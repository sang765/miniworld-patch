package modmenu;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.SystemClock;
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
 *
 * System keys (Back, volume, menu...) and real finger touches are delegated
 * untouched. Logging under the tag MWInput exists so a device-side LogFox
 * capture shows where an event stops: "installed" proves the wrapper is
 * live, "key ..." proves delivery and carries the engine's answer.
 */
public final class InputBridge implements Window.Callback {
    private static final String TAG = "MWInput";

    // Evaluates to the real enableAllKeyBind() when the global exists and to
    // a no-op function otherwise; the outer pcall absorbs either outcome, so
    // a wrong guess can never raise into the game's script host.
    private static final String KEYBIND_ON =
            "(function() pcall(enableAllKeyBind or function() end) end)";

    private static final long ENABLE_WARMUP_MS = 5000;
    private static final long ENABLE_INTERVAL_MS = 2000;

    private final Window.Callback orig;
    private final Activity activity;
    private final long installedAt = SystemClock.uptimeMillis();
    private long lastEnable;

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
        } catch (RuntimeException e) {
            Log.d(TAG, "keybind-on failed: " + e);
        }
    }

    @Override
    public boolean dispatchKeyEvent(KeyEvent event) {
        if (ModMenu.isKbMouseOn() && !keepAndroid(event.getKeyCode())) {
            AppPlayer player = player();
            if (player == null) {
                return orig.dispatchKeyEvent(event);
            }
            boolean freshDown = event.getAction() == KeyEvent.ACTION_DOWN
                    && event.getRepeatCount() == 0;
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
        return orig.dispatchKeyEvent(event);
    }

    @Override
    public boolean dispatchGenericMotionEvent(MotionEvent event) {
        if (ModMenu.isKbMouseOn()
                && (event.getSource() & InputDevice.SOURCE_CLASS_POINTER) != 0) {
            AppPlayer player = player();
            if (player != null) {
                boolean eng = player.injectEvent(event);
                if (event.getActionMasked() != MotionEvent.ACTION_HOVER_MOVE) {
                    Log.d(TAG, "motion act=" + event.getActionMasked()
                            + " src=" + event.getSource() + " eng=" + eng);
                }
                return true;
            }
        }
        return orig.dispatchGenericMotionEvent(event);
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent event) {
        if (ModMenu.isKbMouseOn()
                && (event.getSource() & InputDevice.SOURCE_MOUSE) == InputDevice.SOURCE_MOUSE) {
            MotionEvent finger = asFinger(event);
            if (finger != null) {
                int act = event.getActionMasked();
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
     * state, which is exactly what the engine's touch path accepts.
     */
    private static MotionEvent asFinger(MotionEvent src) {
        try {
            int count = src.getPointerCount();
            MotionEvent.PointerProperties[] props =
                    new MotionEvent.PointerProperties[count];
            MotionEvent.PointerCoords[] coords = new MotionEvent.PointerCoords[count];
            for (int i = 0; i < count; i++) {
                MotionEvent.PointerProperties p = new MotionEvent.PointerProperties();
                p.id = src.getPointerId(i);
                p.toolType = MotionEvent.TOOL_TYPE_FINGER;
                props[i] = p;
                MotionEvent.PointerCoords c = new MotionEvent.PointerCoords();
                c.x = src.getX(i);
                c.y = src.getY(i);
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
        orig.onPointerCaptureChanged(hasCapture);
    }
}
