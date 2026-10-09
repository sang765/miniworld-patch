#!/usr/bin/env python3
"""4-byte-align every STORED entry of an APK (pure-Python zipalign).

apktool writes local headers back to back, so the data offsets land anywhere.
The SDK zipalign cannot run on this aarch64 box (x86_64 ELF), so this does the
same job the vendor's zipalign did: append raw zero bytes to each local header's
extra field until the payload starts on a 4-byte boundary.

Confirmed against the original base.apk: all 784 STORED entries are aligned and
their local extra fields are 0..3 plain filler bytes (not TLV blocks), i.e. this
is exactly the convention Android ships with.

The central directory is rewritten with the shifted local-header offsets.
DEFLATED entries are copied untouched - their payload never needs aligning.

`drop` removes named entries while rewriting. That is how stamp-cert-sha256
gets stripped: we re-sign every split with a new key, and a stamp left over
from the original signer points at a certificate that no longer signs anything
(SourceStampVerifier then reports SOURCE_STAMP_SIGNATURE_BLOCK_WITHOUT_CERT_DIGEST
because apksigner does not emit a stamp signing block). An APK without the
entry is simply "SourceStamp not present", which is the normal case.

`replace` swaps a named entry's payload for new bytes, re-writing it STORED so
the replacement still lands on an aligned offset. That is how the anti-ban
overlay reaches assets/script_res.pkg inside the asset pack: the merged pkg is
built by tools/pkgwrite.py, then written in place of the original.
"""
import struct
import sys
import zipfile
import zlib

LFH_SIG = 0x04034B50
CDH_SIG = 0x02014B50
EOCD_SIG = 0x06054B50


def align(src_path: str, dst_path: str, alignment: int = 4,
          drop=frozenset(), replace=None) -> dict:
    """Rewrite a zip, aligning STORED entries. `replace` maps an entry name to
    new raw bytes: that entry is re-written STORED (whatever it was before) with
    the new payload, so the replacement still lands on an aligned offset."""
    replace = replace or {}
    zin = zipfile.ZipFile(src_path)
    infos = sorted(zin.infolist(), key=lambda i: i.header_offset)
    start_dir = zin.start_dir

    stats = {"entries": 0, "padded": 0, "max_pad": 0, "dropped": 0,
             "replaced": 0}
    central = []

    with open(src_path, "rb") as src, open(dst_path, "wb") as dst:
        for i, info in enumerate(infos):
            if info.filename in drop:
                stats["dropped"] += 1
                continue
            src.seek(info.header_offset)
            hdr = src.read(30)
            if len(hdr) < 30:
                raise SystemExit(f"truncated local header at {info.header_offset}")
            # the central directory is authoritative for crc and sizes: an
            # entry written with a data descriptor (flag bit 3) leaves all
            # three as 0 in its local header, and writing those through would
            # zero the entry - unzip then reports "invalid compressed data".
            (sig, ver, flags, method, mt, md, _lcrc, _lcs, _lus, nlen, elen) = struct.unpack(
                "<IHHHHHIIIHH", hdr
            )
            crc, cs, us = info.CRC, info.compress_size, info.file_size
            if sig != LFH_SIG:
                raise SystemExit(f"bad local signature at {info.header_offset}")
            name = src.read(nlen)
            extra = src.read(elen)
            data_start = info.header_offset + 30 + nlen + elen
            # payload runs up to the next local header; for the last entry up to
            # the central directory. That range also swallows any data descriptor.
            end = infos[i + 1].header_offset if i + 1 < len(infos) else start_dir
            body = src.read(end - data_start)

            if info.filename in replace:
                body = replace[info.filename]
                method = zipfile.ZIP_STORED
                flags = 0
                crc, cs, us = zlib.crc32(body) & 0xFFFFFFFF, len(body), len(body)
                stats["replaced"] += 1

            header_off = dst.tell()
            if method == zipfile.ZIP_STORED:
                pad = (-(header_off + 30 + nlen + elen)) % alignment
                if pad:
                    stats["padded"] += 1
                    stats["max_pad"] = max(stats["max_pad"], pad)
            else:
                pad = 0

            dst.write(struct.pack("<IHHHHHIIIHH", sig, ver, flags, method, mt, md,
                                  crc, cs, us, nlen, elen + pad))
            dst.write(name)
            dst.write(extra + b"\x00" * pad)
            dst.write(body)

            central.append((info, header_off, name, extra + b"\x00" * pad,
                            flags, method, mt, md, crc, cs, us))
            stats["entries"] += 1

        cd_start = dst.tell()
        for (info, header_off, name, extra, flags, method, mt, md,
             crc, cs, us) in central:
            version_made_by = (info.create_system << 8) | info.create_version
            dst.write(struct.pack(
                "<IHHHHHHIIIHHHHHII",
                CDH_SIG,
                version_made_by,
                info.extract_version,
                flags,
                method,
                mt,
                md,
                crc,
                cs,
                us,
                len(name),
                len(extra),
                len(info.comment),
                0,  # disk number start
                info.internal_attr,
                info.external_attr,
                header_off,
            ))
            dst.write(name)
            dst.write(extra)
            dst.write(info.comment)
        cd_size = dst.tell() - cd_start

        n = len(central)
        dst.write(struct.pack("<IHHHHIIH", EOCD_SIG, 0, 0, n, n, cd_size, cd_start, 0))

    zin.close()
    return stats


def main() -> int:
    args = sys.argv[1:]
    drop = set()
    replace = {}
    positional = []
    while args:
        if args[0] == "--drop" and len(args) > 1:
            drop.add(args[1])
            args = args[2:]
        elif args[0] == "--replace" and len(args) > 2:
            replace[args[1]] = args[2]
            args = args[3:]
        else:
            positional.append(args.pop(0))
    if not positional:
        print("usage: zipalign.py [--drop <name>] [--replace <name> <file>]... "
              "<apk> [out.apk]")
        return 2

    src = positional[0]
    dst = positional[1] if len(positional) > 1 else src + ".aligned"
    payload = {name: open(path, "rb").read() for name, path in replace.items()}
    stats = align(src, dst, drop=frozenset(drop), replace=payload)
    print(f"{dst}: {stats['entries']} entries, padded {stats['padded']} "
          f"(max {stats['max_pad']} bytes), dropped {stats['dropped']}, "
          f"replaced {stats['replaced']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
