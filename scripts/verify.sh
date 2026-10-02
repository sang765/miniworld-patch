#!/usr/bin/env bash
# Verification gate for the rebuilt base.apk.
#
# Six independent checks; any failure sets exit status 1. This is what stops a
# silently broken build from reaching the bundle step, so it is run both after
# apktool b and again against the base.apk extracted from the final bundle.
#
# usage: verify.sh [path/to/base.apk]   (defaults to the freshly built one)
set -euo pipefail

. "$(dirname "${BASH_SOURCE[0]}")/env.sh"

APK="${1:-$BUILD/base-mod.apk}"
ORIG="$WORK/base_extracted/base.apk"

T=$(mktemp -d "${TMPDIR:-/tmp}/mwverify.XXXXXX")
trap 'rm -rf "$T"' EXIT

# v1 signature entries are named after the keystore alias, uppercased. MOD.* is
# ours once signed; anything else means the original signer is still embedded.
# The alias is interpolated into an ERE below, so a metacharacter in it could
# over-match and hide a foreign entry - refuse it instead of trusting it.
if ! printf '%s' "$KS_ALIAS" | grep -Eq '^[A-Za-z0-9_]+$'; then
  echo "FAIL: keystore alias must be [A-Za-z0-9_], got '$KS_ALIAS'"
  exit 1
fi
V1_OWN=$(printf '%s' "$KS_ALIAS" | tr '[:lower:]' '[:upper:]')

fail=0
step() { echo; echo "### $*"; }

step "1. archive integrity + dex/entry counts"
# Under set -e an `A && B` list does not abort when A fails, so the zip test
# has to set the flag itself; otherwise a CRC-dead member slips past every
# later check (they count names and read headers, none of them re-read data).
if unzip -tqq "$APK"; then
  echo "zip OK"
else
  echo "FAIL: corrupt archive"; fail=1
fi
n=$(unzip -l "$APK" | grep -cE 'classes[0-9]*\.dex$' || true)
o=$(unzip -l "$ORIG" | grep -cE 'classes[0-9]*\.dex$' || true)
echo "dex: rebuilt=$n original=$o (must match)"
[ "$n" = "$o" ] || fail=1
# unzip -l's last line is "<length> <count> files", so $2 is already the count
ne=$(unzip -l "$APK" | awk 'END{print $2}')
oe=$(unzip -l "$ORIG" | awk 'END{print $2}')
echo "entries: rebuilt=$ne original=$oe"
[ "$ne" -gt 2500 ] || fail=1

# The game is native + asset heavy; a rebuilt archive that silently drops lib/
# or assets/ would still pass a plain entry-count check. -Z1 prints bare entry
# names, unlike -l which pads them with size/date columns.
for pat in '\.so$' '^assets/' '^lib/' '^resources\.arsc$'; do
  rn=$(unzip -Z1 "$APK" | grep -cE "$pat" || true)
  ro=$(unzip -Z1 "$ORIG" | grep -cE "$pat" || true)
  printf '%-22s rebuilt=%-5s original=%s\n' "$pat" "$rn" "$ro"
  [ "$rn" = "$ro" ] || fail=1
done

step "2. no foreign v1 signature ($V1_OWN.* is ours once signed)"
foreign=$(unzip -Z1 "$APK" | grep -E '^META-INF/[^/]+\.(SF|RSA|DSA|EC)$' \
  | grep -vE "^META-INF/$V1_OWN\.(SF|RSA)$" || true)
if [ -n "$foreign" ]; then
  echo "FAIL: foreign v1 signature entries:"; echo "$foreign" | sed 's/^/  /'
  fail=1
else
  echo "clean"
fi

step "3. zipalign check (measure, do not assume)"
if python3 "$TOOLS/align.py" "$APK"; then
  echo "aligned"
else
  echo "MISALIGNED - needs aligner before signing"; fail=1
fi

step "4. manifest: identity + BrowserActivity exported flag"
"$AAPT2" dump badging "$APK" > "$T/bad.txt" 2>/dev/null || true
head -2 "$T/bad.txt"

# Nothing else reads the built package's identity: a rebuild against the wrong
# source, or one that mangled the manifest, would otherwise verify clean.
python3 - "$T/bad.txt" "$WANT_PKG" "$WANT_VCODE" "$WANT_VNAME" <<'PY' || fail=1
import re, sys
t = open(sys.argv[1], encoding="utf-8", errors="replace").read()

def field(pattern, label):
    m = re.search(pattern, t)
    if not m:
        raise SystemExit(f"badging: {label} not found")
    return m.group(1)

pkg = field(r"^package: name='([^']+)'", "package name")
vc = field(r"\bversionCode='([^']+)'", "versionCode")
vn = field(r"\bversionName='([^']+)'", "versionName")
want = {"package": sys.argv[2], "versionCode": sys.argv[3], "versionName": sys.argv[4]}
got = {"package": pkg, "versionCode": vc, "versionName": vn}
if got != want:
    raise SystemExit(f"identity mismatch: got {got}, want {want}")
print(f"identity: {pkg} versionCode={vc} versionName={vn} -> OK")
PY

"$AAPT2" dump xmltree "$APK" --file AndroidManifest.xml > "$T/mf.txt" 2>/dev/null || \
  "$AAPT2" dump xmltree "$APK" AndroidManifest.xml > "$T/mf.txt" 2>/dev/null || true

python3 - "$T/mf.txt" <<'PY' || fail=1
import re, sys
lines = open(sys.argv[1], encoding="utf-8", errors="replace").read().splitlines()

idx = next((i for i, l in enumerate(lines)
            if "org.appplay.lib.browser.BrowserActivity" in l), None)
if idx is None:
    raise SystemExit("BrowserActivity not found in manifest")

start = idx
while start > 0 and not re.match(r"\s*E: activity\b", lines[start]):
    start -= 1
if not re.match(r"\s*E: activity\b", lines[start]):
    raise SystemExit("could not locate the owning <activity> element")

indent = len(lines[start]) - len(lines[start].lstrip())
exported = None
for l in lines[start + 1:]:
    if re.match(r"\s*[EA]: ", l) and (len(l) - len(l.lstrip())) <= indent \
       and re.match(r"\s*E: ", l):
        break
    m = re.search(r":exported\(0x01010010\)=(\S+)", l)
    if m:
        exported = m.group(1)

if exported is None:
    raise SystemExit("FAIL: BrowserActivity has no android:exported attribute")
state = exported.rstrip(')"')
ok = state in ("false", "0x0", "0x00000000", "0x00000000 (type 0x12)")
print(f"BrowserActivity exported = {exported} -> {'BLOCKED' if ok else 'STILL EXPORTED'}")
sys.exit(0 if ok else 1)
PY

step "5. spoof constants present in the built dex"
rm -rf "$WORK/dexcheck" && mkdir -p "$WORK/dexcheck"
unzip -o -q "$APK" 'classes*.dex' -d "$WORK/dexcheck"
. "$SPOOF"
for v in "$DTOKEN" "$GAID" "04$GAID" "$FLYER"; do
  if grep -aqF -- "$v" "$WORK/dexcheck"/*.dex 2>/dev/null; then
    echo "  present: $v"
  else
    echo "  MISSING: $v"; fail=1
  fi
done

step "6. patch scope: all 14 stubs present, pristine decode vs patched tree"
# scopecheck only proves these five files differ from pristine; it cannot tell
# 14 applied patches from 13, so assert each stub by content first.
python3 "$PATCHES/patch.py" --decoded "$WORK/decoded" --spoof "$SPOOF" --check || fail=1
if [ ! -d "$WORK/pristine" ]; then
  echo "(pristine decode not present -> running apktool d)"
  run_apktool d -f -o "$WORK/pristine" "$ORIG" > "$LOG/pristine_decode.log" 2>&1 \
    || { echo "pristine decode failed"; cat "$LOG/pristine_decode.log"; fail=1; }
fi
python3 "$TOOLS/scopecheck.py" \
  --pristine "$WORK/pristine" \
  --decoded "$WORK/decoded" || fail=1

echo
if [ "$fail" = 0 ]; then echo "=== VERIFY PASS ==="; else echo "=== VERIFY FAIL ==="; fi
exit "$fail"
