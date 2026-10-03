#!/usr/bin/env python3
"""Resolve an APKMirror release page to the URL that serves the .apkm.

The /download/?key= query expires within the hour, so it is scraped fresh on
every run instead of being pinned (SOURCE_PAGE in env.sh). Two HTTP clients:

  curl_cffi impersonating Chrome - what gets past Cloudflare from a datacenter
  IP. A plain curl gets the "Just a moment..." interstitial there, and a real
  headless browser gets "Attention Required", so TLS impersonation is the only
  path that works on GitHub Actions.

  plain curl - the fallback where curl_cffi is not installed (a local
  Termux/Python without wheels). On a residential IP Cloudflare serves the
  pages without a challenge, so the plain client is enough there.

Only the HTML pages need the impersonation. The 874MB payload is downloaded by
curl in fetch_source.sh straight from the object-storage URL resolved here.

usage: resolve_source.py <release page or download url>
prints the download URL on stdout, progress and diagnostics on stderr.
"""
import os
import re
import shutil
import subprocess
import sys
import tempfile

UA = ("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 "
      "(KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36")
ORIGIN = "https://www.apkmirror.com/"

PAGE_LINK = re.compile(r'/apk/[^"]*/download/\?key=[0-9a-f]+')
DIRECT_LINK = re.compile(
    r'/wp-content/themes/APKMirror/download\.php\?id=\d+&key=[0-9a-f]+')
# A block shows up as an interstitial title, an Access denied body, or the
# challenge platform markers - all three need the same "wrong IP" advice.
BLOCK_MARKERS = re.compile(
    r'cf-browser-verification|challenge-platform|just a moment|cf-chl'
    r'|access denied|attention required', re.I)

HEADERS = {
    "Accept": ("text/html,application/xhtml+xml,application/xml;q=0.9,"
               "image/avif,image/webp,*/*;q=0.8"),
    "Accept-Language": "en-US,en;q=0.9",
    "sec-ch-ua": '"Chromium";v="122", "Not(A:Brand";v="24"',
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": '"Windows"',
    "Sec-Fetch-Dest": "document",
    "Sec-Fetch-Mode": "navigate",
    "Sec-Fetch-Site": "same-origin",
    "Upgrade-Insecure-Requests": "1",
}


def fail(msg):
    print(msg, file=sys.stderr)
    sys.exit(1)


def diagnose(url, code, body):
    title = re.search(r'<title>(.*?)</title>', body, re.I | re.S)
    title = title.group(1).strip() if title else "<none>"
    marks = len(BLOCK_MARKERS.findall(body))
    lines = [
        f"FAIL: HTTP {code} from {url}",
        f"      bytes={len(body.encode('utf-8', 'replace'))}  "
        f"challenge_markers={marks}",
        f"      title={title}",
    ]
    if marks:
        lines += [
            "      -> Cloudflare blocked this IP. On a CI runner, install",
            "         curl_cffi (the workflow does this) so the pages are",
            "         fetched with an impersonated TLS fingerprint. On a local",
            "         machine, re-run from a different network or download the",
            "         .apkm by hand and pass SRC_FILE=<path>.",
        ]
    else:
        lines += [
            "      -> APKMirror changed the page markup; update the regexes",
            "         in scripts/resolve_source.py.",
        ]
    fail("\n".join(lines))


class Curl:
    """Plain curl with a shared cookie jar - the local-network path."""

    name = "curl"

    def __init__(self):
        fd, self.jar = tempfile.mkstemp(prefix="apkm-cookies.")
        os.close(fd)

    def _base(self, ref):
        args = ["curl", "-sS", "--compressed", "--max-time", "90",
                "-A", UA, "-c", self.jar, "-b", self.jar, "-e", ref]
        for key, value in HEADERS.items():
            args += ["-H", f"{key}: {value}"]
        return args

    def get(self, url, ref):
        fd, out = tempfile.mkstemp(prefix="apkm-page.")
        os.close(fd)
        try:
            proc = subprocess.run(
                self._base(ref) + ["--retry", "3", "--retry-delay", "2",
                                   "-w", "%{http_code}", "-o", out, url],
                capture_output=True, text=True)
            if proc.returncode != 0:
                fail(f"FAIL: request to {url} did not complete "
                     f"(curl exit {proc.returncode}): {proc.stderr.strip()}")
            with open(out, encoding="utf-8", errors="replace") as fh:
                body = fh.read()
            return proc.stdout[-3:], body
        finally:
            os.unlink(out)

    def location(self, url, ref):
        # HEAD without -L, so the first redirect is what gets read.
        proc = subprocess.run(
            self._base(ref) + ["-I", url], capture_output=True, text=True)
        status = [l for l in proc.stdout.splitlines() if l.startswith("HTTP/")]
        if proc.returncode != 0 or not status:
            return None
        if " 30" not in status[-1]:
            return None
        for line in proc.stdout.splitlines():
            if line.lower().startswith("location:"):
                return line.split(":", 1)[1].strip()
        return None


class Cffi:
    """curl_cffi with Chrome impersonation - the CI/datacenter path."""

    name = "curl_cffi"

    def __init__(self):
        from curl_cffi import requests
        self.session = requests.Session(
            impersonate="chrome", headers=dict(HEADERS, **{"User-Agent": UA}))

    def get(self, url, ref):
        try:
            resp = self.session.get(
                url, headers={"Referer": ref}, timeout=60)
        except Exception as exc:  # network-level failure, not a block
            fail(f"FAIL: request to {url} did not complete: {exc}")
        return str(resp.status_code), resp.text

    def location(self, url, ref):
        try:
            resp = self.session.head(url, headers={"Referer": ref},
                                     allow_redirects=False, timeout=60)
        except Exception:
            return None
        if resp.status_code not in (301, 302, 303, 307, 308):
            return None
        return resp.headers.get("Location")


def pick_client():
    try:
        import curl_cffi  # noqa: F401
    except ImportError:
        return Curl()
    return Cffi()


def main():
    if len(sys.argv) != 2:
        fail("usage: resolve_source.py <apkmirror release page or download url>")
    src = sys.argv[1]

    # the listing page the download url belongs to: same path minus
    # /download/, or the argument itself when it is a release page
    list_url = (src.split("/download/")[0] + "/"
                if "/download/" in src else src.rstrip("/") + "/")

    client = pick_client()
    print(f"resolve: using {client.name}", file=sys.stderr)

    print("resolve: fetching release page", file=sys.stderr)
    code, body = client.get(list_url, ORIGIN)
    if code != "200":
        diagnose(list_url, code, body)

    # The release page renders the download button once, pointing at the same
    # path with a fresh key=. There is no other candidate to choose between.
    if "/download/" not in src:
        match = PAGE_LINK.search(body)
        if not match:
            diagnose(list_url, "no-link", body)
        src = ORIGIN + match.group(0).lstrip("/")
        print(f"resolve: download link {src}", file=sys.stderr)

    print("resolve: fetching download landing page", file=sys.stderr)
    code, body = client.get(src, list_url)
    if code != "200":
        diagnose(src, code, body)

    match = DIRECT_LINK.search(body)
    if not match:
        diagnose(src, "no-link", body)
    direct = ORIGIN + match.group(0).lstrip("/")
    print(f"resolve: {direct}", file=sys.stderr)

    # download.php 302s to the object store. The payload is fetched by curl
    # from that URL directly - only this hand-off needs the impersonation.
    location = client.location(direct, list_url)
    if location:
        if location.startswith("/"):
            location = ORIGIN.rstrip("/") + location
        print(f"resolve: object url {location.split('?')[0]}...",
              file=sys.stderr)
        print(location)
    else:
        print("resolve: no redirect, falling back to download.php",
              file=sys.stderr)
        print(direct)


if __name__ == "__main__":
    main()
