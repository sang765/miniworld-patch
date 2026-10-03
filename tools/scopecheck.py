#!/usr/bin/env python3
"""Assert the patched decode differs from a pristine decode only where the mod
is meant to touch it.

Allowed:
  * the 11 smali files that carry the WebView/HWID/verifyPackage/ad-reward/
    MicroG-login patches and the two mod-menu startup hooks
  * AndroidManifest.xml (BrowserActivity exported=false + menu activity)
  * smali_classes8/modmenu/ - the mod-menu classes, new files that have no
    pristine counterpart; the entry classes must all be there
  * res/ - only as the aapt1->aapt2 entry rename: every removed entry must have
    a renamed counterpart, and every rewritten XML must be reproducible from the
    pristine one by substituting the entry names. That proves no resource
    content was altered beyond the rename.

Everything else is a scope violation.
"""
import argparse
import os
import sys
from pathlib import Path

ROOT = Path(os.environ.get("MW_ROOT", Path(__file__).resolve().parent.parent))
WORK = Path(os.environ.get("MW_WORK", ROOT / "work"))

PATCHED_SMALI = {
    "smali/org/appplay/lib/ClientMethodCommonApi.smali",
    "smali_classes8/org/appplay/lib/browser/MiniUniverseHelper.smali",
    "smali/org/appplay/lib/utils/IdDevice.smali",
    "smali/cn/mini1/utils/b.smali",
    "smali/org/appplay/lib/CommonNatives.smali",
    "smali/cn/mini1/google/GoogleApplication.smali",
    "smali/org/appplay/lib/AppPlayBaseActivity.smali",
    "smali/org/appplay/lib/client/ClientMethodUniverseSubject.smali",
    "smali/com/google/android/gms/common/GooglePlayServicesUtilLight.smali",
    "smali/org/appplay/lib/sdk/GoogleLoginSDK.smali",
    "smali_classes8/org/appplay/lib/sdk/GoogleLoginSDK$1.smali",
}
MANIFEST = "AndroidManifest.xml"

# New files, no pristine counterpart. The inner ModMenu$1/$2 Runnables are
# allowed by the prefix too, but the entry classes are required: a copy step
# that silently copied nothing must not pass. Hwid, Palette, AdReward and
# GmsCompat are referenced from patched method bodies, so a missing one would
# crash later.
ADDED_SMALI = "smali_classes8/modmenu/"
MODMENU_FILES = {
    "smali_classes8/modmenu/ModMenu.smali",
    "smali_classes8/modmenu/ModMenuActivity.smali",
    "smali_classes8/modmenu/Api26.smali",
    "smali_classes8/modmenu/Api33.smali",
    "smali_classes8/modmenu/Hwid.smali",
    "smali_classes8/modmenu/Palette.smali",
    "smali_classes8/modmenu/AdReward.smali",
    "smali_classes8/modmenu/GmsCompat.smali",
}

# fixdollar.py runs two logical passes: prefix an 'x' when the name started
# with '$', then replace every '$' with '_'. Folding both gives a pure function
# of the original name, so the expected counterpart can be derived without a
# lookup table - and it must stay in sync with fixdollar.renamed().
def renamed(stem: str) -> str:
    return ("x" if stem.startswith("$") else "") + stem.replace("$", "_")


def walk(root: Path) -> set:
    out = set()
    for p in root.rglob("*"):
        if not p.is_file():
            continue
        rel = p.relative_to(root).as_posix()
        if rel.startswith("build/"):
            continue
        out.add(rel)
    return out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--pristine", type=Path, default=WORK / "pristine")
    ap.add_argument("--decoded", type=Path, default=WORK / "decoded")
    args = ap.parse_args()
    pristine, decoded = args.pristine, args.decoded

    if not pristine.is_dir() or not decoded.is_dir():
        print(f"missing trees: pristine={pristine.is_dir()} decoded={decoded.is_dir()}")
        return 2

    old, new = walk(pristine), walk(decoded)
    problems = []

    only_old = sorted(old - new)
    only_new = sorted(new - old)
    differ = sorted(p for p in old & new
                    if (pristine / p).read_bytes() != (decoded / p).read_bytes())

    renames = {}
    for rel in only_old:
        if not rel.startswith("res/"):
            problems.append(f"removed outside res/: {rel}")
            continue
        name = Path(rel).name
        stem = name[: -len(Path(name).suffix)] if Path(name).suffix else name
        expect = Path(rel).with_name(renamed(name)).as_posix()
        if expect not in only_new:
            problems.append(f"removed without renamed counterpart: {rel}")
        else:
            renames[stem] = renamed(stem)

    added_modmenu = [r for r in only_new if r.startswith(ADDED_SMALI)]
    for rel in only_new:
        if rel.startswith(ADDED_SMALI):
            continue
        if not rel.startswith("res/"):
            problems.append(f"added outside res/: {rel}")
    if len(only_old) != len(only_new) - len(added_modmenu):
        problems.append(f"rename count mismatch: removed={len(only_old)} "
                        f"added={len(only_new) - len(added_modmenu)}")

    for rel in sorted(MODMENU_FILES - new):
        problems.append(f"mod-menu class missing from decode: {rel}")

    # longest first so a stem can never eat a longer stem containing it
    subs = sorted(renames.items(), key=lambda kv: -len(kv[0]))

    for rel in differ:
        if rel == MANIFEST or rel in PATCHED_SMALI:
            continue
        if not rel.startswith("res/"):
            problems.append(f"content changed outside smali/manifest/res: {rel}")
            continue
        text = (pristine / rel).read_bytes()
        for a, b in subs:
            text = text.replace(a.encode(), b.encode())
        if text != (decoded / rel).read_bytes():
            problems.append(f"res/ content changed beyond entry rename: {rel}")

    print(f"removed={len(only_old)}  added={len(only_new)}  content-diff={len(differ)}")
    print(f"smali patched={sum(1 for p in differ if p in PATCHED_SMALI)}"
          f"/{len(PATCHED_SMALI)}  "
          f"manifest={'yes' if MANIFEST in differ else 'no'}  "
          f"res renamed={len(renames)}  "
          f"res rewritten={sum(1 for p in differ if p.startswith('res/'))}  "
          f"modmenu added={len(added_modmenu)}")

    for p in sorted(PATCHED_SMALI - set(differ)):
        problems.append(f"expected patch missing (file identical to pristine): {p}")
    if MANIFEST not in differ:
        problems.append("AndroidManifest.xml identical to pristine - exported flag not applied")

    if problems:
        print("\nSCOPE VIOLATIONS:")
        for p in problems:
            print("  !", p)
        return 1
    print("\nSCOPE OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
