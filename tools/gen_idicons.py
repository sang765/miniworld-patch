#!/usr/bin/env python3
"""Generate patches/modmenu/src/modmenu/IdIcons.java - the id browser's icons.

Run from anywhere; the APKs must already be in work/out/apks (the large pkgs
are extracted into work/extracted/ on first run):

    python3 tools/gen_idnames.py && python3 tools/gen_idicons.py

Icon columns, verified against the shipped catalogs - the game resolves an
icon as "directory per column convention, then file", and where a catalog
gives no directory the lookup walks the known ones:

  itemdef.Icon        item plus every item-backed category; block and tool
                      reach it through the Chinese-name join, the same join
                      the name generator uses - their own catalogs carry no
                      icon column and their ids drift apart
  buffdef.IconID      iconbank.csv: Classification picks the folder, FilePath
                      the file; IconName is probed directly when absent
  monster.Icon        iconbank first (aiicons), then the roleicons bucket
  roleskin.Head       roleicons (emitted for both the skin and role chips)
  petdef.HeadIcon     "roleicons.NNN" -> roleicons/NNN.png, the game's own
                      dir.prefix notation
  effectbank.IconName -> bufficons
  task.Icon, headicon.IconID -> items / roleicons

Pixels: records are Rainbow textures, overwhelmingly fmt65 (CRN/ETC2A), which
needs crn2rgba from the upstream unpacker project - not vendored here (no
license to copy); put it on PATH or set MW_CRN2RGBA. The raw formats
(1/3/4/5/63) decode in-process. Every icon is resized to at most 64 px and
quantized to a 48-colour PNG8 through ImageMagick, cached under
work/iconcache/, then embedded base64 - dex has no byte-array constants -
with identical images collapsed into one blob.

Keys are cat#id, the scanner's own dedup form, so IdIcons.get() mirrors
IdNames.get(): item-backed categories fall back to item#id at runtime instead
of repeating itemdef's rows per category. An id that resolves to no file gets
no entry; the row draws its placeholder then.
"""
import base64
import concurrent.futures
import csv
import hashlib
import io
import os
import shutil
import struct
import subprocess
import sys
import zipfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gen_idnames import APK, ITEMDEF_CATS, REPO, chunks, jlit
from pkgread import from_apk, from_file

OUT = os.path.join(REPO, "patches/modmenu/src/modmenu/IdIcons.java")
EXTRACTED = os.path.join(REPO, "work/extracted")
PNG_DIR = os.path.join(REPO, "work/iconcache/png")
TMP_DIR = os.path.join(REPO, "work/iconcache/tmp")

MAX_PX = 64
COLORS = 48

MAGIC_INTL = b"\x45\x82\x4c\x05"
DATA_OFF = 107
RAW_FMTS = (1, 3, 4, 5, 63)          # Alpha8, RGB24, RGBA32, BGRA, R8

ITEM_PROBES = [
    "resources/minigame/items/%s.png",
    "resources/items/%s.png",
    "resources/minigame/ui/roleicons/%s.png",
    "resources/ui/roleicons/%s.png",
]
ROLE_PROBES = [
    "resources/minigame/ui/roleicons/%s.png",
    "resources/ui/roleicons/%s.png",
    "resources/ui/headframes/%s.png",
]
BUFF_PROBES = [
    "resources/minigame/ui/bufficons/%s.png",
    "resources/minigame/items/%s.png",
]
# iconbank Classification -> folder (checked before any basename search)
CLS_DIRS = {
    1: "resources/minigame/ui/bufficons",
    2: "resources/minigame/ui/itemskillicons",
    3: "resources/minigame/ui/aiicons",
    4: "resources/minigame/ui/animact",
}
# dir.prefix notation, petdef writes roleicons.10001
PREFIX_DIRS = {
    "roleicons": ["resources/minigame/ui/roleicons", "resources/ui/roleicons"],
    "headframes": ["resources/ui/headframes",
                   "resources/increments/universe/ui/headframes"],
    "bufficons": ["resources/minigame/ui/bufficons"],
    "items": ["resources/minigame/items", "resources/items"],
}

CRN = None                        # set in main(); shared by the pool threads


def load(script, stem):
    for path in ("../commonresource/script/csvdef/utf8/%s.csv" % stem,
                 "../script/csvdef/utf8/%s.csv" % stem):
        try:
            raw = script.read(path)
        except KeyError:
            continue
        return list(csv.reader(io.StringIO(raw.decode("utf-8-sig", "replace"))))
    return None


def col(header, name):
    return next((i for i, c in enumerate(header) if c.strip().lower() == name), None)


def by_id(rows, *want):
    """{id: {col: value}} over a two-row-header def CSV."""
    if not rows or len(rows) < 3:
        return {}
    header = rows[1]
    id_i = col(header, "id") or 0
    idx = {name: col(header, name) for name in want}
    width = max(i for i in (id_i,) + tuple(idx.values()) if i is not None)
    out = {}
    for row in rows[2:]:
        if len(row) <= width:
            continue
        try:
            key = int(row[id_i])
        except ValueError:
            continue
        out[key] = {name: (row[i].strip() if i is not None else "")
                    for name, i in idx.items()}
    return out


def make_lookup(corpus, iconbank, basename_index):
    def probe(value, templates):
        v = value.strip()
        if v.endswith(".png"):
            v = v[:-4]
        if v.startswith("#"):
            v = v[1:]
        if not v or v.startswith(("[", "<", "@", "%")):
            return None
        if "." in v and "/" not in v:
            prefix, _, rest = v.partition(".")
            for base in PREFIX_DIRS.get(prefix, []):
                path = "%s/%s.png" % (base, rest)
                if path in corpus:
                    return path
        for tmpl in templates:
            path = tmpl % v
            if path in corpus:
                return path
        return None

    def iconbank_path(icon_id):
        if icon_id not in iconbank:
            return None
        cls, fp = iconbank[icon_id]
        folder = CLS_DIRS.get(cls)
        if folder:
            path = "%s/%s.png" % (folder, fp)
            if path in corpus:
                return path
        hits = basename_index.get(fp + ".png")
        return hits[0] if hits else None

    return probe, iconbank_path


def build_entries(script, corpus):
    """{cat#id: pkg path} for every catalog that carries an icon column."""
    basename_index = {}
    for path in corpus:
        if "/" in path:
            basename_index.setdefault(path.rsplit("/", 1)[1], []).append(path)

    iconbank = {}
    for key, row in by_id(load(script, "iconbank"),
                          "classification", "filepath").items():
        try:
            cls = int(row["classification"])
        except ValueError:
            continue
        iconbank[key] = (cls, row["filepath"])

    probe, iconbank_path = make_lookup(corpus, iconbank, basename_index)
    entries = {}

    def put(key, path):
        if path and key not in entries:
            entries[key] = path

    # itemdef feeds the item chip directly, and block/tool through the
    # Chinese name - both def CSVs carry no icon column of their own
    item_rows = load(script, "itemdef")
    icon_i, zh_i = col(item_rows[1], "icon"), col(item_rows[1], "name")
    item_icons = {}
    icon_by_zh = {}
    for row in item_rows[2:]:
        if len(row) <= icon_i:
            continue
        value = row[icon_i].strip()
        if value:
            icon_by_zh.setdefault(row[zh_i].strip(), value)
            try:
                item_icons[int(row[0])] = value
            except ValueError:
                pass
    for cid, value in item_icons.items():
        put("item#%d" % cid, probe(value, ITEM_PROBES))

    for stem, cat in (("blockdef", "block"), ("tooldef", "tool")):
        for cid, row in by_id(load(script, stem), "name").items():
            put("%s#%d" % (cat, cid),
                probe(icon_by_zh.get(row["name"], ""), ITEM_PROBES))

    # buffs: iconbank by id, IconName as the direct fallback
    for cid, row in by_id(load(script, "buffdef"),
                          "iconid", "iconname").items():
        path = iconbank_path(int(row["iconid"])) \
            if row["iconid"].isdigit() else None
        put("buff#%d" % cid, path or probe(row["iconname"], BUFF_PROBES))

    # monsters: iconbank first, then the portrait buckets; the scan shows
    # both a monster and a mob chip over the same records
    for cid, row in by_id(load(script, "monster"), "icon").items():
        path = iconbank_path(int(row["icon"])) \
            if row["icon"].isdigit() else None
        path = path or probe(row["icon"], ROLE_PROBES + ITEM_PROBES)
        put("monster#%d" % cid, path)
        put("mob#%d" % cid, path)

    # character side: skins and roles share roleskin's heads
    for cid, row in by_id(load(script, "roleskin"), "head").items():
        path = probe(row["head"], ROLE_PROBES)
        put("skin#%d" % cid, path)
        put("role#%d" % cid, path)
    for stem, cols in (("headicon", ("iconid",)),
                       ("avatardef", ("nameicon",))):
        for cid, row in by_id(load(script, stem), *cols).items():
            put("avatar#%d" % cid, probe(row[cols[0]], ROLE_PROBES))

    # pets, effects, tasks
    for cid, row in by_id(load(script, "petdef"), "headicon").items():
        put("pet#%d" % cid, probe(row["headicon"], ROLE_PROBES))
    for cid, row in by_id(load(script, "effectbank"), "iconname").items():
        put("effect#%d" % cid, probe(row["iconname"], BUFF_PROBES + ITEM_PROBES))
    for cid, row in by_id(load(script, "task"), "icon").items():
        put("task#%d" % cid, probe(row["icon"], ITEM_PROBES))

    return entries


def ensure_extracted(member):
    """Common/game res sit on disk once - those pkgs are far too big to
    reread out of the apk for every lookup."""
    path = os.path.join(EXTRACTED, member.split("/")[-1])
    if os.path.isfile(path) and os.path.getsize(path) > 0:
        return path
    os.makedirs(EXTRACTED, exist_ok=True)
    with zipfile.ZipFile(APK) as z, z.open(member) as src, open(path, "wb") as dst:
        shutil.copyfileobj(src, dst, length=1 << 20)
    return path


def find_crn2rgba():
    for cand in (os.environ.get("MW_CRN2RGBA"),
                 shutil.which("crn2rgba"),
                 os.path.expandvars("$PREFIX/tmp/re14/crn2rgba"),
                 os.path.join(REPO, "tools/crn2rgba")):
        if cand and os.path.isfile(cand) and os.access(cand, os.X_OK):
            return cand
    return None


def decode(data):
    """Rainbow texture -> (top-down RGBA bytes, w, h), or None."""
    if len(data) < 0x24 or data[8:12] != MAGIC_INTL:
        return None
    w, h = struct.unpack_from("<II", data, 0x14)
    fmt = struct.unpack_from("<I", data, 0x20)[0]
    if fmt == 65:
        tag = hashlib.sha1(data).hexdigest()[:24]
        fin = os.path.join(TMP_DIR, tag + ".crn")
        fout = os.path.join(TMP_DIR, tag + ".rgba")
        finfo = os.path.join(TMP_DIR, tag + ".info")
        with open(fin, "wb") as f:
            f.write(data[DATA_OFF:])
        try:
            run = subprocess.run([CRN, fin, fout, finfo], capture_output=True,
                                 timeout=60)
            if run.returncode != 0:
                return None
            info = open(finfo).read().split()
            if len(info) >= 4 and int(info[3]) != 1:
                return None                      # cubemap
            raw = open(fout, "rb").read()
            cw, ch = struct.unpack_from("<2I", raw, 24)
            px = raw[32:32 + cw * ch * 4]
            if len(px) < cw * ch * 4:
                return None
            # GL convention: bottom row first
            row = cw * 4
            px = b"".join(px[(ch - 1 - y) * row:(ch - y) * row]
                          for y in range(ch))
            return px, cw, ch
        except (OSError, ValueError, IndexError, subprocess.TimeoutExpired):
            return None
        finally:
            for p in (fin, fout, finfo):
                try:
                    os.remove(p)
                except OSError:
                    pass
    if fmt not in RAW_FMTS:
        return None
    bpp = {1: 1, 3: 3, 4: 4, 5: 4, 63: 1}[fmt]
    px = data[DATA_OFF:DATA_OFF + w * h * bpp]
    if len(px) < w * h * bpp:
        return None
    rows = []
    for y in range(h):
        sy = h - 1 - y                       # bottom row first, same as CRN
        row = px[sy * w * bpp:(sy + 1) * w * bpp]
        if fmt == 3:
            row = bytes(b for i in range(0, len(row), 3)
                        for b in (row[i], row[i + 1], row[i + 2], 255))
        elif fmt == 5:
            row = bytes(b for i in range(0, len(row), 4)
                        for b in (row[i + 2], row[i + 1], row[i], row[i + 3]))
        elif fmt in (1, 63):
            row = bytes(b for c in row for b in (c, c, c, 255))
        rows.append(row)
    return b"".join(rows), w, h


def convert_one(item):
    """(pkg path, record bytes) -> cached PNG path, or None to skip."""
    path, data = item
    dst = os.path.join(PNG_DIR, hashlib.sha1(path.encode()).hexdigest()[:24]
                       + ".png")
    if os.path.isfile(dst) and os.path.getsize(dst) > 0:
        return dst
    decoded = decode(data)
    if not decoded:
        return None
    rgba, w, h = decoded
    run = subprocess.run(
        ["convert", "-size", "%dx%d" % (w, h), "-depth", "8", "rgba:-",
         "-resize", "%dx%d" % (MAX_PX, MAX_PX),
         "-alpha", "set", "-colors", str(COLORS), "+dither",
         "-define", "png:compression-filter=0",
         "-define", "png:compression-level=9",
         "PNG8:%s" % dst],
        input=rgba, capture_output=True, timeout=60)
    if run.returncode != 0 or not os.path.isfile(dst) \
            or os.path.getsize(dst) == 0:
        try:
            os.remove(dst)
        except OSError:
            pass
        return None
    return dst


JAVA_HEAD = """\
package modmenu;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Base64;
import android.util.LruCache;

import java.util.HashMap;

/**
 * Row icons for the id browser, generated by tools/gen_idicons.py out of the
 * game's own texture packs - the exact files the engine draws its inventory
 * art from. Keys are cat#id, the scanner's dedup form, so a miss falls back
 * to item#id for the categories whose ids live in itemdef (ITEM_CATS below).
 * A null return means the game ships no icon for that id; the row draws its
 * placeholder then.
 */
public final class IdIcons {
    private static final String[] ITEM_CATS = {
"""

JAVA_TAIL = """\
    };

    private static HashMap<String, Integer> map;

    // a screenful of decoded 64 px icons plus the scrollback, without
    // keeping a whole browse session's bitmaps alive
    private static final LruCache<Integer, Bitmap> cache =
            new LruCache<Integer, Bitmap>(4 * 1024 * 1024) {
                @Override
                protected int sizeOf(Integer key, Bitmap value) {
                    return value.getByteCount();
                }
            };

    private IdIcons() {}

    /** Decoded icon for cat#id, or null when the game ships none. */
    public static Bitmap get(String cat, String id) {
        if (map == null) {
            map = parse();
        }
        Integer i = map.get(cat + "#" + id);
        if (i == null && isItemCat(cat)) {
            i = map.get("item#" + id);
        }
        if (i == null) {
            return null;
        }
        Bitmap b = cache.get(i);
        if (b != null) {
            return b;
        }
        byte[] raw = Base64.decode(BLOBS[i], Base64.DEFAULT);
        b = BitmapFactory.decodeByteArray(raw, 0, raw.length);
        if (b != null) {
            cache.put(i, b);
        }
        return b;
    }

    private static boolean isItemCat(String cat) {
        for (int i = 0; i < ITEM_CATS.length; i++) {
            if (ITEM_CATS[i].equals(cat)) {
                return true;
            }
        }
        return false;
    }

    private static HashMap<String, Integer> parse() {
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < MAP.length; i++) {
            b.append(MAP[i]);
        }
        String data = b.toString();
        HashMap<String, Integer> m = new HashMap<String, Integer>(16384);
        int line = 0;
        int n = data.length();
        while (line < n) {
            int end = data.indexOf('\\n', line);
            if (end < 0) {
                end = n;
            }
            int tab = data.indexOf('\\t', line);
            if (tab > line && tab < end) {
                m.put(data.substring(line, tab),
                        Integer.valueOf(data.substring(tab + 1, end)));
            }
            line = end + 1;
        }
        return m;
    }
}
"""


def emit(entries, blob_index, blobs):
    lines = ["IDICONS1\n"]
    for key in sorted(entries):
        index = blob_index.get(entries[key])
        if index is not None:
            lines.append("%s\t%d\n" % (key, index))

    out = [JAVA_HEAD]
    out.append("        " + ", ".join('"%s"' % c for c in ITEMDEF_CATS) + "\n")
    out.append("    };\n\n")
    out.append("    /** One PNG per distinct icon, base64: dex has no "
               "byte-array constants. */\n"
               "    private static final String[] BLOBS = {\n")
    for blob in blobs:
        out.append("        " + jlit(blob) + ",\n")
    out.append("    };\n\n")
    out.append("    /** cat#id -> index into BLOBS; the first line is the\n"
               "     * marker and carries no tab, so parse() skips it. */\n"
               "    private static final String[] MAP = {\n")
    for part in chunks("".join(lines)):
        out.append("        " + jlit(part) + ",\n")
    out.append(JAVA_TAIL)
    with open(OUT, "w", encoding="utf-8") as f:
        f.write("".join(out))


def main():
    global CRN
    if not os.path.isfile(APK):
        sys.exit("gen_idicons: no APK at %s (run the build first)" % APK)
    os.makedirs(PNG_DIR, exist_ok=True)
    os.makedirs(TMP_DIR, exist_ok=True)

    script = from_apk(APK, "assets/script_res.pkg")
    big = {
        "common": from_file(ensure_extracted("assets/common_res.pkg")),
        "game": from_file(ensure_extracted("assets/game_res.pkg")),
    }
    small = {}
    for member in ("assets/first_res.pkg", "assets/remote_res.pkg"):
        try:
            small[member] = from_apk(APK, member)
        except KeyError:
            pass

    corpus = set()
    for pkg in list(big.values()) + list(small.values()):
        corpus |= set(pkg.names())
    print("corpus: %d paths" % len(corpus))

    entries = build_entries(script, corpus)
    wanted = sorted(set(entries.values()))
    print("entries: %d keys over %d distinct icons"
          % (len(entries), len(wanted)))

    # preload records: the pkgs are shared across the pool threads and
    # zipfile's decompressor is not
    data_of = {}
    for path in wanted:
        for pkg in list(big.values()) + list(small.values()):
            if path in pkg.paths:
                data_of[path] = pkg.read(path)
                break

    # fmt65 cannot decode without the upstream tool; cached icons don't care
    CRN = find_crn2rgba()
    need_crn = 0
    for path, data in data_of.items():
        dst = os.path.join(PNG_DIR,
                           hashlib.sha1(path.encode()).hexdigest()[:24] + ".png")
        if os.path.isfile(dst) and os.path.getsize(dst) > 0:
            continue
        if len(data) >= 0x24 and data[8:12] == MAGIC_INTL \
                and struct.unpack_from("<I", data, 0x20)[0] == 65:
            need_crn += 1
    if need_crn and CRN is None:
        sys.exit("gen_idicons: %d uncached icons are fmt65 and crn2rgba was "
                 "not found - get it from the upstream unpacker project and "
                 "set MW_CRN2RGBA" % need_crn)

    workers = int(sys.argv[1]) if len(sys.argv) > 1 else 6
    ok = bad = 0
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as pool:
        for dst in pool.map(convert_one, sorted(data_of.items())):
            if dst:
                ok += 1
            else:
                bad += 1
                if bad <= 5:
                    print("  no icon (see entries with no map line)")
    print("converted: %d ok, %d skipped" % (ok, bad))

    # one blob per distinct image; index order follows sorted keys
    blobs = []
    blob_by_content = {}
    blob_index = {}                 # pkg path -> blob index
    for key in sorted(entries):
        path = entries[key]
        if path in blob_index:
            continue
        dst = os.path.join(PNG_DIR,
                           hashlib.sha1(path.encode()).hexdigest()[:24] + ".png")
        if not (os.path.isfile(dst) and os.path.getsize(dst) > 0):
            continue
        content = open(dst, "rb").read()
        tag = hashlib.sha1(content).digest()
        if tag not in blob_by_content:
            blob_by_content[tag] = len(blobs)
            blobs.append(base64.b64encode(content).decode("ascii"))
        blob_index[path] = blob_by_content[tag]

    emit(entries, blob_index, blobs)
    mapped = sum(1 for k in entries if entries[k] in blob_index)
    print("blobs: %d distinct, %.1f MB base64; keys mapped: %d/%d"
          % (len(blobs), sum(len(b) for b in blobs) / 1e6, mapped, len(entries)))
    print("wrote %s (%d KB)" % (os.path.relpath(OUT, REPO),
                                os.path.getsize(OUT) // 1024))


if __name__ == "__main__":
    main()
