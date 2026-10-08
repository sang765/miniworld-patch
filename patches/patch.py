#!/usr/bin/env python3
"""Insert early-return stubs and mod-menu startup hooks at method heads.

Dry-run by default; pass --apply to write. Every target is validated:
the method must exist exactly once, .locals must be >= registers used,
and the head must be free of .param/.annotation blocks once the insertion
offset is found - for methods whose prologue follows .locals, the stub is
written after the prologue instead of splicing into it.

The A/B/E stubs are gated by the mod-menu toggles (isWebBlocked/isSpoofOn/
isRewardBypass) so each mod can be switched off at runtime; C1 stays forced
because re-signing the APK makes the original package check fail, D1/D2
start the menu, and F1-F3 wire the Google-login MicroG fallback, which must
behave the same with or without the menu.
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
    always at the method's insertion offset, so a disabled mod falls straight
    through to the original instructions.
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


def desc_stub(value):
    """Return a spoofed device descriptor verbatim, without rotation.

    A model or an OS version has to stay a plausible model or OS version -
    Hwid.rotate would rewrite its digits into nonsense ("14" -> "07") - and
    unlike an id it carries no uniqueness to preserve: the same string is
    shared by millions of real devices, so a fixed fake leaks nothing while
    the real value would be uploaded by every report node.
    """
    return [
        f'const-string v0, "{value}"',
        "return-object v0",
    ]


# The game signs in through Identity One-Tap, whose service MicroG/GmsCore does
# not provide. F2/F3 hand a failed One-Tap over to modmenu.GmsCompat, which
# retries through the legacy GoogleSignInApi: same web client id, so the id
# token is still the one the server expects. The work lives there instead of
# in GoogleLoginSDK because the primary dex is a couple of method ids below
# the 64K limit (classes8 has room, and callGame is reached by reflection).


# (id, relative file, method name+proto, registers used by inserted code,
#  inserted lines)
def build_patches(GAID, DTOKEN, UNIQUE, FLYER, MODEL, OS):
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
        # --- B: spoof HWID and device descriptors (toggle: hwidSpoof) ---
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
        # One chokepoint per descriptor: every live game-side reader of
        # Build.MODEL / Build$VERSION.RELEASE (the TechReportNode and
        # ReportTrackingUtil report nodes, the getMobilePhoneInfo JSON Lua
        # queries) funnels through these two, and the third-party UID
        # checkers echo Model / OS back from exactly those reports.
        ("B6", "smali/cn/mini1/utils/devices/b.smali",
         "d()Ljava/lang/String;", 1,
         gated("isSpoofOn", desc_stub(MODEL))),
        ("B7", "smali/cn/mini1/utils/devices/b.smali",
         "o()Ljava/lang/String;", 1,
         gated("isSpoofOn", desc_stub(OS))),
        # --- G: block the game's own telemetry (toggle: antiTrack) ---
        # ReportHttpManager is the single HTTP layer of the report SDK: the
        # Tech/Device/Third report nodes (device_collect, logpost5 - the
        # store a third-party UID checker reads device and behaviour data
        # from) all funnel through ReportManager into these two overloads,
        # and ReportTrackingUtil's own events ride the client it configures
        # for that same manager. Nothing gameplay-related is posted through
        # it - room, login and social traffic use their own channels.
        ("G1", "smali_classes6/com/miniworld/report/http/ReportHttpManager.smali",
         "newCall(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;"
         "Lcom/miniworld/report/http/ReportFormatType;Lokhttp3/Callback;)V", 1,
         gated("isAntiTrack", ["return-void"])),
        ("G2", "smali_classes6/com/miniworld/report/http/ReportHttpManager.smali",
         "newCall(Ljava/lang/String;Lokhttp3/RequestBody;Ljava/util/Map;"
         "Lokhttp3/Callback;)V", 2,
         gated("isAntiTrack", ["return-void"])),
        # uploadRegistrationId posts {uin, nickname, push token} to tj3; the
        # token never reaching the server is the accepted cost of the block.
        ("G3", "smali/org/appplay/lib/ClientMethodSubject.smali",
         "uploadRegistrationId(Ljava/lang/String;Ljava/lang/String;"
         "Ljava/lang/String;)Ljava/lang/String;", 1,
         gated("isAntiTrack", ['const-string v0, ""', "return-object v0"])),
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
        # --- F: Google login under MicroG/GmsCore (forced, no toggle) ---
        # F1: every availability caller funnels through this method, and it is
        # where MicroG dies (certificate whitelist, min-version check).
        ("F1", "smali/com/google/android/gms/common/GooglePlayServicesUtilLight.smali",
         "isGooglePlayServicesAvailable(Landroid/content/Context;I)I", 1,
         ["const/4 v0, 0x0", "return v0", ":modmenu_orig"]),
        # F2: beginSignIn failing is exactly the MicroG case (no Identity
        # service) - retry through the legacy flow instead of reporting -1.
        ("F2", "smali_classes8/org/appplay/lib/sdk/GoogleLoginSDK$1.smali",
         "onFailure(Ljava/lang/Exception;)V", 2,
         ["iget-object v0, p0, "
          "Lorg/appplay/lib/sdk/GoogleLoginSDK$1;->this$0:Lorg/appplay/lib/sdk/GoogleLoginSDK;",
          "invoke-static {v0}, "
          "Lorg/appplay/lib/sdk/GoogleLoginSDK;->access$200(Lorg/appplay/lib/sdk/GoogleLoginSDK;)Landroid/app/Activity;",
          "move-result-object v1",
          "invoke-static {v0, v1}, Lmodmenu/GmsCompat;->legacySignIn(Lorg/appplay/lib/sdk/GoogleLoginSDK;Landroid/app/Activity;)V",
          "return-void",
          ":modmenu_orig"]),
        # F3: result code for GmsCompat's legacySignIn (0xf4a1b is One-Tap's)
        # is routed before the existing filter, which would swallow it.
        ("F3", "smali/org/appplay/lib/sdk/GoogleLoginSDK.smali",
         "OnActivityResult(IILandroid/content/Intent;)V", 1,
         ["const v0, 0xf4a1c",
          "if-ne p1, v0, :modmenu_orig",
          "invoke-static {p0, p3}, "
          "Lmodmenu/GmsCompat;->onResult(Lorg/appplay/lib/sdk/GoogleLoginSDK;Landroid/content/Intent;)V",
          "return-void",
          ":modmenu_orig"]),
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


def insert_idx(lines, locals_idx):
    """Offset the stub is written at: right after `.locals`, except when a
    `.param`/`.annotation` prologue sits there - instructions may not be
    spliced into the prologue, so the offset moves past it.

    The prologue's body counts too: an `.annotation` block spans several
    lines of `value = {...}` that match none of the directives below, and
    stopping there would split the annotation in half and leave a method
    that no longer assembles.
    """
    j = locals_idx + 1
    if j >= len(lines):
        return j
    if not lines[j].strip().startswith((".param", ".annotation")):
        return j
    depth = 0
    while j < len(lines):
        s = lines[j].strip()
        if s.startswith(".annotation"):
            depth += 1
        elif s.startswith(".end annotation"):
            depth -= 1
        if depth > 0:
            j += 1
            continue
        if s.startswith((".param", ".annotation", ".end annotation",
                         ".end param")) or not s:
            j += 1
            continue
        break
    return j


def head_is_clean(lines, idx, proto):
    """Head must be free of .param/.annotation before the first real body line."""
    for j in range(idx, idx + 12):
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


def is_patched(lines, at, body):
    """True when the whole stub already sits at the insertion offset.

    The stub is always written at exactly the offset returned by insert_idx,
    so testing the full contiguous body there is the only sound test.
    Matching just the first line anywhere in a small window would read a
    pristine method that returns void within its first few instructions as
    already patched and skip it - which would silently drop one of the
    browser-block entries while still exiting 0.
    """
    got = [line.strip() for line in lines[at:at + len(body)]]
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
                            spoof["UNIQUE"], spoof["FLYER"],
                            spoof["MODEL"], spoof["OS"])

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
        at = insert_idx(lines, locals_idx)
        if is_patched(lines, at, body):
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
        head = lines[at].strip() if at < len(lines) else ""
        if head.startswith(f"invoke-static {{}}, {MODMENU}->is") or any(
                lines[k].strip() == ":modmenu_orig"
                for k in range(at, min(at + 24, len(lines)))):
            end = next((k for k in range(at, min(at + 24, len(lines)))
                        if lines[k].strip() == ":modmenu_orig"), None)
            if end is not None:
                print(f"{pid}: replacing a previous stub revision in {rel}")
                del lines[at:end + 1]
        clean, bad = head_is_clean(lines, at, proto)
        if not clean:
            errors.append(f"{pid}: dirty head (.param/.annotation) at line {bad} in {proto}")
            continue
        indent = "    "
        lines[at:at] = [indent + ins for ins in body]
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
