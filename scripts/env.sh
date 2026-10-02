#!/usr/bin/env bash
# Shared environment for the patch pipeline. Sourced by every script in this
# directory - not meant to be run on its own.
#
# Paths derive from this file's location, so the same scripts work from a
# checkout on CI and on a local machine. MW_WORK is the only thing that has to
# be overridden when the work tree lives outside the checkout.
#
# aapt2/aapt/zipalign come from PATH first, and the Android SDK only as a
# fallback: on a Termux install the SDK copies are x86_64 ELFs that would shadow
# the working Termux ones. Nothing here prepends build-tools to PATH.

set -euo pipefail

_mw_script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$_mw_script_dir/.." && pwd)"

WORK="${MW_WORK:-$ROOT/work}"
TOOLS="$ROOT/tools"
PATCHES="$ROOT/patches"
SPOOF="$ROOT/spoof.env"
SCRIPTS="$ROOT/scripts"
BUILD="$WORK/build"
OUT="$WORK/out"
LOG="$WORK/log"
SRC_FILE="${SRC_FILE:-$WORK/source.apkm}"

# apktool allocates its Java heap from here; 1600m is what survived the
# 8-dex smali build without an OutOfMemoryError.
APKTOOL_MEM="${APKTOOL_MEM:--Xmx1600m}"

# The one release this pipeline is pinned to. fetch_source.sh checks them
# against info.json inside the archive, verify.sh against the built badging -
# two independent reads, so a wrong or updated source cannot slip through as
# "verified". Bump them together when moving to a new release.
WANT_PKG="${WANT_PKG:-com.playmini.miniworld}"
WANT_VCODE="${WANT_VCODE:-67343}"
WANT_VNAME="${WANT_VNAME:-1.7.15}"
WANT_APK_ID="${WANT_APK_ID:-8053176}"
WANT_RELEASE_ID="${WANT_RELEASE_ID:-8053149}"
WANT_SIZE="${WANT_SIZE:-916916904}"
# SHA-256 of the signer certificate every split must carry. A keystore that
# does not match it produces bundles that cannot be installed over earlier
# builds, so verify_bundle.sh fails rather than merely counting distinct certs.
WANT_SIGNER="${WANT_SIGNER:-2b118a633ec20c538b2e97a3c9042d89e2e1bb8fc9267f25119c2fd6178d48bd}"

KS="${KS:-$WORK/modkey.jks}"
KS_ALIAS="${KS_ALIAS:-mod}"
KS_PASS="${KS_PASS:-modmod}"
KS_KEY_PASS="${KS_KEY_PASS:-$KS_PASS}"

mkdir -p "$WORK" "$LOG"

_mw_sdk="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/android-sdk}}"

# First hit on PATH wins; otherwise the newest build-tools copy in the SDK.
_mw_resolve() {
  local name=$1 hit
  if command -v "$name" >/dev/null 2>&1; then
    command -v "$name"
    return 0
  fi
  hit=$(ls -1 "$_mw_sdk"/build-tools/*/"$name" 2>/dev/null | sort -V | tail -1)
  if [ -n "$hit" ]; then
    printf '%s\n' "$hit"
    return 0
  fi
  return 1
}

AAPT2="${AAPT2:-$(_mw_resolve aapt2 || true)}"
APKSIGNER="${APKSIGNER:-$(_mw_resolve apksigner || true)}"

# A preset value may be stale: without this it would not surface until
# verify.sh's `dump ... || true` chains produced an empty manifest.
_mw_require() {
  local name=$1 path=${2:-}
  if [ -n "$path" ] && { [ -x "$path" ] || command -v "$path" >/dev/null 2>&1; }; then
    return 0
  fi
  echo "env.sh: $name not usable (value='${path:-}', not on PATH," >&2
  echo "        none executable in $_mw_sdk/build-tools)" >&2
  return 1
}
_mw_require aapt2 "$AAPT2" || exit 1
_mw_require apksigner "$APKSIGNER" || exit 1

if [ -z "${APKTOOL_JAR:-}" ]; then
  if [ -f "$ROOT/tools/apktool.jar" ]; then
    APKTOOL_JAR="$ROOT/tools/apktool.jar"
  elif [ -n "${PREFIX:-}" ] && [ -f "$PREFIX/share/java/apktool.jar" ]; then
    APKTOOL_JAR="$PREFIX/share/java/apktool.jar"
  fi
fi
if [ -z "${APKTOOL_JAR:-}" ] || [ ! -f "$APKTOOL_JAR" ]; then
  echo "env.sh: apktool jar not found. Set APKTOOL_JAR, or place it at" >&2
  echo "        tools/apktool.jar (the CI workflow downloads it there)." >&2
  exit 1
fi
export APKTOOL_JAR

# The SDK's apksigner is a shell wrapper around a jar, so it has to be invoked
# by path when it is not on PATH.
run_apksigner() { "$APKSIGNER" "$@"; }

run_apktool() { java "$APKTOOL_MEM" -jar "$APKTOOL_JAR" "$@"; }

export AAPT2 APKSIGNER KS KS_ALIAS KS_PASS KS_KEY_PASS SRC_FILE
