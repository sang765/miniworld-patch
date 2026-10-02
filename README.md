# miniworld-patch

Reproducible build for a modified **Mini World: CREATA 1.7.15**
(`com.playmini.miniworld`, versionCode 67343) as an installable split-APK
bundle, trimmed to **arm64-v8a + Vietnamese**.

Exactly two changes are made to the app. Everything else is gated by
`scripts/verify.sh` before a bundle is produced: a pristine decode is diffed
against the patched tree so that only the five patched smali files, the
manifest and the `$`-renamed resources may differ; entry, native-library,
asset and `resources.arsc` counts are compared against the original; the
package identity is read back from the built APK; and each of the 14 patch
stubs is confirmed by content, not merely by "this file changed".

## What the mod does

| # | Change | Where |
|---|--------|-------|
| 1 | In-game browser / WebView opening is blocked | `ClientMethodCommonApi` (5 JNI/Lua entries) and `MiniUniverseHelper` (3 loadUrl convergence points), plus `android:exported="false"` on `BrowserActivity` |
| 2 | Device identifiers the client generates itself are spoofed | `IdDevice`, `cn/mini1/utils/b`, `ClientMethodCommonApi.GetFlyerUID` |

Constants live in `spoof.env`.

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
patches/patch.py        inserts early-return stubs at the head of 14 smali methods
tools/manifest.py       sets android:exported=false on BrowserActivity
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
each tool individually.

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
`SOURCE_PAGE` in `env.sh`). It does not fetch either directly, for two
reasons. APKMirror's `/download/?key=...` endpoint only renders the download
landing page when the request carries the site's cookies — without them it
hands back the release listing page, whose download button points at the very
URL you just requested, so there is no link to parse at all. The script
therefore visits the release page first with a cookie jar, scrapes the fresh
`download/?key=` link off it if it was given a bare page, then fetches that
page, parses the `download.php?id=...&key=...` link out of it, and follows its
redirect to the object store.

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
  identity, alignment, manifest flags, patch-scope diff, presence of all 14
  stubs, the spoof constants, every split's versionCode, and the pinned signer
  certificate. The app has not been run on a device, so login after re-sign
  and the effect of the native `deviceId` report still need a first runtime
  test.
- The bundle stays around 829 MB. Roughly 90% of that is the install-time
  asset pack; dropping the arm-v7a split only saves about 45 MB because the
  native libraries compress well.
- Rebuilding reproduces the same 2585 entries byte for byte (measured by
  diffing two builds), but not the same archive: zip entry timestamps and the
  APK signing block change every run, so the sha256 printed in the release
  notes is specific to that build. Verify a download against the notes for the
  release you took it from.
