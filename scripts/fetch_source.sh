#!/usr/bin/env bash
# Fetch the source .apkm from APKMirror.
#
# Two things make a plain curl of the download URL fail, both silently:
#
#  1. /download/?key=... only renders the download landing page when the
#     request carries the site's cookies. Without them the server hands back
#     the release listing page instead - same title, same app id, but its
#     download button points back at the URL you just asked for, so there is no
#     link to parse. A cookie jar (listing page first) is what gets the real
#     page, which links to /wp-content/themes/APKMirror/download.php?id=...,
#     and that 302s to a short-lived object-storage URL.
#  2. The resolved file is 874MB and the landing page is ~375KB of HTML, so
#     content has to be told apart by parsing rather than by downloading and
#     hoping.
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

JAR=$(mktemp "${TMPDIR:-/tmp}/apkm-cookies.XXXXXX")
trap 'rm -f "$JAR" "$WORK/landing.html"' EXIT

# the listing page the download url belongs to: same path minus /download/,
# or the argument itself when it is a release page
case "$SRC_URL" in
  */download/*) LIST_URL="${SRC_URL%%/download/*}/" ;;
  *)            LIST_URL="${SRC_URL%/}/" ;;
esac

# Fetch one HTML page with a full browser header set. APKMirror sits behind
# Cloudflare, which answers a bare curl (no Accept-Language, no sec-ch-ua) with
# 403 on datacenter IPs even when nothing is wrong with the URL - so -f would
# hide the one fact needed to tell a block from a bad link. The status is read
# explicitly and a non-200 is reported with the markers found in the body.
get_page() {
  local url=$1 ref=$2 out=$3 code
  code=$(curl -sS --compressed --retry 3 --retry-delay 2 --max-time 90 \
    -A "$UA" -c "$JAR" -b "$JAR" -e "$ref" \
    -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' \
    -H 'Accept-Language: en-US,en;q=0.9' \
    -H 'sec-ch-ua: "Chromium";v="122", "Not(A:Brand";v="24"' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'sec-ch-ua-platform: "Windows"' \
    -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' \
    -H 'Sec-Fetch-Site: same-origin' -H 'Upgrade-Insecure-Requests: 1' \
    -w '%{http_code}' -o "$out" "$url") || {
      echo "FAIL: request to $url did not complete (curl exit $?)" >&2
      return 1
    }
  if [ "$code" != "200" ]; then
    local title chal
    title=$(grep -oiE '<title>[^<]*</title>' "$out" 2>/dev/null | head -1 \
      | sed -E 's/<\/?title>//gi' || true)
    chal=$(grep -ciE 'cf-browser-verification|challenge-platform|just a moment|cf-chl|Access denied' \
      "$out" 2>/dev/null || true)
    {
      echo "FAIL: HTTP $code from $url"
      echo "      bytes=$(wc -c < "$out" 2>/dev/null || echo 0)  challenge_markers=$chal"
      echo "      title=${title:-<none>}"
      if [ "$chal" -gt 0 ]; then
        echo "      -> Cloudflare blocked this IP (datacenter ranges usually are)."
        echo "         Re-run from a residential IP, or download the .apkm by hand"
        echo "         and pass SRC_FILE=<path>."
      fi
    } >&2
    return 1
  fi
}

echo "priming cookies from the release page"
get_page "$LIST_URL" "$ORIGIN" "$WORK/landing.html"

# The release page renders the download button once, pointing at the same
# path with a fresh key=. There is no other candidate to choose between.
if [[ "$SRC_URL" != */download/* ]]; then
  rel=$(grep -oE '/apk/[^"]*/download/\?key=[0-9a-f]+' "$WORK/landing.html" \
    | head -1 || true)
  if [ -z "$rel" ]; then
    chal=$(grep -ciE 'cf-browser-verification|challenge-platform|just a moment|cf-chl' \
      "$WORK/landing.html" || true)
    {
      echo "FAIL: no download link on the release page"
      echo "      bytes=$(wc -c < "$WORK/landing.html")  challenge_markers=$chal"
      if [ "$chal" -gt 0 ]; then
        echo "      -> Cloudflare challenged this request. Re-run from a different IP,"
        echo "         or download the .apkm by hand and pass SRC_FILE=<path>."
      else
        echo "      -> APKMirror changed the page markup; update the scrape in"
        echo "         scripts/fetch_source.sh."
      fi
    } >&2
    exit 1
  fi
  SRC_URL="$ORIGIN${rel#/}"
  echo "resolved download link: $SRC_URL"
fi

echo "fetching download landing page"
get_page "$SRC_URL" "$LIST_URL" "$WORK/landing.html"

direct=$(grep -oE '/wp-content/themes/APKMirror/download\.php\?id=[0-9]+&key=[0-9a-f]+' \
  "$WORK/landing.html" | head -1 || true)
if [ -z "$direct" ]; then
  # The two usual causes need completely different fixes, so report which one
  # it is: an expired key still returns a normal page, while a bot block from a
  # datacenter IP hands back a challenge page.
  title=$(grep -oiE '<title>[^<]*</title>' "$WORK/landing.html" | head -1 \
    | sed -E 's/<\/?title>//gi' || true)
  chal=$(grep -ciE 'cf-browser-verification|challenge-platform|just a moment|cf-chl' \
    "$WORK/landing.html" || true)
  {
    echo "FAIL: no download.php link on the landing page"
    echo "      bytes=$(wc -c < "$WORK/landing.html")  challenge_markers=$chal"
    echo "      title=${title:-<none>}"
    if [ "$chal" -gt 0 ]; then
      echo "      -> Cloudflare challenged this request. Download the .apkm by hand"
      echo "         and pass SRC_FILE=<path>, or re-run from a different IP."
    else
      echo "      -> the key= was scraped fresh from the release page, so this is"
      echo "         usually changed page markup. Update the scrape in"
      echo "         scripts/fetch_source.sh."
    fi
  } >&2
  exit 1
fi
echo "resolved: $direct"

tmp="$SRC_FILE.part"
rm -f "$tmp"
rc=0
# Same header set and cookie jar as the page fetches: download.php 302s to the
# object store, and the redirect is only followed when the request looks like
# the browser that scraped it.
curl -fL --compressed --retry 5 --retry-all-errors --retry-delay 5 --max-time 3600 \
  -A "$UA" -c "$JAR" -b "$JAR" -e "$ORIGIN" \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: same-origin' -H 'Upgrade-Insecure-Requests: 1' \
  "$ORIGIN${direct#/}" -o "$tmp" || rc=$?

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
