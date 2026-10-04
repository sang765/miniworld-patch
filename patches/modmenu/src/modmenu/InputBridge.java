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
 * - Keys are injected into AppPlayer.injectEvent and consumed. Right before
 *   a fresh key-down, the engine's keybind master switch is invoked on the
 *   settings tables that own it (GameSettingsMgr/GameSettings - located by
 *   the round-5 Lua probe; a bare global never existed) - pcall-wrapped so
 *   a wrong guess is a no-op and can never raise into the script host.
 * - Mouse button/drag events reach the engine as source=MOUSE/toolType=
 *   MOUSE touches; the engine's touch path only recognises finger touches,
 *   so they are rewritten to SOURCE_TOUCHSCREEN/TOOL_TYPE_FINGER before
 *   being passed on - a mouse click becomes exactly a finger tap.
 * - Pointer-class generic motion (hover/scroll/right-click) is injected so
 *   the engine can react like the Windows build does.
 * - Crosshair mode (menu toggle or F1): the game surface gets pointer
 *   capture so the system cursor disappears, and mouse movement is rewritten
 *   into a center-screen finger drag - the engine's proven camera path.
 *   Captured movement never reaches the window callback (rounds 4 and 5 saw
 *   zero motion events while captured), it is delivered to the captured view
 *   instead, so the surface also gets an OnCapturedPointerListener feeding
 *   the same camera path, rebuilding button presses at the crosshair and
 *   forwarding scroll. A real finger touch or a lost focus ends the
 *   synthetic drag immediately. While the bridge is on, a slow poll asks the
 *   Lua VM whether a map is active (the script reports through a two-byte
 *   state file; io.open is the only channel back into Java) and turns the
 *   crosshair on/off across that transition - manual F1 still wins in
 *   between.
 * - F2 cycles the game's own control scheme (the classical/rocker pair
 *   ControlMoveSwitch_OnClick toggles) and reports the values it saw
 *   through error().
 *
 * System keys (Back, volume, menu...) and real finger touches are delegated
 * untouched. Logging under the tag MWInput exists so a device-side LogFox
 * capture shows where an event stops: "installed" proves the wrapper is
 * live, "key ..." proves delivery and carries the engine's answer plus the
 * originating device/source, "xh-in" shows every event the window sees
 * while crosshair mode is on, and the one-shot "HKUI2"/"MWP4"/"MWP5" Lua
 * reports (first fresh key-down) open the real settings window, dump the
 * control-mode API and the whole keybind table and test the state-file
 * channel - print() never reaches logcat on this build, error() does.
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
                    + " local cl,cl2,cm,cm2"
                    + " local okc,cfg=pcall(function() return GetIWorldConfig() end)"
                    + " if not okc or cfg==nil then error('MWP6|cfg=no',0) end"
                    + " pcall(function() cl=cfg:getGameData('classical') end)"
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
                    + " pcall(function() cm2=GetClientInfo():getContrlMode() end)"
                    + " error('MWP6|cl='..tostring(cl)..'->'..tostring(cl2)"
                    + " ..' cm='..tostring(cm)..'->'..tostring(cm2)"
                    + " ..'|set='..tostring(ok1)..' ui='..tostring(ok2)"
                    + " ..' ap='..tostring(ok3),0)"
                    + " end)";

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
    private boolean looking; // a synthetic finger drag session is open
    private boolean mouseTouching; // a mouse click is held as a touch
    private float lookX;
    private float lookY;
    private long lookDownTime;
    private long clickDown; // downTime of the currently held centre click
    private long lastArrLog;
    private long lastDeltaLog;
    private long lastInLog;
    private boolean polling;
    private String statePath; // state file candidate 1 (external files dir)
    private String statePath2; // candidate 2 (internal files dir)
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
            if (mouseTouching) { // a release event was lost: never wedge the touch
                dispatchCenter(MotionEvent.ACTION_UP, clickDown,
                        SystemClock.uptimeMillis());
                mouseTouching = false;
                Log.d(TAG, "center-touch auto-up");
            }
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
                // consumed even when the engine declines it: letting the event
                // continue into the view path would hand the same key to
                // injectEvent a second time through AppPlayer.onKeyDown
                boolean eng = player.injectEvent(event);
                if (freshDown || event.getAction() == KeyEvent.ACTION_UP) {
                    // dev/src/rep identify who produced the key: rounds 4 and 5
                    // saw unexplained DPAD bursts only inside the capture window
                    Log.d(TAG, "key " + event.getKeyCode() + "/" + event.getAction()
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
            if (center && act == MotionEvent.ACTION_MOVE
                    && event.getButtonState() == 0) {
                // a captured pointer can report its movement on the touch path
                // instead of the generic one - same delta source for the camera
                long now = SystemClock.uptimeMillis();
                if (now - lastArrLog > 500) {
                    lastArrLog = now;
                    Log.d(TAG, "xh-t x=" + event.getX() + " y=" + event.getY());
                }
                lookBy(event);
                return true;
            }
            if (center && act == MotionEvent.ACTION_DOWN) {
                endLook(event.getEventTime()); // click opens its own touch
            }
            MotionEvent finger = asFinger(event, center);
            if (finger != null) {
                boolean handled = orig.dispatchTouchEvent(finger);
                finger.recycle();
                if (act == MotionEvent.ACTION_DOWN) {
                    mouseTouching = true;
                } else if (act == MotionEvent.ACTION_UP
                        || act == MotionEvent.ACTION_CANCEL) {
                    mouseTouching = false; // a cancel must never wedge the look
                }
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
     * is the missing half: same camera path as hover, buttons rebuilt as
     * centre touches, scroll handed to the engine.
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
                    lookBy(e);
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
        endLook(SystemClock.uptimeMillis());
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
     * MWP5: the keybind table. getKeyName over both keycode spaces says how
     * the engine numbers keys (VK vs Android decides how the bridge must
     * translate), GetGameHotkey per action says what is bound right now
     * (d+default when unbound), and the io test says whether the state-file
     * channel the poller needs is writable.
     */
    private String probeB() {
        if (statePath == null) {
            resolvePaths();
        }
        String p1 = luaStr(statePath);
        String p2 = statePath2 != null ? luaStr(statePath2) : "";
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
     * A mouse button while the pointer is captured never reaches the touch
     * path (round 5 saw zero clicks inside the capture window), so the button
     * is rebuilt as a finger touch at the crosshair. The safety timeout
     * closes it when the matching release event is lost.
     */
    private void centerTouch(long time, boolean down) {
        if (down) {
            if (mouseTouching) {
                return;
            }
            endLook(time);
            mouseTouching = true;
            clickDown = time;
            dispatchCenter(MotionEvent.ACTION_DOWN, time, time);
            MAIN.removeCallbacks(clickEnd);
            MAIN.postDelayed(clickEnd, CLICK_HOLD_MS);
            Log.d(TAG, "center-touch down");
        } else {
            if (!mouseTouching) {
                return;
            }
            MAIN.removeCallbacks(clickEnd);
            dispatchCenter(MotionEvent.ACTION_UP, clickDown, time);
            mouseTouching = false;
            Log.d(TAG, "center-touch up");
        }
    }

    private void dispatchCenter(int action, long downTime, long time) {
        DisplayMetrics dm = activity.getResources().getDisplayMetrics();
        dispatchFinger(action, downTime, time, dm.widthPixels / 2f,
                dm.heightPixels / 2f);
    }

    /**
     * Turns a mouse movement into the engine's camera path: a finger drag
     * around the screen centre. Deltas come from the tracked pointer
     * position, so capture or hover both work; when the virtual finger hits
     * an edge it is lifted and re-opened at the centre, which reads as a
     * fresh swipe with the same delta the next move carries.
     */
    private void lookBy(MotionEvent event) {
        if (mouseTouching) {
            return; // a held mouse button already drags as a touch
        }
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
        long now = SystemClock.uptimeMillis();
        if (dx == 0f && dy == 0f) {
            if (now - lastDeltaLog > 500) {
                lastDeltaLog = now;
                Log.d(TAG, "xh-d0 x=" + x + " y=" + y);
            }
            return;
        }
        if (now - lastDeltaLog > 500) {
            lastDeltaLog = now;
            Log.d(TAG, "xh-d dx=" + dx + " dy=" + dy);
        }
        long t = event.getEventTime();
        DisplayMetrics dm = activity.getResources().getDisplayMetrics();
        if (!looking) {
            lookX = dm.widthPixels / 2f;
            lookY = dm.heightPixels / 2f;
            lookDownTime = t;
            dispatchSynth(MotionEvent.ACTION_DOWN, lookX, lookY, t);
            looking = true;
        }
        lookX += dx;
        lookY += dy;
        if (lookX < 2f || lookX > dm.widthPixels - 3f
                || lookY < 2f || lookY > dm.heightPixels - 3f) {
            dispatchSynth(MotionEvent.ACTION_UP, lookX, lookY, t);
            lookX = dm.widthPixels / 2f;
            lookY = dm.heightPixels / 2f;
            lookDownTime = t;
            dispatchSynth(MotionEvent.ACTION_DOWN, lookX, lookY, t);
        }
        dispatchSynth(MotionEvent.ACTION_MOVE, lookX, lookY, t);
        MAIN.removeCallbacks(lookEnd);
        MAIN.postDelayed(lookEnd, LOOK_IDLE_MS);
    }

    /** Ends the synthetic drag, if one is open. */
    private void endLook(long t) {
        MAIN.removeCallbacks(lookEnd);
        if (!looking) {
            return;
        }
        dispatchSynth(MotionEvent.ACTION_UP, lookX, lookY, t);
        looking = false;
    }

    private void dispatchSynth(int action, float x, float y, long time) {
        dispatchFinger(action, lookDownTime, time, x, y);
    }

    private void dispatchFinger(int action, long downTime, long time,
                                float x, float y) {
        MotionEvent.PointerProperties p = new MotionEvent.PointerProperties();
        p.id = 0;
        p.toolType = MotionEvent.TOOL_TYPE_FINGER;
        MotionEvent.PointerCoords c = new MotionEvent.PointerCoords();
        c.x = x;
        c.y = y;
        c.pressure = 1f;
        c.size = 0.05f;
        MotionEvent m = MotionEvent.obtain(downTime, time, action, 1,
                new MotionEvent.PointerProperties[]{p},
                new MotionEvent.PointerCoords[]{c},
                0, 0, 1f, 1f, 0, 0, InputDevice.SOURCE_TOUCHSCREEN, 0);
        orig.dispatchTouchEvent(m);
        m.recycle();
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
                endLook(SystemClock.uptimeMillis());
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
            endLook(SystemClock.uptimeMillis());
            Log.d(TAG, "xh capture lost");
        }
        orig.onPointerCaptureChanged(hasCapture);
    }
}
