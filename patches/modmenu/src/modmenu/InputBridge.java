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
 *   a fresh key-down, enableAllKeyBind() is evaluated in the game's Lua VM
 *   (pcall-wrapped so a missing global is a no-op) - the Android build is
 *   assumed to start with key binds disabled, which would otherwise eat the
 *   event silently.
 * - Mouse button/drag events reach the engine as source=MOUSE/toolType=
 *   MOUSE touches; the engine's touch path only recognises finger touches,
 *   so they are rewritten to SOURCE_TOUCHSCREEN/TOOL_TYPE_FINGER before
 *   being passed on - a mouse click becomes exactly a finger tap.
 * - Pointer-class generic motion (hover/scroll/right-click) is injected so
 *   the engine can react like the Windows build does.
 * - Crosshair mode (menu toggle or F1): the game surface gets pointer
 *   capture so the system cursor disappears, and mouse movement is rewritten
 *   into a center-screen finger drag - the engine's proven camera path.
 *   Mouse clicks land on the crosshair; a real finger touch or a lost focus
 *   ends the synthetic drag immediately.
 *
 * System keys (Back, volume, menu...) and real finger touches are delegated
 * untouched. Logging under the tag MWInput exists so a device-side LogFox
 * capture shows where an event stops: "installed" proves the wrapper is
 * live, "key ..." proves delivery and carries the engine's answer, "xh-in"
 * shows every event the window sees while crosshair mode is on, and the
 * one-shot "MWP3"/"HKUI" Lua reports say what the script side actually
 * exposes.
 */
public final class InputBridge implements Window.Callback {
    private static final String TAG = "MWInput";

    // Evaluates to the real enableAllKeyBind() when the global exists and to
    // a no-op function otherwise; the outer pcall absorbs either outcome, so
    // a wrong guess can never raise into the game's script host.
    private static final String KEYBIND_ON =
            "(function() pcall(enableAllKeyBind or function() end) end)";

    // One-shot report on the first fresh key-down. Round 2 proved none of the
    // keybind functions are Lua globals, and its pairs() walk hit the entry
    // cap before reaching an owner, so this version asks directly: every
    // global table/userdata is indexed by the API names (an __index chain
    // answers too), then the hotkey UI callback's defining file is located
    // through debug.getinfo and its source dumped through io.open when the
    // sandbox allows it. Reported through error(): print never reaches
    // logcat on this build - the engine only logs [script error].
    private static final String PROBE =
            "(function()"
                    + " local out,nh={},0"
                    + " local names={\"setOneKeyBindCode\",\"getContrlMode\",\"getHotkeyName\",\"appalyGameSetData\",\"checkCmd\",\"enableAllKeyBind\",\"pushCommand\",\"getCurrentGameMapId\",\"getCurWorldId\"}"
                    + " for k,v in pairs(_G) do local t=type(v)"
                            + " if t==\"table\" or t==\"userdata\" then"
                                    + " for i=1,#names do local nm=names[i]"
                                            + " local ok,f=pcall(function() return v[nm] end)"
                                            + " if ok and type(f)==\"function\" then nh=nh+1"
                                                    + " if nh<=30 then out[#out+1]=k..\".\"..nm end end end end end"
                    + " local s=\"MWP3|n=\"..nh..\"|\"..table.concat(out,\",\")"
                    + " if type(debug)==\"table\" and type(debug.getinfo)==\"function\" then"
                            + " local cs={\"GameSetFrameHotkey_OnShow\",\"RecoveryDefaultHotKey\",\"LoadHotkeyType\",\"GameSetFrameHotkey_OnHide\"}"
                            + " for i=1,#cs do local f=rawget(_G,cs[i])"
                                    + " if type(f)==\"function\" then"
                                            + " local ok,inf=pcall(debug.getinfo,f,\"S\")"
                                            + " if ok and type(inf)==\"table\" and type(inf.source)==\"string\""
                                                    + " and inf.source:sub(1,1)==\"@\" then"
                                                    + " local p=inf.source:sub(2)"
                                                    + " s=s..\"|src=\"..cs[i]..\":\"..p"
                                                    + " local fh=(type(io)==\"table\" and io.open) and io.open(p,\"r\")"
                                                    + " if fh then local d=fh:read(2300) fh:close()"
                                                            + " if d then s=s..\"|lua=\"..d end end"
                                                    + " break end end end"
                            + " else s=s..\"|debug=nil\" end"
                    + " if type(io)~=\"table\" or not io.open then s=s..\"|io=nil\" end"
                    + " error(s:sub(1,3000))"
                    + " end)";

    // Opens the game's own hotkey settings screen once, right before the
    // probe: the callback ships with the UI scripts, so a successful open
    // proves the PC keybind panel is reachable on Android, lets the tester
    // try real rebinding, and lazy-loads the module the probe then scans.
    private static final String OPEN_HOTKEY =
            "(function() local f=rawget(_G,\"GameSetFrameHotkey_OnShow\")"
                    + " if type(f)~=\"function\" then error(\"HKUI|missing\") end"
                    + " local ok,e=pcall(f)"
                    + " error(\"HKUI|ok=\"..tostring(ok)..\" e=\"..tostring(e))"
                    + " end)";

    private static final long ENABLE_WARMUP_MS = 5000;
    private static final long ENABLE_INTERVAL_MS = 2000;
    private static final long CAPTURE_RETRY_MS = 1500;
    private static final long LOOK_IDLE_MS = 120;

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
    private long lastArrLog;
    private long lastDeltaLog;
    private long lastInLog;
    private final Runnable lookEnd = new Runnable() {
        @Override
        public void run() {
            endLook(SystemClock.uptimeMillis());
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
        window.setCallback(new InputBridge(current, activity));
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
                // panel first: a successful open lazy-loads the hotkey module
                // the probe then scans
                CommonNatives.javaCallLuaEvent(OPEN_HOTKEY, new Object[0]);
                CommonNatives.javaCallLuaEvent(PROBE, new Object[0]);
                Log.d(TAG, "probe fired");
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
                    Log.d(TAG, "key " + event.getKeyCode() + "/" + event.getAction()
                            + " eng=" + eng);
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
        MotionEvent.PointerProperties p = new MotionEvent.PointerProperties();
        p.id = 0;
        p.toolType = MotionEvent.TOOL_TYPE_FINGER;
        MotionEvent.PointerCoords c = new MotionEvent.PointerCoords();
        c.x = x;
        c.y = y;
        c.pressure = 1f;
        c.size = 0.05f;
        MotionEvent m = MotionEvent.obtain(lookDownTime, time, action, 1,
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
        orig.onAttachedToWindow();
    }

    @Override
    public void onDetachedFromWindow() {
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
