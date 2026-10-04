# miniworld-patch

Reproducible build for a modified **Mini World: CREATA 1.7.15**
(`com.playmini.miniworld`, versionCode 67343) as an installable split-APK
bundle, with **every split the source ships**: 2 ABI, 24 languages, 7
densities.

Three changes are made to the app. Everything else is gated by
`scripts/verify.sh` before a bundle is produced: a pristine decode is diffed
against the patched tree so that only the eleven patched smali files, the new
`smali_classes8/modmenu/` classes, the manifest and the `$`-renamed resources
may differ; entry, native-library, asset and `resources.arsc` counts are
compared against the original; the package identity is read back from the
built APK; and each of the 20 patches is confirmed by content, not merely by
"this file changed".

## What the mod does

| # | Change | Where |
|---|--------|-------|
| 1 | In-game browser / WebView opening is blocked | `ClientMethodCommonApi` (5 JNI/Lua entries) and `MiniUniverseHelper` (3 loadUrl convergence points), plus `android:exported="false"` on `BrowserActivity` |
| 2 | Device identifiers the client generates itself are spoofed | `IdDevice`, `cn/mini1/utils/b`, `ClientMethodCommonApi.GetFlyerUID` |
| 3 | Notification-based mod menu with an on/off switch per mod, plus HWID rotation | `ModMenu` + `ModMenuActivity`, committed smali in `smali_classes8/modmenu/`, started by hooks at the head of `GoogleApplication.onCreate` and `AppPlayBaseActivity.onCreate` |
| 4 | Rewarded-ad reward without watching the ad | head of `ClientMethodUniverseSubject.reqSdkAD`: the stub fires `onWatchAD(1001)` + the `DeliverAdEvent` Lua event through `AdReward`, the same pair a real rewarded video ends in |
| 5 | Google login under MicroG/GmsCore | forces `GooglePlayServicesUtilLight.isGooglePlayServicesAvailable` past the certificate/version gate and retries One-Tap failures through the legacy `GoogleSignInApi` (`legacySignIn`/`onResult` in `modmenu.GmsCompat`) |
| 6 | OTG keyboard and mouse input reaches the engine like the Windows build | `modmenu.InputBridge`, a `Window.Callback` wrapper installed on every activity as it resumes: keys are injected into `AppPlayer.injectEvent` (after evaluating `enableAllKeyBind()` in the game's Lua VM), mouse-button touches are rewritten from `SOURCE_MOUSE` to a finger touch, and pointer motion is injected as-is |
| 7 | Crosshair mode: the cursor disappears and moving the mouse looks around | `modmenu.InputBridge` holds pointer capture on the game surface while the switch (or F1) is on, rewrites pointer movement into a centre-screen finger drag - the engine's proven camera path - and lands mouse clicks on the crosshair |

Constants live in `spoof.env`.

The game posts an Android notification on startup (title "Mini World", body
translated through `modmenu.I18n`); tapping it opens the menu, a
Material You bottom sheet with one switch per mod. The switches persist in
`SharedPreferences`, default to on — which is exactly changes 1, 2, 4 and 6
above, with crosshair mode (`isCrosshairOn()`) the exception as it starts off
— and gate their stubs through `ModMenu.isWebBlocked()` / `isSpoofOn()`
/ `isRewardBypass()` / `isKbMouseOn()`. The third switch makes the
`reqSdkAD` stub skip the ad SDK and fire the exact success pair (`onWatchAD(1001)` plus the
`DeliverAdEvent` Lua event) a moment later, so the reward credits with no ad
ever loading — which also covers devices where low RAM drops the game to its
`EmptyAd` fallback. The HWID-rotate button steps a stored generation
counter that `ModMenu.spoofValue()` applies to every baked identity on its
next read; each generation is a deterministic, format-preserving rewrite (hex
stays hex, separators stay put), so a banned fake identity can be swapped for
a fresh one without rebuilding — the client picks the new values up at its
next start. On Android 13+ the post waits for the `POST_NOTIFICATIONS`
runtime grant and retries for a few minutes; that permission is already
declared by the source manifest.

Menu and notification wording lives in
`patches/modmenu/res/values*/modmenu_strings.xml`: one file per language —
English, Vietnamese, Simplified Chinese and Traditional Chinese (TW/HK/MO
variants) ship by default, Android's resource selection picks the file from
the device locale and falls back to the English default for every other
language. `modmenu.I18n` resolves the keys by name at runtime
(`Resources.getIdentifier`), so no resource ids are baked into the committed
smali. Rewording a string or adding a language is an edit in those files:
`build.sh` copies them into the decode before the rebuild links them into
`resources.arsc`, `scopecheck` requires every file from the patch to land
there, and `verify.sh` asserts the strings survived the rebuild.

OTG keyboards and mice are wired to the engine by `modmenu.InputBridge`.
DecorView routes key, pointer and touch events to the window callback before
any view, so the wrapper is a single focus-independent delivery point: it is
installed on every activity as it resumes (`InputBridge.Lifecycle`, registered
from `onAppCreate`), injects each hardware key into `AppPlayer.injectEvent`
exactly once, and evaluates `enableAllKeyBind()` in the game's Lua VM right
before a fresh key-down - pcall-wrapped inside a `or function() end` fallback
so a missing global is a no-op and can never raise into the script host.
Mouse clicks reach Android as `SOURCE_MOUSE`/`TOOL_TYPE_MOUSE` touches, which
the engine's touch path ignores, so the wrapper rebuilds them as finger
touches (same coordinates, `TOOL_TYPE_FINGER`, `SOURCE_TOUCHSCREEN`, no button
state) before passing them on - a mouse click becomes exactly a finger tap.
System keys (Back, volume, menu) and real finger touches keep their normal
Android path. Everything logs under the `MWInput` tag (`installed on <activity>`,
`key <code>/<action> eng=<bool>`, `mouse-touch <action> handled=<bool>`), so a
LogFox capture shows exactly where an event stops. The engine side is not
something this patch adds - `ProcessKeyEvent`, a `KeyCharacterMap` lookup, the
`keyBindForward`/`keyBindJump`/... bind table and the
`UIEventType_KeyDown`/`IsKeyDown` machinery are already compiled into
`liblibGameApp.so`.

Crosshair mode (fifth switch, off by default, or F1 while the OTG bridge is
on) asks the game surface for pointer capture, so the system cursor disappears
while movement keeps arriving; every movement is rewritten into a finger drag
around the screen centre - the same path a thumb uses to turn the camera - and
mouse clicks are rebuilt at the crosshair instead of the locked pointer
position. A real finger touch, a mouse click or a lost window focus ends the
synthetic drag first, and capture is released whenever the window loses focus
so menus can show a cursor again. The first fresh key-down after startup also
fires a one-shot Lua probe (logged as `MWP2|...` through both `print` and the
engine's own error logger) that walks every global table for the engine's
keybind/control-mode API (`setOneKeyBindCode`, `getContrlMode`, the hotkey
settings UI, whatever invoker owns them) and reports the mode getters, so the
keybind backport is driven by data instead of a guess.

Google sign-in keeps working on devices that ship MicroG/GmsCore instead of
official Play Services. The game logs in through Identity One-Tap, whose
`...identity.service.signin.START` service MicroG does not provide, and the
bundled client rejects MicroG's certificate (status 9) before anything else
is attempted. The `F` patches force
`GooglePlayServicesUtilLight.isGooglePlayServicesAvailable` to report success
for every caller, then turn any One-Tap failure into a retry through the
legacy `GoogleSignInApi` (`GmsCompat`, in classes8: the primary dex sits two
method ids below the 64K limit, so new code for this build belongs there) with
the same web client id, so the id token handed to the server is still a
genuine Google-signed one. They are forced rather than switched: on official
Play Services One-Tap succeeds and the fallback never runs. Whether MicroG
can mint that id token for this client id is the one part that has to be
proven on a device actually running it.

Two other edits are required for the mod to work at all, rather than being
features:

- `CommonNatives.verifyPackage` is forced to `true`. After re-signing, its
  `false` branch would skip the only sender of `MSG_ASYNC_INIT_SDK` and the
  app would hang at login.
- `stamp-cert-sha256` is stripped from every split. Those entries name the
  **original** signer; apksigner does not emit a stamp block, so leaving them
  would fail install-time verification.

`AdvertisingIdClient` is deliberately left alone — faking it there would break
the ad SDKs, which read that id directly from Play services. Only the app's own
getters are redirected.

## Layout

```
patches/patch.py        inserts toggle-gated stubs, menu hooks and fallback
                        branches at the head of 20 smali methods
patches/modmenu/        mod-menu sources: Java under src/, regen.sh rebuilds the
                        smali under smali/ (javac -> d8 -> apktool); CI copies
                        that smali as-is, no JDK needed there
tools/manifest.py       sets android:exported=false on BrowserActivity and
                        declares modmenu.ModMenuActivity (exported=false)
tools/fixdollar.py      aapt1 allowed '$' in resource entry names, aapt2 does not:
                        renames the 29 drawables and rewrites public.xml and every
                        referencing XML together so entry IDs stay pinned
tools/scopecheck.py     diffs a pristine decode against the patched one and fails
                        on anything outside the intended files
tools/align.py          measures 4-byte alignment
tools/zipalign.py       pure-python aligner, also drops entries
scripts/env.sh          path/tool resolution, sourced by everything else
scripts/build.sh        the whole pipeline, one command
scripts/fetch_source.sh resolves and downloads the source .apkm from APKMirror
scripts/verify.sh       6-check gate on base.apk
scripts/verify_bundle.sh  gate on the finished bundle
.github/workflows/build.yml
```

## Running it

### Locally

```bash
bash scripts/build.sh            # fetches from the release page pinned in scripts/env.sh
bash scripts/build.sh '<apkmirror release page>'   # a different release
```

Or point it at a bundle you already have:

```bash
SRC_FILE=/path/to/source.apkm bash scripts/build.sh
```

Set `MW_WORK` to put the work tree somewhere other than `work/`. Build
artifacts land in `$MW_WORK/out/MiniWorld-mod.apkm`.

The script needs `java` (21), `python3`, `unzip`, `zip`, `curl`, plus `aapt2`
and `apksigner` either on `PATH` or under `$ANDROID_HOME/build-tools`. It does
**not** add build-tools to `PATH`: on a Termux install those binaries are
x86_64 ELFs that would shadow the working Termux copies, so `env.sh` resolves
each tool individually. `curl_cffi` (pip) is optional locally and required on
CI — see Source below.

### In CI

Push the repo, set these secrets, then run the **build** workflow:

| Secret | Value |
|--------|-------|
| `APK_KEYSTORE` | `base64 -w0 modkey.jks` (the whole keystore, one line) |
| `APK_KEYSTORE_PASS` | keystore password |
| `APK_KEY_ALIAS` | defaults to `mod` if unset |
| `APK_KEY_PASS` | key password, defaults to `APK_KEYSTORE_PASS` |

> [!IMPORTANT]
> The keystore is a permanent secret. Every future build must use the same
> one, or Android will refuse to install the new bundle over the previous one.
> `repack.sh` deliberately refuses to run without a keystore rather than
> generating a throwaway key.

The workflow downloads apktool 3.0.3 with a pinned SHA-256, runs
`scripts/build.sh`, and publishes `MiniWorld-mod.apkm` to a release. The
source is the release page pinned in `scripts/env.sh`; its download link
carries a `key=` that expires within the hour, so `fetch_source.sh` scrapes a
fresh one on every run — dispatching the workflow needs no input.

> [!NOTE]
> The pipeline was developed against a Termux apktool reporting `3.0.3-dirty`;
> CI uses the official `3.0.3`. The checksum pins the jar, it does not compare
> the two builds — `scripts/verify.sh` holds each one to the same spec
> independently.

## Source

`scripts/fetch_source.sh` takes either a release page or a
`/download/?key=...` link (the release page is the default, pinned as
`SOURCE_PAGE` in `env.sh`), and hands it to `scripts/resolve_source.py`.
That split exists because of Cloudflare: on a datacenter IP — GitHub Actions —
a plain curl gets the "Just a moment..." interstitial and a headless browser
gets "Attention required" instead, so the HTML requests go through
`curl_cffi` with a Chrome TLS fingerprint (plain curl is the fallback where
that package is not installed, e.g. a local Termux). The resolver scrapes the
fresh `download/?key=` link off the release page when given a bare page,
fetches that page, parses the `download.php?id=...&key=...` link out of it,
and returns the object-storage URL it redirects to. Only that hand-off needs
the impersonation — the 874MB payload is fetched by `curl` directly from
object storage, where plain ranged requests work.

The download is then checked three ways: byte count, `testzip()` over every
member, and `info.json` against the pinned `apk_id` / package / versionCode —
a wrong release would otherwise be patched against the wrong smali and only
fail much later. Calling the script with no URL re-runs those same assertions
against an already-downloaded file.

## Installing

> [!CAUTION]
> Uninstall the original app first. The bundle is re-signed with a different
> key, so it will not install over the original, and the reinstall discards
> local saves and any login session.

`MiniWorld-mod.apkm` is a zip of split APKs in APKMirror's format — install it
with SAI or APKMirror Installer.

## Limits

- The spoofed identifiers are frozen in `spoof.env`, so anyone building from
  this repo produces the same ones. If a value is ever blacklisted it is
  blacklisted for every build.
- Verification here is static: archive integrity, entry counts, package
  identity, alignment, manifest flags, patch-scope diff, presence of all 20
  patches (including the mod-menu classes and its notification text in the
  built dex), the spoof constants, every split's versionCode, and the pinned
  signer certificate. The app has not been run on a device, so login after
  re-sign, the effect of the native `deviceId` report and the menu
  notification still need a first runtime test.
- The bundle comes out around 917 MB — the whole source is 916,916,904
  bytes, and roughly 90% of that is the install-time asset pack. The ABI and
  language splits together add about 130 MB uncompressed but compress well
  inside the container.
- Rebuilding reproduces the same 2585 entries byte for byte (measured by
  diffing two builds), but not the same archive: zip entry timestamps and the
  APK signing block change every run, so the sha256 printed in the release
  notes is specific to that build. Verify a download against the notes for the
  release you took it from.
