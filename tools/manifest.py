#!/usr/bin/env python3
"""Set android:exported on an activity and declare the mod-menu activity.

apktool emits the whole <activity ...> element as one line, but tolerate a
multi-line element: anchor on the activity's android:name, walk back to the
<activity that owns it, then walk forward to the end of that tag.

Three patches run in one pass: the BrowserActivity exported flag, the
mod-menu activity (exported=false - only our PendingIntent starts it, while
POST_NOTIFICATIONS it needs at runtime is already declared by the source
manifest), and the crash screen (exported=false plus excludeFromRecents: it
is started by the crash handler's PendingIntent and by nothing else - an
exported crash screen would let any app on the device pop it).

Fails loudly instead of silently doing nothing - a manifest patch that does
not apply would ship an APK whose BrowserActivity stays reachable from other
apps, or with no menu activity at all, and verify.sh is the only later line
of defence.
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
MENU_NAME = "modmenu.ModMenuActivity"
MENU_ELEMENT = ('<activity android:exported="false" '
                'android:name="modmenu.ModMenuActivity" '
                'android:screenOrientation="sensorLandscape"/>')
CRASH_NAME = "modmenu.CrashActivity"
CRASH_ELEMENT = ('<activity android:exported="false" '
                 'android:name="modmenu.CrashActivity" '
                 'android:excludeFromRecents="true"/>')
# (class name, element to insert when it is missing, what to report)
DECLARED = (
    (MENU_NAME, MENU_ELEMENT, "exported=false, sensorLandscape"),
    (CRASH_NAME, CRASH_ELEMENT, "exported=false, excludeFromRecents"),
)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--manifest", type=Path, default=DEFAULT_MANIFEST)
    ap.add_argument("--activity", default=DEFAULT_ACTIVITY)
    ap.add_argument("--value", default="false", choices=("false", "true"))
    args = ap.parse_args()

    if not args.manifest.is_file():
        print(f"missing {args.manifest}")
        return 1

    text = args.manifest.read_text(encoding="utf-8")
    lines = text.splitlines(keepends=True)

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

    # apktool writes the whole <activity ...> on one line. If the attribute is
    # not there, allow attribute continuation lines - but never walk past the
    # end of this element: a sibling with its own android:exported would get
    # flipped while this script reported success.
    end = start
    while end + 1 < len(lines) and not ATTR_RE.search(lines[end]):
        nxt = lines[end + 1].strip()
        if nxt.startswith("<") or ">" in lines[end]:
            break
        end += 1
    span = "".join(lines[start:end + 1])
    current = ATTR_RE.search(span)
    if current is None:
        print(f"FAIL: {args.activity} has no android:exported attribute")
        return 1

    want = f'android:exported="{args.value}"'
    if current.group(0) == want:
        print(f"OK: {args.activity} already {want} (lines {start + 1}-{end + 1})")
    else:
        lines[start:end + 1] = [ATTR_RE.sub(want, span, count=1)]
        print(f"patched {args.activity}: {current.group(0)} -> {want} "
              f"(lines {start + 1}-{end + 1})")

    # Re-read the insertion point every time: inserting shifts the indices,
    # and a stale </application> would land an element inside the previous one.
    for name, element, note in DECLARED:
        if any(name in l for l in lines):
            print(f"OK: {name} already declared")
            continue
        close = next((i for i, l in enumerate(lines) if l.strip() == "</application>"),
                     None)
        if close is None:
            print(f"FAIL: </application> not found in {args.manifest}")
            return 1
        indent = lines[close][: len(lines[close]) - len(lines[close].lstrip())]
        lines.insert(close, indent + element + "\n")
        print(f"added {name} ({note})")

    out = "".join(lines)
    if out != text:
        args.manifest.write_text(out, encoding="utf-8")
    return 0


if __name__ == "__main__":
    sys.exit(main())
