#!/usr/bin/env bash
# Regenerate patches/modmenu/smali from the Java sources under src/.
#
# CI never runs this - the smali is committed, so a build needs no JDK. Run it
# after editing any src/modmenu/*.java and commit the smali diff together with
# the source change.
#
# Pipeline: javac -> d8 -> classes.dex zipped into a resource-less carrier APK
# -> apktool d, which baksmalis the dex into plain smali. baksmali is not a
# standalone CLI here; apktool's decode is the supported path to smali.
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
sdk="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/android-sdk}}"

android_jar=$(ls -1 "$sdk"/platforms/android-*/android.jar 2>/dev/null | sort -V | tail -1)
d8=$(ls -1 "$sdk"/build-tools/*/d8 2>/dev/null | sort -V | tail -1)
aapt2=$(command -v aapt2 || true)
[ -n "$android_jar" ] || { echo "regen: no android.jar under $sdk/platforms" >&2; exit 1; }
[ -n "$d8" ]         || { echo "regen: no d8 under $sdk/build-tools" >&2; exit 1; }
[ -n "$aapt2" ]      || { echo "regen: aapt2 not on PATH" >&2; exit 1; }

if [ -z "${APKTOOL_JAR:-}" ]; then
  if [ -f "$here/../../tools/apktool.jar" ]; then
    APKTOOL_JAR="$here/../../tools/apktool.jar"
  elif [ -n "${PREFIX:-}" ] && [ -f "$PREFIX/share/java/apktool.jar" ]; then
    APKTOOL_JAR="$PREFIX/share/java/apktool.jar"
  fi
fi
[ -n "${APKTOOL_JAR:-}" ] || { echo "regen: apktool jar not found" >&2; exit 1; }

build=$(mktemp -d "${TMPDIR:-/tmp}/mwmodmenu.XXXXXX")
trap 'rm -rf "$build"' EXIT
mkdir -p "$build/classes" "$build/dex"

# CommonNatives lives in the game's dex, not in any jar javac can see, and
# AdReward calls it: compile a two-signature stub into its own directory so
# javac resolves it but the stub class never reaches d8 or the shipped smali.
mkdir -p "$build/stubsrc/org/appplay/lib" "$build/stubcls"
cat > "$build/stubsrc/org/appplay/lib/CommonNatives.java" <<'EOF'
package org.appplay.lib;

public final class CommonNatives {
    private CommonNatives() {}

    public static void javaCallLuaEvent(String event, Object[] args) {}

    public static void onWatchAD(int code) {}
}
EOF
javac -source 8 -target 8 -encoding UTF-8 -nowarn \
  -d "$build/stubcls" "$build/stubsrc/org/appplay/lib/CommonNatives.java"

javac -source 8 -target 8 -encoding UTF-8 -nowarn \
  -classpath "$android_jar:$build/stubcls" -d "$build/classes" \
  "$here"/src/modmenu/*.java

"$d8" --min-api 19 --lib "$android_jar" --output "$build/dex" \
  $(find "$build/classes" -name '*.class')

printf '%s\n' \
  '<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="modmenu.carrier"/>' \
  > "$build/AM.xml"
"$aapt2" link -I "$android_jar" -o "$build/carrier.apk" --manifest "$build/AM.xml"
(cd "$build/dex" && zip -q "$build/carrier.apk" classes.dex)

java -jar "$APKTOOL_JAR" d -f -o "$build/out" "$build/carrier.apk" >/dev/null

mkdir -p "$build/smali_out"
cp "$build"/out/smali/modmenu/*.smali "$build/smali_out/"
rm -rf "$here/smali"
mv "$build/smali_out" "$here/smali"
ls -1 "$here/smali"
