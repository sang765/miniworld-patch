#!/usr/bin/env bash
# Repack the modified base.apk plus the untouched splits into one bundle.
#
# Only arm64-v8a + Vietnamese are shipped. The base manifest declares
#   requiredSplitTypes="base__abi,base__density"
# so at least one ABI split and one density split have to be present or the
# installer rejects the bundle with INSTALL_FAILED_INVALID_APK - the density
# splits therefore stay even though they were not asked for (2.4 MB total).
# The asset pack is install-time delivery and carries the game data, so it also
# has to stay.
#
# Every APK is re-signed with a single new key: Android requires all splits of
# a package to share the base's signer, so the original splits cannot be left
# as-is once base.apk is re-signed. The keystore is REQUIRED - there is no
# auto-generation fallback, because a throwaway key would produce a bundle that
# cannot be installed over the previous build.
set -euo pipefail

. "$(dirname "${BASH_SOURCE[0]}")/env.sh"

# base + arm64 + Vietnamese + every *dpi split + the asset pack
MIN_APKS=11

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

if [ ! -f "$OUT/.extracted_min" ]; then
  rm -rf "$OUT/apks"
  mkdir -p "$OUT/apks"
  unzip -o -q "$SRC_FILE" \
    base.apk split_config.arm64_v8a.apk split_config.vi.apk \
    'split_config.*dpi.apk' split_mini_asset_pack.apk \
    info.json icon.png -d "$OUT/apks"
  mv -f "$OUT/apks/info.json" "$OUT/apks/icon.png" "$OUT/" 2>/dev/null || true
  touch "$OUT/.extracted_min"
fi

count=$(find "$OUT/apks" -name '*.apk' | wc -l)
echo "apks extracted: $count (expect $MIN_APKS)"
[ "$count" -eq "$MIN_APKS" ] || { echo "unexpected split set"; exit 1; }

# keep the bundle's own metadata honest about what it now contains
python3 - "$OUT/info.json" <<'PY'
import json, sys
p = sys.argv[1]
d = json.load(open(p, encoding="utf-8"))
d["arches"] = ["arm64-v8a"]
d["languages"] = ["vi"]
title = "Mini World: CREATA 1.7.15 (arm64-v8a + vi) (120-640dpi)"
d["apk_title"] = title
d["release_title"] = title
d["variant"] = "(arm64-v8a + vi) (120-640dpi) (Android 4.4+)"
with open(p, "w", encoding="utf-8") as f:
    json.dump(d, f, indent=4, ensure_ascii=False)
PY

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
