#!/usr/bin/env python3
"""Report the data offset of every STORED (uncompressed) zip entry.

zipalign only matters for STORED entries: their payload must start on an
alignment boundary or the runtime cannot mmap it. Alignment rule:
  - default        : 4 bytes   (resources.arsc, classes*.dex, ...)
  - -p / .so files : page size (extractNativeLibs=false loads them from the APK)
"""
import struct
import sys
import zipfile
from pathlib import Path

STORED = zipfile.ZIP_STORED


def data_offset(path, info):
    with open(path, "rb") as f:
        f.seek(info.header_offset)
        lh = f.read(30)
        if len(lh) < 30 or lh[:4] != b"PK\x03\x04":
            return None
        (_sig, _ver, _flags, method, _mt, _md, _crc, _cs, _us,
         namelen, extralen) = struct.unpack("<IHHHHHIIIHH", lh)
        if method != STORED:
            return None
        return info.header_offset + 30 + namelen + extralen


def check(path, page=4096):
    z = zipfile.ZipFile(path)
    bad4, badpage, stored = [], [], 0
    for info in z.infolist():
        if info.compress_type != STORED:
            continue
        stored += 1
        off = data_offset(path, info)
        if off is None:
            continue
        if off % 4:
            bad4.append((info.filename, off))
        if info.filename.endswith(".so") and off % page:
            badpage.append((info.filename, off, off % page))
    return stored, bad4, badpage


def main():
    rc = 0
    for p in sys.argv[1:]:
        p = str(Path(p))
        try:
            stored, bad4, badpage = check(p)
        except Exception as e:  # noqa: BLE001 - report, don't crash the audit
            print(f"{Path(p).name}: ERROR {e}")
            rc = 1
            continue
        name = Path(p).name
        if not bad4 and not badpage:
            print(f"OK      {name}: {stored} STORED entries, all 4-byte aligned")
        else:
            rc = 1
            print(f"MISALIGN {name}: {stored} STORED, "
                  f"{len(bad4)} not 4-byte aligned, {len(badpage)} .so not page-aligned")
            for fn, off in bad4[:5]:
                print(f"    4B  {fn} @ {off} (mod4={off % 4})")
            for fn, off, m in badpage[:5]:
                print(f"    PG  {fn} @ {off} (mod{page}={m})")
    return rc


if __name__ == "__main__":
    sys.exit(main())
