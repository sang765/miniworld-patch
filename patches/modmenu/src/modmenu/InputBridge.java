package modmenu;

import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.ActionMode;
import android.view.InputDevice;
import android.view.KeyboardShortcutGroup;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;

import com.minitech.player.AppPlayer;

import org.appplay.lib.CommonNatives;
import org.appplay.lib.GameBaseActivity;

import java.util.List;

/**
 * OTG keyboard/mouse bridge.
 *
 * DecorView routes key, pointer and touch events to the Window.Callback
 * before any view, so the wrapper is a single focus-independent point where
 * hardware input can be handed to the engine:
 *
 * - Keys are translated from Android keycodes to the ASCII space the
 *   engine numbers its binds in (getKeyName(51)='3' proved the bind table
 *   is PC/ASCII while nativeInjectEvent forwards Android codes untouched)
 *   and injected into AppPlayer.injectEvent. Right before a fresh key-down,
 *   the engine's keybind master switch is invoked on the settings tables
 *   that own it (GameSettingsMgr/GameSettings - located by the round-5 Lua
 *   probe; a bare global never existed) - pcall-wrapped so a wrong guess is
 *   a no-op and can never raise into the script host.
 * - W/A/S/D, Space and Shift are additionally mirrored into the player API
 *   the game scripts use (CurMainPlayer:setMoveForward and friends): the
 *   native keybind matcher still never fires on Android, so movement is
 *   driven directly - one script call per key edge, not per repeat.
 * - Mouse button/drag events reach the engine as source=MOUSE/toolType=
 *   MOUSE touches; the engine's touch path only recognises finger touches,
 *   so they are rewritten to SOURCE_TOUCHSCREEN/TOOL_TYPE_FINGER before
 *   being passed on - a mouse click becomes exactly a finger tap.
 * - Pointer-class generic motion (hover/scroll/right-click) is injected so
 *   the engine can react like the Windows build does. The engine swallows
 *   ACTION_SCROLL without acting on it, so each wheel notch also cycles
 *   the hotbar through setCurShortcut, the way the PC build plays.
 * - Crosshair mode (menu toggle or F1): the game surface gets pointer
 *   capture so the system cursor disappears. Captured movement never
 *   reaches the window callback (rounds 4 and 5 saw zero motion events
 *   while captured), it is delivered to the captured view instead, so the
 *   surface also gets an OnCapturedPointerListener feeding the camera path
 *   with one correction: captured coordinates are relative deltas per the
 *   Android docs, not absolute positions, and the hover/touch paths stay
 *   absolute. The camera runs as pointer 0 dragging around the centre; a
 *   mouse button is pointer 1 held on the block under the crosshair, so
 *   holding the button and moving keeps mining while the view turns. A
 *   real finger touch or a lost focus lifts both pointers immediately.
 *   While the bridge is on, a slow poll asks the Lua VM whether a map is
 *   active (the script reports through a two-byte state file; io.open is
 *   the only channel back into Java) and turns the crosshair on/off across
 *   that transition - manual F1 still wins in between - and a map exit
 *   clears the movement state so the player never walks on.
 * - F2 cycles the game's own control scheme (the classical/rocker pair
 *   ControlMoveSwitch_OnClick toggles, both keys every time) and reports
 *   the values it saw through error().
 *
 * System keys (Back, volume, menu...) and real finger touches are delegated
 * untouched. Logging under the tag MWInput exists so a device-side LogFox
 * capture shows where an event stops: "installed" proves the wrapper is
 * live, "key ..." proves delivery, shows the translation and carries the
 * engine's answer plus the originating device/source, "xh-in"/"xh-d" show
 * the capture window and its deltas, and the one-shot "HKUI2"/"MWP4"/
 * "MWP5"/"MWP6"/"MWP8"/"MWP9" Lua reports (first fresh key-down, first
 * movement, first wheel notch) open the real settings window, dump the
 * control-mode API, the keybind table with per-def details and the
 * player/hotbar APIs, and test the state-file channel - print() never
 * reaches logcat on this build, error() does.
 */
public final class InputBridge implements Window.Callback {
    private static final String TAG = "MWInput";

    // The keybind master switch lives on the engine's settings tables, not in
    // globals: round 5 proved the old bare-global form was silently a no-op.
    // Walks the two owners the probe found (and ClientInfo as a last resort);
    // every step is pcall-wrapped so a wrong guess stays invisible.
    private static final String KEYBIND_ON =
            "(function() pcall(function()"
                    + " local names={\"GameSettingsMgr\",\"GameSettings\"}"
                    + " for i=1,#names do local t=_G[names[i]]"
                    + " if t~=nil then"
                    + " local ok,fn=pcall(function() return t.enableAllKeyBind end)"
                    + " if ok and type(fn)==\"function\""
                    + " and pcall(function() t:enableAllKeyBind() end) then return end"
                    + " end end"
                    + " local ok,ci=pcall(GetClientInfo)"
                    + " if ok and ci~=nil then pcall(function() ci:enableAllKeyBind() end) end"
                    + " end) end)";

    // One-shot on the first fresh key-down. Round 5's HKUI called
    // GameSetFrameHotkey_OnShow directly, which only refreshes tab content
    // behind a frame that was never opened - hence "khong co gi thay doi".
    // GameSet_OnClick does exactly show GameSetFrame; the tab button lands on
    // the hotkey page, and the IsShown readback says whether anything really
    // appeared on screen.
    private static final String OPEN_FRAME =
            "(function()"
                    + " local r={}"
                    + " local ok,e=pcall(function()"
                    + " local fr=getglobal('GameSetFrame')"
                    + " if fr==nil then error('noframe') end"
                    + " fr:Show()"
                    + " end)"
                    + " r[#r+1]='show='..tostring(ok)..','..tostring(e)"
                    + " local ok2,e2=pcall(function()"
                    + " local f=rawget(_G,'GameSetFrameHotkey_OnShow')"
                    + " if type(f)~='function' then error('missing') end"
                    + " f()"
                    + " end)"
                    + " r[#r+1]='onshow='..tostring(ok2)..','..tostring(e2)"
                    + " local ok3=pcall(function() press_btn('GameSetFrameHotkeyBtn') end)"
                    + " r[#r+1]='tab='..tostring(ok3)"
                    + " local vis='?'"
                    + " pcall(function()"
                    + " local fr=getglobal('GameSetFrame')"
                    + " vis=tostring(fr~=nil and fr.IsShown and fr:IsShown())"
                    + " end)"
                    + " r[#r+1]='vis='..vis"
                    + " error('HKUI2|'..table.concat(r,'|'):sub(1,2900),0)"
                    + " end)";

    // Control-mode report: master-switch result, the classical/rocker scheme
    // flags ControlMoveSwitch_OnClick toggles, getContrlMode, every
    // control-ish ClientInfo entry (a setter name not found statically shows
    // up here), and the in-game/map ids the crosshair auto-detect needs.
    private static final String PROBE_A =
            "(function()"
                    + " local eb='none'"
                    + " local names={\"GameSettingsMgr\",\"GameSettings\"}"
                    + " for i=1,#names do local t=_G[names[i]]"
                    + " if t~=nil then"
                    + " local ok,fn=pcall(function() return t.enableAllKeyBind end)"
                    + " if ok and type(fn)==\"function\" then"
                    + " local ran,er=pcall(function() t:enableAllKeyBind() end)"
                    + " eb=names[i]..(ran and ':ok' or ':err:'..tostring(er))"
                    + " break end end end"
                    + " if eb=='none' then"
                    + " local okb,ci2=pcall(GetClientInfo)"
                    + " if okb and ci2~=nil then"
                    + " local ranb=pcall(function() ci2:enableAllKeyBind() end)"
                    + " eb='ClientInfo'..(ranb and ':ok' or ':err')"
                    + " end end"
                    + " local cm,cl,rk,ing,mid"
                    + " pcall(function() cm=GetClientInfo():getContrlMode() end)"
                    + " pcall(function()"
                    + " local c=GetIWorldConfig()"
                    + " cl=c:getGameData('classical') rk=c:getGameData('rocker')"
                    + " end)"
                    + " pcall(function()"
                    + " ing=ClientCurGame and ClientCurGame.isInGame"
                    + " and ClientCurGame:isInGame()"
                    + " end)"
                    + " pcall(function() mid=GetClientInfo():getCurrentGameMapId() end)"
                    + " local hits,seen={},{}"
                    + " local ok,ci=pcall(GetClientInfo)"
                    + " if ok and type(ci)=='table' then"
                    + " local pok=pcall(function()"
                    + " for k in pairs(ci) do"
                    + " if type(k)=='string'"
                    + " and (k:find('ontrl') or k:find('ontrol')"
                    + " or k:find('witch') or k:find('KeyBind')) then"
                    + " if not seen[k] then seen[k]=true hits[#hits+1]=k end"
                    + " end end end)"
                    + " if not pok then hits[#hits+1]='pairs-fail' end"
                    + " end"
                    + " local cand={'setContrlMode','setControlMode','setContrlType'"
                    + ",'setMoveMode','setUIMode','disableAllKeyBind'}"
                    + " for i=1,#cand do"
                    + " if ci~=nil then"
                    + " local okf,f=pcall(function() return ci[cand[i]] end)"
                    + " if okf and type(f)=='function' and not seen[cand[i]] then"
                    + " seen[cand[i]]=true hits[#hits+1]=cand[i]"
                    + " end end end"
                    + " local s='MWP4|eb='..eb..'|cm='..tostring(cm)"
                    + " ..'|cl='..tostring(cl)..',rk='..tostring(rk)"
                    + " ..'|in='..tostring(ing)..',mid='..tostring(mid)"
                    + " ..'|set='..table.concat(hits,',')"
                    + " error(s:sub(1,2900),0)"
                    + " end)";

    // F2: flip the classical/rocker pair exactly like the game's own
    // ControlMoveSwitch_OnClick (set flags, refresh the switch widgets, apply
    // through appalyGameSetData) and report getContrlMode before/after so the
    // log says whether the scheme switch actually moves the control mode.
    private static final String CTRL_TOGGLE =
            "(function()"
                    + " local cl,cl2,rk,rk2,cm,cm2"
                    + " local okc,cfg=pcall(function() return GetIWorldConfig() end)"
                    + " if not okc or cfg==nil then error('MWP6|cfg=no',0) end"
                    + " pcall(function() cl=cfg:getGameData('classical') end)"
                    + " pcall(function() rk=cfg:getGameData('rocker') end)"
                    + " pcall(function() cm=GetClientInfo():getContrlMode() end)"
                    + " local num=tonumber(cl)"
                    + " local newc=(num and num>0) and 0 or 1"
                    + " local ok1=pcall(function()"
                    + " cfg:setGameData('classical',newc)"
                    + " cfg:setGameData('rocker',newc==1 and 0 or 1)"
                    + " end)"
                    + " local ok2=pcall(SetControlMoveSwithState)"
                    + " local ok3=pcall(function() GetClientInfo():appalyGameSetData() end)"
                    + " pcall(function() cl2=cfg:getGameData('classical') end)"
                    + " pcall(function() rk2=cfg:getGameData('rocker') end)"
                    + " pcall(function() cm2=GetClientInfo():getContrlMode() end)"
                    + " error('MWP6|cl='..tostring(cl)..'->'..tostring(cl2)"
                    + " ..' rk='..tostring(rk)..'->'..tostring(rk2)"
                    + " ..' cm='..tostring(cm)..'->'..tostring(cm2)"
                    + " ..'|set='..tostring(ok1)..' ui='..tostring(ok2)"
                    + " ..' ap='..tostring(ok3),0)"
                    + " end)";

    // Movement through the engine's own player API: the keybind matcher
    // never fires on Android (rounds 4-6: keys consumed, character stands
    // still), so the bridge maps WASD/Space/Shift itself and drives
    // CurMainPlayer - the same global the game scripts call setSneaking on.
    // fwd/str are 1/-1/false: false reads as Lua false for the boolean
    // setters and as 0 for the integer ones, 1/-1 as either. Reported once
    // through error() so the first press proves which setters exist.
    private static final String MOVEMENT =
            "(function(fw,st,jp,sk,rep)"
                    + " local p=nil"
                    + " pcall(function() p=CurMainPlayer end)"
                    + " if p==nil then pcall(function() p=ClientCurGame:getMainPlayer() end) end"
                    + " if p==nil then"
                    + " if rep==1 then error('MWP8|pl=no',0) end return end"
                    + " local ok1,e1=pcall(function() p:setMoveForward(fw) end)"
                    + " local ok2=pcall(function() p:setMoveStrafing(st) end)"
                    + " local ok3=pcall(function() p:setJumping(jp) end)"
                    + " local ok4=pcall(function() p:setSneaking(sk) end)"
                    + " if rep==1 then"
                    + " error('MWP8|mf='..tostring(ok1)..','..tostring(e1):sub(1,60)"
                    + " ..' ms='..tostring(ok2)..' mj='..tostring(ok3)"
                    + " ..' mk='..tostring(ok4),0)"
                    + " end end)";

    // Wheel = hotbar slot, the way the PC build plays: the Android engine
    // swallows ACTION_SCROLL without acting on it, so the bridge cycles
    // setCurShortcut itself. Wrapping uses getShortcutStartIndex and
    // getCurShortcutItemNum so it stays correct whatever base the slot
    // numbers use. First notch reports the slot layout once.
    private static final String HOTBAR =
            "(function(d,rep)"
                    + " local p=nil"
                    + " pcall(function() p=CurMainPlayer end)"
                    + " if p==nil then pcall(function() p=ClientCurGame:getMainPlayer() end) end"
                    + " if p==nil then"
                    + " if rep==1 then error('MWP9|pl=no',0) end return end"
                    + " local ok1,s=pcall(function() return p:getCurShortcut() end)"
                    + " if not ok1 or type(s)~='number' then"
                    + " if rep==1 then error('MWP9|get=no',0) end return end"
                    + " local ok2,st=pcall(function() return p:getShortcutStartIndex() end)"
                    + " local ok3,cn=pcall(function() return p:getCurShortcutItemNum() end)"
                    + " st=(ok2 and type(st)=='number') and st or 1"
                    + " cn=(ok3 and type(cn)=='number' and cn>0) and cn or 9"
                    + " local n=s+d"
                    + " if n<st then n=st+cn-1 elseif n>=st+cn then n=st end"
                    + " local ok4,e4=pcall(function() p:setCurShortcut(n) end)"
                    + " if rep==1 then"
                    + " error('MWP9|s='..s..',st='..st..',cn='..cn..'->'..n"
                    + " ..' set='..tostring(ok4)..','..tostring(e4):sub(1,50),0)"
                    + " end end)";

    private static final long ENABLE_WARMUP_MS = 5000;
    private static final long ENABLE_INTERVAL_MS = 2000;
    private static final long CAPTURE_RETRY_MS = 1500;
    private static final long LOOK_IDLE_MS = 120;
    private static final long STATE_POLL_MS = 1500;
    private static final long CLICK_HOLD_MS = 700;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile boolean probed;

    private final Window.Callback orig;
    private final Activity activity;
    private final long installedAt = SystemClock.uptimeMillis();
    private long lastEnable;

    private boolean captured;
    private long lastCaptureReq;
    private boolean primed; // the current crosshair drag has a movement baseline
    private float lastX;
    private float lastY;
    private boolean looking; // the synthetic look pointer (id 0) is down
    private boolean mouseTouching; // the synthetic click pointer (id 1) is down
    private float lookX;
    private float lookY;
    private float clickX;
    private float clickY;
    private long gestureDown; // downTime of the currently open pointer gesture
    private final int[] pIds = new int[2];
    private int pCount;
    private boolean stateInGame; // byte 1 of the script state file
    private boolean mvF;
    private boolean mvB;
    private boolean mvL;
    private boolean mvR;
    private boolean mvJ;
    private boolean mvS;
    private float wheelAcc;
    private boolean moveReported;
    private boolean hotbarReported;
    private long lastArrLog;
    private long lastDeltaLog;
    private long lastInLog;
    private boolean polling;
    private String statePath; // state file candidate 1 (external files dir)
    private String statePath2; // candidate 2 (internal files dir)
    private String probePath; // io channel test file (kept off the state file)
    private String probePath2;
    private boolean lastInMap; // last observed crosshair auto state
    private boolean stateErrLogged;
    private final Runnable lookEnd = new Runnable() {
        @Override
        public void run() {
            endLook(SystemClock.uptimeMillis());
        }
    };
    private final Runnable clickEnd = new Runnable() {
        @Override
        public void run() {
            releaseClick(SystemClock.uptimeMillis()); // a lost release must never wedge
        }
    };
    private final Runnable poll = new Runnable() {
        @Override
        public void run() {
            if (!polling) {
                return;
            }
            MAIN.postDelayed(this, STATE_POLL_MS);
            if (!ModMenu.isKbMouseOn()) {
                // the menu switch owns crosshair state: a stale capture must
                // not survive turning the OTG bridge off
                if (ModMenu.isCrosshairOn()) {
                    ModMenu.setCrosshair(activity, false);
                    syncCrosshair();
                }
                if (mvF || mvB || mvL || mvR || mvJ || mvS) {
                    clearMovement();
                }
                return;
            }
            if (SystemClock.uptimeMillis() - installedAt < ENABLE_WARMUP_MS
                    || player() == null) {
                return;
            }
            pollState();
        }
    };

    private InputBridge(Window.Callback orig, Activity activity) {
        this.orig = orig;
        this.activity = activity;
    }

    /** Installed from ModMenu.onGameStart and by Lifecycle on every resume. */
    public static void install(Activity activity) {
        Window window = activity.getWindow();
        Window.Callback current = window.getCallback();
        if (current == null || current instanceof InputBridge) {
            return;
        }
        InputBridge bridge = new InputBridge(current, activity);
        window.setCallback(bridge);
        bridge.startPoll();
        Log.i(TAG, "installed on " + activity.getClass().getName());
    }

    /** Registered from ModMenu.onAppCreate so no activity is left unwrapped. */
    public static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity activity) {
            install(activity);
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}

        @Override
        public void onActivityStarted(Activity activity) {}

        @Override
        public void onActivityPaused(Activity activity) {}

        @Override
        public void onActivityStopped(Activity activity) {}

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}

        @Override
        public void onActivityDestroyed(Activity activity) {}
    }

    private AppPlayer player() {
        if (!(activity instanceof GameBaseActivity)) {
            return null;
        }
        return ((GameBaseActivity) activity).m_AppPlayer;
    }

    /**
     * Keys that must keep their normal Android meaning even with the bridge
     * on: Back, volume, power and friends would otherwise stop working.
     * (KeyEvent.isSystemKey is @hide, so the list is spelled out here.)
     */
    private static boolean keepAndroid(int keyCode) {
        switch (keyCode) {
            case KeyEvent.KEYCODE_BACK:
            case KeyEvent.KEYCODE_HOME:
            case KeyEvent.KEYCODE_CALL:
            case KeyEvent.KEYCODE_ENDCALL:
            case KeyEvent.KEYCODE_MENU:
            case KeyEvent.KEYCODE_SEARCH:
            case KeyEvent.KEYCODE_VOLUME_UP:
            case KeyEvent.KEYCODE_VOLUME_DOWN:
            case KeyEvent.KEYCODE_MUTE:
            case KeyEvent.KEYCODE_POWER:
            case KeyEvent.KEYCODE_CAMERA:
            case KeyEvent.KEYCODE_APP_SWITCH:
            case KeyEvent.KEYCODE_MEDIA_PLAY:
            case KeyEvent.KEYCODE_MEDIA_PAUSE:
            case KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE:
            case KeyEvent.KEYCODE_MEDIA_STOP:
            case KeyEvent.KEYCODE_MEDIA_NEXT:
            case KeyEvent.KEYCODE_MEDIA_PREVIOUS:
            case KeyEvent.KEYCODE_MEDIA_REWIND:
            case KeyEvent.KEYCODE_MEDIA_FAST_FORWARD:
            case KeyEvent.KEYCODE_MEDIA_RECORD:
                return true;
            default:
                return false;
        }
    }

    /**
     * Re-enables gameplay key binds shortly before injecting a fresh
     * key-down. The VM may not exist during the first seconds of boot, so
     * the first attempts wait out a warmup; after that at most one call
     * every ENABLE_INTERVAL_MS so held keys do not spam script evaluation.
     */
    private void enableKeyBinds() {
        long now = SystemClock.uptimeMillis();
        if (now - installedAt < ENABLE_WARMUP_MS || now - lastEnable < ENABLE_INTERVAL_MS) {
            return;
        }
        lastEnable = now;
        try {
            CommonNatives.javaCallLuaEvent(KEYBIND_ON, new Object[0]);
            Log.d(TAG, "keybind-on fired");
            if (!probed) {
                probed = true;
                // panel first: it proves the real settings window is reachable
                // and loads the UI module the reports below read state from
                CommonNatives.javaCallLuaEvent(OPEN_FRAME, new Object[0]);
                CommonNatives.javaCallLuaEvent(PROBE_A, new Object[0]);
                CommonNatives.javaCallLuaEvent(probeB(), new Object[0]);
                Log.d(TAG, "probes fired");
            }
        } catch (RuntimeException e) {
            Log.d(TAG, "keybind-on failed: " + e);
        }
    }

    /**
     * The engine's keybind matcher never fires on Android (rounds 4-6 saw
     * every key consumed with the character standing still), so the six
     * movement keys are mirrored into the player API the game scripts use.
     * Returns true when the key belongs to the movement set and the stored
     * state actually changed, which is the only moment worth a script call.
     */
    private boolean movementKey(int code, boolean down) {
        switch (code) {
            case KeyEvent.KEYCODE_W:
                if (mvF == down) return false;
                mvF = down;
                return true;
            case KeyEvent.KEYCODE_S:
                if (mvB == down) return false;
                mvB = down;
                return true;
            case KeyEvent.KEYCODE_A:
                if (mvL == down) return false;
                mvL = down;
                return true;
            case KeyEvent.KEYCODE_D:
                if (mvR == down) return false;
                mvR = down;
                return true;
            case KeyEvent.KEYCODE_SPACE:
                if (mvJ == down) return false;
                mvJ = down;
                return true;
            case KeyEvent.KEYCODE_SHIFT_LEFT:
            case KeyEvent.KEYCODE_SHIFT_RIGHT:
                if (mvS == down) return false;
                mvS = down;
                return true;
            default:
                return false;
        }
    }

    /**
     * Pushes the movement state into CurMainPlayer. Numbers land as Lua
     * numbers, false as Lua false - both spellings the setters accept, so a
     * boolean-flavoured and an integer-flavoured binding behave the same.
     */
    private void fireMovement(boolean report) {
        Object fwd = mvF ? Integer.valueOf(1) : (mvB ? Integer.valueOf(-1) : Boolean.FALSE);
        Object str = mvR ? Integer.valueOf(1) : (mvL ? Integer.valueOf(-1) : Boolean.FALSE);
        Object jump = mvJ ? Boolean.TRUE : Boolean.FALSE;
        Object sneak = mvS ? Boolean.TRUE : Boolean.FALSE;
        try {
            CommonNatives.javaCallLuaEvent(MOVEMENT,
                    new Object[]{fwd, str, jump, sneak, report ? 1 : 0});
            Log.d(TAG, "move f=" + mvF + " b=" + mvB + " l=" + mvL
                    + " r=" + mvR + " j=" + mvJ + " s=" + mvS);
        } catch (RuntimeException e) {
            Log.d(TAG, "move failed: " + e);
        }
    }

    private void clearMovement() {
        mvF = mvB = mvL = mvR = mvJ = mvS = false;
        fireMovement(false);
    }

    /** One wheel notch = one hotbar slot, PC style. */
    private void handleWheel(MotionEvent event) {
        if (!stateInGame) {
            return;
        }
        float v = event.getAxisValue(MotionEvent.AXIS_VSCROLL);
        if (v == 0f) {
            return;
        }
        wheelAcc += v;
        while (wheelAcc >= 1f) {
            wheelAcc -= 1f;
            fireHotbar(1);
        }
        while (wheelAcc <= -1f) {
            wheelAcc += 1f;
            fireHotbar(-1);
        }
    }

    private void fireHotbar(int delta) {
        boolean report = !hotbarReported;
        try {
            CommonNatives.javaCallLuaEvent(HOTBAR,
                    new Object[]{Integer.valueOf(delta), report ? 1 : 0});
            hotbarReported = true;
            Log.d(TAG, "wheel " + delta);
        } catch (RuntimeException e) {
            Log.d(TAG, "wheel failed: " + e);
        }
    }

    /**
     * Android keycode to the PC code space the engine numbers its binds in.
     * getKeyName(51)='3' and getKeyName(87)='W' proved the bind table is
     * plain ASCII, while nativeInjectEvent forwards Android codes untouched
     * - so without this map a W press is read as '3' and nothing matches.
     * Unmapped keys fall through with their original code.
     */
    private static int toAscii(int k) {
        if (k >= KeyEvent.KEYCODE_A && k <= KeyEvent.KEYCODE_Z) {
            return 65 + (k - KeyEvent.KEYCODE_A);
        }
        if (k >= KeyEvent.KEYCODE_0 && k <= KeyEvent.KEYCODE_9) {
            return 48 + (k - KeyEvent.KEYCODE_0);
        }
        if (k >= KeyEvent.KEYCODE_F1 && k <= KeyEvent.KEYCODE_F12) {
            return 112 + (k - KeyEvent.KEYCODE_F1);
        }
        switch (k) {
            case KeyEvent.KEYCODE_SPACE: return 32;
            case KeyEvent.KEYCODE_ENTER: return 13;
            case KeyEvent.KEYCODE_TAB: return 9;
            case KeyEvent.KEYCODE_DEL: return 8;
            case KeyEvent.KEYCODE_FORWARD_DEL: return 46;
            case KeyEvent.KEYCODE_ESCAPE: return 27;
            case KeyEvent.KEYCODE_DPAD_UP: return 38;
            case KeyEvent.KEYCODE_DPAD_DOWN: return 40;
            case KeyEvent.KEYCODE_DPAD_LEFT: return 37;
            case KeyEvent.KEYCODE_DPAD_RIGHT: return 39;
            case KeyEvent.KEYCODE_SHIFT_LEFT:
            case KeyEvent.KEYCODE_SHIFT_RIGHT: return 16;
            case KeyEvent.KEYCODE_CTRL_LEFT:
            case KeyEvent.KEYCODE_CTRL_RIGHT: return 17;
            case KeyEvent.KEYCODE_ALT_LEFT:
            case KeyEvent.KEYCODE_ALT_RIGHT: return 18;
            case KeyEvent.KEYCODE_CAPS_LOCK: return 20;
            case KeyEvent.KEYCODE_MOVE_HOME: return 36;
            case KeyEvent.KEYCODE_MOVE_END: return 35;
            case KeyEvent.KEYCODE_PAGE_UP: return 33;
            case KeyEvent.KEYCODE_PAGE_DOWN: return 34;
            case KeyEvent.KEYCODE_INSERT: return 45;
            case KeyEvent.KEYCODE_COMMA: return 44;
            case KeyEvent.KEYCODE_PERIOD: return 46;
            case KeyEvent.KEYCODE_SLASH: return 47;
            case KeyEvent.KEYCODE_SEMICOLON: return 59;
            case KeyEvent.KEYCODE_APOSTROPHE: return 39;
            case KeyEvent.KEYCODE_MINUS: return 45;
            case KeyEvent.KEYCODE_EQUALS: return 61;
            case KeyEvent.KEYCODE_LEFT_BRACKET: return 91;
            case KeyEvent.KEYCODE_RIGHT_BRACKET: return 93;
            case KeyEvent.KEYCODE_BACKSLASH: return 92;
            case KeyEvent.KEYCODE_GRAVE: return 96;
            default:
                return -1;
        }
    }

    private static KeyEvent translate(KeyEvent event, int ascii) {
        return new KeyEvent(event.getDownTime(), event.getEventTime(),
                event.getAction(), ascii, event.getRepeatCount(),
                event.getMetaState(), event.getDeviceId(), event.getScanCode());
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (ModMenu.isKbMouseOn()) {
            boolean freshDown = event.getAction() == KeyEvent.ACTION_DOWN
                    && event.getRepeatCount() == 0;
            // F1 flips crosshair mode locally; the pref write keeps the menu
            // switch and the notification in sync. Consumed in both actions
            // so the engine never sees a bare key-up.
            if (event.getKeyCode() == KeyEvent.KEYCODE_F1) {
                if (freshDown) {
                    ModMenu.setCrosshair(activity, !ModMenu.isCrosshairOn());
                    syncCrosshair();
                    Log.d(TAG, "xh=" + ModMenu.isCrosshairOn() + " (F1)");
                }
                return true;
            }
            // F2 cycles the control scheme the game's own switch uses, so the
            // keyboard/scroll gate hypothesis can be tested from the keyboard
            // without digging through the settings UI.
            if (event.getKeyCode() == KeyEvent.KEYCODE_F2) {
                if (freshDown) {
                    try {
                        CommonNatives.javaCallLuaEvent(CTRL_TOGGLE, new Object[0]);
                        Log.d(TAG, "ctrl-toggle fired");
                    } catch (RuntimeException e) {
                        Log.d(TAG, "ctrl-toggle failed: " + e);
                    }
                }
                return true;
            }
            if (!keepAndroid(event.getKeyCode())) {
                AppPlayer player = player();
                if (player == null) {
                    return orig.dispatchKeyEvent(event);
                }
                if (freshDown) {
                    enableKeyBinds();
                }
                boolean edge = freshDown || event.getAction() == KeyEvent.ACTION_UP;
                boolean moved = edge && stateInGame
                        && movementKey(event.getKeyCode(),
                                event.getAction() == KeyEvent.ACTION_DOWN);
                int ascii = toAscii(event.getKeyCode());
                KeyEvent send = ascii >= 0 ? translate(event, ascii) : event;
                // consumed even when the engine declines it: letting the event
                // continue into the view path would hand the same key to
                // injectEvent a second time through AppPlayer.onKeyDown
                boolean eng = player.injectEvent(send);
                if (moved) {
                    fireMovement(!moveReported);
                    moveReported = true;
                }
                if (edge) {
                    // dev/src/rep identify who produced the key; "->ascii"
                    // shows the translation the bind matcher needs
                    Log.d(TAG, "key " + event.getKeyCode()
                            + (ascii >= 0 ? "->" + ascii : "")
                            + "/" + event.getAction()
                            + " eng=" + eng + " dev=" + event.getDeviceId()
                            + " src=" + event.getSource()
                            + " rep=" + event.getRepeatCount());
                }
                return true;
            }
        }
        return orig.dispatchKeyEvent(event);
    }

    /**
     * Diagnostic tap: every event the window actually sees while crosshair
     * mode is on, before any filter decides to drop it. Round 4 produced a
     * single motion line in 45 s of capture, and without this it was
     * impossible to tell "the system sent nothing" from "our guards ate it".
     */
    private void logCrosshairIn(String path, int act, MotionEvent e) {
        if (!ModMenu.isCrosshairOn()) {
            return;
        }
        long now = SystemClock.uptimeMillis();
        if (now - lastInLog <= 400) {
            return;
        }
        lastInLog = now;
        Log.d(TAG, "xh-in " + path + " act=" + act + " src=" + e.getSource()
                + " btn=" + e.getButtonState() + " x=" + e.getX() + " y=" + e.getY());
    }

    @Override
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        if (ModMenu.isKbMouseOn()
                && (event.getSource() & InputDevice.SOURCE_CLASS_POINTER) != 0) {
            int act = event.getActionMasked();
            logCrosshairIn("generic", act, event);
            AppPlayer player = player();
            if (player != null) {
                boolean mouse = (event.getSource() & InputDevice.SOURCE_MOUSE)
                        == InputDevice.SOURCE_MOUSE;
                if (mouse && ModMenu.isCrosshairOn()
                        && (act == MotionEvent.ACTION_HOVER_MOVE
                            || act == MotionEvent.ACTION_MOVE)) {
                    syncCrosshair();
                    long now = SystemClock.uptimeMillis();
                    if (now - lastArrLog > 500) {
                        lastArrLog = now;
                        Log.d(TAG, "xh-m act=" + act + " x=" + event.getX()
                                + " y=" + event.getY());
                    }
                    lookBy(event);
                    return true;
                }
                boolean eng = player.injectEvent(event);
                if (act == MotionEvent.ACTION_SCROLL) {
                    handleWheel(event);
                }
                if (act != MotionEvent.ACTION_HOVER_MOVE) {
                    Log.d(TAG, "motion act=" + act
                            + " src=" + event.getSource() + " eng=" + eng);
                }
                return true;
            }
        }
        return orig.dispatchGenericMotionEvent(event);
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent event) {
        int act = event.getActionMasked();
        logCrosshairIn("touch", act, event);
        boolean mouse = (event.getSource() & InputDevice.SOURCE_MOUSE)
                == InputDevice.SOURCE_MOUSE;
        if (!mouse && act == MotionEvent.ACTION_DOWN) {
            endLook(event.getEventTime()); // a real finger owns the pointer now
        }
        if (ModMenu.isKbMouseOn() && mouse) {
            boolean center = ModMenu.isCrosshairOn();
            if (center) {
                // under the crosshair the whole mouse runs through the
                // pointer pair: moves steer the camera (button held or not),
                // buttons mine at the centre
                if (act == MotionEvent.ACTION_MOVE) {
                    long now = SystemClock.uptimeMillis();
                    if (now - lastArrLog > 500) {
                        lastArrLog = now;
                        Log.d(TAG, "xh-t x=" + event.getX() + " y=" + event.getY());
                    }
                    lookBy(event);
                    return true;
                }
                if (act == MotionEvent.ACTION_DOWN) {
                    centerTouch(event.getEventTime(), true);
                    return true;
                }
                if (act == MotionEvent.ACTION_UP
                        || act == MotionEvent.ACTION_CANCEL) {
                    centerTouch(event.getEventTime(), false);
                    return true;
                }
            }
            MotionEvent finger = asFinger(event, center);
            if (finger != null) {
                boolean handled = orig.dispatchTouchEvent(finger);
                finger.recycle();
                if (act == MotionEvent.ACTION_DOWN || act == MotionEvent.ACTION_UP) {
                    Log.d(TAG, "mouse-touch " + act + " handled=" + handled);
                }
                return handled;
            }
        }
        return orig.dispatchTouchEvent(event);
    }

    /**
     * Rebuilds a mouse-generated touch as a finger touch: same coordinates
     * and timing, but toolType FINGER, source TOUCHSCREEN and no button
     * state, which is exactly what the engine's touch path accepts. With the
     * crosshair on the coordinates are replaced by the screen centre, so a
     * click acts where the crosshair points instead of at the locked
     * (invisible) pointer position.
     */
    private MotionEvent asFinger(MotionEvent src, boolean center) {
        try {
            int count = src.getPointerCount();
            MotionEvent.PointerProperties[] props =
                    new MotionEvent.PointerProperties[count];
            MotionEvent.PointerCoords[] coords = new MotionEvent.PointerCoords[count];
            DisplayMetrics dm = activity.getResources().getDisplayMetrics();
            for (int i = 0; i < count; i++) {
                MotionEvent.PointerProperties p = new MotionEvent.PointerProperties();
                p.id = src.getPointerId(i);
                p.toolType = MotionEvent.TOOL_TYPE_FINGER;
                props[i] = p;
                MotionEvent.PointerCoords c = new MotionEvent.PointerCoords();
                c.x = center ? dm.widthPixels / 2f : src.getX(i);
                c.y = center ? dm.heightPixels / 2f : src.getY(i);
                c.pressure = src.getPressure(i) > 0f ? src.getPressure(i) : 1f;
                c.size = src.getSize(i);
                coords[i] = c;
            }
            return MotionEvent.obtain(src.getDownTime(), src.getEventTime(),
                    src.getAction(), count, props, coords, src.getMetaState(),
                    0, src.getXPrecision(), src.getYPrecision(), src.getDeviceId(),
                    src.getEdgeFlags(), InputDevice.SOURCE_TOUCHSCREEN, src.getFlags());
        } catch (RuntimeException e) {
            return null;
        }
    }

    /**
     * Captured pointer movement is delivered to the captured view, not to the
     * window callback - rounds 4 and 5 logged zero motion events while
     * capture was held, which left the crosshair camera dead. This listener
     * is the missing half: camera deltas (relative, unlike the hover path),
     * buttons rebuilt as centre touches, wheel handed to the hotbar handler.
     */
    private final View.OnCapturedPointerListener captureListener =
            new View.OnCapturedPointerListener() {
        @Override
        public boolean onCapturedPointer(View v, MotionEvent e) {
            int act = e.getActionMasked();
            logCrosshairIn("captured", act, e);
            if (!ModMenu.isKbMouseOn() || !ModMenu.isCrosshairOn()) {
                return false;
            }
            switch (act) {
                case MotionEvent.ACTION_HOVER_MOVE:
                case MotionEvent.ACTION_MOVE:
                    lookByRel(e); // captured coords are relative deltas
                    return true;
                case MotionEvent.ACTION_BUTTON_PRESS:
                case MotionEvent.ACTION_DOWN:
                    centerTouch(e.getEventTime(), true);
                    return true;
                case MotionEvent.ACTION_BUTTON_RELEASE:
                case MotionEvent.ACTION_UP:
                    centerTouch(e.getEventTime(), false);
                    return true;
                case MotionEvent.ACTION_SCROLL: {
                    handleWheel(e);
                    AppPlayer p = player();
                    return p != null && p.injectEvent(e);
                }
                default:
                    return false;
            }
        }
    };

    /**
     * Brings pointer capture in line with the setting: requested while the
     * game surface exists, released on the way off. A denied request is
     * signalled by onPointerCaptureChanged(false), so retries are spaced out
     * instead of firing on every event.
     */
    private void syncCrosshair() {
        if (Build.VERSION.SDK_INT < 26) {
            return;
        }
        AppPlayer player = player();
        View surface = player != null ? player.getSurfaceView() : null;
        if (surface == null) {
            return;
        }
        long now = SystemClock.uptimeMillis();
        if (ModMenu.isCrosshairOn()) {
            if (!captured && now - lastCaptureReq > CAPTURE_RETRY_MS) {
                lastCaptureReq = now;
                captured = true;
                primed = false;
                surface.setOnCapturedPointerListener(captureListener);
                surface.requestPointerCapture();
                Log.d(TAG, "xh capture requested");
            }
        } else if (captured) {
            releaseCapture(surface);
        }
    }

    private void releaseCapture(View surface) {
        surface.releasePointerCapture();
        captured = false;
        primed = false;
        long now = SystemClock.uptimeMillis();
        endLook(now);
        releaseClick(now);
        Log.d(TAG, "xh capture released");
    }

    /**
     * Asks the script side whether a map is active and mirrors that onto the
     * crosshair across the transition. The VM cannot return values
     * (javaCallLuaEvent is void), so the script writes two bytes - in-map,
     * settings frame open - into a state file that Java reads back. The
     * crosshair only changes on the rising/falling edge: a manual F1 while
     * the map stays loaded is respected until the map changes.
     */
    private void pollState() {
        if (statePath == null && !resolvePaths()) {
            return;
        }
        try {
            CommonNatives.javaCallLuaEvent(stateScript(), new Object[0]);
        } catch (RuntimeException e) {
            if (!stateErrLogged) {
                stateErrLogged = true;
                Log.d(TAG, "state poll failed: " + e);
            }
            return;
        }
        String s = readFile(statePath);
        if (s == null && statePath2 != null) {
            s = readFile(statePath2);
        }
        if (s == null || s.length() < 2) {
            return;
        }
        boolean inMap = s.charAt(0) == '1' && s.charAt(1) != '1';
        boolean inGame = s.charAt(0) == '1';
        if (inGame != stateInGame) {
            stateInGame = inGame;
            if (!inGame) {
                clearMovement(); // a map exit must not leave the player walking
            }
        }
        if (inMap == lastInMap) {
            return;
        }
        lastInMap = inMap;
        ModMenu.setCrosshair(activity, inMap);
        syncCrosshair();
        Log.d(TAG, "xh auto=" + inMap + " state=" + s);
    }

    private void startPoll() {
        if (polling) {
            return;
        }
        polling = true;
        MAIN.postDelayed(poll, STATE_POLL_MS);
    }

    private boolean resolvePaths() {
        try {
            java.io.File ext = activity.getExternalFilesDir(null);
            java.io.File internal = activity.getFilesDir();
            if (internal == null) {
                return false;
            }
            statePath2 = new java.io.File(internal, "mw_state.txt").getAbsolutePath();
            statePath = ext != null
                    ? new java.io.File(ext, "mw_state.txt").getAbsolutePath()
                    : statePath2;
            // the io channel test must not clobber the state file: round 6's
            // probe wrote "mw-ok" there and the poller read a phantom map exit
            probePath2 = new java.io.File(internal, "mw_probe.txt").getAbsolutePath();
            probePath = ext != null
                    ? new java.io.File(ext, "mw_probe.txt").getAbsolutePath()
                    : probePath2;
            return true;
        } catch (RuntimeException e) {
            Log.d(TAG, "state paths failed: " + e);
            return false;
        }
    }

    /** Silent state report for the poller: no error(), nothing reaches logcat. */
    private String stateScript() {
        return "(function()"
                + " local ing,shown=false,false"
                + " pcall(function()"
                + " ing=(ClientCurGame and ClientCurGame.isInGame"
                + " and ClientCurGame:isInGame()) and true or false"
                + " end)"
                + " pcall(function()"
                + " local fr=getglobal('GameSetFrame')"
                + " shown=(fr and fr.IsShown and fr:IsShown()) and true or false"
                + " end)"
                + " local data=(ing and '1' or '0')..(shown and '1' or '0')"
                + " local function w(p)"
                + " local ok,fh=pcall(function() return io.open(p,'w') end)"
                + " if ok and fh then"
                + " pcall(function() fh:write(data) end)"
                + " pcall(function() fh:close() end)"
                + " end end"
                + " w('" + luaStr(statePath) + "')"
                + (statePath2 != null && !statePath2.equals(statePath)
                        ? " w('" + luaStr(statePath2) + "')" : "")
                + " end)";
    }

    /**
     * MWP5: the keybind table and the round-7 discoveries. getKeyName over
     * both keycode spaces says how the engine numbers keys (VK vs Android
     * decides how the bridge must translate), GetGameHotkey per action says
     * what is bound right now (d+default when unbound), d3 shows the raw
     * result of the first three defs so an empty b= can finally be told
     * apart from a broken reader, mgr dumps the engine's GameSettingsMgr,
     * pl/sc report the player object the movement and hotbar scripts need,
     * and the io test says whether the state-file channel is writable - it
     * writes into mw_probe.txt, never into the state file itself.
     */
    private String probeB() {
        if (statePath == null) {
            resolvePaths();
        }
        String p1 = luaStr(probePath);
        String p2 = probePath2 != null ? luaStr(probePath2) : "";
        return "(function()"
                + " local parts={'MWP5'}"
                + " local function ioTest(p)"
                + " if p=='' then return 'nopath' end"
                + " local okw,fh=pcall(function() return io.open(p,'w') end)"
                + " if not okw then return 'open-fail:'..tostring(fh) end"
                + " if fh==nil then return 'nilfh' end"
                + " local okw2,werr=pcall(function() fh:write('mw-ok') end)"
                + " pcall(function() fh:close() end)"
                + " return okw2 and 'ok' or ('wr-fail:'..tostring(werr))"
                + " end"
                + " local kn={}"
                + " local codes={27,111,32,65,68,83,87,37,38,39,40,16,13,"
                + "21,22,19,20,29,47,51,62,59,66}"
                + " for i=1,#codes do local c=codes[i]"
                + " local ok,n=pcall(function() return DefMgr:getKeyName(c) end)"
                + " if ok and type(n)=='string' and n~='' then kn[#kn+1]=c..'='..n end"
                + " end"
                + " parts[#parts+1]='kn='..table.concat(kn,',')"
                + " local binds,n,nerr={},nil,nil"
                + " local okd,dn=pcall(function() return DefMgr:getHotkeyNum() end)"
                + " if okd and type(dn)=='number' then n=dn else nerr='nonum' end"
                + " local okgi,gi=pcall(GetGameInfo)"
                + " if n~=nil and okgi and gi~=nil then"
                + " for i=1,n do"
                + " local ok1,d=pcall(function() return DefMgr:getHotkeyDef(i) end)"
                + " if ok1 and type(d)=='table' and type(d.FuncName)=='string' then"
                + " local ok2,cur=pcall(function()"
                + " return gi:GetGameHotkey(d.FuncName)"
                + " end)"
                + " if ok2 and type(cur)=='number' then"
                + " local code=cur<0 and ('d'..tostring(d.DefaultCode)) or tostring(cur)"
                + " binds[#binds+1]=d.FuncName..'='..code"
                + " end end"
                + " if #binds>60 then nerr='cap'; break end"
                + " end"
                + " elseif not okgi and nerr==nil then nerr='nogi' end"
                + " parts[#parts+1]='n='..tostring(n)..(nerr and (','..nerr) or '')"
                + " parts[#parts+1]='b='..table.concat(binds,';')"
                + " local d3={}"
                + " for i=1,3 do"
                + " local ok1,d=pcall(function() return DefMgr:getHotkeyDef(i) end)"
                + " if not ok1 then d3[#d3+1]=i..':F'"
                + " else"
                + " local fn=type(d)=='table' and tostring(d.FuncName) or type(d)"
                + " local ok2,cur=pcall(function()"
                + " return gi:GetGameHotkey(d.FuncName) end)"
                + " local tail=ok2 and (type(cur)..':'..tostring(cur):sub(1,8)) or 'F'"
                + " d3[#d3+1]=i..':'..fn..':'..tail"
                + " end end"
                + " parts[#parts+1]='d3='..table.concat(d3,',')"
                + " local mks={}"
                + " pcall(function()"
                + " local t=_G['GameSettingsMgr']"
                + " if type(t)=='table' then"
                + " for k in pairs(t) do"
                + " if #mks<40 then mks[#mks+1]=tostring(k) end"
                + " end end end)"
                + " parts[#parts+1]='mgr='..(#mks>0 and table.concat(mks,',') or 'none')"
                + " local pl='nil'"
                + " pcall(function()"
                + " local c=CurMainPlayer"
                + " if c~=nil then"
                + " local okmf=type(c.setMoveForward)=='function'"
                + " local oksc=type(c.setCurShortcut)=='function'"
                + " pl=type(c)..(okmf and '/mf' or '/nomf')"
                + " ..(oksc and '/sc' or '/nosc')"
                + " end end)"
                + " if pl=='nil' then pcall(function()"
                + " local c=ClientCurGame:getMainPlayer()"
                + " if c~=nil then pl='ccg:'..type(c) end end) end"
                + " parts[#parts+1]='pl='..pl"
                + " local sc='-'"
                + " pcall(function()"
                + " local c=CurMainPlayer"
                + " if c~=nil then"
                + " local ok1,s=pcall(function() return c:getCurShortcut() end)"
                + " local ok2,st=pcall(function() return c:getShortcutStartIndex() end)"
                + " local ok3,cn=pcall(function() return c:getCurShortcutItemNum() end)"
                + " sc=(ok1 and tostring(s) or '?')..','.."
                + "(ok2 and tostring(st) or '?')..','.."
                + "(ok3 and tostring(cn) or '?')"
                + " end end)"
                + " parts[#parts+1]='sc='..sc"
                + " local io1,io2='skip','skip'"
                + " if type(io)=='table' and io.open then"
                + " io1=ioTest('" + p1 + "');"
                + " io2=ioTest('" + p2 + "')"
                + " else io1='noio'; io2='noio'"
                + " end"
                + " parts[#parts+1]='io='..io1..','..io2"
                + " error(table.concat(parts,'|'):sub(1,2900),0)"
                + " end)";
    }

    private static String luaStr(String s) {
        return s == null ? "" : s.replace("\\", "\\\\").replace("'", "\\'");
    }

    private static String readFile(String path) {
        if (path == null) {
            return null;
        }
        try {
            java.io.InputStream in = new java.io.FileInputStream(path);
            try {
                byte[] buf = new byte[32];
                int n = in.read(buf);
                return n > 0 ? new String(buf, 0, n, "UTF-8") : null;
            } finally {
                in.close();
            }
        } catch (java.io.IOException e) {
            return null;
        }
    }

    /**
     * A mouse button becomes the second pointer of a pair held at the
     * crosshair: pointer 0 steers the camera, pointer 1 stays planted on
     * the block - so holding the button and moving keeps mining while the
     * view turns, the way the PC build plays. The safety timeout closes
     * pointer 1 when the matching release event is lost.
     */
    private void centerTouch(long time, boolean down) {
        if (down) {
            if (mouseTouching) {
                return;
            }
            DisplayMetrics dm = activity.getResources().getDisplayMetrics();
            clickX = dm.widthPixels / 2f;
            clickY = dm.heightPixels / 2f;
            mouseTouching = true;
            ptrDown(CLICK_ID, time);
            MAIN.removeCallbacks(lookEnd);
            MAIN.postDelayed(clickEnd, CLICK_HOLD_MS);
            Log.d(TAG, "center-touch down");
        } else {
            releaseClick(time);
        }
    }

    private void releaseClick(long time) {
        if (!mouseTouching) {
            return;
        }
        MAIN.removeCallbacks(clickEnd);
        ptrUp(CLICK_ID, time);
        mouseTouching = false;
        if (looking) { // the look pointer may have outlived the click
            MAIN.removeCallbacks(lookEnd);
            MAIN.postDelayed(lookEnd, LOOK_IDLE_MS);
        }
        Log.d(TAG, "center-touch up");
    }

    /**
     * Turns mouse movement into the engine's camera path: pointer 0 drags
     * around the screen centre while pointer 1 (if held) stays planted on
     * the block. Hover coordinates are absolute; captured coordinates are
     * relative deltas - Android's OnCapturedPointerListener docs: "pointer
     * coordinates that specify relative movements such as X or Y deltas" -
     * which is why the two entry points treat the baseline differently.
     * At a screen edge the look pointer lifts and re-opens at the centre,
     * which reads as a fresh swipe carrying the same delta.
     */
    private void lookBy(MotionEvent event) {
        float x = event.getX();
        float y = event.getY();
        if (!primed) {
            primed = true;
            lastX = x;
            lastY = y;
            long now = SystemClock.uptimeMillis();
            if (now - lastArrLog > 500) {
                lastArrLog = now;
                Log.d(TAG, "xh-prime x=" + x + " y=" + y);
            }
            return;
        }
        float dx = x - lastX;
        float dy = y - lastY;
        lastX = x;
        lastY = y;
        lookMove(dx, dy, event.getEventTime());
    }

    /** Captured movement: x/y already are this sample's delta. */
    private void lookByRel(MotionEvent event) {
        if (!primed) {
            primed = true;
            return;
        }
        float dx = 0f;
        float dy = 0f;
        int hist = event.getHistorySize();
        for (int i = 0; i < hist; i++) {
            dx += event.getHistoricalX(0, i);
            dy += event.getHistoricalY(0, i);
        }
        dx += event.getX();
        dy += event.getY();
        lookMove(dx, dy, event.getEventTime());
    }

    private void lookMove(float dx, float dy, long t) {
        long now = SystemClock.uptimeMillis();
        if (dx == 0f && dy == 0f) {
            if (now - lastDeltaLog > 500) {
                lastDeltaLog = now;
                Log.d(TAG, "xh-d0 dx=" + dx + " dy=" + dy);
            }
            return;
        }
        if (now - lastDeltaLog > 500) {
            lastDeltaLog = now;
            Log.d(TAG, "xh-d dx=" + dx + " dy=" + dy);
        }
        DisplayMetrics dm = activity.getResources().getDisplayMetrics();
        if (!looking) {
            lookX = dm.widthPixels / 2f;
            lookY = dm.heightPixels / 2f;
            looking = true;
            ptrDown(LOOK_ID, t);
        }
        lookX += dx;
        lookY += dy;
        if (lookX < 2f || lookX > dm.widthPixels - 3f
                || lookY < 2f || lookY > dm.heightPixels - 3f) {
            ptrUp(LOOK_ID, t);
            lookX = dm.widthPixels / 2f;
            lookY = dm.heightPixels / 2f;
            ptrDown(LOOK_ID, t);
        }
        ptrMove(t);
        if (!mouseTouching) {
            MAIN.removeCallbacks(lookEnd);
            MAIN.postDelayed(lookEnd, LOOK_IDLE_MS);
        }
    }

    /** Ends the synthetic look pointer, if it is open. */
    private void endLook(long t) {
        MAIN.removeCallbacks(lookEnd);
        if (!looking) {
            return;
        }
        ptrUp(LOOK_ID, t);
        looking = false;
    }

    // ---- the synthetic pointer pair -------------------------------------

    private static final int LOOK_ID = 0;
    private static final int CLICK_ID = 1;

    private float ptrX(int id) {
        return id == LOOK_ID ? lookX : clickX;
    }

    private float ptrY(int id) {
        return id == LOOK_ID ? lookY : clickY;
    }

    /** Sends an event covering every synthetic pointer currently down. */
    private void ptrEvent(int action, long time) {
        int n = pCount;
        if (n == 0) {
            return;
        }
        MotionEvent.PointerProperties[] props =
                new MotionEvent.PointerProperties[n];
        MotionEvent.PointerCoords[] coords = new MotionEvent.PointerCoords[n];
        for (int i = 0; i < n; i++) {
            MotionEvent.PointerProperties p = new MotionEvent.PointerProperties();
            p.id = pIds[i];
            p.toolType = MotionEvent.TOOL_TYPE_FINGER;
            props[i] = p;
            MotionEvent.PointerCoords c = new MotionEvent.PointerCoords();
            c.x = ptrX(pIds[i]);
            c.y = ptrY(pIds[i]);
            c.pressure = 1f;
            c.size = 0.05f;
            coords[i] = c;
        }
        MotionEvent m = MotionEvent.obtain(gestureDown, time, action, n,
                props, coords, 0, 0, 1f, 1f, 0, 0,
                InputDevice.SOURCE_TOUCHSCREEN, 0);
        orig.dispatchTouchEvent(m);
        m.recycle();
    }

    private void ptrDown(int id, long time) {
        if (pCount >= pIds.length) {
            return;
        }
        int idx = pCount;
        if (idx == 0) {
            gestureDown = time;
        }
        pIds[pCount++] = id;
        int action = idx == 0 ? MotionEvent.ACTION_DOWN
                : MotionEvent.ACTION_POINTER_DOWN
                        | (idx << MotionEvent.ACTION_POINTER_INDEX_SHIFT);
        ptrEvent(action, time);
    }

    private void ptrUp(int id, long time) {
        int idx = -1;
        for (int i = 0; i < pCount; i++) {
            if (pIds[i] == id) {
                idx = i;
                break;
            }
        }
        if (idx < 0) {
            return;
        }
        int action = pCount == 1 ? MotionEvent.ACTION_UP
                : MotionEvent.ACTION_POINTER_UP
                        | (idx << MotionEvent.ACTION_POINTER_INDEX_SHIFT);
        ptrEvent(action, time);
        for (int i = idx; i < pCount - 1; i++) {
            pIds[i] = pIds[i + 1];
        }
        pCount--;
    }

    private void ptrMove(long time) {
        ptrEvent(MotionEvent.ACTION_MOVE, time);
    }

    @Override
    public boolean dispatchKeyShortcutEvent(KeyEvent event) {
        return orig.dispatchKeyShortcutEvent(event);
    }

    @Override
    public boolean dispatchTrackballEvent(MotionEvent event) {
        return orig.dispatchTrackballEvent(event);
    }

    @Override
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
        return orig.dispatchPopulateAccessibilityEvent(event);
    }

    @Override
    public View onCreatePanelView(int featureId) {
        return orig.onCreatePanelView(featureId);
    }

    @Override
    public boolean onCreatePanelMenu(int featureId, Menu menu) {
        return orig.onCreatePanelMenu(featureId, menu);
    }

    @Override
    public void onContentChanged() {
        orig.onContentChanged();
    }

    @Override
    public boolean onSearchRequested() {
        return orig.onSearchRequested();
    }

    @Override
    public boolean onSearchRequested(SearchEvent searchEvent) {
        return orig.onSearchRequested(searchEvent);
    }

    @Override
    public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
        return orig.onWindowStartingActionMode(callback);
    }

    @Override
    public ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int type) {
        return orig.onWindowStartingActionMode(callback, type);
    }

    @Override
    public boolean onPreparePanel(int featureId, View menuView, Menu menu) {
        return orig.onPreparePanel(featureId, menuView, menu);
    }

    @Override
    public boolean onMenuOpened(int featureId, Menu menu) {
        return orig.onMenuOpened(featureId, menu);
    }

    @Override
    public boolean onMenuItemSelected(int featureId, MenuItem item) {
        return orig.onMenuItemSelected(featureId, item);
    }

    @Override
    public void onWindowAttributesChanged(WindowManager.LayoutParams attrs) {
        orig.onWindowAttributesChanged(attrs);
    }

    @Override
    public void onWindowFocusChanged(boolean hasFocus) {
        if (hasFocus) {
            syncCrosshair(); // back from the menu or a dialog: re-lock
        } else {
            AppPlayer player = player();
            View surface = player != null ? player.getSurfaceView() : null;
            if (captured && surface != null) {
                releaseCapture(surface); // the menu needs to see its cursor
            } else {
                long now = SystemClock.uptimeMillis();
                endLook(now);
                releaseClick(now);
            }
        }
        orig.onWindowFocusChanged(hasFocus);
    }

    @Override
    public void onAttachedToWindow() {
        startPoll(); // an activity may detach and re-attach without install
        orig.onAttachedToWindow();
    }

    @Override
    public void onDetachedFromWindow() {
        polling = false;
        MAIN.removeCallbacks(poll);
        orig.onDetachedFromWindow();
    }

    @Override
    public void onPanelClosed(int featureId, Menu menu) {
        orig.onPanelClosed(featureId, menu);
    }

    @Override
    public void onActionModeStarted(ActionMode mode) {
        orig.onActionModeStarted(mode);
    }

    @Override
    public void onActionModeFinished(ActionMode mode) {
        orig.onActionModeFinished(mode);
    }

    @Override
    public void onProvideKeyboardShortcuts(List<KeyboardShortcutGroup> shortcuts,
                                           Menu menu, int category) {
        orig.onProvideKeyboardShortcuts(shortcuts, menu, category);
    }

    @Override
    public void onPointerCaptureChanged(boolean hasCapture) {
        if (!hasCapture && captured) {
            captured = false;
            primed = false;
            long now = SystemClock.uptimeMillis();
            endLook(now);
            releaseClick(now); // a lost capture must not leave a finger held
            Log.d(TAG, "xh capture lost");
        }
        orig.onPointerCaptureChanged(hasCapture);
    }
}
