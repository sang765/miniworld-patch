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
"""
import struct
import sys
import zipfile

LFH_SIG = 0x04034B50
CDH_SIG = 0x02014B50
EOCD_SIG = 0x06054B50


def align(src_path: str, dst_path: str, alignment: int = 4,
          drop=frozenset()) -> dict:
    zin = zipfile.ZipFile(src_path)
    infos = sorted(zin.infolist(), key=lambda i: i.header_offset)
    start_dir = zin.start_dir

    stats = {"entries": 0, "padded": 0, "max_pad": 0, "dropped": 0}
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
            (sig, ver, flags, method, mt, md, crc, cs, us, nlen, elen) = struct.unpack(
                "<IHHHHHIIIHH", hdr
            )
            if sig != LFH_SIG:
                raise SystemExit(f"bad local signature at {info.header_offset}")
            name = src.read(nlen)
            extra = src.read(elen)
            data_start = info.header_offset + 30 + nlen + elen
            # payload runs up to the next local header; for the last entry up to
            # the central directory. That range also swallows any data descriptor.
            end = infos[i + 1].header_offset if i + 1 < len(infos) else start_dir
            body = src.read(end - data_start)

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

            central.append((info, header_off, name, extra + b"\x00" * pad, flags, method, mt, md))
            stats["entries"] += 1

        cd_start = dst.tell()
        for info, header_off, name, extra, flags, method, mt, md in central:
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
                info.CRC,
                info.compress_size,
                info.file_size,
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
    positional = []
    while args:
        if args[0] == "--drop" and len(args) > 1:
            drop.add(args[1])
            args = args[2:]
        else:
            positional.append(args.pop(0))
    if not positional:
        print("usage: zipalign.py [--drop <name>]... <apk> [out.apk]")
        return 2

    src = positional[0]
    dst = positional[1] if len(positional) > 1 else src + ".aligned"
    stats = align(src, dst, drop=frozenset(drop))
    print(f"{dst}: {stats['entries']} entries, padded {stats['padded']} "
          f"(max {stats['max_pad']} bytes), dropped {stats['dropped']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
