#!/usr/bin/env python3
"""Generate patches/modmenu/src/modmenu/IdNames.java from the game's own data.

Run from the repo root (the APKs must already be in work/out/apks):

    python3 tools/gen_idnames.py

script_res.pkg holds the definition catalogs the id browser lists, each with
one file per language under script/language/<lng>/csvdef/utf8/. Names are
resolved per language in this order:

  1. the language's own file for the catalog, keyed by id - itemdef, buffdef,
     monster and friends ship one per language;
  2. the base file's native column (blockdef carries ENName/TWName; cn is the
     base file itself);
  3. a Chinese-name join through itemdef: blockdef/tooldef/fooddef have no
     localized file of their own, but itemdef carries most of the same names,
     so matching on the Chinese text (not the id, which drifts between
     catalogs) finds the same thing's localized text.

Whatever stays unnamed falls back to the entry's constant label at display
time, so a miss costs nothing but the localized name.

The output is a plain modmenu source file - regen.sh compiles it like any
other, which is the only route past scopecheck (added files are allowed only
under the modmenu smali, and regen.sh wipes that directory every run).
"""
import csv
import io
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from pkgread import from_apk

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
APK = os.environ.get(
    "MW_ASSET_APK",
    os.path.join(REPO, "work/out/apks/split_mini_asset_pack.apk"))
OUT = os.path.join(REPO, "patches/modmenu/src/modmenu/IdNames.java")

# Every code LanguageUtils.getLanuageByGame() returns; cn has no language
# directory of its own - the base CSVs are the Chinese text.
LANGS = ["vie", "en", "tw", "cn", "ara", "esn", "fra", "ger", "ind", "ita",
         "jpn", "kor", "msa", "ptb", "rus", "tha", "tur"]
PRIORITY = ["vie", "en", "tw", "cn"]
TRIM_LIMIT = 8_000_000  # raw bytes; over this only PRIORITY ships

# id browser category -> definition catalogs, first hit wins. Keys are the
# scanner's own catOf()/FAM output (see IdScan.java), stems are the csvdef
# file names; stems missing from script_res are skipped silently.
CAT_SOURCES = {
    "item": ["itemdef"],
    "block": ["blockdef"],
    "tool": ["tooldef"],
    "buff": ["buffdef"],
    "food": ["fooddef"],
    "effect": ["effectbank"],
    "sound": ["sound"],
    "monster": ["monster"],
    "mob": ["mobspawner", "monster"],
    "pet": ["petdef", "monster"],
    "summon": ["summondef"],
    "projectile": ["projectiledef"],
    "skin": ["roleskin", "itemuseskindef", "skinact"],
    "role": ["role", "roleskin"],
    "avatar": ["avatardef", "headicon"],
    "npc": ["homenpcdef", "npcplotdef", "npctaskdef", "npctrade"],
    "task": ["task", "survivetaskdef"],
    "achievement": ["achievement"],
    "recipe": ["crafting"],
    "craft": ["crafting", "homecraftdef"],
    "crop": ["homecropsdef", "planttrees"],
    "seed": ["homecropsdef", "planttrees"],
    "horse": ["horse", "storehorse"],
    "mount": ["horse", "storehorse"],
    "furniture": ["homebuilddef", "homeitemdef"],
    "home": ["homeitemdef", "homebuilddef"],
    "shop": ["storeprop"],
    "mall": ["storeprop"],
    "trade": ["npctrade"],
    # plugin / other are runtime-only ids: no catalog can name them
}

# Cats whose constants point into itemdef's id space by definition (equipment,
# titles, shop items, ...). They are not emitted per cat - IdNames falls back
# to item#id for these - which keeps itemdef's 13k rows out of the data eleven
# times over.
ITEMDEF_CATS = ["activity", "armor", "award", "bag", "emoji", "equip",
                "festival", "food", "shop", "mall", "title", "tower",
                "weapon"]

PLACEHOLDERS = {"", "-", "--", "(empty)", "(空)", "（空）", "无", "暂无"}

BASE_CANDIDATES = [
    "../commonresource/script/csvdef/utf8/%s.csv",
    "../script/csvdef/utf8/%s.csv",
]
LANG_PATH = "../script/language/%s/csvdef/utf8/%s.csv"


def decode(raw):
    try:
        return raw.decode("utf-8-sig")
    except UnicodeDecodeError:
        return raw.decode("gbk", "replace")


def read_csv(raw):
    """-> ({id: name}, {id: en} or {}, {id: tw} or {})

    Def CSVs carry two header rows (zh, then en field names) and data from
    row 2; the en row is detected rather than assumed so a single-header
    file still parses with the generic id/name column fallbacks.
    """
    rows = list(csv.reader(io.StringIO(decode(raw))))
    if len(rows) < 2:
        return {}, {}, {}
    double = rows[1][0].strip().lower() == "id"
    hdr = rows[1] if double else rows[0]
    data = rows[2:] if double else rows[1:]

    def find(*names):
        want = {n.lower() for n in names}
        for i, cell in enumerate(hdr):
            if cell.strip().lower() in want:
                return i
        return None

    id_i = find("id")
    if id_i is None:
        id_i = 0
    name_i = find("name")
    if name_i is None:
        name_i = 1
    en_i = find("enname")
    tw_i = find("twname")

    zh, en, tw = {}, {}, {}
    width = max(id_i, name_i, en_i or 0, tw_i or 0)
    for row in data:
        if len(row) <= width:
            continue
        key = row[id_i].strip()
        if not key.isdigit():
            continue
        i = int(key)
        zh[i] = row[name_i].strip()
        if en_i is not None:
            en[i] = row[en_i].strip()
        if tw_i is not None:
            tw[i] = row[tw_i].strip()
    return zh, en, tw


def clean(s):
    if s is None:
        return None
    s = " ".join(s.split())  # tabs/newlines would break the record format
    if s in PLACEHOLDERS:
        return None
    return s or None


def resolve(lang, stem, id_, base, lang_csv, join):
    zh, en, tw = base.get(stem, ({}, {}, {}))
    if lang == "cn":
        return zh.get(id_)
    lc = lang_csv.get((lang, stem))
    if lc is not None and id_ in lc:
        return lc[id_]
    if lang == "en" and id_ in en:
        return en[id_]
    if lang == "tw" and id_ in tw:
        return tw[id_]
    z = zh.get(id_)
    if z is not None:
        return join.get(lang, {}).get(z)
    return None


def build(pkg, langs):
    have = set(pkg.names())
    stems = []
    for sources in CAT_SOURCES.values():
        for s in sources:
            if s not in stems:
                stems.append(s)

    base = {}
    for stem in stems:
        for pattern in BASE_CANDIDATES:
            path = pattern % stem
            if path in have:
                base[stem] = read_csv(pkg.read(path))
                break

    lang_csv = {}
    for lang in langs:
        if lang == "cn":
            continue
        for stem in stems:
            path = LANG_PATH % (lang, stem)
            if path in have:
                lang_csv[(lang, stem)] = read_csv(pkg.read(path))[0]

    # zh-name join: itemdef's Chinese name -> this language's name for it
    join = {}
    if "itemdef" in base:
        item_zh = base["itemdef"][0]
        for lang in langs:
            lc = lang_csv.get((lang, "itemdef"))
            if not lc:
                continue
            j = {}
            for iid, zhname in item_zh.items():
                nm = lc.get(iid)
                if nm:
                    j.setdefault(zhname, nm)
            join[lang] = j

    def idset(stem):
        if stem in base:
            return base[stem][0]
        for lang in langs:
            lc = lang_csv.get((lang, stem))
            if lc:
                return lc
        return {}

    data, counts = {}, {}
    for lang in langs:
        lines = ["IDNAMES1\n"]
        n = 0
        for cat, sources in CAT_SOURCES.items():
            seen = set()
            for stem in sources:
                for id_ in sorted(idset(stem)):
                    if id_ in seen:
                        continue
                    nm = clean(resolve(lang, stem, id_, base, lang_csv, join))
                    if nm is None:
                        continue
                    seen.add(id_)
                    lines.append("%s#%d\t%s\n" % (cat, id_, nm))
                    n += 1
        data[lang] = "".join(lines)
        counts[lang] = n
    return data, counts


def mutf8_bytes(ch):
    o = ord(ch)
    if o == 0:
        return 2
    if o < 0x80:
        return 1
    if o < 0x800:
        return 2
    if o > 0xFFFF:
        return 6  # supplementary pair, stored as two surrogates
    return 3


def chunks(s, limit=60000):
    """Split for the class-file 64 KB string-constant limit (modified UTF-8)."""
    out, cur, n = [], [], 0
    for ch in s:
        b = mutf8_bytes(ch)
        if n + b > limit:
            out.append("".join(cur))
            cur, n = [], 0
        cur.append(ch)
        n += b
    if cur:
        out.append("".join(cur))
    return out


def jlit(s):
    out = ['"']
    for ch in s:
        o = ord(ch)
        if ch == "\\":
            out.append("\\\\")
        elif ch == '"':
            out.append('\\"')
        elif ch == "\n":
            out.append("\\n")
        elif ch == "\r":
            out.append("\\r")
        elif ch == "\t":
            out.append("\\t")
        elif o < 0x20 or o == 0x7F:
            out.append("\\u%04x" % o)
        else:
            out.append(ch)
    out.append('"')
    return "".join(out)


JAVA_HEAD = """\
package modmenu;

import android.content.Context;

import org.appplay.lib.utils.LanguageUtils;

import java.util.HashMap;
import java.util.Locale;

/**
 * Display names for the id browser, in the language the game runs in.
 *
 * Generated by tools/gen_idnames.py from the game's own csvdef catalogs -
 * the engine keeps every localized table in its data packs, so the browser
 * can show the name a player would read in-game ("Khối cỏ") instead of the
 * constant label, with no extra call into the VM. One String[] per
 * LanguageUtils.getLanuageByGame() code, assembled and parsed only for the
 * language actually picked; the parsed keys are cat#id, the same form the
 * scanner dedupes entries with. A language miss falls back to the entry's
 * label at the call site.
 */
public final class IdNames {
    private static final String[] LANGS = {
"""

JAVA_TAIL = """\
    };

    private static String lang;
    private static HashMap<String, String> map;

    private IdNames() {}

    /** Forget the cached language so the next read sees a language change. */
    public static void reset() {
        lang = null;
        map = null;
    }

    /** The display name for cat#id, or null when the language has none. */
    public static String get(Context ctx, String cat, String id) {
        if (lang == null) {
            lang = pick(ctx);
            map = null;
        }
        if (map == null) {
            map = parse(assemble());
        }
        String name = map.get(cat + "#" + id);
        if (name == null && isItemCat(cat)) {
            name = map.get("item#" + id);
        }
        return name;
    }

    private static boolean isItemCat(String cat) {
        for (int i = 0; i < ITEM_CATS.length; i++) {
            if (ITEM_CATS[i].equals(cat)) {
                return true;
            }
        }
        return false;
    }

    private static String pick(Context ctx) {
        String code = "";
        try {
            code = LanguageUtils.getLanuageByGame(
                    LanguageUtils.getMobileLang(ctx));
        } catch (RuntimeException e) {
            // prefs unreadable or class missing: fall back to the locale
        }
        if (code == null || code.length() == 0) {
            // -1 means the player never picked a language: follow the device
            Locale loc = Locale.getDefault();
            if ("vi".equals(loc.getLanguage())) {
                code = "vie";
            } else if ("zh".equals(loc.getLanguage())) {
                String r = loc.getCountry();
                code = ("TW".equals(r) || "HK".equals(r) || "MO".equals(r))
                        ? "tw" : "cn";
            } else {
                code = "en";
            }
        }
        for (int i = 0; i < LANGS.length; i++) {
            if (LANGS[i].equals(code)) {
                return code;
            }
        }
        return "en";
    }

    private static String assemble() {
        int idx = 0;
        for (int i = 0; i < LANGS.length; i++) {
            if (LANGS[i].equals(lang)) {
                idx = i;
                break;
            }
        }
        String[] parts = DATA[idx];
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < parts.length; i++) {
            b.append(parts[i]);
        }
        return b.toString();
    }

    /** Flat cat#id<TAB>name lines; anything without a tab is a marker. */
    private static HashMap<String, String> parse(String data) {
        HashMap<String, String> m = new HashMap<String, String>(32768);
        int line = 0;
        int n = data.length();
        while (line < n) {
            int end = data.indexOf('\\n', line);
            if (end < 0) {
                end = n;
            }
            int tab = data.indexOf('\\t', line);
            if (tab > line && tab < end) {
                m.put(data.substring(line, tab), data.substring(tab + 1, end));
            }
            line = end + 1;
        }
        return m;
    }
}
"""


def emit(langs, data, counts):
    out = [JAVA_HEAD]
    out.append("        " + ", ".join('"%s"' % l for l in langs) + "\n")
    out.append("    };\n\n")
    out.append("    // Emission is per dedicated catalog; for these cats the\n"
               "    // constant's value is an itemdef id, so get() falls back to\n"
               "    // item#id instead of repeating itemdef under every one of\n"
               "    // them.\n"
               "    private static final String[] ITEM_CATS = {\n")
    out.append("        " + ", ".join('"%s"' % c for c in ITEMDEF_CATS) + "\n")
    out.append("    };\n\n")
    out.append("    // Chunks, not whole languages: a class-file string\n"
               "    // constant tops out at 64 KB, so each language ships as\n"
               "    // ~60 KB pieces and only the chosen one is ever joined.\n"
               "    private static final String[][] DATA = {\n")
    for lang in langs:
        parts = chunks(data[lang])
        out.append("        { // %s: %d names, %d bytes\n"
                   % (lang, counts[lang], len(data[lang].encode("utf-8"))))
        for part in parts:
            out.append("            " + jlit(part) + ",\n")
        out.append("        },\n")
    out.append(JAVA_TAIL)
    with open(OUT, "w", encoding="utf-8") as f:
        f.write("".join(out))


def main():
    if not os.path.isfile(APK):
        sys.exit("gen_idnames: no APK at %s (run the build first)" % APK)
    pkg = from_apk(APK, "assets/script_res.pkg")

    langs = list(LANGS)
    data, counts = build(pkg, langs)
    total = sum(len(v.encode("utf-8")) for v in data.values())
    if total > TRIM_LIMIT:
        print("gen_idnames: %d bytes over the %d limit, trimming to %s"
              % (total, TRIM_LIMIT, "/".join(PRIORITY)))
        langs = [l for l in LANGS if l in PRIORITY]
        data, counts = build(pkg, langs)
        total = sum(len(v.encode("utf-8")) for v in data.values())

    for lang in langs:
        print("  %-4s %6d names  %8d bytes" % (lang, counts[lang],
                                               len(data[lang].encode("utf-8"))))
    print("  total %d bytes in %d languages" % (total, len(langs)))
    emit(langs, data, counts)
    print("wrote %s (%d KB)" % (os.path.relpath(OUT, REPO),
                                os.path.getsize(OUT) // 1024))


if __name__ == "__main__":
    main()
