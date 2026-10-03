#!/usr/bin/env bash
# Repack the modified base.apk plus the untouched splits into one bundle.
#
# Every split the source bundle carries ships: 2 ABI, 24 language, 7 density,
# the base and the install-time asset pack. The base manifest declares
#   requiredSplitTypes="base__abi,base__density"
# so at least one ABI split and one density split are mandatory, and dropping
# a language split would silently drop that language rather than fall back to
# the default - there is no upside to trimming.
#
# Every APK is re-signed with a single new key: Android requires all splits of
# a package to share the base's signer, so the original splits cannot be left
# as-is once base.apk is re-signed. The keystore is REQUIRED - there is no
# auto-generation fallback, because a throwaway key would produce a bundle that
# cannot be installed over the previous build.
set -euo pipefail

. "$(dirname "${BASH_SOURCE[0]}")/env.sh"

# base + every split (2 ABI, 24 language, 7 density) + the asset pack
MIN_APKS=35

if [ ! -f "$KS" ]; then
  {
    echo "FAIL: keystore not found at $KS"
    echo "      Generate one and keep it for every future build:"
    echo "        keytool -genkeypair -keystore modkey.jks -alias $KS_ALIAS \\"
    echo "          -keyalg RSA -keysize 2048 -validity 10000 \\"
    echo "          -storepass <pass> -keypass <pass> \\"
    echo "          -dname 'CN=MiniWorld Mod, O=local, C=VN'"
    echo "      On CI it is provided by the APK_KEYSTORE secret."
  } >&2
  exit 1
fi

mkdir -p "$OUT/signed"

[ -f "$SRC_FILE" ] || { echo "FAIL: source not found at $SRC_FILE" >&2; exit 1; }

# The marker records WHICH source the splits came from, not merely that an
# extraction happened once. Without that, a base rebuilt from a newer release
# could be bundled with older splits - which passes every check here (member
# count, stamps, signer) and then refuses to install with
# INSTALL_FAILED_INVALID_APK. A marker left by an older script is empty and
# therefore never matches, so it re-extracts. A marker whose apks/ was deleted
# out from under it is the same broken state and re-extracts too - otherwise
# the find below fails with a bare "No such file" instead of doing the work.
src_id=$(wc -c < "$SRC_FILE" | tr -d ' ')
marker="$OUT/.extracted"
if [ ! -d "$OUT/apks" ] || [ ! -f "$marker" ] || [ "$(cat "$marker")" != "$src_id" ]; then
  if [ -f "$marker" ] && [ "$(cat "$marker")" != "$src_id" ]; then
    echo "splits came from a different source ($(cat "$marker") bytes, now $src_id) - re-extracting"
  fi
  rm -rf "$OUT/apks"
  mkdir -p "$OUT/apks"
  unzip -o -q "$SRC_FILE" \
    base.apk 'split_config.*.apk' split_mini_asset_pack.apk \
    info.json icon.png -d "$OUT/apks"
  mv -f "$OUT/apks/info.json" "$OUT/apks/icon.png" "$OUT/" 2>/dev/null || true
  printf '%s\n' "$src_id" > "$marker"
fi

count=$(find "$OUT/apks" -name '*.apk' | wc -l)
echo "apks extracted: $count (expect $MIN_APKS)"
[ "$count" -eq "$MIN_APKS" ] || { echo "unexpected split set"; exit 1; }

# info.json is copied through untouched: it already describes this exact
# bundle (2 ABI, 24 languages, 7 densities), and verify_bundle.sh reads it
# back against the split names actually present rather than trusting it.

cp "$BUILD/base-mod.apk" "$OUT/apks/base.apk"

# SourceStamp: every split is about to be re-signed with our key, but each one
# still carries a stamp-cert-sha256 naming the ORIGINAL signer. apksigner does
# not emit a stamp signing block, so leaving it in would make Android report
# SOURCE_STAMP_SIGNATURE_BLOCK_WITHOUT_CERT_DIGEST during install verification.
# Dropping the entry makes SourceStamp "not present" - the normal case, and the
# same state the rebuilt base.apk is already in.
for f in "$OUT"/apks/*.apk; do
  if unzip -Z1 "$f" | grep -qx 'stamp-cert-sha256'; then
    python3 "$TOOLS/zipalign.py" --drop stamp-cert-sha256 "$f" "$OUT/apks/.strip.tmp" >/dev/null
    mv -f "$OUT/apks/.strip.tmp" "$f"
    echo "stripped stamp-cert-sha256: $(basename "$f")"
  fi
done

n=0
for f in "$OUT"/apks/*.apk; do
  b=$(basename "$f")

  # apksigner preserves entry offsets, so alignment is inherited from the
  # input - assert it rather than silently lose it.
  python3 "$TOOLS/align.py" "$f" >/dev/null \
    || { echo "MISALIGNED (needs aligner): $b"; exit 1; }

  run_apksigner sign --ks "$KS" --ks-pass "pass:$KS_PASS" --ks-key-alias "$KS_ALIAS" \
    --key-pass "pass:$KS_KEY_PASS" --out "$OUT/signed/$b" "$f"
  run_apksigner verify --verbose "$OUT/signed/$b" >/dev/null \
    || { echo "VERIFY FAILED: $b"; exit 1; }
  python3 "$TOOLS/align.py" "$OUT/signed/$b" >/dev/null \
    || { echo "ALIGNMENT LOST AFTER SIGNING: $b"; exit 1; }

  n=$((n+1))
  echo "signed+verified [$n/$count] $b"
done

cd "$OUT"
rm -f MiniWorld-mod.apkm
# The original bundle deflates its inner APKs (ratio 0.69) even though each is
# already a zip: the STORED entries inside - dex, resources.arsc, the asset
# pack's .pkg files - still compress at container level. Storing them flat
# would ship ~1.2GB where the original ships ~875MB.
( cd signed && zip -q -6 -X "$OUT/MiniWorld-mod.apkm" ./*.apk )
zip -q -6 -X "$OUT/MiniWorld-mod.apkm" info.json icon.png 2>/dev/null || true

echo "=== output ==="
ls -lh MiniWorld-mod.apkm
echo "apk entries: $(unzip -Z1 MiniWorld-mod.apkm | grep -c '\.apk$')"
