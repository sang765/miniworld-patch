package modmenu;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;

import org.appplay.lib.CommonNatives;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;

/**
 * One-shot give of any item to the local player or to another player by UID,
 * gated behind {@link ModMenu#isUnsafe()} by the menu.
 *
 * There is no Java entry into the backpack: every path lives in libGameApp.so
 * behind the CurMainPlayer / WorldMgr / ClientBackpack bindings, so delivery
 * mirrors GameMode - javaCallLuaEvent queues a pcall-wrapped script and the
 * script answers through a JSON file - but a give is a network round trip,
 * not a local flip: the answer only arrives once the host's backpack sync
 * comes back. The act script therefore reports a pending state plus the bag
 * count it needs to reach, and this class re-dispatches a check script until
 * the count lands or the budget runs out. Reporting before that would claim
 * an item the player may never receive.
 *
 * Which primitive the act script picks is decided by a capability probe on
 * the target object itself, because the same Lua call lands in different C++
 * code depending on the control the engine handed us:
 *
 *   CurMainPlayer:setItem        builds PB_BackPackSetItemCH and sends it
 *                                when our session says we are a room client,
 *                                applies it locally when we are the host -
 *                                real either way.
 *   target:gainItems(want)       on a host makes the bag hold at least want,
 *                                on a room client returns -1 and does
 *                                nothing. Asking for what the bag already
 *                                holds cannot add anything, so the return
 *                                value is a free capability probe.
 *   target:gainItemsUserdata     carries the target's own uin into
 *                                PB_GainItemsUserDatastrToBackPackCH, so a
 *                                client can name another player as the
 *                                recipient.
 *
 * When the object turns out to be local-only and we are not the host, there
 * is no client-reachable message that carries an attacker-chosen recipient,
 * and the script says so instead of writing to the mirror - that would be a
 * ghost item, gone the moment the host next corrects our bag.
 */
public final class GiveItem {
    private static final String TAG = "MWGiveItem";
    private static final String FILE = "mw_give.json";
    private static final long TIMEOUT_MS = 12000;
    private static final long POLL_MS = 250;
    /** How often the pending give is re-checked, and for how long. The
     *  host's answer is a round trip, so a single read proves nothing. */
    private static final int CHECKS = 12;
    private static final long CHECK_MS = 450;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** A give that has not answered yet. It survives a timeout on purpose:
     *  the act script may still be queued for a loop that is not pumping,
     *  and shipping again would give the item twice. */
    private static volatile boolean polling;

    private GiveItem() {}

    /** Deliver the result on the main thread - the menu uses it to
     *  re-enable the button. Toasts are posted from here, so the result is
     *  seen even if the sheet is already gone. */
    public static void request(Context ctx, final int item, final int count,
            final long uid, final Runnable done) {
        final String[] p = paths(ctx);
        if (p == null) {
            Log.d(TAG, "no writable files dir");
            toast(ctx, "fail");
            done.run();
            return;
        }
        // one give at a time: the thread below owns `done`, so returning
        // here leaves the button down until that one reports
        if (polling) {
            return;
        }
        final Context app = ctx.getApplicationContext();
        // delete, send and the poller thread all sit inside the guard: this
        // runs on the main thread where an escaping exception would reach
        // the game's uncaught handler
        try {
            for (int i = 0; i < p.length; i++) {
                new File(p[i]).delete();
            }
            polling = true;
            CommonNatives.javaCallLuaEvent(
                    act(p[0], p[1], item, count, uid), new Object[0]);
            new Thread(new Runnable() {
                @Override
                public void run() {
                    String state;
                    try {
                        state = awaitGuarded(p, TIMEOUT_MS);
                        if ("wait".equals(state)) {
                            state = verify(p, item, uid);
                        }
                    } catch (RuntimeException e) {
                        // never leave the flag up: a stuck `polling` would
                        // silently drop every later give
                        Log.d(TAG, "poll failed: " + e);
                        state = "fail";
                    }
                    polling = false;
                    final String out = "timeout".equals(state) ? "fail" : state;
                    Log.d(TAG, "give done: " + out);
                    MAIN.post(new Runnable() {
                        @Override
                        public void run() {
                            toast(app, out);
                            done.run();
                        }
                    });
                }
            }, "mw-giveitem").start();
            Log.d(TAG, "give shipped");
        } catch (RuntimeException e) {
            polling = false;
            Log.d(TAG, "dispatch failed: " + e);
            toast(ctx, "fail");
            done.run();
        }
    }

    /**
     * Re-dispatch until the bag reaches what the act script promised. The
     * pending file is dropped first so a stale answer cannot be mistaken for
     * the new one, and a check that never lands counts as "not yet".
     */
    private static String verify(final String[] p, final int item,
            final long uid) {
        final long want = want(p);
        if (want <= 0) {
            return "fail";
        }
        for (int i = 0; i < CHECKS; i++) {
            try {
                Thread.sleep(CHECK_MS);
            } catch (InterruptedException e) {
                return "fail";
            }
            for (int k = 0; k < p.length; k++) {
                new File(p[k]).delete();
            }
            // the act script shipped on the caller's thread; this one is the
            // poller, so hand the re-dispatch back to the main one
            MAIN.post(new Runnable() {
                @Override
                public void run() {
                    try {
                        CommonNatives.javaCallLuaEvent(
                                check(p[0], p[1], item, want, uid),
                                new Object[0]);
                    } catch (RuntimeException e) {
                        Log.d(TAG, "check dispatch failed: " + e);
                    }
                }
            });
            String state = awaitGuarded(p, CHECK_MS * 4);
            if (!"wait".equals(state) && !"timeout".equals(state)) {
                return state;
            }
        }
        return "fail";
    }

    private static void toast(Context c, String state) {
        try {
            Toast.makeText(c, message(c, state), Toast.LENGTH_SHORT).show();
        } catch (RuntimeException e) {
            Log.d(TAG, "toast failed: " + e);
        }
    }

    private static String message(Context c, String state) {
        if ("ok".equals(state)) {
            return I18n.t(c, "mod_give_ok");
        }
        if ("nomap".equals(state)) {
            return I18n.t(c, "mod_give_nomap");
        }
        if ("notarget".equals(state)) {
            return I18n.t(c, "mod_give_notarget");
        }
        if ("noclient".equals(state)) {
            return I18n.t(c, "mod_give_noclient");
        }
        if ("full".equals(state)) {
            return I18n.t(c, "mod_give_full");
        }
        if ("bad".equals(state)) {
            return I18n.t(c, "mod_give_bad");
        }
        return I18n.t(c, "mod_give_fail");
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

    /** "timeout" on any failure: an unreadable answer is indistinguishable
     *  from no answer, and only the wait state may keep the poll alive. */
    private static String awaitGuarded(String[] paths, long budgetMs) {
        try {
            return await(paths, budgetMs);
        } catch (RuntimeException e) {
            return "timeout";
        }
    }

    private static String await(String[] paths, long budgetMs) {
        long deadline = System.currentTimeMillis() + budgetMs;
        while (System.currentTimeMillis() < deadline) {
            for (int i = 0; i < paths.length; i++) {
                String state = state(paths[i]);
                if (state != null) {
                    return state;
                }
            }
            try {
                Thread.sleep(POLL_MS);
            } catch (InterruptedException e) {
                break;
            }
        }
        return "timeout";
    }

    /** The result the script wrote, or null while it is still running - the
     *  {"started":1} marker counts as running, anything unparsable too (a
     *  half-written file). */
    private static String state(String path) {
        JSONObject o = obj(path);
        if (o == null || o.optInt("started", 0) != 0) {
            return null;
        }
        String r = o.optString("r", null);
        return r == null || r.length() == 0 ? null : r;
    }

    /** The bag count the act script promised to reach, -1 when unreadable. */
    private static long want(String[] paths) {
        for (int i = 0; i < paths.length; i++) {
            JSONObject o = obj(paths[i]);
            if (o != null && o.optLong("want", -1) > 0) {
                return o.optLong("want", -1);
            }
        }
        return -1;
    }

    private static JSONObject obj(String path) {
        String body = read(path);
        if (body == null || body.length() <= 2) {
            return null;
        }
        try {
            return new JSONObject(body);
        } catch (Exception e) {
            return null;
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

    private static String luaStr(String s) {
        return s == null ? "" : s.replace("\\", "\\\\").replace("'", "\\'");
    }

    /** Lua numbers are doubles: a uin stays exact well past any real one. */
    private static String luaNum(long n) {
        return Long.toString(n);
    }

    /**
     * The act script. Every engine call sits in its own pcall: a wrong guess
     * becomes a Lua error the rest of the script survives, never a crash -
     * and only bindings the game itself calls from script are used, because
     * no pcall contains a native fault.
     *
     * It never trusts a primitive: the bag is counted before and the same
     * count is what the check script looks for afterwards, so a call that
     * silently does nothing ends as a reported failure instead of a lie.
     *
     * The script source ends as an expression - javaCallLuaEvent appends
     * "();" to it.
     */
    static String act(String p1, String p2, int item, int count, long uid) {
        return "(function()"
                + " local p1='" + luaStr(p1) + "'"
                + " local p2='" + luaStr(p2) + "'"
                + " local ITEM=" + item
                + " local N=" + count
                + " local UID=" + luaNum(uid)
                + " local function w(j)"
                + " local function one(p)"
                + " local ok,fh=pcall(function() return io.open(p,'w') end)"
                + " if not ok or fh==nil then return end"
                + " pcall(function() fh:write(j) fh:close() end)"
                + " end"
                + " one(p1)"
                + " if p2~=p1 then one(p2) end"
                + " end"
                // marker: written before the give, overwritten by its result
                + " w('{\"started\":1}')"
                + " local ok,err=pcall(function()"
                // outside a map there is no bag to put it in, and the menu
                // is up over the lobby: say so instead of failing late
                + " local inmap=false"
                + " pcall(function()"
                + " local r=ClientCurGame:isInGame()"
                + " inmap=(r==true or r==1)"
                + " end)"
                + " if not inmap then w('{\"r\":\"nomap\"}') return end"
                + " if ITEM<=0 or N<=0 then w('{\"r\":\"bad\"}') return end"
                // --- to ourselves -----------------------------------
                + " if UID==0 then"
                + " local bag=nil pcall(function() bag=ClientBackpack end)"
                + " local okb,b0=pcall(function()"
                + " return bag:getItemCountInNormalPack(ITEM) end)"
                + " if not bag or type(b0)~='number' then"
                + " w('{\"r\":\"fail\",\"why\":\"nobag\"}') return end"
                + " b0=math.floor(b0)"
                + " local idx=nil"
                + " pcall(function() idx=bag:getEmptyBagIndex() end)"
                + " if type(idx)~='number' then"
                + " w('{\"r\":\"fail\",\"why\":\"noindex\"}') return end"
                + " idx=math.floor(idx)"
                + " if idx<0 or idx>1000 then"
                + " w('{\"r\":\"full\",\"b\":'..b0..'}') return end"
                // setItem builds PB_BackPackSetItemCH: sent as a room client,
                // applied by the host - real either way
                + " local sent=false"
                + " pcall(function()"
                + " CurMainPlayer:setItem(ITEM,idx,N) sent=true end)"
                + " if not sent then"
                + " w('{\"r\":\"fail\",\"why\":\"nosend\"}') return end"
                + " w('{\"r\":\"wait\",\"want\":'..(b0+N)..',\"u\":0}')"
                + " return end"
                // --- to another player ------------------------------
                + " local target=nil"
                + " pcall(function() target=WorldMgr:getPlayerByUin(UID) end)"
                + " if target==nil then"
                + " w('{\"r\":\"notarget\"}') return end"
                + " local bag=nil"
                + " pcall(function() bag=target:getBackPack() end)"
                + " local okb,b0=pcall(function()"
                + " return bag:getItemCountInNormalPack(ITEM) end)"
                + " if not bag or type(b0)~='number' then"
                + " w('{\"r\":\"fail\",\"why\":\"nobag\"}') return end"
                + " b0=math.floor(b0)"
                // capability probe: wanting what the bag already holds can
                // only answer, never add - -1 means the control refuses a
                // local apply in our role and sends instead
                + " local probed=false local r=nil"
                + " pcall(function() r=target:gainItems(ITEM,b0)"
                + " probed=true end)"
                + " if not probed or type(r)~='number' then"
                + " w('{\"r\":\"fail\",\"why\":\"nogain\"}') return end"
                + " local auth=false"
                + " pcall(function() local v=UGCCommon:IsSingleGame()"
                + " auth=(v==true or v==1) end)"
                + " if not auth then pcall(function()"
                + " local v=UGCCommon:IsHost() auth=(v==true or v==1) end) end"
                + " if not auth then pcall(function()"
                + " local v=GameNetMgr:isHost() auth=(v==true or v==1) end) end"
                + " if r<0 then"
                // the request goes out naming this player as the recipient
                + " local sent=false"
                + " pcall(function()"
                + " target:gainItemsUserdata(ITEM,b0+N,'') sent=true end)"
                + " if not sent then"
                + " w('{\"r\":\"fail\",\"why\":\"nosend\"}') return end"
                + " w('{\"r\":\"wait\",\"want\":'..(b0+N)..',\"u\":'..UID..'}')"
                + " return end"
                // local-only and not authoritative: writing the mirror would
                // be a ghost item, so say why instead
                + " if not auth then w('{\"r\":\"noclient\"}') return end"
                + " local applied=false"
                + " pcall(function() target:gainItems(ITEM,b0+N)"
                + " applied=true end)"
                + " if not applied then"
                + " w('{\"r\":\"fail\",\"why\":\"nogain\"}') return end"
                + " w('{\"r\":\"wait\",\"want\":'..(b0+N)..',\"u\":'..UID..'}')"
                + " end)"
                + " if not ok then"
                + " w('{\"r\":\"err\"}')"
                // the JSON above is the answer Java reads, this one the
                // answer logcat gets - CallLuaString swallows the failure
                + " error('MWNM|'..tostring(err),0)"
                + " end"
                + " end)";
    }

    /**
     * The check script: re-count the same bag the act script counted and
     * compare against the count it promised. Nothing else, and a failure to
     * read counts as "not there yet" - only the act script may report a
     * reason, because only it knows which primitive it tried.
     *
     * The script source ends as an expression - javaCallLuaEvent appends
     * "();" to it.
     */
    static String check(String p1, String p2, int item, long want, long uid) {
        return "(function()"
                + " local p1='" + luaStr(p1) + "'"
                + " local p2='" + luaStr(p2) + "'"
                + " local ITEM=" + item
                + " local WANT=" + luaNum(want)
                + " local UID=" + luaNum(uid)
                + " local function w(j)"
                + " local function one(p)"
                + " local ok,fh=pcall(function() return io.open(p,'w') end)"
                + " if not ok or fh==nil then return end"
                + " pcall(function() fh:write(j) fh:close() end)"
                + " end"
                + " one(p1)"
                + " if p2~=p1 then one(p2) end"
                + " end"
                + " w('{\"started\":1}')"
                + " local ok,err=pcall(function()"
                + " local bag=nil"
                + " if UID==0 then"
                + " pcall(function() bag=ClientBackpack end)"
                + " else local t=nil"
                + " pcall(function() t=WorldMgr:getPlayerByUin(UID) end)"
                + " if t~=nil then"
                + " pcall(function() bag=t:getBackPack() end) end"
                + " end"
                + " local n=nil"
                + " pcall(function()"
                + " n=bag:getItemCountInNormalPack(ITEM) end)"
                + " if type(n)~='number' then"
                + " w('{\"r\":\"wait\"}') return end"
                + " n=math.floor(n)"
                + " if n>=WANT then"
                + " w('{\"r\":\"ok\",\"have\":'..n..'}')"
                + " else w('{\"r\":\"wait\"}') end"
                + " end)"
                + " if not ok then w('{\"r\":\"wait\"}') end"
                + " end)";
    }
}
