#!/usr/bin/env python3
"""Strip '$' from resource entry names (aapt1 -> aapt2 requirement).

The original APK was built with aapt1, which allowed '$' in entry names.
apktool 3.x only ships aapt2, and aapt2 rejects '$' in the `name=` attribute of
res/values/*.xml (e.g. public.xml) - not just in file names - so renaming the
drawable files alone is not enough: file names, public.xml declarations and
every reference have to move together. Entry IDs stay pinned by public.xml, so
this does not shift resource IDs.

The rule is a pure function of the original name (the historical fix ran as two
passes: prefix an 'x' when the name started with '$', then replace every '$'
with '_'). scopecheck.py derives its expectations from the same function, so
the two must never drift.
"""
import argparse
import os
import sys
from pathlib import Path

ROOT = Path(os.environ.get("MW_ROOT", Path(__file__).resolve().parent.parent))
WORK = Path(os.environ.get("MW_WORK", ROOT / "work"))
DEFAULT_RES = WORK / "decoded" / "res"


def renamed(name: str) -> str:
    return ("x" if name.startswith("$") else "") + name.replace("$", "_")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--res", type=Path, default=DEFAULT_RES,
                    help="decoded res/ directory (default: %(default)s)")
    args = ap.parse_args()
    res = args.res

    if not res.is_dir():
        print(f"missing {res}")
        return 1

    targets = sorted(p for p in res.rglob("*") if p.is_file() and "$" in p.name)
    if not targets:
        print("no '$' left in file names (already applied)")
        return 0

    mapping = {}
    for p in targets:
        new_path = p.with_name(renamed(p.name))
        if new_path.exists():
            print(f"collision: {new_path}")
            return 1
        stem = p.name[: -len(p.suffix)] if p.suffix else p.name
        mapping[stem] = renamed(stem)
        p.rename(new_path)
        print(f"renamed {p.relative_to(res)} -> {new_path.relative_to(res)}")

    # declarations (public.xml) and references (animated-vector targets) both
    # carry the raw entry name, so one substring pass covers both
    touched = 0
    for p in res.rglob("*.xml"):
        try:
            text = p.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            continue
        orig = text
        for old, new in mapping.items():
            text = text.replace(old, new)
        if text != orig:
            p.write_text(text, encoding="utf-8")
            print(f"updated refs in {p.relative_to(res)}")
            touched += 1

    leftover = []
    for p in res.rglob("*.xml"):
        try:
            text = p.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            continue
        if 'name="$' in text or '"$' in text:
            leftover.append(str(p.relative_to(res)))

    print(f"\nrenamed={len(mapping)} xml_files_updated={touched}")
    if leftover:
        print("STILL DECLARING '$':")
        for p in leftover:
            print("  !", p)
        return 1
    print("no '$' remains in any res xml")
    return 0


if __name__ == "__main__":
    sys.exit(main())
