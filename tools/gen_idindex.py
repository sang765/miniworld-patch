#!/usr/bin/env python3
"""Generate patches/modmenu/src/modmenu/IdIndex.java - the id browser's index.

Run from anywhere; the APK must already be in work/out/apks:

    python3 tools/gen_idindex.py

The browser used to list only what a scan of the running VM happened to
expose - a small fraction of the game: item 12005 (the Energy Sword) exists
in itemdef but no scan ever surfaced it. The csvdef catalogs inside
script_res.pkg define the full id space, so this flattens them into one
language-neutral cat#id index. Categories come from the catalogs themselves,
not from guessing at Lua constant names:

    blockdef       -> block      (a placeable is a block even when it is
                                  also edible, so this goes first)
    gundef         -> weapon
    tooldef        -> weapon / equip / tool, split on the game's own Type
                      column: 6/7/24 are swords, bows and staves -> weapon;
                      8-11/16 are helmet/chest/legs/boots and capes -> equip;
                      everything else (picks, shovels, buckets, rods) -> tool
    projectiledef  -> projectile
    fooddef        -> food
    itemdef        -> item       (everything else)

Non-item catalogs keep the mapping gen_idnames.CAT_SOURCES already
established (buff, monster, sound, home, ...), minus 'recipe': crafting's
ids ship under 'craft' only, and the browser relabels scan rows that said
're recipe' - one chip, not two copies of one row.

The browser seeds its entries from this index before adding scan rows, and
drops a scan row whose category is item-space and whose id the index owns:
that turns WEAPON_* constants with enum values (which used to show air and
water under the weapon chip) into no-ops, while plugin ids no catalog has
heard of still come through.
"""
import csv
import io
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gen_idnames import (APK, BASE_CANDIDATES, CAT_SOURCES, ITEMDEF_CATS,
                         REPO, chunks, decode, jlit)
from pkgread import from_apk

OUT = os.path.join(REPO, "patches/modmenu/src/modmenu/IdIndex.java")

# Emission order for the itemdef-backed chain; first cat to claim an id wins.
CHAIN = ("block", "weapon", "equip", "projectile", "food", "tool", "item")

# tooldef.Type, the catalog's own split of its 900 wieldable rows.
TOOL_WEAPON = {"6", "7", "24"}       # swords, bows, staves
TOOL_ARMOR = {"8", "9", "10", "11", "16"}  # armor pieces, capes


def rows_of(pkg, path):
    """-> (header, data rows); def CSVs carry a zh header row over an en one."""
    rows = list(csv.reader(io.StringIO(decode(pkg.read(path)))))
    if len(rows) < 2:
        return [], []
    double = rows[1][0].strip().lower() == "id"
    return (rows[1] if double else rows[0]), (rows[2:] if double else rows[1:])


def build(pkg):
    have = set(pkg.names())

    def path_for(stem):
        for pattern in BASE_CANDIDATES:
            path = pattern % stem
            if path in have:
                return path
        return None

    def idset(stem):
        path = path_for(stem)
        if path is None:
            return set()
        _, data = rows_of(pkg, path)
        return {int(r[0]) for r in data if r and r[0].isdigit()}

    def col_of(stem, col):
        path = path_for(stem)
        if path is None:
            return {}
        header, data = rows_of(pkg, path)
        idx = {c.strip().lower(): i for i, c in enumerate(header)}
        ci = idx.get(col)
        out = {}
        for r in data:
            if not r or not r[0].isdigit() or ci is None or ci >= len(r):
                continue
            out[int(r[0])] = r[ci].strip()
        return out

    item = idset("itemdef")
    block = idset("blockdef")
    gun = idset("gundef")
    proj = idset("projectiledef")
    food = idset("fooddef")
    tool_type = col_of("tooldef", "type")

    keys = []
    used = set()

    def claim(cat, ids):
        for i in sorted(ids):
            if i in used:
                continue
            used.add(i)
            keys.append((cat, i))

    claim("block", block)
    claim("weapon", gun | {i for i, t in tool_type.items()
                           if t in TOOL_WEAPON})
    claim("equip", {i for i, t in tool_type.items() if t in TOOL_ARMOR})
    claim("projectile", proj)
    claim("food", food)
    claim("tool", set(tool_type))
    claim("item", item)

    chain_counts = {}
    for cat, i in keys:
        chain_counts[cat] = chain_counts.get(cat, 0) + 1

    # Non-item catalogs: same first-source-wins walk as gen_idnames, ids
    # only - the names already ship in IdNames.
    rest_counts = {}
    item_space = set(ITEMDEF_CATS) & set(CAT_SOURCES)
    for cat, sources in CAT_SOURCES.items():
        if cat in CHAIN or cat == "recipe":
            continue
        seen = set()
        for stem in sources:
            for i in sorted(idset(stem)):
                if i in seen:
                    continue
                seen.add(i)
                # shop/mall constants address itemdef ids (see
                # ITEMDEF_CATS): the chain already lists that row
                if cat in item_space and i in item:
                    continue
                keys.append((cat, i))
                rest_counts[cat] = rest_counts.get(cat, 0) + 1

    return keys, chain_counts, rest_counts


JAVA_HEAD = """\
package modmenu;

import java.util.ArrayList;
import java.util.HashSet;

/**
 * Every id the game's csvdef catalogs define, with the category the id
 * browser lists it under.
 *
 * Generated by tools/gen_idindex.py - the language-neutral counterpart of
 * IdNames: keys only, names stay over there. The browser seeds its rows
 * from here, so coverage no longer leans on whatever a scan of the running
 * VM happened to expose (the Energy Sword, item 12005, was simply absent),
 * and a scan row in an item-space category whose id lives here is dropped:
 * the catalogs say what an id is, the VM's constant-name guesses - a global
 * named WEAPON_* holding the value 0 - do not.
 */
public final class IdIndex {
    // Chunks, not one string: a class-file string constant tops out at
    // 64 KB, so the index ships as ~60 KB pieces joined on first use.
    private static final String[] DATA = {
"""

JAVA_TAIL = """\
    };

    // Categories whose ids live in itemdef's space: the chain cats the
    // generator emits, plus the constant cats IdNames resolves through
    // item#id. A scan row in one of these is answered by the index;
    // any other row is judged by exact cat#id alone, because a foreign
    // catalog's ids (buff#1001, item#1001) name different things.
    private static final String[] ITEM_SPACE = {
    };

    private static String[] keys;
    private static HashSet<String> space;

    private IdIndex() {}

    /** Every cat#id the catalogs define, in emission order. */
    public static String[] keys() {
        if (keys == null) {
            parse();
        }
        return keys;
    }

    /** True when cat is one of the itemdef-space categories. */
    public static boolean itemCat(String cat) {
        for (int i = 0; i < ITEM_SPACE.length; i++) {
            if (ITEM_SPACE[i].equals(cat)) {
                return true;
            }
        }
        return false;
    }

    /** True when the catalogs define this id anywhere in itemdef's space. */
    public static boolean inItemSpace(String id) {
        if (space == null) {
            parse();
        }
        return space.contains(id);
    }

    private static void parse() {
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < DATA.length; i++) {
            b.append(DATA[i]);
        }
        String data = b.toString();
        ArrayList<String> ks = new ArrayList<String>(32768);
        HashSet<String> sp = new HashSet<String>(16384);
        int line = 0;
        int n = data.length();
        while (line < n) {
            int end = data.indexOf('\\n', line);
            if (end < 0) {
                end = n;
            }
            int hash = data.indexOf('#', line);
            if (hash > line && hash < end) {
                String key = data.substring(line, end);
                ks.add(key);
                if (itemCat(data.substring(line, hash))) {
                    sp.add(data.substring(hash + 1, end));
                }
            }
            line = end + 1;
        }
        keys = ks.toArray(new String[0]);
        space = sp;
    }
}
"""


def emit(keys):
    data = "IDINDEX1\n" + "".join("%s#%d\n" % (cat, i) for cat, i in keys)
    out = [JAVA_HEAD]
    for part in chunks(data):
        out.append("            " + jlit(part) + ",\n")
    out.append(JAVA_TAIL.replace(
        "    private static final String[] ITEM_SPACE = {\n    };",
        "    private static final String[] ITEM_SPACE = {\n"
        + "        " + ", ".join('"%s"' % c for c in item_space()) + "\n"
        + "    };"))
    with open(OUT, "w", encoding="utf-8") as f:
        f.write("".join(out))
    return len(data.encode("utf-8"))


def item_space():
    cats = set(ITEMDEF_CATS) | set(CHAIN)
    return sorted(cats)


def main():
    if not os.path.isfile(APK):
        sys.exit("gen_idindex: no APK at %s (run the build first)" % APK)
    pkg = from_apk(APK, "assets/script_res.pkg")
    keys, chain_counts, rest_counts = build(pkg)
    size = emit(keys)
    print("chain: %s" % ", ".join("%s=%d" % (c, chain_counts.get(c, 0))
                                  for c in CHAIN))
    print("catalogs: %s" % ", ".join("%s=%d" % kv
                                     for kv in sorted(rest_counts.items())))
    print("wrote %s: %d keys, %d KB" % (os.path.relpath(OUT, REPO),
                                        len(keys), size // 1024))


if __name__ == "__main__":
    main()
