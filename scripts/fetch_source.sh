#!/usr/bin/env bash
# Fetch the source .apkm from APKMirror.
#
# A plain curl of the download URL fails, silently, for two reasons:
#
#  1. /download/?key=... renders the real landing page only for a client that
#     looks like a browser - Cloudflare answers a bare curl with the "Just a
#     moment..." interstitial on datacenter IPs (GitHub Actions), and a
#     headless browser gets "Attention Required" instead. The HTML side is
#     therefore done by scripts/resolve_source.py, which uses curl_cffi's
#     Chrome TLS impersonation when available and plain curl otherwise.
#  2. The resolved file is 874MB and the landing page is ~375KB of HTML, so
#     content has to be told apart by parsing rather than by downloading and
#     hoping.
#
# resolve_source.py returns the object-storage URL that download.php 302s to;
# that host serves plain ranged requests, so the transfer itself stays with
# curl - retry, resume and the size check are all curl's job.
#
# Called with no argument it just validates an already-downloaded file, which
# is how build.sh gets the identity assertion even when it never fetches.
#
# The argument may be either a /download/?key=... link or the release page it
# belongs to. Only the release page is stable - the key= query expires within
# the hour - so the second form is the default (SOURCE_PAGE in env.sh) and the
# link is scraped fresh on every run.
#
# usage: fetch_source.sh [apkmirror release page or download url]
set -euo pipefail

. "$(dirname "${BASH_SOURCE[0]}")/env.sh"

SRC_URL="${1:-${SOURCE_URL:-${SOURCE_PAGE:-}}}"
SIZE_EXPECT="${SIZE_EXPECT:-$WANT_SIZE}"
UA="${UA:-Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36}"
ORIGIN="https://www.apkmirror.com/"

# Read only info.json - decompressing 874MB to check CRCs is worth doing once
# after a download, not every time an existing file is reused.
check_identity() {
  python3 - "$SRC_FILE" "$WANT_APK_ID" "$WANT_RELEASE_ID" "$WANT_PKG" "$WANT_VCODE" <<'PY'
import json, sys, zipfile

path = sys.argv[1]
with zipfile.ZipFile(path) as z:
    info = json.loads(z.read("info.json"))

expected = {"apk_id": sys.argv[2], "release_id": sys.argv[3],
            "pname": sys.argv[4], "versioncode": sys.argv[5]}
# info.json mixes int and str across fields (apk_id is an int, versioncode is
# not), so both sides are normalised rather than assuming a type.
wrong = {k: (info.get(k), v) for k, v in expected.items()
         if str(info.get(k)) != str(v)}
if wrong:
    raise SystemExit(f"wrong release, refusing to patch: {wrong}")

print(f"identity OK: {info['pname']} {info['apk_id']} v{info['versioncode']}")
PY
}

check_integrity() {
  python3 - "$SRC_FILE" <<'PY'
import sys, zipfile

with zipfile.ZipFile(sys.argv[1]) as z:
    bad = z.testzip()
    if bad:
        raise SystemExit(f"corrupt member: {bad}")
print("integrity OK: every member decompresses cleanly")
PY
}

if [ -f "$SRC_FILE" ]; then
  have=$(wc -c < "$SRC_FILE" | tr -d ' ')
  if [ "$have" = "$SIZE_EXPECT" ]; then
    echo "source already present: $SRC_FILE ($have bytes)"
    check_identity
    exit 0
  fi
  echo "stale source ($have bytes, expected $SIZE_EXPECT) - refetching"
  rm -f "$SRC_FILE"
fi

if [ -z "$SRC_URL" ]; then
  echo "FAIL: no source at $SRC_FILE and no release page given." >&2
  echo "       usage: fetch_source.sh <apkmirror release page>" >&2
  exit 2
fi

# Resolves the release page to the object-storage URL; the two HTML requests
# happen inside resolve_source.py so one session carries the cookies between
# them.
download_url=$(python3 "$SCRIPTS/resolve_source.py" "$SRC_URL")

tmp="$SRC_FILE.part"
rm -f "$tmp"
rc=0
echo "downloading $SIZE_EXPECT bytes from ${download_url%%\?*}"
curl -fL --retry 5 --retry-all-errors --retry-delay 5 --max-time 3600 \
  -A "$UA" -e "$ORIGIN" \
  -H 'Accept: application/octet-stream,*/*;q=0.8' \
  "$download_url" -o "$tmp" || rc=$?

have=$(wc -c < "$tmp" 2>/dev/null | tr -d ' ')
if [ "$rc" -ne 0 ]; then
  {
    echo "FAIL: transfer aborted (curl exit $rc) after ${have:-0} bytes of $SIZE_EXPECT."
    echo "      Re-run the build, or download the .apkm by hand and pass SRC_FILE=<path>."
  } >&2
  exit 1
fi
if [ "$have" != "$SIZE_EXPECT" ]; then
  echo "FAIL: got $have bytes, expected $SIZE_EXPECT (truncated or wrong release)" >&2
  rm -f "$tmp"
  exit 1
fi
mv -f "$tmp" "$SRC_FILE"
echo "downloaded: $SRC_FILE ($have bytes)"

check_integrity
check_identity
