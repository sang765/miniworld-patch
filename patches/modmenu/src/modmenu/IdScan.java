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
 * The engine drains that channel from its own game loop - nativeCallLuaString
 * queues the source for LuaInterfaceProxy::callLuaString to pump - and the
 * menu window pauses the game behind it (that pause is what keeps MIUI from
 * killing it). A script sent while the menu is up therefore waits for a loop
 * that is not running: it never lands, and the panel just times out. So
 * request() only records the wish; menuClosed(), called when the window goes
 * away and the game resumes right after, is where the scan actually ships.
 * The poller outlives the activity, and the panel reads the cached result on
 * the next open.
 *
 * The script wraps every source in pcall, which contains a wrong guess as
 * a Lua error - but no pcall can contain a native fault, so it calls only
 * what has already survived a scan on device: the getXNum()/getXDef()
 * getters the methods dump finds, the two id-map readers, isInGame.
 * Probing every *Mgr global by name and sweeping Get*Count() pairs read
 * sound and segfaulted the game once, so they stay out until they can be
 * tried one call at a time. Each step stamps its number into the marker
 * file and the poller says it out loud: a native fault, the one failure
 * nothing here can catch, still leaves the step it hit in logcat.
 */
public final class IdScan {
    private static final String TAG = "MWIds";
    private static final String FILE = "mw_ids.json";
    private static final long TIMEOUT_MS = 15000;
    private static final long POLL_MS = 250;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** A scan is wanted but not landed yet: request() sets it, a clean
     *  result clears it, a failed one keeps it so the next menu close
     *  retries on its own. Volatile: written from the browser and the poll
     *  thread, read on the menu-close path. */
    private static volatile boolean wantScan;
    private static volatile boolean polling;
    /** The step the running script last stamped into its marker file: the
     *  poller logs every new one, so a native death - which no pcall can
     *  catch - still names the step it hit. */
    private static volatile int progress = -1;
    /** A dispatch went out at least once, so a result file can only be a
     *  late landing of our own script, never a leftover of an old run. */
    private static volatile boolean sent;
    private static volatile Result cached;
    /** The browser, main thread only; ModMenuActivity clears it in onDestroy. */
    private static Listener listener;

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

    /** Records that a scan is wanted; it ships on the next menu close. */
    public static void request() {
        wantScan = true;
    }

    public static void setListener(Listener l) {
        listener = l;
    }

    public static boolean scanning() {
        return polling;
    }

    /**
     * The last scan. When the last attempt failed the result file is read
     * once more directly: the script may have landed after the poller gave
     * up, and that output is as fresh as any other.
     */
    public static Result current(Context ctx) {
        Result c = cached;
        if (sent && (c == null || c.error != null)) {
            String[] p = paths(ctx);
            if (p != null) {
                for (int i = 0; i < p.length; i++) {
                    String body = read(p[i]);
                    if (body != null && body.length() > 2) {
                        Result r = parse(body);
                        if (r != null && r.error == null) {
                            cached = r;
                            wantScan = false;
                            return r;
                        }
                    }
                }
            }
        }
        return c;
    }

    /**
     * Called when the menu window goes away - the moment the game resumes
     * and its script loop comes back, so this is where a wanted scan is
     * dispatched. Everything is guarded: this runs on the game's main
     * thread in the activity's onPause, where an escaping exception would
     * reach the game's uncaught handler and take the process down.
     */
    public static void menuClosed(Context ctx) {
        if (!wantScan || polling) {
            return;
        }
        final String[] p = paths(ctx);
        if (p == null) {
            Log.d(TAG, "no writable files dir");
            cached = Result.fail("nopath");
            return;
        }
        // delete, send and start the poller inside the guard: this runs on
        // the game's main thread in onPause, where an escaping exception
        // would reach the game's uncaught handler
        try {
            for (int i = 0; i < p.length; i++) {
                new File(p[i]).delete();
            }
            polling = true;
            progress = -1;
            CommonNatives.javaCallLuaEvent(script(p[0], p[1]), new Object[0]);
            sent = true;
            new Thread(new Runnable() {
                @Override
                public void run() {
                    final Result r = awaitGuarded(p);
                    cached = r;
                    polling = false;
                    if (r.error == null) {
                        wantScan = false;
                    }
                    Log.d(TAG, "scan done: entries=" + r.entries.size()
                            + " error=" + r.error);
                    MAIN.post(new Runnable() {
                        @Override
                        public void run() {
                            Listener l = listener;
                            if (l != null) {
                                l.onDone(r);
                            }
                        }
                    });
                }
            }, "mw-idscan").start();
            Log.d(TAG, "scan shipped at menu close");
        } catch (RuntimeException e) {
            polling = false;
            Log.d(TAG, "dispatch failed: " + e);
            cached = Result.fail("send: " + e);
            return; // wantScan stays set: the next menu close retries
        }
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

    private static Result awaitGuarded(String[] paths) {
        try {
            return await(paths);
        } catch (RuntimeException e) {
            // a stray throw here would leave polling stuck and silence
            // every later scan, so it becomes the reported result instead
            return Result.fail("poll: " + e);
        }
    }

    private static Result await(String[] paths) {
        long deadline = System.currentTimeMillis() + TIMEOUT_MS;
        boolean ran = false;
        while (System.currentTimeMillis() < deadline) {
            for (int i = 0; i < paths.length; i++) {
                String body = read(paths[i]);
                if (body != null && body.length() > 2) {
                    ran = true; // something was written: the script ran
                    noteProgress(body);
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
        // a marker without a payload means the script started and never
        // finished; nothing at all means the game never picked it up
        return Result.fail(ran
                ? "timeout(ran" + (progress >= 0 ? ",s" + progress : "") + ")"
                : "timeout");
    }

    /**
     * While the scan runs, the file at the result path only ever carries the
     * marker, and each step restamps it with its number first. Saying that
     * number out loud is the one thing that survives a native fault: the
     * process dies, no Java code of ours runs again, and the last line
     * logged is all that is left of where the scan stopped.
     */
    private static void noteProgress(String body) {
        if (!body.contains("\"started\"")) {
            return; // the final payload, not the marker
        }
        try {
            int s = new JSONObject(body).optInt("s", -1);
            if (s >= 0 && s != progress) {
                progress = s;
                Log.d(TAG, "scan step " + s);
            }
        } catch (Exception ignored) {
            // a half-written marker reads as unparsable; the next poll
            // sees the completed one
        }
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
            // the script writes this marker before anything else: it is what
            // tells a run that started from one that never did
            if (o.optInt("started", 0) != 0) {
                return null;
            }
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
     * 15 count getters x 1000 records, 12 record tables x 1000 keys, 10000
     * entries in total - the id constants the VM defines (BLOCK_STONE,
     * ITEM_PEARL, ...) are their bulk. Before each step the script restamps
     * the marker with that step's number, so a native fault - the one
     * failure no pcall contains - leaves the step it hit behind.
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
                // marker: written before the scan, overwritten by its result
                + " w('{\"started\":1,\"s\":0}')"
                + " local ok,err=pcall(function()"
                + " local E={} local G={} local M={} local N={}"
                + " local seen={}"
                + " local cap=10000 local gcap=600 local mcap=500"
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
                // Content matching runs on words, not on raw substrings:
                // "taskinfo" contains "skin" and would otherwise read as a
                // skin table. camelCase and underscores are word breaks,
                // and a word may carry a suffix (blocks -> block).
                + " local function words(s)"
                + " local t=tostring(s)"
                + " t=string.gsub(t,'(%l)(%u)','%1 %2')"
                + " t=string.gsub(t,'_',' ')"
                + " local o={}"
                + " for w in string.gmatch(t,'%a+') do"
                + " o[#o+1]=string.lower(w)"
                + " end"
                + " return o"
                + " end"
                + " local function hit(w,c)"
                + " if w==c then return true end"
                + " if string.sub(w,1,#c)==c then return true end"
                + " return #w>#c and string.sub(w,-#c)==c"
                + " end"
                + " local function hasWord(s,list)"
                + " local ws=words(s)"
                + " for i=1,#list do"
                + " for j=1,#ws do"
                + " if hit(ws[j],list[i]) then return true end"
                + " end"
                + " end"
                + " return false"
                + " end"
                // raw substring matching stays for BAD, where over-matching
                // only ever skips more getters
                + " local function has(s,list)"
                + " local t=string.lower(tostring(s))"
                + " for i=1,#list do"
                + " if string.find(t,list[i],1,true) then return true end"
                + " end"
                + " return false"
                + " end"
                + " local function catOf(x)"
                + " local ws=words(x)"
                + " for i=1,#HARV do"
                + " for j=1,#ws do"
                + " if hit(ws[j],HARV[i]) then return HARV[i] end"
                + " end"
                + " end"
                + " return 'other'"
                + " end"
                // one append point: dedupes by category+id and drops the
                // tolua junk keys (.get / tolua_ubox) a record table carries
                + " local function push(id,name,cat,src)"
                + " if #E>=cap then return false end"
                + " local sid=tostring(id)"
                + " if string.sub(sid,1,1)=='.' or string.sub(sid,1,2)=='__'"
                + " or string.sub(sid,1,6)=='tolua_' then return false end"
                + " local key=cat..'#'..sid"
                + " if seen[key] then return false end"
                + " seen[key]=1"
                + " E[#E+1]={i=sid,n=name or '',c=cat,s=src}"
                + " return true"
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
                + " push(id,name,cat,src)"
                + " end"
                // 1. inventory: every global whose name smells of content or
                //    of a manager, with its type - this is the map of what
                //    the VM exposes, and it is what a failed scan still
                //    hands back for the next round.
                + " w('{\"started\":1,\"s\":1}')"
                + " local gcount=0"
                + " for k,v in pairs(_G) do"
                + " gcount=gcount+1"
                + " if type(k)=='string' and #G<gcap and hasWord(k,INV) then"
                + " G[#G+1]={n=k,t=type(v)}"
                + " end"
                + " end"
                + " N[#N+1]='globals='..tostring(gcount)"
                // 2. methods: a userdata's method table is not enumerable
                //    through pairs() itself, but its metatable's __index is -
                //    that turns "guess the API" into a list.
                + " w('{\"started\":1,\"s\":2}')"
                + " local owners={'DefMgr','ClientCurGame','GameSettingsMgr',"
                + "'GameSettings'}"
                + " for i=1,#G do owners[#owners+1]=G[i].n end"
                + " local oseen={}"
                + " for i=1,#owners do"
                + " local o=owners[i]"
                + " if o~=nil and not oseen[o] and #M<mcap then"
                + " oseen[o]=1"
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
                + " w('{\"started\":1,\"s\":3}')"
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
                + " local pa=hasWord(a.base,HARV) and 0 or 1"
                + " local pb=hasWord(b.base,HARV) and 0 or 1"
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
                + " w('{\"started\":1,\"s\":4}')"
                + " local hvt=0"
                + " for i=1,#G do"
                + " if #E>=cap or hvt>=12 then break end"
                + " local nm=G[i].n"
                + " if G[i].t=='table' and hasWord(nm,HARV) then"
                + " hvt=hvt+1"
                + " local t=_G[nm]"
                + " local cat=catOf(nm)"
                + " pcall(function()"
                + " local c=0"
                + " for k,v in pairs(t) do"
                + " c=c+1"
                + " if c>1000 then break end"
                + " if type(v)=='table' then"
                + " add(v,cat,nm,k)"
                + " elseif type(v)=='string' and v~='' and"
                + " (type(k)=='number' or (type(k)=='string' and #k<48)) then"
                + " push(k,v,cat,nm)"
                + " end"
                + " if #E>=cap then break end"
                + " end"
                + " end)"
                + " end"
                + " end"
                // 5. a few names harvested from libGameApp.so that read as
                //    id maps rather than count/getter pairs
                + " w('{\"started\":1,\"s\":5}')"
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
                + " if type(v)=='string' and v~='' then"
                + " push(k,v,cat,FNS[i])"
                + " elseif type(v)=='table' then"
                + " add(v,cat,FNS[i],k)"
                + " end"
                + " if #E>=cap then break end"
                + " end"
                + " N[#N+1]=FNS[i]..'=map:'..tostring(c)"
                + " end)"
                + " end"
                + " end"
                // 6. id constants: the VM defines thousands of NUMBER
                //    globals shaped BLOCK_STONE / ITEM_PEARL - the name is
                //    the label, the value is the id. Runs last so a record
                //    that carries a real name keeps any id it shares.
                + " w('{\"started\":1,\"s\":6}')"
                + " local FAM={item='item',block='block',mob='mob',"
                + "monster='monster',buff='buff',buffattrt='buff',"
                + "effect='effect',status_effect='effect',seq='sound',"
                + "sound='sound',gsound='sound',sfx='sound',bgm='sound',"
                + "skin='skin',role='role',avatar='avatar',craft='craft',"
                + "recipe='recipe',projectile='projectile',summon='summon',"
                + "pet='pet',food='food',npc='npc',tool='tool',"
                + "ugctooltype='tool',task='task',achievement='achievement',"
                + "achv='achievement',equip='equip',armor='armor',"
                + "weapon='weapon',bag='bag',backpack='bag',tower='tower',"
                + "horse='horse',mount='mount',emoji='emoji',title='title',"
                + "festival='festival',activity='activity',award='award',"
                + "shop='shop',trade='trade',mall='mall',home='home',"
                + "furniture='furniture',crop='crop',seed='seed'}"
                + " local cn=0"
                + " for k,v in pairs(_G) do"
                + " if #E>=cap then break end"
                + " if type(k)=='string' and type(v)=='number' and v>=0"
                + " and v<2147483648 and v==math.floor(v)"
                + " and string.match(k,'^[A-Z][A-Z0-9_]*$') then"
                + " local a,b=string.match(k,'^([A-Z]+)_([A-Z0-9]+)')"
                + " if a then"
                + " local cat=FAM[string.lower(a)]"
                + " if cat==nil and b then"
                + " cat=FAM[string.lower(a..'_'..b)]"
                + " end"
                + " if cat~=nil then"
                + " if push(v,k,cat,'const') then cn=cn+1 end"
                + " end"
                + " end"
                + " end"
                + " end"
                + " N[#N+1]='constants='..tostring(cn)"
                // 7. in-map state: plugin items only exist while a map is
                //    loaded, and the browser says so instead of showing an
                //    empty plugin row as if nothing were wrong.
                + " w('{\"started\":1,\"s\":7}')"
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
                // the JSON above is the answer Java reads, this one the
                // answer logcat gets - CallLuaString swallows the failure
                // in Java, but the engine still logs it
                + " error('MWID|'..tostring(err),0)"
                + " end"
                + " end)";
    }
}
