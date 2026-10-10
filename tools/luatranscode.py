#!/usr/bin/env python3
"""Transcode a stock-luac Lua 5.1 chunk into Mini World's engine chunk format.

The engine loads stock Lua 5.1 bytecode with two deviations from a dump made
by a stock luac (both proven against the game's own script_res.pkg chunks):

1. String lengths are 4-byte size_t even though the header advertises the
   host width; luac on a 64-bit host writes 8.
2. The opcode block 10..20 (NEWTABLE,SELF,ADD..LEN) is rotated left by 2, so
   the engine reads ADD=10 SUB=11 .. LEN=18 NEWTABLE=19 SELF=20. Verified by
   instruction shape: NEWTABLE carries raw table sizes (C never an RK const),
   SELF always has C>=256 (method-name constant), the unary ops have C==0.

Usage:
  luatranscode.py IN.luac OUT.lua
      Transcode a luac5.1/string.dump output.
  luatranscode.py --selftest GAME.lua
      Parse + re-emit a game-format chunk and require byte-identity, i.e.
      validate this reader/writer against a chunk the game already runs.
  luatranscode.py --check GAME.lua NEW.lua
      Assert the instruction stream of every matched prototype is identical
      between the two files; after compiling edited source this validates both
      transforms end-to-end (a wrong rotation or width desync cannot pass).

Compile step (chunkname = the whole source, matching how the game embeds the
source of its shipped scripts in the debug field):

  lua5.1 -e 'local s=io.open(arg[1]):read("*a")
    local c=assert(loadstring(s,s))
    local o=io.open(arg[2],"wb"); o:write(string.dump(c)); o:close()' in.lua out.luac
"""
import difflib
import struct
import sys

STOCK2MW = {10: 19, 11: 20, 12: 10, 13: 11, 14: 12, 15: 13, 16: 14,
            17: 15, 18: 16, 19: 17, 20: 18}


class R:
    def __init__(self, buf, width):
        self.b = buf
        self.p = 0
        self.width = width

    def raw(self, n):
        v = self.b[self.p:self.p + n]
        if len(v) != n:
            raise EOFError("short read at %d" % self.p)
        self.p += n
        return v

    def u8(self):
        return self.raw(1)[0]

    def i32(self):
        return struct.unpack("<i", self.raw(4))[0]

    def u32(self):
        return struct.unpack("<I", self.raw(4))[0]

    def u64(self):
        return struct.unpack("<Q", self.raw(8))[0]

    def f64(self):
        return struct.unpack("<d", self.raw(8))[0]

    def size(self):
        return self.u32() if self.width == 4 else self.u64()

    def s(self):
        n = self.size()
        if n == 0:
            return None
        return self.raw(n)


def read_header(r):
    if r.raw(4) != b"\x1bLua":
        raise ValueError("not a lua chunk")
    fields = [r.u8() for _ in range(8)]
    # fields = version, format, endian, sizeof(int), sizeof(size_t),
    #          sizeof(Instruction), sizeof(lua_Number), integral
    if fields[:4] != [0x51, 0, 1, 4] or fields[5:] != [4, 8, 0]:
        raise ValueError("unexpected header %r" % (fields,))
    r.width = fields[4]
    if r.width not in (4, 8):
        raise ValueError("bad size_t width %d" % r.width)
    return fields


def read_proto(r):
    p = {"source": r.s(),
         "line": r.i32(), "lastline": r.i32(),
         "nups": r.u8(), "nparams": r.u8(), "vararg": r.u8(),
         "maxstack": r.u8()}
    p["code"] = [r.u32() for _ in range(r.u32())]
    k = []
    for _ in range(r.u32()):
        tag = r.u8()
        if tag == 0:
            k.append(None)
        elif tag == 1:
            k.append(bool(r.u8()))
        elif tag == 3:
            k.append(r.f64())
        elif tag == 4:
            k.append(("s", r.s()))
        else:
            raise ValueError("bad const tag %d at %d" % (tag, r.p))
    p["k"] = k
    p["protos"] = [read_proto(r) for _ in range(r.u32())]
    p["lineinfo"] = [r.i32() for _ in range(r.u32())]
    p["locvars"] = [(r.s(), r.i32(), r.i32()) for _ in range(r.u32())]
    p["upvals"] = [r.s() for _ in range(r.u32())]
    return p


def parse(buf):
    r = R(buf, 4)
    fields = read_header(r)
    proto = read_proto(r)
    if r.p != len(buf):
        raise ValueError("consumed %d of %d" % (r.p, len(buf)))
    return fields, proto


class W:
    def __init__(self):
        self.b = bytearray()

    def raw(self, v):
        self.b += v

    def u8(self, v):
        self.b.append(v)

    def i32(self, v):
        self.b += struct.pack("<i", v)

    def u32(self, v):
        self.b += struct.pack("<I", v)

    def f64(self, v):
        self.b += struct.pack("<d", v)

    def s(self, v):
        if v is None:
            self.u32(0)
        else:
            self.u32(len(v))
            self.b += v


def write_header(w, size_t):
    w.raw(b"\x1bLua")
    w.u8(0x51)
    w.u8(0)
    w.u8(1)
    w.u8(4)
    w.u8(size_t)
    w.u8(4)
    w.u8(8)
    w.u8(0)


def write_proto(w, p, remap):
    w.s(p["source"])
    w.i32(p["line"])
    w.i32(p["lastline"])
    for f in ("nups", "nparams", "vararg", "maxstack"):
        w.u8(p[f])
    w.u32(len(p["code"]))
    for ins in p["code"]:
        w.u32(remap.get(ins & 0x3F, ins & 0x3F) | (ins & ~0x3F))
    w.u32(len(p["k"]))
    for v in p["k"]:
        if v is None:
            w.u8(0)
        elif isinstance(v, bool):
            w.u8(1)
            w.u8(1 if v else 0)
        elif isinstance(v, tuple):
            w.u8(4)
            w.s(v[1])
        else:
            w.u8(3)
            w.f64(v)
    w.u32(len(p["protos"]))
    for sub in p["protos"]:
        write_proto(w, sub, remap)
    w.u32(len(p["lineinfo"]))
    for x in p["lineinfo"]:
        w.i32(x)
    w.u32(len(p["locvars"]))
    for name, a, b in p["locvars"]:
        w.s(name)
        w.i32(a)
        w.i32(b)
    w.u32(len(p["upvals"]))
    for name in p["upvals"]:
        w.s(name)


def emit(proto, remap):
    w = W()
    write_header(w, 4)
    write_proto(w, proto, remap)
    return bytes(w.b)


def walk(proto, path="/"):
    yield path, proto
    for i, sub in enumerate(proto["protos"]):
        yield from walk(sub, "%s/p%d" % (path, i))


def check(game_path, new_path):
    _, a = parse(open(game_path, "rb").read())
    _, b = parse(open(new_path, "rb").read())
    la = list(walk(a))
    lb = list(walk(b))
    ca = [tuple(c["code"]) for _, c in la]
    cb = [tuple(c["code"]) for _, c in lb]
    sm = difflib.SequenceMatcher(None, ca, cb, autojunk=False)
    blocks = sm.get_matching_blocks()
    un_a = [i for i in range(len(la))
            if not any(m.a <= i < m.a + m.size for m in blocks)]
    un_b = [i for i in range(len(lb))
            if not any(m.b <= i < m.b + m.size for m in blocks)]
    print("protos: game=%d new=%d identical=%d unmatched=%d/%d"
          % (len(la), len(lb), sum(m.size for m in blocks),
             len(un_a), len(un_b)))
    for i in un_a:
        print("  - game %s line %d (%d insns)"
              % (la[i][0], la[i][1]["line"], len(ca[i])))
    for i in un_b:
        print("  + new  %s line %d (%d insns)"
              % (lb[i][0], lb[i][1]["line"], len(cb[i])))
    # The game side is the real gate: if either transform is wrong, hundreds
    # of untouched prototypes stop matching. New prototypes are expected from
    # the patch itself (helpers + pcall closures), so they are not capped.
    ok = len(un_a) <= 20
    print("CHECK %s" % ("PASS" if ok else "FAIL"))
    return 0 if ok else 1


def selftest(game_path):
    buf = open(game_path, "rb").read()
    _, proto = parse(buf)
    out = emit(proto, {})
    if out != buf:
        for i in range(min(len(out), len(buf))):
            if out[i] != buf[i]:
                print("SELFTEST FAIL: first diff at %d (out=%02x game=%02x)"
                      % (i, out[i], buf[i]))
                break
        return 1
    print("SELFTEST PASS (%d bytes round-tripped)" % len(buf))
    return 0


def main(argv):
    if argv[1:2] == ["--selftest"]:
        return selftest(argv[2])
    if argv[1:2] == ["--check"]:
        return check(argv[2], argv[3])
    fields, proto = parse(open(argv[1], "rb").read())
    if fields[4] != 8:
        raise SystemExit("input is not a 64-bit-luac chunk (size_t=%d)"
                         % fields[4])
    out = emit(proto, STOCK2MW)
    # validate our own output before anyone can build with it
    parse(out)
    open(argv[2], "wb").write(out)
    n = sum(1 for _ in walk(proto))
    print("transcoded %s -> %s (%d bytes, %d protos)"
          % (argv[1], argv[2], len(out), n))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
