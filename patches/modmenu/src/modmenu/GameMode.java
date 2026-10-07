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
 * One-shot switch of the current player's gamemode, gated behind
 * {@link ModMenu#isUnsafe()} by the menu.
 *
 * There is no Java entry into the engine's WorldType: the switch lives in
 * libGameApp.so behind the WorldManager Lua class (WorldMgr), and the pause
 * menu's own ChangeGameModeBtn reaches it through the same bindings we do.
 * Delivery therefore mirrors IdScan - javaCallLuaEvent queues a
 * pcall-wrapped script, the script answers through a JSON file - with one
 * difference: the sheet is a dialog on the live game window, so the script
 * loop keeps pumping while it is up and the dispatch ships on the tap
 * instead of waiting for the menu to close.
 *
 * The script picks the path by role (single/host go through
 * hostToggleMpGameMode and the UI's own changeGameMode, a room client goes
 * through clientToggleMpGameMode) and never trusts a return value: after
 * every attempt it re-reads WorldMgr:getGameMode() and stops on the first
 * step that lands on the target, so a binding that silently does nothing
 * falls through to the next one instead of reporting a lie.
 */
public final class GameMode {
    private static final String TAG = "MWGameMode";
    private static final String FILE = "mw_gm.json";
    private static final long TIMEOUT_MS = 12000;
    private static final long POLL_MS = 250;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** A dispatch that has not answered yet. It survives a timeout on
     *  purpose: the script may still be queued for a loop that is not
     *  pumping, and a second one would flip the mode back when both
     *  finally run - so a tap on an unanswered dispatch resumes the poll
     *  instead of shipping again. */
    private static volatile boolean polling;

    private GameMode() {}

    /** Deliver the result on the main thread - the menu uses it to
     *  re-enable the button. Toasts are posted from here, so the result is
     *  seen even if the sheet is already gone. */
    public static void request(Context ctx, final Runnable done) {
        final String[] p = paths(ctx);
        if (p == null) {
            Log.d(TAG, "no writable files dir");
            toast(ctx, "nopath");
            done.run();
            return;
        }
        final boolean fresh = !polling;
        // delete, send and the poller thread all sit inside the guard: this
        // runs on the main thread where an escaping exception would reach
        // the game's uncaught handler
        try {
            if (fresh) {
                for (int i = 0; i < p.length; i++) {
                    new File(p[i]).delete();
                }
                polling = true;
                CommonNatives.javaCallLuaEvent(script(p[0], p[1]), new Object[0]);
            }
            final Context app = ctx.getApplicationContext();
            new Thread(new Runnable() {
                @Override
                public void run() {
                    final String state = awaitGuarded(p);
                    if (!"timeout".equals(state)) {
                        polling = false;
                    }
                    Log.d(TAG, "switch done: " + state);
                    MAIN.post(new Runnable() {
                        @Override
                        public void run() {
                            toast(app, state);
                            done.run();
                        }
                    });
                }
            }, "mw-gamemode").start();
            Log.d(TAG, fresh ? "switch shipped" : "resuming poll");
        } catch (RuntimeException e) {
            if (fresh) {
                polling = false;
            }
            Log.d(TAG, "dispatch failed: " + e);
            toast(ctx, "fail");
            done.run();
        }
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
            return I18n.t(c, "mod_gm_ok");
        }
        if ("nomap".equals(state)) {
            return I18n.t(c, "mod_gm_nomap");
        }
        if ("unsupported".equals(state)) {
            return I18n.t(c, "mod_gm_unsupported");
        }
        return I18n.t(c, "mod_gm_fail");
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

    private static String awaitGuarded(String[] paths) {
        try {
            return await(paths);
        } catch (RuntimeException e) {
            return "fail";
        }
    }

    private static String await(String[] paths) {
        long deadline = System.currentTimeMillis() + TIMEOUT_MS;
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
        String body = read(path);
        if (body == null || body.length() <= 2) {
            return null;
        }
        try {
            JSONObject o = new JSONObject(body);
            if (o.optInt("started", 0) != 0) {
                return null;
            }
            String r = o.optString("r", null);
            return r == null || r.length() == 0 ? null : r;
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

    /**
     * The switch script. Every engine call sits in its own pcall: a wrong
     * guess becomes a Lua error the cascade survives, never a crash - and
     * only bindings the game itself uses from script are called (the pause
     * menu's changeGameMode path, the WorldMgr toggles, UGCCommon's role
     * queries), because no pcall contains a native fault.
     *
     * Steps run in role order and each is verified against
     * WorldMgr:getGameMode(): a step that moves the mode somewhere other
     * than the target aborts instead of letting the next toggle flip it
     * back, so the cascade can never oscillate between two modes.
     *
     * The script source ends as an expression - javaCallLuaEvent appends
     * "();" to it.
     */
    static String script(String p1, String p2) {
        return "(function()"
                + " local p1='" + luaStr(p1) + "'"
                + " local p2='" + luaStr(p2) + "'"
                + " local function w(j)"
                + " local function one(p)"
                + " local ok,fh=pcall(function() return io.open(p,'w') end)"
                + " if not ok or fh==nil then return end"
                + " pcall(function() fh:write(j) fh:close() end)"
                + " end"
                + " one(p1)"
                + " if p2~=p1 then one(p2) end"
                + " end"
                // marker: written before the switch, overwritten by its result
                + " w('{\"started\":1}')"
                + " local ok,err=pcall(function()"
                // outside a map there is no WorldMgr state to switch, and the
                // menu is up over the lobby: say so instead of failing late
                + " local inmap=false"
                + " pcall(function()"
                + " local r=ClientCurGame:isInGame()"
                + " inmap=(r==true or r==1)"
                + " end)"
                + " if not inmap then w('{\"r\":\"nomap\"}') return end"
                + " local okc,cur=pcall(function()"
                + " return WorldMgr:getGameMode() end)"
                + " if not okc or type(cur)~='number' then"
                + " w('{\"r\":\"nomap\"}') return end"
                + " cur=math.floor(cur)"
                // the toggle pair the engine flips: create<->run and
                // gamemaker edit<->run; every other WorldType (0 single,
                // 6 freemode, ...) has no switch and says so
                + " local target=nil"
                + " if cur==1 then target=3"
                + " elseif cur==3 then target=1"
                + " elseif cur==4 then target=5"
                + " elseif cur==5 then target=4 end"
                + " if target==nil then"
                + " w('{\"r\":\"unsupported\",\"cur\":'..cur..'}') return end"
                + " local single=false local host=false local known=false"
                + " local o1,v1=pcall(function() return UGCCommon:IsSingleGame() end)"
                + " if o1 then known=true single=(v1==true or v1==1) end"
                + " local o2,v2=pcall(function() return UGCCommon:IsHost() end)"
                + " if o2 then known=true host=(v2==true or v2==1) end"
                // the pause menu passes this flag to changeGameMode; default
                // matches the binding's own default when the query is absent
                + " local fb=true"
                + " pcall(function()"
                + " fb=(if_open_scene_fallback()==true) end)"
                + " local S={}"
                + " if (not known) or single or host then"
                // host/single: the MP flip first (it fires the room events),
                // then the pause menu's own path, then the reporting variant
                + " if cur==1 or cur==3 then S[#S+1]=function()"
                + " WorldMgr:hostToggleMpGameMode() end end"
                + " S[#S+1]=function() CurMainPlayer:changeGameMode(fb) end"
                + " S[#S+1]=function() CurMainPlayer:changeMpGameMode(false) end"
                + " else"
                // room client: the network path first, the local switch last
                + " if cur==1 or cur==3 then S[#S+1]=function()"
                + " WorldMgr:clientToggleMpGameMode(cur,target) end end"
                + " S[#S+1]=function() CurMainPlayer:changeMpGameMode(false) end"
                + " S[#S+1]=function() CurMainPlayer:changeGameMode(fb) end"
                + " end"
                + " for i=1,#S do"
                + " pcall(S[i])"
                + " local okm,now=pcall(function()"
                + " return WorldMgr:getGameMode() end)"
                + " if okm and type(now)=='number' then"
                + " now=math.floor(now)"
                + " if now==target then"
                + " w('{\"r\":\"ok\",\"from\":'..cur..',\"to\":'..target..'}')"
                + " return end"
                // a step moved the mode but missed the target: the next
                // toggle would flip it again, so stop and report
                + " if now~=cur then"
                + " w('{\"r\":\"fail\",\"cur\":'..cur..'}') return end"
                + " end"
                + " end"
                + " w('{\"r\":\"fail\",\"cur\":'..cur..'}')"
                + " end)"
                + " if not ok then"
                + " w('{\"r\":\"err\"}')"
                // the JSON above is the answer Java reads, this one the
                // answer logcat gets - CallLuaString swallows the failure
                + " error('MWNM|'..tostring(err),0)"
                + " end"
                + " end)";
    }
}
