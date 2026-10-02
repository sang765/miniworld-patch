#!/usr/bin/env bash
# Full pipeline: fetch -> decode -> patch -> rebuild -> align -> verify -> bundle.
#
# Every step is idempotent where it is cheap to be: an existing decode is
# reused, so re-running only re-signs and re-bundles. A different source file
# than the one the work tree was built from is refused rather than patched
# against stale smali.
#
# usage: build.sh [apkmirror download url]
#   SOURCE_URL / SRC_FILE are read from the environment as alternatives.
set -euo pipefail

. "$(dirname "${BASH_SOURCE[0]}")/env.sh"

SOURCE_URL="${1:-${SOURCE_URL:-}}"
APKTOOL_JOBS="${APKTOOL_JOBS:-3}"

say() { echo; echo "### $*"; }

say "1/8 fetch source"
if [ -n "$SOURCE_URL" ]; then
  bash "$SCRIPTS/fetch_source.sh" "$SOURCE_URL"
elif [ -f "$SRC_FILE" ]; then
  echo "source present: $SRC_FILE"
else
  echo "FAIL: pass an APKMirror url, or set SRC_FILE to an existing .apkm" >&2
  exit 1
fi

say "2/8 extract base.apk"
mkdir -p "$WORK/base_extracted"
unzip -o -q "$SRC_FILE" base.apk -d "$WORK/base_extracted"

src_id=$(wc -c < "$SRC_FILE" | tr -d ' ')
if [ -f "$WORK/.source_id" ] && [ -d "$WORK/decoded" ]; then
  old=$(cat "$WORK/.source_id")
  if [ "$old" != "$src_id" ]; then
    {
      echo "FAIL: the work tree was built from a $old-byte source, this is $src_id."
      echo "      Remove $WORK/decoded $WORK/pristine $WORK/build $WORK/out"
      echo "      before switching to a different release."
    } >&2
    exit 1
  fi
fi
echo "$src_id" > "$WORK/.source_id"

say "3/8 decode"
if [ -d "$WORK/decoded" ]; then
  echo "reusing existing decode: $WORK/decoded"
else
  run_apktool d -f -o "$WORK/decoded" "$WORK/base_extracted/base.apk" \
    > "$LOG/decode.log" 2>&1 || { cat "$LOG/decode.log"; exit 1; }
  echo "decoded"
fi

say "4/8 apply patches"
python3 "$PATCHES/patch.py" --decoded "$WORK/decoded" --spoof "$SPOOF" --apply
python3 "$TOOLS/manifest.py" --manifest "$WORK/decoded/AndroidManifest.xml"
python3 "$TOOLS/fixdollar.py" --res "$WORK/decoded/res"

say "5/8 rebuild"
mkdir -p "$BUILD"
run_apktool b -f -j "$APKTOOL_JOBS" -o "$BUILD/base-mod.apk" "$WORK/decoded" \
  > "$LOG/build.log" 2>&1 || { tail -40 "$LOG/build.log"; exit 1; }
echo "built: $(ls -lh "$BUILD/base-mod.apk" | awk '{print $5}')"

say "6/8 align"
# apktool's zip writer does not honour alignment; write the aligned copy aside
# and swap it in, since the tool refuses to overwrite its own input.
python3 "$TOOLS/zipalign.py" "$BUILD/base-mod.apk" "$BUILD/.base-mod.aligned.apk"
mv -f "$BUILD/.base-mod.aligned.apk" "$BUILD/base-mod.apk"

say "7/8 verify rebuilt base.apk"
bash "$SCRIPTS/verify.sh" "$BUILD/base-mod.apk"

say "8/8 bundle + verify bundle"
bash "$SCRIPTS/repack.sh"
bash "$SCRIPTS/verify_bundle.sh"

echo
echo "=== PIPELINE COMPLETE ==="
echo "artifact: $OUT/MiniWorld-mod.apkm"
sha256sum "$OUT/MiniWorld-mod.apkm"
