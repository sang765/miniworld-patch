package modmenu;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import org.appplay.lib.CommonNatives;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Reads the game's ID registries out of its own Lua VM.
 *
 * Every catalog (items, plugin items, buffs, sounds, effects, skins, mobs,
 * blocks, recipes...) is a C++ config table the engine loads from its .pkg
 * archives, and those are encrypted in native code (DirVisitorDecrypt in
 * libGameApp.so) - unreadable from outside the process. Plugin items only
 * exist while a map is loaded anyway, so the running VM is the only channel
 * that covers every category the browser lists.
 *
 * Delivery mirrors the old state-file probe: javaCallLuaEvent appends "()"
 * to the source and hands it to CallLuaString, which swallows any native
 * error; the script answers by writing a JSON file with io.open, because
 * javaCallLuaEvent is void and the VM has no value-returning path back into
 * Java. Both the external and the internal files dir are written, and the
 * poller reads both, so a ROM that grants either one still works.
 *
 * The script itself is pcall-wrapped end to end and does no unprotected
 * call: a wrong guess about a registry only loses that one source, never the
 * scan, and never the game.
 */
public final class IdScan {
    private static final String TAG = "MWIds";
    private static final String FILE = "mw_ids.json";
    private static final long TIMEOUT_MS = 15000;
    private static final long POLL_MS = 250;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile boolean running;

    private IdScan() {}

    public interface Listener {
        void onDone(Result result);
    }

    /** One id the browser can show and copy. */
    public static final class Entry {
        public final String id;
        public final String name;
        public final String cat;
        public final String src;

        Entry(String id, String name, String cat, String src) {
            this.id = id;
            this.name = name;
            this.cat = cat;
            this.src = src;
        }
    }

    public static final class Result {
        public final List<Entry> entries;
        public final List<String> globals;
        public final List<String> methods;
        public final List<String> notes;
        public final boolean inMap;
        public final String error;

        Result(List<Entry> entries, List<String> globals, List<String> methods,
               List<String> notes, boolean inMap, String error) {
            this.entries = entries;
            this.globals = globals;
            this.methods = methods;
            this.notes = notes;
            this.inMap = inMap;
            this.error = error;
        }

        static Result fail(String why) {
            return new Result(new ArrayList<Entry>(), new ArrayList<String>(),
                    new ArrayList<String>(), new ArrayList<String>(), false, why);
        }
    }

    /**
     * Sends the scan script and calls back on the main thread once the JSON
     * file lands, or with an error after the timeout. The file is deleted
     * first so a stale result can never be mistaken for this run's.
     */
    public static void scan(Context ctx, final Listener listener) {
        if (running) {
            listener.onDone(Result.fail("busy"));
            return;
        }
        final String[] paths = paths(ctx);
        if (paths == null) {
            listener.onDone(Result.fail("nopath"));
            return;
        }
        // delete and send inside the guard: this runs on the tap path of the
        // game's own main thread, where an escaping RuntimeException would
        // reach the game's uncaught handler and take the process down
        try {
            for (int i = 0; i < paths.length; i++) {
                new File(paths[i]).delete();
            }
            running = true;
            CommonNatives.javaCallLuaEvent(script(paths[0], paths[1]), new Object[0]);
        } catch (RuntimeException e) {
            running = false;
            listener.onDone(Result.fail("send: " + e));
            return;
        }
        new Thread(new Runnable() {
            @Override
            public void run() {
                final Result r = await(paths);
                running = false;
                MAIN.post(new Runnable() {
                    @Override
                    public void run() {
                        listener.onDone(r);
                    }
                });
            }
        }, "mw-idscan").start();
    }

    /** External files dir first, internal as fallback; both are written. */
    private static String[] paths(Context ctx) {
        try {
            File internal = ctx.getFilesDir();
            if (internal == null) {
                return null;
            }
            String in = new File(internal, FILE).getAbsolutePath();
            File ext = ctx.getExternalFilesDir(null);
            if (ext == null) {
                return new String[]{in, in};
            }
            return new String[]{new File(ext, FILE).getAbsolutePath(), in};
        } catch (RuntimeException e) {
            Log.d(TAG, "paths failed: " + e);
            return null;
        }
    }

    private static Result await(String[] paths) {
        long deadline = System.currentTimeMillis() + TIMEOUT_MS;
        while (System.currentTimeMillis() < deadline) {
            for (int i = 0; i < paths.length; i++) {
                String body = read(paths[i]);
                if (body != null && body.length() > 2) {
                    Result r = parse(body);
                    if (r != null) {
                        return r;
                    }
                    // short or unparsable: the script is still writing
                }
            }
            try {
                Thread.sleep(POLL_MS);
            } catch (InterruptedException e) {
                break;
            }
        }
        return Result.fail("timeout");
    }

    private static String read(String path) {
        FileInputStream in = null;
        try {
            in = new FileInputStream(path);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) > 0) {
                out.write(buf, 0, n);
            }
            return out.toString("UTF-8");
        } catch (Exception e) {
            return null;
        } finally {
            if (in != null) {
                try {
                    in.close();
                } catch (Exception ignored) {
                }
            }
        }
    }

    /** null means "not written yet" - the poller keeps waiting. */
    private static Result parse(String body) {
        try {
            JSONObject o = new JSONObject(body);
            List<String> notes = strings(o, "n");
            String error = null;
            if (!notes.isEmpty() && notes.get(0).startsWith("err:")) {
                error = notes.get(0);
            }
            List<String> globals = new ArrayList<String>();
            JSONArray g = o.optJSONArray("g");
            for (int i = 0; g != null && i < g.length(); i++) {
                JSONObject e = g.optJSONObject(i);
                if (e != null) {
                    globals.add(e.optString("n") + " (" + e.optString("t") + ")");
                }
            }
            List<String> methods = new ArrayList<String>();
            JSONArray m = o.optJSONArray("m");
            for (int i = 0; m != null && i < m.length(); i++) {
                JSONObject e = m.optJSONObject(i);
                if (e != null) {
                    methods.add(e.optString("o") + "." + e.optString("n"));
                }
            }
            List<Entry> entries = new ArrayList<Entry>();
            JSONArray arr = o.optJSONArray("e");
            for (int i = 0; arr != null && i < arr.length(); i++) {
                JSONObject e = arr.optJSONObject(i);
                if (e == null) {
                    continue;
                }
                String id = e.optString("i");
                if (id.length() == 0) {
                    continue;
                }
                entries.add(new Entry(id, e.optString("n"), e.optString("c", "other"),
                        e.optString("s")));
            }
            return new Result(entries, globals, methods, notes,
                    o.optInt("inmap", 0) != 0, error);
        } catch (Exception e) {
            return null;
        }
    }

    private static List<String> strings(JSONObject o, String key) {
        List<String> out = new ArrayList<String>();
        JSONArray a = o.optJSONArray(key);
        for (int i = 0; a != null && i < a.length(); i++) {
            out.add(a.optString(i));
        }
        return out;
    }

    private static String luaStr(String s) {
        return s == null ? "" : s.replace("\\", "\\\\").replace("'", "\\'");
    }

    /**
     * The scan script. Every source is isolated in its own pcall so one bad
     * registry cannot end the run, and the caps keep the whole thing short
     * enough to run on the engine's script thread without stalling a frame:
     * 15 count getters x 1000 records, 12 record tables x 500 keys, 3000
     * entries in total.
     *
     * The script source ends as an expression - javaCallLuaEvent appends
     * "();" to it.
     */
    static String script(String p1, String p2) {
        return "(function()"
                + " local p1='" + luaStr(p1) + "'"
                + " local p2='" + luaStr(p2) + "'"
                // JSON encoder: our payloads are strings/numbers/plain tables,
                // so only these three cases matter. Escaping runs per string,
                // control characters as \\u00xx, everything else raw UTF-8.
                + " local function enc(v)"
                + " if v==nil then return 'null' end"
                + " local t=type(v)"
                + " if t=='boolean' then return v and 'true' or 'false' end"
                + " if t=='number' then"
                + " if v~=v or v==math.huge or v==-math.huge then return '0' end"
                + " if v==math.floor(v) then return string.format('%d',v) end"
                + " return string.format('%.14g',v)"
                + " end"
                + " if t=='string' then"
                + " local s=v"
                + " s=string.gsub(s,'\\\\','\\\\\\\\')"
                + " s=string.gsub(s,'\"','\\\\\"')"
                + " s=string.gsub(s,'[%z\\1-\\31]',function(c)"
                + " return string.format('\\\\u%04x',string.byte(c)) end)"
                + " return '\"'..s..'\"'"
                + " end"
                + " if t=='table' then"
                + " local arr=true local n=0"
                + " for k,_ in pairs(v) do"
                + " n=n+1"
                + " if type(k)~='number' then arr=false end"
                + " end"
                + " if n>0 then"
                + " for i=1,n do if v[i]==nil then arr=false break end end"
                + " else arr=false end"
                + " local b={}"
                + " if arr then"
                + " for i=1,n do b[#b+1]=enc(v[i]) end"
                + " return '['..table.concat(b,',')..']'"
                + " end"
                + " local first=true"
                + " for k,val in pairs(v) do"
                + " local ks=type(k)=='string' and k or tostring(k)"
                + " if first then first=false else b[#b+1]=',' end"
                + " b[#b+1]=enc(ks)..':'..enc(val)"
                + " end"
                + " return '{'..table.concat(b,'')..'}'"
                + " end"
                + " return 'null'"
                + " end"
                + " local function w(j)"
                + " local function one(p)"
                + " local ok,fh=pcall(function() return io.open(p,'w') end)"
                + " if not ok or fh==nil then return end"
                + " pcall(function() fh:write(j) fh:close() end)"
                + " end"
                + " one(p1)"
                + " if p2~=p1 then one(p2) end"
                + " end"
                + " local ok,err=pcall(function()"
                + " local E={} local G={} local M={} local N={}"
                + " local cap=3000 local gcap=400 local mcap=500"
                // INV marks a global worth inventorying (managers included,
                // they are where the getters live); HARV marks a name that is
                // a record container and can be walked directly.
                + " local INV={'item','plugin','buff','effect','sound','skin',"
                + "'role','avatar','block','recipe','craft','projectile','summon',"
                + "'pet','mob','monster','tool','food','npc','define','def',"
                + "'mgr','manager','script'}"
                + " local HARV={'item','plugin','buff','effect','sound','skin',"
                + "'role','avatar','block','recipe','craft','projectile','summon',"
                + "'pet','mob','monster','tool','food','npc'}"
                // names that mark a getter as mutating: never call those
                + " local BAD={'remove','set','add','create','delete','clear',"
                + "'kill','spawn','drop','buy','equip','apply','send','write',"
                + "'reset','refresh','load','init','destroy','release','save',"
                + "'open','close','start','stop','play','update','change',"
                + "'switch','toggle','damage','heal','random'}"
                + " local function has(s,list)"
                + " local t=string.lower(tostring(s))"
                + " for i=1,#list do"
                + " if string.find(t,list[i],1,true) then return true end"
                + " end"
                + " return false"
                + " end"
                + " local function catOf(x)"
                + " local t=string.lower(tostring(x))"
                + " for i=1,#HARV do"
                + " if string.find(t,HARV[i],1,true) then return HARV[i] end"
                + " end"
                + " return 'other'"
                + " end"
                + " local function add(v,cat,src,idx)"
                + " if #E>=cap or type(v)~='table' then return end"
                + " local id=nil local name=nil"
                + " local okp=pcall(function()"
                + " for kk,vv in pairs(v) do"
                + " if type(kk)=='string' then"
                + " local t=string.lower(kk)"
                + " local isid=(t=='id' or t=='fid' or t=='key' or t=='code'"
                + " or t=='uid' or string.sub(t,-2)=='id')"
                + " if id==nil and isid"
                + " and (type(vv)=='number' or type(vv)=='string') then"
                + " id=vv"
                + " end"
                + " if name==nil and type(vv)=='string' and vv~='' and"
                + " (t=='name' or t=='cn' or t=='zh' or t=='en' or t=='title'"
                + " or t=='showname' or t=='desc' or t=='text') then"
                + " name=vv"
                + " end"
                + " if name==nil and type(vv)=='table' and"
                + " (t=='name' or t=='string' or t=='str' or t=='text') then"
                + " for sk,sv in pairs(vv) do"
                + " if type(sv)=='string' and sv~='' then name=sv break end"
                + " end"
                + " end"
                + " end"
                + " end"
                + " end)"
                + " if not okp then return end"
                + " if id==nil then id=idx end"
                + " if id==nil then return end"
                + " E[#E+1]={i=tostring(id),n=name or '',c=cat,s=src}"
                + " end"
                // 1. inventory: every global whose name smells of content or
                //    of a manager, with its type - this is the map of what
                //    the VM exposes, and it is what a failed scan still
                //    hands back for the next round.
                + " local gcount=0"
                + " for k,v in pairs(_G) do"
                + " gcount=gcount+1"
                + " if type(k)=='string' and #G<gcap and has(k,INV) then"
                + " G[#G+1]={n=k,t=type(v)}"
                + " end"
                + " end"
                + " N[#N+1]='globals='..tostring(gcount)"
                // 2. methods: a userdata's method table is not enumerable
                //    through pairs() itself, but its metatable's __index is -
                //    that turns "guess the API" into a list.
                + " local owners={'DefMgr','ClientCurGame','GameSettingsMgr',"
                + "'GameSettings'}"
                + " for i=1,#G do owners[#owners+1]=G[i].n end"
                + " local seen={}"
                + " for i=1,#owners do"
                + " local o=owners[i]"
                + " if o~=nil and not seen[o] and #M<mcap then"
                + " seen[o]=1"
                + " local g=_G[o]"
                + " if g~=nil then"
                + " local idx=nil"
                + " local okm,mt=pcall(function() return getmetatable(g) end)"
                + " if okm and type(mt)=='table' and type(mt.__index)=='table'"
                + " then idx=mt.__index end"
                + " if idx==nil then"
                + " local okd,mt2=pcall(function()"
                + " return debug.getmetatable(g) end)"
                + " if okd and type(mt2)=='table'"
                + " and type(mt2.__index)=='table' then idx=mt2.__index end"
                + " end"
                + " if idx~=nil then"
                + " pcall(function()"
                + " for mn,_ in pairs(idx) do"
                + " if type(mn)=='string' and #M<mcap then"
                + " M[#M+1]={o=o,n=mn}"
                + " end"
                + " end"
                + " end)"
                + " elseif type(g)=='table' then"
                + " pcall(function()"
                + " for mn,mv in pairs(g) do"
                + " if type(mn)=='string' and type(mv)=='function'"
                + " and #M<mcap then M[#M+1]={o=o,n=mn} end"
                + " end"
                + " end)"
                + " end"
                + " end"
                + " end"
                + " end"
                // 3. the engine names getters get<X>Num() / get<X>Def(i) -
                //    proved by DefMgr:getHotkeyNum/getHotkeyDef. Only names
                //    without a mutating word are called, and each job runs in
                //    its own pcall so one bad registry cannot end the scan.
                + " local jobs={}"
                + " for i=1,#M do"
                + " local n=M[i].n"
                + " local base=string.match(n,'^get(%a+)Num$')"
                + " or string.match(n,'^get(%a+)Count$')"
                + " if base~=nil and not has(n,BAD) then"
                + " jobs[#jobs+1]={o=M[i].o,base=base,num=n}"
                + " end"
                + " end"
                // the 15-job budget is small and pairs() order is arbitrary:
                // a settings manager can hold a dozen getXNum() getters of its
                // own, so content registries have to be reached first
                + " table.sort(jobs,function(a,b)"
                + " local pa=has(a.base,HARV) and 0 or 1"
                + " local pb=has(b.base,HARV) and 0 or 1"
                + " if pa~=pb then return pa<pb end"
                + " return a.base<b.base"
                + " end)"
                + " N[#N+1]='jobs='..tostring(#jobs)"
                + " local tried=0"
                + " for i=1,#jobs do"
                + " if #E>=cap or tried>=15 then break end"
                + " local j=jobs[i]"
                + " local obj=_G[j.o]"
                + " if obj~=nil then"
                + " tried=tried+1"
                + " pcall(function()"
                + " local cnt=obj[j.num](obj)"
                + " if type(cnt)~='number' or cnt<1 or cnt>30000 then return end"
                + " local fnames={'get'..j.base..'Def','get'..j.base,"
                + "'get'..j.base..'Info','get'..j.base..'ByIndex',"
                + "'get'..j.base..'At','Get'..j.base..'Def',"
                + "'Get'..j.base..'ByIndex'}"
                + " local fn=nil local fname=''"
                + " for a=1,#fnames do"
                + " local r=obj[fnames[a]]"
                + " if type(r)=='function' then fn=r fname=fnames[a] break end"
                + " end"
                + " if fn==nil then"
                + " N[#N+1]=j.o..'.'..j.base..'>nofn'"
                + " return"
                + " end"
                + " local cat=catOf(j.base)"
                + " local src=j.o..'.'..fname"
                + " local lim=cnt"
                + " if lim>1000 then lim=1000 end"
                + " local got=0"
                + " for k=1,lim do"
                + " local d=fn(obj,k)"
                + " local before=#E"
                + " add(d,cat,src,k)"
                + " if #E>before then got=got+1 end"
                + " if #E>=cap then break end"
                + " end"
                + " N[#N+1]=j.o..'.'..j.base..'='..tostring(cnt)..'>'..tostring(got)"
                + " end)"
                + " end"
                + " end"
                // 4. record tables sitting in _G under a content name: the
                //    key becomes the id when the record carries none.
                + " local hvt=0"
                + " for i=1,#G do"
                + " if #E>=cap or hvt>=12 then break end"
                + " local nm=G[i].n"
                + " if G[i].t=='table' and has(nm,HARV) then"
                + " hvt=hvt+1"
                + " local t=_G[nm]"
                + " local cat=catOf(nm)"
                + " pcall(function()"
                + " local c=0"
                + " for k,v in pairs(t) do"
                + " c=c+1"
                + " if c>500 then break end"
                + " if type(v)=='table' then"
                + " add(v,cat,nm,k)"
                + " elseif type(v)=='string' and v~='' and"
                + " (type(k)=='number' or (type(k)=='string' and #k<48)) then"
                + " if #E<cap then"
                + " E[#E+1]={i=tostring(k),n=v,c=cat,s=nm}"
                + " end"
                + " end"
                + " if #E>=cap then break end"
                + " end"
                + " end)"
                + " end"
                + " end"
                // 5. a few names harvested from libGameApp.so that read as
                //    id maps rather than count/getter pairs
                + " local FNS={'GetSoundStrDefCsvIdMap',"
                + "'GetParticlesStrDefCsvIdMap'}"
                + " for i=1,#FNS do"
                + " local f=_G[FNS[i]]"
                + " if type(f)=='function' and #E<cap then"
                + " pcall(function()"
                + " local r=f()"
                + " if type(r)~='table' then return end"
                + " local cat=catOf(FNS[i])"
                + " local c=0"
                + " for k,v in pairs(r) do"
                + " c=c+1"
                + " if c>500 then break end"
                + " if type(v)=='string' and v~='' and #E<cap then"
                + " E[#E+1]={i=tostring(k),n=v,c=cat,s=FNS[i]}"
                + " elseif type(v)=='table' then"
                + " add(v,cat,FNS[i],k)"
                + " end"
                + " if #E>=cap then break end"
                + " end"
                + " N[#N+1]=FNS[i]..'=map:'..tostring(c)"
                + " end)"
                + " end"
                + " end"
                // 6. in-map state: plugin items only exist while a map is
                //    loaded, and the browser says so instead of showing an
                //    empty plugin row as if nothing were wrong.
                + " local inmap=false"
                + " pcall(function()"
                + " local ci=_G.ClientCurGame"
                + " if ci~=nil then"
                + " local r=ci:isInGame()"
                + " inmap=(r==true or r==1)"
                + " end"
                + " end)"
                + " N[#N+1]='entries='..tostring(#E)"
                + " N[#N+1]='methods='..tostring(#M)"
                + " w('{\"inmap\":'..(inmap and '1' or '0')"
                + "..',\"n\":'..enc(N)"
                + "..',\"g\":'..enc(G)"
                + "..',\"m\":'..enc(M)"
                + "..',\"e\":'..enc(E)..'}')"
                + " end)"
                + " if not ok then"
                + " w('{\"inmap\":0,\"n\":'..enc({'err:'..tostring(err)})"
                + "..',\"g\":[],\"m\":[],\"e\":[]}')"
                + " end"
                + " end)";
    }
}
