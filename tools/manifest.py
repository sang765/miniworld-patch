#!/usr/bin/env python3
"""Set android:exported="false" on an activity in a decoded AndroidManifest.xml.

apktool emits the whole <activity ...> element as one line, but tolerate a
multi-line element: anchor on the activity's android:name, walk back to the
`<activity` that owns it, then walk forward to the end of that tag.

Fails loudly instead of silently doing nothing - a manifest patch that does not
apply would ship an APK whose BrowserActivity stays reachable from other apps,
and verify.sh is the only later line of defence.
"""
import argparse
import os
import re
import sys
from pathlib import Path

ROOT = Path(os.environ.get("MW_ROOT", Path(__file__).resolve().parent.parent))
WORK = Path(os.environ.get("MW_WORK", ROOT / "work"))
DEFAULT_MANIFEST = WORK / "decoded" / "AndroidManifest.xml"
DEFAULT_ACTIVITY = "org.appplay.lib.browser.BrowserActivity"

ATTR_RE = re.compile(r'android:exported="[^"]*"')


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--manifest", type=Path, default=DEFAULT_MANIFEST)
    ap.add_argument("--activity", default=DEFAULT_ACTIVITY)
    ap.add_argument("--value", default="false", choices=("false", "true"))
    args = ap.parse_args()

    if not args.manifest.is_file():
        print(f"missing {args.manifest}")
        return 1

    lines = args.manifest.read_text(encoding="utf-8").splitlines(keepends=True)

    anchor = next((i for i, l in enumerate(lines) if args.activity in l), None)
    if anchor is None:
        print(f"FAIL: activity {args.activity} not found in {args.manifest}")
        return 1

    start = anchor
    while start >= 0 and "<activity" not in lines[start]:
        start -= 1
    if start < 0:
        print(f"FAIL: no <activity ...> tag owning {args.activity}")
        return 1

    end = start
    while end < len(lines) and not ATTR_RE.search(lines[end]):
        if end > start and "<activity" in lines[end]:
            break
        end += 1
    if not ATTR_RE.search("".join(lines[start:end + 1])):
        print(f"FAIL: {args.activity} has no android:exported attribute")
        return 1

    span = "".join(lines[start:end + 1])
    current = ATTR_RE.search(span)
    want = f'android:exported="{args.value}"'
    if current.group(0) == want:
        print(f"OK: {args.activity} already {want} (lines {start + 1}-{end + 1})")
        return 0

    before = span
    after = ATTR_RE.sub(want, span, count=1)
    lines[start:end + 1] = [after]
    args.manifest.write_text("".join(lines), encoding="utf-8")
    print(f"patched {args.activity}: {current.group(0)} -> {want} "
          f"(lines {start + 1}-{end + 1})")
    if before == after:
        print("FAIL: manifest unchanged despite a differing attribute")
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
