#!/usr/bin/env python3
"""Insert early-return stubs and mod-menu startup hooks at method heads.

Dry-run by default; pass --apply to write. Every target is validated:
the method must exist exactly once, .locals must be >= registers used,
and the head must not contain .param/.annotation blocks.

The A/B/E stubs are gated by the mod-menu toggles (isWebBlocked/isSpoofOn/
isRewardBypass) so each mod can be switched off at runtime; C1 stays forced
because re-signing the APK makes the original package check fail, and D1/D2
start the menu.
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

MODMENU = "Lmodmenu/ModMenu;"


def gated(flag, body):
    """Run `body` only while the mod-menu toggle is on.

    The jump target sits at the end of the inserted block, and insertion is
    always at locals_idx+1, so a disabled mod falls straight through to the
    original instructions.
    """
    return [
        f"invoke-static {{}}, {MODMENU}->{flag}()Z",
        "move-result v0",
        "if-eqz v0, :modmenu_orig",
    ] + body + [":modmenu_orig"]


def spoof_stub(value):
    """Return the spoofed identity, rotated to the current generation.

    The baked constant is the generation-0 default; ModMenu.spoofValue
    rewrites it deterministically whenever the menu's HWID button has been
    used, so one build can present a fresh device identity without patching.
    """
    return [
        f'const-string v0, "{value}"',
        f"invoke-static {{v0}}, {MODMENU}->spoofValue(Ljava/lang/String;)Ljava/lang/String;",
        "move-result-object v0",
        "return-object v0",
    ]


# (id, relative file, method name+proto, registers used by inserted code, inserted lines)
def build_patches(GAID, DTOKEN, UNIQUE, FLYER):
    return [
        # --- A: block WebView / browser opening (toggle: webBlocked) ---
        ("A1", "smali/org/appplay/lib/ClientMethodCommonApi.smali",
         "BrowserShowWebpage(Ljava/lang/String;I)V", 1,
         gated("isWebBlocked", ["return-void"])),
        ("A2", "smali/org/appplay/lib/ClientMethodCommonApi.smali",
         "WindowBrowserOpenWebpage(Ljava/lang/String;IIII)V", 1,
         gated("isWebBlocked", ["return-void"])),
        ("A3", "smali/org/appplay/lib/ClientMethodCommonApi.smali",
         "WindowBrowserShowWebpage()V", 1,
         gated("isWebBlocked", ["return-void"])),
        ("A4", "smali/org/appplay/lib/ClientMethodCommonApi.smali",
         "reopenWebView(Ljava/lang/String;)Ljava/lang/String;", 1,
         gated("isWebBlocked", ['const-string v0, ""', "return-object v0"])),
        ("A8", "smali/org/appplay/lib/ClientMethodCommonApi.smali",
         "OpenWebView(Ljava/lang/String;ILjava/lang/String;)V", 1,
         gated("isWebBlocked", ["return-void"])),
        ("A5", "smali_classes8/org/appplay/lib/browser/MiniUniverseHelper.smali",
         "loadUrl(Ljava/lang/String;)V", 1,
         gated("isWebBlocked", ["return-void"])),
        ("A6", "smali_classes8/org/appplay/lib/browser/MiniUniverseHelper.smali",
         "reopenWebView(Ljava/lang/String;)V", 1,
         gated("isWebBlocked", ["return-void"])),
        ("A7", "smali_classes8/org/appplay/lib/browser/MiniUniverseHelper.smali",
         "handleLoadUrl(Ljava/lang/String;)V", 1,
         gated("isWebBlocked", ["return-void"])),
        # --- B: spoof HWID (toggle: hwidSpoof) ---
        ("B1", "smali/org/appplay/lib/utils/IdDevice.smali",
         "getAdvertisingId(Landroid/content/Context;)Ljava/lang/String;", 1,
         gated("isSpoofOn", spoof_stub(DTOKEN))),
        ("B2", "smali/org/appplay/lib/utils/IdDevice.smali",
         "getGoogleAdId()Ljava/lang/String;", 1,
         gated("isSpoofOn", spoof_stub(GAID))),
        ("B3", "smali/org/appplay/lib/utils/IdDevice.smali",
         "getGoogleAdidFilter()Ljava/lang/String;", 1,
         gated("isSpoofOn", spoof_stub(GAID))),
        ("B4", "smali/cn/mini1/utils/b.smali",
         "m()Ljava/lang/String;", 1,
         gated("isSpoofOn", spoof_stub(UNIQUE))),
        ("B5", "smali/org/appplay/lib/ClientMethodCommonApi.smali",
         "GetFlyerUID()Ljava/lang/String;", 1,
         gated("isSpoofOn", spoof_stub(FLYER))),
        # --- C: keep SDK init alive after re-sign (forced, no toggle) ---
        ("C1", "smali/org/appplay/lib/CommonNatives.smali",
         "verifyPackage(Landroid/content/Context;)Z", 1,
         ["const/4 v0, 0x1", "return v0"]),
        # --- D: mod-menu startup hooks (p0 only, no local registers) ---
        ("D1", "smali/cn/mini1/google/GoogleApplication.smali",
         "onCreate()V", 0,
         [f"invoke-static {{p0}}, {MODMENU}->onAppCreate(Landroid/content/Context;)V"]),
        ("D2", "smali/org/appplay/lib/AppPlayBaseActivity.smali",
         "onCreate(Landroid/os/Bundle;)V", 0,
         [f"invoke-static {{p0}}, {MODMENU}->onGameStart(Landroid/app/Activity;)V"]),
        # --- E: rewarded-ad reward without watching (toggle: rewardBypass) ---
        # p2=platformId / p3=positionId feed the fake success event; return 1
        # matches what ADHelper.reqSdkAD always reports to Lua.
        ("E1", "smali/org/appplay/lib/client/ClientMethodUniverseSubject.smali",
         "reqSdkAD(Ljava/lang/String;III)I", 1,
         gated("isRewardBypass", [
             "invoke-static {p2, p3}, Lmodmenu/AdReward;->fire(II)V",
             "const/4 v0, 0x1",
             "return v0",
         ])),
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


def is_patched(lines, locals_idx, body):
    """True when the whole stub already sits at the insertion offset.

    The stub is always written at exactly locals_idx+1, so testing the full
    contiguous body there is the only sound test. Matching just the first line
    anywhere in a small window would read a pristine method that returns void
    within its first few instructions as already patched and skip it - which
    would silently drop one of the browser-block entries while still exiting 0.
    """
    got = [line.strip() for line in lines[locals_idx + 1:locals_idx + 1 + len(body)]]
    return got == body


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--decoded", type=Path, default=DEFAULT_DECODED,
                    help="decoded apk directory (default: %(default)s)")
    ap.add_argument("--spoof", type=Path, default=DEFAULT_SPOOF,
                    help="identity constants file (default: %(default)s)")
    ap.add_argument("--apply", action="store_true",
                    help="write changes (default is a dry run)")
    ap.add_argument("--check", action="store_true",
                    help="assert every stub is present instead of applying anything")
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
    missing = []
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
        if is_patched(lines, locals_idx, body):
            if args.check:
                print(f"{pid}: present  {proto}")
            else:
                print(f"{pid}: ALREADY PATCHED {proto}")
            continue
        if args.check:
            missing.append(f"{pid}: stub absent in {rel} :: {proto}")
            print(f"{pid}: MISSING  {proto}")
            continue
        # An older revision of this stub may already occupy the head (same
        # gate, previous body); strip it so --apply replaces it instead of
        # stacking a second gate, which would duplicate :modmenu_orig.
        if locals_idx + 1 < len(lines) and lines[locals_idx + 1].strip().startswith(
                f"invoke-static {{}}, {MODMENU}->is"):
            end = next((k for k in range(locals_idx + 1, min(locals_idx + 24, len(lines)))
                        if lines[k].strip() == ":modmenu_orig"), None)
            if end is not None:
                print(f"{pid}: replacing a previous stub revision in {rel}")
                del lines[locals_idx + 1:end + 1]
        clean, bad = head_is_clean(lines, locals_idx, proto)
        if not clean:
            errors.append(f"{pid}: dirty head (.param/.annotation) at line {bad} in {proto}")
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

    if args.check:
        print(f"\npatches present: {len(patches) - len(missing)}/{len(patches)}")
        if errors or missing:
            print("\nERRORS:")
            for e in errors + missing:
                print("  !", e)
            return 1
        print("CHECK OK")
        return 0

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
