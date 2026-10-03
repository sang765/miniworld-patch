#!/usr/bin/env bash
# Full pipeline: fetch -> decode -> patch -> rebuild -> align -> verify -> bundle.
#
# An existing decode is reused rather than rebuilt from scratch, so re-running
# costs a full apktool b but not the decode or the patch. Changing sources is
# refused outright: the work tree carries a .source_id, and repack.sh keys its
# split extraction to the same id, so base.apk and the splits can never end up
# coming from different releases - a mix that verifies clean here and then
# fails to install.
#
# usage: build.sh [apkmirror release page]
#   SOURCE_URL / SRC_FILE are read from the environment as alternatives.
set -euo pipefail

. "$(dirname "${BASH_SOURCE[0]}")/env.sh"

SOURCE_URL="${1:-${SOURCE_URL:-}}"
APKTOOL_JOBS="${APKTOOL_JOBS:-3}"

say() { echo; echo "### $*"; }

say "1/8 fetch source"
# Always goes through fetch_source.sh: with a url it downloads, without one it
# still asserts that SRC_FILE is the release this pipeline is pinned to. The
# default source is the pinned release page (env.sh SOURCE_PAGE); the expiring
# download link is scraped from it at run time.
if [ -n "$SOURCE_URL" ]; then
  bash "$SCRIPTS/fetch_source.sh" "$SOURCE_URL"
else
  bash "$SCRIPTS/fetch_source.sh"
fi

say "2/8 extract base.apk"
mkdir -p "$WORK/base_extracted"
unzip -o -q "$SRC_FILE" base.apk -d "$WORK/base_extracted"

src_id=$(wc -c < "$SRC_FILE" | tr -d ' ')
if [ -f "$WORK/.source_id" ]; then
  old=$(cat "$WORK/.source_id")
  if [ "$old" != "$src_id" ]; then
    {
      echo "FAIL: the work tree was built from a $old-byte source, this is $src_id."
      echo "      Deleting decoded/ alone is not enough - the check is the recorded"
      echo "      size, not the presence of a decode. Remove them all before moving"
      echo "      to a different release:"
      echo "        rm -rf $WORK/decoded $WORK/pristine $WORK/build $WORK/out $WORK/.source_id"
    } >&2
    exit 1
  fi
else
  for stale in "$WORK/decoded" "$WORK/pristine" "$WORK/build" "$WORK/out"; do
    if [ -e "$stale" ]; then
      echo "FAIL: $stale exists but there is no $WORK/.source_id to attribute it to." >&2
      echo "      Its provenance is unknown, so it cannot be trusted with this source." >&2
      echo "      Remove it (and anything else in $WORK) before building." >&2
      exit 1
    fi
  done
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
# Mod-menu classes ship as committed smali (patches/modmenu/regen.sh rebuilds
# them from Java) and go into classes8 - classes.dex has no free method IDs.
# A failed copy must abort here: `cp` with no match fails under set -e.
rm -rf "$WORK/decoded/smali_classes8/modmenu"
mkdir -p "$WORK/decoded/smali_classes8/modmenu"
cp "$PATCHES/modmenu/smali/"*.smali "$WORK/decoded/smali_classes8/modmenu/"

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
