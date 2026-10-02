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

if [ -z "$AAPT2" ]; then
  echo "env.sh: aapt2 not found (not on PATH, none in $_mw_sdk/build-tools)" >&2
  exit 1
fi
if [ -z "$APKSIGNER" ]; then
  echo "env.sh: apksigner not found (not on PATH, none in $_mw_sdk/build-tools)" >&2
  exit 1
fi

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
