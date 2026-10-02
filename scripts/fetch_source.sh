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
# usage: fetch_source.sh <apkmirror download url>
set -euo pipefail

. "$(dirname "${BASH_SOURCE[0]}")/env.sh"

SRC_URL="${1:-${SOURCE_URL:-}}"
SIZE_EXPECT="${SIZE_EXPECT:-916916904}"
UA="${UA:-Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36}"
ORIGIN="https://www.apkmirror.com/"

# the listing page the download url belongs to: same path minus /download/
LIST_URL="${SRC_URL%%/download/*}/"

if [ -f "$SRC_FILE" ]; then
  have=$(wc -c < "$SRC_FILE" | tr -d ' ')
  if [ "$have" = "$SIZE_EXPECT" ]; then
    echo "source already present: $SRC_FILE ($have bytes)"
    exit 0
  fi
  echo "stale source ($have bytes, expected $SIZE_EXPECT) - refetching"
  rm -f "$SRC_FILE"
fi

if [ -z "$SRC_URL" ]; then
  echo "usage: fetch_source.sh <apkmirror download url>" >&2
  exit 2
fi

JAR=$(mktemp "${TMPDIR:-/tmp}/apkm-cookies.XXXXXX")
trap 'rm -f "$JAR" "$WORK/landing.html"' EXIT

echo "priming cookies from the release page"
curl -fsSL --retry 3 --max-time 90 -A "$UA" -c "$JAR" -b "$JAR" \
  -e "$ORIGIN" "$LIST_URL" -o "$WORK/landing.html"

echo "fetching download landing page"
curl -fsSL --retry 3 --max-time 90 -A "$UA" -c "$JAR" -b "$JAR" \
  -e "$LIST_URL" "$SRC_URL" -o "$WORK/landing.html"

direct=$(grep -oE '/wp-content/themes/APKMirror/download\.php\?id=[0-9]+&key=[0-9a-f]+' \
  "$WORK/landing.html" | head -1 || true)
if [ -z "$direct" ]; then
  {
    echo "FAIL: landing page has no download.php link (got $(wc -c < "$WORK/landing.html") bytes)."
    echo "      Usual cause: the key= query on the URL expired - open the release page"
    echo "      on apkmirror.com and copy a fresh download link."
  } >&2
  exit 1
fi
echo "resolved: $direct"

tmp="$SRC_FILE.part"
rm -f "$tmp"
curl -fL --retry 3 --retry-delay 5 --max-time 3600 \
  -A "$UA" -e "$ORIGIN" "$ORIGIN${direct#/}" -o "$tmp"

have=$(wc -c < "$tmp" | tr -d ' ')
if [ "$have" != "$SIZE_EXPECT" ]; then
  echo "FAIL: got $have bytes, expected $SIZE_EXPECT (truncated or wrong release)" >&2
  rm -f "$tmp"
  exit 1
fi
mv -f "$tmp" "$SRC_FILE"
echo "downloaded: $SRC_FILE ($have bytes)"

python3 - "$SRC_FILE" <<'PY'
import json, sys, zipfile

path = sys.argv[1]
with zipfile.ZipFile(path) as z:
    bad = z.testzip()
    if bad:
        raise SystemExit(f"corrupt member: {bad}")
    info = json.loads(z.read("info.json"))

expected = {"apk_id": 8053176, "pname": "com.playmini.miniworld",
            "release_id": 8053149, "versioncode": 67343}
wrong = {k: (info.get(k), v) for k, v in expected.items() if info.get(k) != v}
if wrong:
    raise SystemExit(f"wrong release, refusing to patch: {wrong}")

print(f"identity OK: {info['pname']} {info['apk_id']} v{info['versioncode']}")
PY
