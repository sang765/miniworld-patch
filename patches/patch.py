#!/usr/bin/env python3
"""Insert early-return stubs at the head of selected smali methods.

Dry-run by default; pass --apply to write. Every target is validated:
the method must exist exactly once, .locals must be >= registers used,
and the head must not contain .param/.annotation blocks.
"""
import argparse
import os
import re
import sys
from pathlib import Path

# Layout differs between the repo (patches/patch.py, work/ under the repo root)
# and a flat working directory (script and work tree side by side), so the root
# is overridable instead of hard-coded.
ROOT = Path(os.environ.get("MW_ROOT", Path(__file__).resolve().parent.parent))
WORK = Path(os.environ.get("MW_WORK", ROOT / "work"))
DEFAULT_DECODED = WORK / "decoded"
DEFAULT_SPOOF = Path(os.environ.get("MW_SPOOF", ROOT / "spoof.env"))

# (id, relative file, method name+proto, registers used by inserted code, inserted lines)
def build_patches(GAID, DTOKEN, UNIQUE, FLYER):
    return [
        # --- A: block WebView / browser opening ---
        ("A1", "smali/org/appplay/lib/ClientMethodCommonApi.smali",
         "BrowserShowWebpage(Ljava/lang/String;I)V", 1, ["return-void"]),
        ("A2", "smali/org/appplay/lib/ClientMethodCommonApi.smali",
         "WindowBrowserOpenWebpage(Ljava/lang/String;IIII)V", 1, ["return-void"]),
        ("A3", "smali/org/appplay/lib/ClientMethodCommonApi.smali",
         "WindowBrowserShowWebpage()V", 1, ["return-void"]),
        ("A4", "smali/org/appplay/lib/ClientMethodCommonApi.smali",
         "reopenWebView(Ljava/lang/String;)Ljava/lang/String;", 1,
         ['const-string v0, ""', "return-object v0"]),
        ("A8", "smali/org/appplay/lib/ClientMethodCommonApi.smali",
         "OpenWebView(Ljava/lang/String;ILjava/lang/String;)V", 1, ["return-void"]),
        ("A5", "smali_classes8/org/appplay/lib/browser/MiniUniverseHelper.smali",
         "loadUrl(Ljava/lang/String;)V", 1, ["return-void"]),
        ("A6", "smali_classes8/org/appplay/lib/browser/MiniUniverseHelper.smali",
         "reopenWebView(Ljava/lang/String;)V", 1, ["return-void"]),
        ("A7", "smali_classes8/org/appplay/lib/browser/MiniUniverseHelper.smali",
         "handleLoadUrl(Ljava/lang/String;)V", 1, ["return-void"]),
        # --- B: spoof HWID ---
        ("B1", "smali/org/appplay/lib/utils/IdDevice.smali",
         "getAdvertisingId(Landroid/content/Context;)Ljava/lang/String;", 1,
         [f'const-string v0, "{DTOKEN}"', "return-object v0"]),
        ("B2", "smali/org/appplay/lib/utils/IdDevice.smali",
         "getGoogleAdId()Ljava/lang/String;", 1,
         [f'const-string v0, "{GAID}"', "return-object v0"]),
        ("B3", "smali/org/appplay/lib/utils/IdDevice.smali",
         "getGoogleAdidFilter()Ljava/lang/String;", 1,
         [f'const-string v0, "{GAID}"', "return-object v0"]),
        ("B4", "smali/cn/mini1/utils/b.smali",
         "m()Ljava/lang/String;", 1,
         [f'const-string v0, "{UNIQUE}"', "return-object v0"]),
        ("B5", "smali/org/appplay/lib/ClientMethodCommonApi.smali",
         "GetFlyerUID()Ljava/lang/String;", 1,
         [f'const-string v0, "{FLYER}"', "return-object v0"]),
        # --- C: keep SDK init alive after re-sign ---
        ("C1", "smali/org/appplay/lib/CommonNatives.smali",
         "verifyPackage(Landroid/content/Context;)Z", 1,
         ["const/4 v0, 0x1", "return v0"]),
    ]


METHOD_RE = re.compile(r"^\.method .*?\b([\w$<>]+)\(([^)]*)\)(\S+)\s*$")
LOCALS_RE = re.compile(r"^\s*\.locals\s+(\d+)")


def locate(lines, proto):
    """Return index of the `.locals` line of the unique method matching proto."""
    hits = []
    for i, ln in enumerate(lines):
        m = METHOD_RE.match(ln)
        if m and f"{m.group(1)}({m.group(2)}){m.group(3)}" == proto:
            hits.append(i)
    if len(hits) != 1:
        raise SystemExit(f"FATAL: {proto} matched {len(hits)} times (need 1)")
    start = hits[0]
    lm = None
    for j in range(start + 1, start + 6):
        lm = LOCALS_RE.match(lines[j])
        if lm:
            break
    if not lm:
        raise SystemExit(f"FATAL: no .locals within 5 lines of {proto}")
    return start, j, int(lm.group(1))


def head_is_clean(lines, locals_idx, proto):
    """Head must be free of .param/.annotation before the first real body line."""
    for j in range(locals_idx + 1, locals_idx + 12):
        ln = lines[j].strip()
        if ln.startswith(".end method"):
            break
        if ln.startswith(".param") or ln.startswith(".annotation"):
            return False, j
        if ln.startswith(".line") or ln == "" or ln.startswith(".prologue"):
            continue
        # first executable instruction -> head is clean
        return True, None
    return False, None


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--decoded", type=Path, default=DEFAULT_DECODED,
                    help="decoded apk directory (default: %(default)s)")
    ap.add_argument("--spoof", type=Path, default=DEFAULT_SPOOF,
                    help="identity constants file (default: %(default)s)")
    ap.add_argument("--apply", action="store_true",
                    help="write changes (default is a dry run)")
    args = ap.parse_args()

    spoof = dict(
        line.split("=", 1) for line in args.spoof.read_text().splitlines() if "=" in line
    )
    patches = build_patches(spoof["GAID"], spoof["DTOKEN"],
                            spoof["UNIQUE"], spoof["FLYER"])

    dec = args.decoded
    if not dec.is_dir():
        print(f"FATAL: missing decoded directory {dec}")
        return 1

    changed = set()
    errors = []
    for pid, rel, proto, need_regs, body in patches:
        path = dec / rel
        if not path.is_file():
            errors.append(f"{pid}: missing {path}")
            continue
        lines = path.read_text().splitlines()
        try:
            start, locals_idx, nlocals = locate(lines, proto)
        except SystemExit as e:
            errors.append(f"{pid}: {e}")
            continue
        if nlocals < need_regs:
            errors.append(f"{pid}: .locals {nlocals} < required {need_regs} for {proto}")
            continue
        clean, bad = head_is_clean(lines, locals_idx, proto)
        if not clean:
            errors.append(f"{pid}: dirty head (.param/.annotation) at line {bad} in {proto}")
            continue
        if any(lines[locals_idx + 1 + k].strip() == body[0] for k in range(0, 4)):
            print(f"{pid}: ALREADY PATCHED {proto}")
            continue
        indent = "    "
        lines[locals_idx + 1:locals_idx + 1] = [indent + ins for ins in body]
        print(f"{pid}: {path.name} :: {proto}")
        print(f"      .locals={nlocals} (need {need_regs}) @file-line {start+1}")
        for ins in body:
            print(f"      + {indent}{ins}")
        if args.apply:
            path.write_text("\n".join(lines) + "\n")
            changed.add(rel)
    print(f"\nfiles touched: {len(changed)}")
    for f in sorted(changed):
        print("  -", f)
    if errors:
        print("\nERRORS:")
        for e in errors:
            print("  !", e)
        return 1
    print("OK" + (" (applied)" if args.apply else " (dry-run)"))
    return 0


if __name__ == "__main__":
    sys.exit(main())
