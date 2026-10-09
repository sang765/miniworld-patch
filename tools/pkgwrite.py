#!/usr/bin/env python3
"""Rebuild a Mini World .pkg with a few entries replaced.

Layout is the one tools/pkgread.py documents. The stock pkg is the base: every
record keeps its exact data-region bytes, so an unchanged entry stays bit-identical
and its index md5 still verifies. Replaced entries get their new payload appended
at the end of the data region (never in place - the new payload is usually a
different size), and the index is rebuilt with their md5/x/y/z.

Index and replaced payloads are LZ4-encoded with a literal-only encoder: valid
LZ4 block, no match tokens. It costs ~1% size on the index and a few hundred KB
on the payloads versus the compressor the game ships, and removes any dependency.
shortcut: swap in a real LZ4 encoder if pkg size ever matters.

Usage: pkgwrite.py STOCK.pkg MANIFEST OUT.pkg
  MANIFEST lines: `<pkg path> <local file>` (# comments, blank lines skipped).
  A relative local file is resolved against the manifest's own directory, so
  the manifest can be run from any working directory.
"""
import hashlib
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import pkgread  # noqa: E402

MAGIC = pkgread.MAGIC
HEADER_SIZE = pkgread.HEADER_SIZE


def lz4_literal(src):
    """A single-sequence literal-only LZ4 block (no match tokens)."""
    out = bytearray()
    lit = len(src)
    if lit < 15:
        out.append(lit << 4)
    else:
        out.append(0xF0)
        rem = lit - 15
        while rem >= 255:
            out.append(255)
            rem -= 255
        out.append(rem)
    out += src
    return bytes(out)


def read_index_records(index):
    """Decode the index, keeping each record's raw bytes so H2 (Z bit 5) survives.

    Returns (records, tail) where records is a list of dicts with the raw 28/44
    byte record, and tail is everything after the records (variant B footer +
    path table), copied through untouched.
    """
    (usize,) = struct.unpack_from("<I", index)
    decoded = pkgread.lz4_block(index[4:], usize)
    pos = 0
    (n,) = struct.unpack_from("<I", decoded, pos)
    pos += 4
    records = []
    for _ in range(n):
        raw = decoded[pos:pos + 28]
        md5 = decoded[pos:pos + 16]
        x, y, z = struct.unpack_from("<III", decoded, pos + 16)
        pos += 28
        if z & 0x20:
            raw = decoded[pos - 28:pos + 16]
            pos += 16
        records.append({"raw": raw, "md5": md5, "x": x, "y": y, "z": z})
    return records, decoded[pos:]


def encode_index(records, tail):
    body = bytearray(struct.pack("<I", len(records)))
    for r in records:
        body += r["raw"]
    body += tail
    return struct.pack("<I", len(body)) + lz4_literal(bytes(body))


def main():
    stock_path, manifest_path, out_path = sys.argv[1:4]
    p = pkgread.from_file(stock_path)
    head = open(stock_path, "rb").read(HEADER_SIZE)
    _ver, _sub, _index_off, _index_size = struct.unpack_from("<IIII", head)

    # the data region is copied verbatim; new payloads append after it
    with open(stock_path, "rb") as f:
        f.seek(HEADER_SIZE)
        data_region = f.read(_index_off - HEADER_SIZE)

    with open(manifest_path) as fh:
        jobs = []
        for line in fh:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            pkg_path, local = line.split(None, 1)
            jobs.append((pkg_path, local))

    manifest_dir = os.path.dirname(os.path.abspath(manifest_path))
    jobs = [(pkg_path,
             local if os.path.isabs(local) else os.path.join(manifest_dir, local))
            for pkg_path, local in jobs]

    index = open(stock_path, "rb").read()[_index_off:_index_off + _index_size]
    records, tail = read_index_records(index)

    appended = bytearray()
    base = HEADER_SIZE + len(data_region)
    for pkg_path, local in jobs:
        if pkg_path not in p.paths:
            raise SystemExit("not in stock pkg: %s" % pkg_path)
        body = open(local, "rb").read()
        stored = struct.pack("<I", len(body)) + lz4_literal(body)
        off = base + len(appended)
        appended += stored
        r = records[p.paths[pkg_path]]
        r["raw"] = hashlib.md5(stored).digest() + struct.pack(
            "<III", off, len(stored), r["z"])
        r["md5"] = hashlib.md5(stored).digest()
        r["x"], r["y"] = off, len(stored)
        print("  %s -> %d bytes stored @%d" % (pkg_path, len(stored), off))

    new_index = encode_index(records, tail)
    with open(out_path, "wb") as out:
        out.write(struct.pack("<IIII", MAGIC, 17,
                              HEADER_SIZE + len(data_region) + len(appended),
                              len(new_index)))
        out.write(data_region)
        out.write(appended)
        out.write(new_index)
    print("wrote %s (%d bytes)" % (out_path, os.path.getsize(out_path)))


if __name__ == "__main__":
    main()
