#!/usr/bin/env python3
"""Read a Mini World international (CREATA 1.7.x) .pkg archive.

Container layout, verified against every shipped pkg (index md5s match
100%, see the round-14 RE notes):

    [16B]  u32 ver=0x000130BA | u32 17 | u32 index_offset | u32 index_size
    [data] record region: each record addressed absolutely by [X, X+Y)
    [index] ONE LZ4 block: u32 usize + LZ4 bytes, decompressing to:
           u32 N
           N records of [16B md5][u32 X][u32 Y][u32 Z]
                        (+ 16B H2 when Z bit 5 is set)
           [16B footer - only in variant B, e.g. game_res/game_language]
           u32 C
           C x [u32 L][path L bytes][u32 record_index]
    Payload at X: Z bit 0 set -> [u32 usize][LZ4 block]; clear -> raw bytes.

Stdlib only: the LZ4 block format is decoded here directly so the name and
icon generators need no extra packages.
"""
import os
import struct
import zipfile

MAGIC = 0x000130BA
HEADER_SIZE = 16


def lz4_block(src, expected_size=None):
    """Decode a raw LZ4 block (no frame header) to bytes."""
    out = bytearray()
    i = 0
    n = len(src)
    while i < n:
        token = src[i]
        i += 1
        lit = token >> 4
        if lit == 15:
            while True:
                b = src[i]
                i += 1
                lit += b
                if b != 255:
                    break
        out += src[i:i + lit]
        i += lit
        if i >= n:
            break
        offset = src[i] | (src[i + 1] << 8)
        i += 2
        match = (token & 0x0F) + 4
        if (token & 0x0F) == 15:
            while True:
                b = src[i]
                i += 1
                match += b
                if b != 255:
                    break
        start = len(out) - offset
        for k in range(match):
            out.append(out[start + k])
    if expected_size is not None and len(out) != expected_size:
        raise ValueError("lz4 size mismatch: %d != %d" % (len(out), expected_size))
    return bytes(out)


def _payload(raw, z):
    if not (z & 1):
        return raw
    if len(raw) < 4:
        raise ValueError("truncated lz4 record")
    (usize,) = struct.unpack_from("<I", raw)
    return lz4_block(raw[4:], usize)


def _walk_paths(buf, start, count):
    """Try to walk `count` [u32 L][path][u32 rec] entries from `start`.

    Returns (list_of_pairs, end_offset) or None when the walk does not
    consume the buffer exactly - that check is what distinguishes variant B
    (16B footer before the count) from the plain layout.
    """
    pos = start
    entries = []
    for _ in range(count):
        if pos + 4 > len(buf):
            return None
        (length,) = struct.unpack_from("<I", buf, pos)
        pos += 4
        if length > len(buf) - pos - 4:
            return None
        path = buf[pos:pos + length]
        pos += length
        (rec,) = struct.unpack_from("<I", buf, pos)
        pos += 4
        entries.append((path.decode("utf-8", "replace"), rec))
    if pos != len(buf):
        return None
    return entries, pos


class Pkg:
    """A parsed pkg; records are read through `_slice`, so a pkg backed by a
    seekable file (from_file) never has to sit in memory as one blob."""

    def __init__(self, head, index, slice_fn, size):
        if len(head) < HEADER_SIZE:
            raise ValueError("not a pkg: too short")
        ver, sub, index_off, index_size = struct.unpack_from("<IIII", head)
        if ver != MAGIC or sub != 17:
            raise ValueError("not a pkg: header %08x/%d" % (ver, sub))
        if index_off + index_size != size:
            raise ValueError("index does not end at EOF")
        self._slice = slice_fn
        self._records(index)
        self._paths()

    def _records(self, index):
        if len(index) < 8:
            raise ValueError("index too short")
        (usize,) = struct.unpack_from("<I", index)
        decoded = lz4_block(index[4:], usize)
        pos = 0
        (n,) = struct.unpack_from("<I", decoded, pos)
        pos += 4
        self.records = []
        for _ in range(n):
            md5 = decoded[pos:pos + 16]
            x, y, z = struct.unpack_from("<III", decoded, pos + 16)
            pos += 28
            if z & 0x20:  # H2 hash present
                pos += 16
            self.records.append((x, y, z, md5))
        self._tail = decoded[pos:]

    def _paths(self):
        if len(self._tail) < 4:
            raise ValueError("index tail too short")
        (count,) = struct.unpack_from("<I", self._tail)
        walked = _walk_paths(self._tail, 4, count)
        if walked is None and len(self._tail) >= 20:
            # variant B: a 16B footer sits before the path count
            (count,) = struct.unpack_from("<I", self._tail, 16)
            walked = _walk_paths(self._tail, 20, count)
        if walked is None:
            raise ValueError("path table does not parse")
        self.paths = dict(walked[0])

    def read(self, path):
        try:
            x, y, z, _ = self.records[self.paths[path]]
        except KeyError:
            raise KeyError(path)
        return _payload(self._slice(x, x + y), z)

    def names(self):
        return sorted(self.paths)


def from_apk(apk_path, member):
    with zipfile.ZipFile(apk_path) as z:
        blob = z.read(member)
    index_off, index_size = struct.unpack_from("<II", blob, 8)
    return Pkg(blob[:HEADER_SIZE], blob[index_off:index_off + index_size],
               lambda a, b: blob[a:b], len(blob))


def from_file(path):
    """Open a pkg that sits on disk (the 667 MB common_res); only the header
    and index are read into memory, records are sought on demand."""
    f = open(path, "rb")
    head = f.read(HEADER_SIZE)
    index_off, index_size = struct.unpack_from("<II", head, 8)
    size = os.fstat(f.fileno()).st_size
    f.seek(index_off)
    index = f.read(index_size)

    def slice_fn(a, b):
        f.seek(a)
        return f.read(b - a)

    return Pkg(head, index, slice_fn, size)
