#!/usr/bin/env bash
# Gate on the finished bundle.
#
# verify.sh covers base.apk in isolation; this checks the artifact that is
# actually handed out. A bundle can still be broken with a valid base: a
# dropped split, a leftover stamp naming the original signer, or one split
# signed with a different key.
#
# usage: verify_bundle.sh [path/to/MiniWorld-mod.apkm]
set -euo pipefail

. "$(dirname "${BASH_SOURCE[0]}")/env.sh"

BUNDLE="${1:-$OUT/MiniWorld-mod.apkm}"
EXPECT_APKS=11

T=$(mktemp -d "${TMPDIR:-/tmp}/mwbundle.XXXXXX")
trap 'rm -rf "$T"' EXIT

fail=0
step() { echo; echo "### $*"; }

step "1. archive integrity"
# `A && B` does not abort under set -e, so the flag has to be set explicitly
if unzip -tqq "$BUNDLE"; then
  echo "zip OK"
else
  echo "FAIL: corrupt archive"; fail=1
fi

step "2. contents: $EXPECT_APKS apks + info.json + icon.png"
names=$(unzip -Z1 "$BUNDLE")
apks=$(printf '%s\n' "$names" | grep -c '\.apk$' || true)
echo "apks: $apks (expect $EXPECT_APKS)"
[ "$apks" -eq "$EXPECT_APKS" ] || fail=1
for need in info.json icon.png; do
  printf '%s\n' "$names" | grep -qx "$need" || { echo "missing $need"; fail=1; }
done
extra=$(printf '%s\n' "$names" | grep -vE '\.apk$|^(info\.json|icon\.png)$' || true)
if [ -n "$extra" ]; then
  echo "unexpected members:"; echo "$extra" | sed 's/^/  /'; fail=1
fi

step "3. info.json describes what was actually shipped"
python3 - "$BUNDLE" <<'PY' || fail=1
import json, sys, zipfile
with zipfile.ZipFile(sys.argv[1]) as z:
    d = json.loads(z.read("info.json"))
if d.get("arches") != ["arm64-v8a"]:
    raise SystemExit(f"arches={d.get('arches')!r} (expected ['arm64-v8a'])")
if d.get("languages") != ["vi"]:
    raise SystemExit(f"languages={d.get('languages')!r} (expected ['vi'])")
print(f"arches={d['arches']} languages={d['languages']}")
PY

step "4. extract every apk"
mkdir -p "$T/x"
unzip -o -q "$BUNDLE" '*.apk' -d "$T/x"

step "5. every split declares the pinned package and versionCode"
# A bundle whose base came from one source and whose splits from another passes
# everything else in this file - member count, stamps and signer all look right
# - and then dies at install with INSTALL_FAILED_INVALID_APK. Reading all 11
# badging dumps is what catches it, along with a mangled manifest.
: > "$T/badging"
for f in "$T"/x/*.apk; do
  b=$(basename "$f")
  line=$("$AAPT2" dump badging "$f" 2>/dev/null | grep -m1 '^package: ' || true)
  if [ -z "$line" ]; then
    echo "  FAIL: no badging for $b"
    fail=1
    continue
  fi
  # anchored: a greedy `.*name='` matches the last `...Codename='14'` on the
  # line and silently reports the compile SDK as the package name
  pkg=$(printf '%s' "$line" | sed -n "s/^package: name='\([^']*\)'.*/\1/p")
  vc=$(printf '%s' "$line" | sed -n "s/^package: name='[^']*' versionCode='\([^']*\)'.*/\1/p")
  printf '%s\t%s\t%s\n' "$b" "$pkg" "$vc" >> "$T/badging"
done
bad=$(awk -F'\t' -v p="$WANT_PKG" -v c="$WANT_VCODE" \
  '$2 != p || $3 != c' "$T/badging")
if [ -n "$bad" ]; then
  echo "  FAIL: split(s) not matching $WANT_PKG versionCode=$WANT_VCODE:"
  echo "$bad" | sed 's/^/    /'
  fail=1
else
  echo "  $(grep -c . "$T/badging")/$EXPECT_APKS splits: $WANT_PKG versionCode=$WANT_VCODE"
fi

step "6. no leftover source stamp"
stamps=0
for f in "$T"/x/*.apk; do
  if unzip -Z1 "$f" | grep -qx 'stamp-cert-sha256'; then
    echo "  stamp present: $(basename "$f")"; stamps=$((stamps+1))
  fi
done
[ "$stamps" -eq 0 ] || fail=1
echo "checked $(ls "$T"/x/*.apk | wc -l) apks"

step "7. every split is signed by the pinned key"
: > "$T/certs"
for f in "$T"/x/*.apk; do
  d=$(run_apksigner verify --print-certs "$f" 2>&1 \
        | sed -n 's/.*certificate SHA-256 digest: *//p' | head -1 | tr -d '[:space:]' || true)
  if [ -n "$d" ]; then
    printf '%s\n' "$d" >> "$T/certs"
  else
    echo "  FAIL: could not read signer digest: $(basename "$f")"
    fail=1
  fi
done
sort -u "$T/certs" > "$T/certs.uniq"
n=$(grep -c . "$T/certs.uniq" || true)
only=$(head -1 "$T/certs.uniq" || true)
echo "distinct signer certs: $n"
cat "$T/certs.uniq" | sed 's/^/  /'
# Counting distinct certs only proves consistency. The bundle is also required
# to install over every earlier build, so the cert has to be the expected one.
if [ "$n" -eq 1 ] && [ "$only" = "$WANT_SIGNER" ]; then
  echo "  matches the pinned key -> OK"
elif [ "$n" -eq 1 ]; then
  echo "  FAIL: signed by an unexpected key"
  echo "        got    $only"
  echo "        want   $WANT_SIGNER"
  echo "        A bundle with this key cannot be installed over earlier builds."
  fail=1
else
  fail=1
fi

step "8. base.apk inside the bundle passes the full verification gate"
mkdir -p "$T/base"
unzip -o -q "$BUNDLE" base.apk -d "$T/base"
bash "$SCRIPTS/verify.sh" "$T/base/base.apk" || fail=1

echo
if [ "$fail" = 0 ]; then echo "=== BUNDLE PASS ==="; else echo "=== BUNDLE FAIL ==="; fi
exit "$fail"
