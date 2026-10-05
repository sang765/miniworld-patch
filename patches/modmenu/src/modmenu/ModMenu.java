package modmenu;

import android.app.Activity;
import android.app.Application;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;

/**
 * State, startup hooks and notification logic for the mod menu.
 *
 * onAppCreate / onGameStart are injected at the head of GoogleApplication and
 * AppPlayBaseActivity onCreate; the WebView/HWID stubs poll isWebBlocked /
 * isSpoofOn. Everything is static: the classes live in classes8 and are loaded
 * through the game's MultiDex install, which finishes before either hook runs.
 *
 * The notification is posted from a Handler task rather than directly inside
 * onCreate so it lands after resume, and on Android 13+ it is retried over a
 * few minutes in case the permission dialog is still on screen. It is not
 * auto-cancelled - it stays as the menu's entry point - and the intent is
 * single-top, so tapping it while the menu is open just returns to it.
 */
public final class ModMenu {
    private static final String PREF_NAME = "mw_mod_menu";
    private static final String KEY_WEB = "webview";
    private static final String KEY_HWID = "hwid";
    private static final String KEY_REWARD = "reward";
    private static final String KEY_GEN = "hwid_gen";
    private static final String KEY_KB = "kbmouse";
    private static final String KEY_XH = "crosshair";

    private static final int NOTIF_ID = 1071;
    private static final long[] RETRY_MS = {2000, 5000, 10000, 20000, 40000, 80000, 160000};

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static volatile boolean webBlocked = true;
    private static volatile boolean hwidSpoof = true;
    private static volatile boolean rewardBypass = true;
    private static volatile boolean kbMouse = true;
    private static volatile boolean crosshair;

    private static volatile Context appCtx;
    private static boolean loaded;
    private static boolean notifyStarted;
    private static boolean posted;
    private static int retryIdx;

    private ModMenu() {}

    /** Injected at the head of GoogleApplication.onCreate, before any stub can run. */
    public static void onAppCreate(Context ctx) {
        loadPrefs(ctx);
        // before anything else can throw: the crash screen is only useful
        // while the handler is still the one watching the threads
        CrashHandler.install(ctx);
        if (ctx instanceof Application) {
            ((Application) ctx).registerActivityLifecycleCallbacks(
                    new InputBridge.Lifecycle());
        }
    }

    /** Injected at the head of AppPlayBaseActivity.onCreate. */
    public static void onGameStart(final Activity activity) {
        loadPrefs(activity);
        InputBridge.install(activity);
        if (notifyStarted) {
            return;
        }
        notifyStarted = true;
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                beginNotify(activity);
            }
        });
    }

    /** Toggle checks called by the WebView-block, HWID and ad-reward stubs. */
    public static boolean isWebBlocked() {
        return webBlocked;
    }

    public static boolean isSpoofOn() {
        return hwidSpoof;
    }

    public static boolean isRewardBypass() {
        return rewardBypass;
    }

    public static void setWebBlocked(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_WEB, value).apply();
        webBlocked = value;
    }

    public static void setHwidSpoof(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_HWID, value).apply();
        hwidSpoof = value;
    }

    public static void setRewardBypass(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_REWARD, value).apply();
        rewardBypass = value;
    }

    public static boolean isKbMouseOn() {
        return kbMouse;
    }

    public static void setKbMouse(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_KB, value).apply();
        kbMouse = value;
    }

    public static boolean isCrosshairOn() {
        return crosshair;
    }

    public static void setCrosshair(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_XH, value).apply();
        crosshair = value;
    }

    /**
     * Called from every spoof stub with the baked generation-0 constant.
     * Reads the stored generation on each call so a rotation from the menu
     * applies without restarting the process.
     */
    public static String spoofValue(String def) {
        Context c = appCtx;
        if (c == null) {
            return def;
        }
        return Hwid.rotate(def, prefs(c).getInt(KEY_GEN, 0));
    }

    /** Menu button: step the identity to a fresh rotation. */
    public static void rotateHwid(Context ctx) {
        SharedPreferences sp = prefs(ctx);
        sp.edit().putInt(KEY_GEN, sp.getInt(KEY_GEN, 0) + 1).apply();
    }

    public static void loadPrefs(Context ctx) {
        if (loaded) {
            return;
        }
        appCtx = ctx.getApplicationContext();
        SharedPreferences sp = prefs(appCtx);
        webBlocked = sp.getBoolean(KEY_WEB, true);
        hwidSpoof = sp.getBoolean(KEY_HWID, true);
        rewardBypass = sp.getBoolean(KEY_REWARD, true);
        kbMouse = sp.getBoolean(KEY_KB, true);
        crosshair = sp.getBoolean(KEY_XH, false);
        loaded = true;
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
    }

    private static void beginNotify(Activity activity) {
        if (Build.VERSION.SDK_INT >= 33 && !Api33.canPost(activity)) {
            Api33.request(activity);
        }
        tryPost();
        scheduleRetry();
    }

    private static void tryPost() {
        if (posted) {
            return;
        }
        if (Build.VERSION.SDK_INT >= 33 && !Api33.canPost(appCtx)) {
            return;
        }
        PendingIntent pi = PendingIntent.getActivity(appCtx, 0,
                new Intent(appCtx, ModMenuActivity.class)
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK
                                | Intent.FLAG_ACTIVITY_SINGLE_TOP),
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        NotificationManager nm = (NotificationManager)
                appCtx.getSystemService(Context.NOTIFICATION_SERVICE);
        // resolved here rather than in a static: the class can load before
        // appCtx is set, and resource selection needs the configuration
        String title = I18n.t(appCtx, "mod_notif_title");
        String text = I18n.t(appCtx, "mod_notif_text");
        Notification n = Build.VERSION.SDK_INT >= 26
                ? Api26.build(appCtx, nm, title, text, pi)
                : legacyBuild(title, text, pi);
        nm.notify(NOTIF_ID, n);
        posted = true;
    }

    // pre-26 path; the channel-taking Builder exists only on 26+
    private static Notification legacyBuild(String title, String text, PendingIntent pi) {
        return new Notification.Builder(appCtx)
                .setContentTitle(title)
                .setContentText(text)
                .setSmallIcon(appCtx.getApplicationInfo().icon)
                .setContentIntent(pi)
                .build();
    }

    private static void scheduleRetry() {
        if (posted || retryIdx >= RETRY_MS.length) {
            return;
        }
        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                tryPost();
                scheduleRetry();
            }
        }, RETRY_MS[retryIdx++]);
    }
}
