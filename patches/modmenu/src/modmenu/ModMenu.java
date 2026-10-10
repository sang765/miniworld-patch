package modmenu;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;

import java.lang.ref.WeakReference;

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
 * auto-cancelled - it stays as the menu's entry point - and the tap opens the
 * sheet on the live game window through ModMenuReceiver (see menuIntent).
 */
public final class ModMenu {
    private static final String PREF_NAME = "mw_mod_menu";
    private static final String KEY_WEB = "webview";
    private static final String KEY_HWID = "hwid";
    private static final String KEY_REWARD = "reward";
    private static final String KEY_ANTITRACK = "antitrack";
    private static final String KEY_GEN = "hwid_gen";
    private static final String KEY_GEN_AUTO = "hwid_auto";
    private static final String KEY_UNSAFE = "unsafe";

    private static final int NOTIF_ID = 1071;
    private static final long[] RETRY_MS = {2000, 5000, 10000, 20000, 40000, 80000, 160000};

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static volatile boolean webBlocked = true;
    private static volatile boolean hwidSpoof = true;
    private static volatile boolean rewardBypass = true;
    private static volatile boolean antiTrack = true;
    private static volatile boolean hwidAutoRotate;

    private static volatile boolean unsafe;

    private static volatile Context appCtx;
    /** The live game window, where the menu sheet attaches. */
    private static WeakReference<Activity> game = new WeakReference<Activity>(null);
    private static boolean loaded;
    private static boolean bootRotated;
    private static boolean notifyStarted;
    private static boolean posted;
    private static int retryIdx;

    private ModMenu() {}

    /** Injected at the head of GoogleApplication.onCreate, before any stub can run. */
    public static void onAppCreate(Context ctx) {
        loadPrefs(ctx);
        // step the identity once per process, before any spoof stub reads it
        if (hwidAutoRotate && !bootRotated) {
            bootRotated = true;
            rotateHwid(ctx);
        }
        // before anything else can throw: the crash screen is only useful
        // while the handler is still the one watching the threads
        CrashHandler.install(ctx);
    }

    /** Injected at the head of AppPlayBaseActivity.onCreate. */
    public static void onGameStart(final Activity activity) {
        loadPrefs(activity);
        // refreshed on every recreation, before the notify guard: the sheet
        // must always land on the window that is actually alive
        game = new WeakReference<Activity>(activity);
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

    /** The live game window, or null once it is finishing or destroyed. */
    static Activity gameActivity() {
        Activity a = game.get();
        if (a == null || a.isFinishing() || a.isDestroyed()) {
            return null;
        }
        return a;
    }

    /**
     * The menu's content intent. Normally a broadcast: ModMenuReceiver opens
     * the sheet as a dialog on the live game window, whose activity is never
     * paused - the script loop, rendering and voice chat keep running behind
     * the menu. Bouncing a notification tap into startActivity would also be
     * blocked as a trampoline on Android 12+. Only when there is no live
     * window to attach to does the old standalone activity get started, and
     * directly by the system through getActivity, which that rule allows.
     */
    static PendingIntent menuIntent(Context c, int requestCode, boolean openIds) {
        Intent i;
        int flags = PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE;
        if (gameActivity() != null) {
            i = new Intent(c, ModMenuReceiver.class)
                    .putExtra(ModMenuActivity.EXTRA_OPEN_IDS, openIds);
            return PendingIntent.getBroadcast(c, requestCode, i, flags);
        }
        i = new Intent(c, ModMenuActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP)
                .putExtra(ModMenuActivity.EXTRA_OPEN_IDS, openIds);
        return PendingIntent.getActivity(c, requestCode, i, flags);
    }

    /** Toggle checks called by the WebView-block, HWID, ad-reward and anti-track stubs. */
    public static boolean isWebBlocked() {
        return webBlocked;
    }

    public static boolean isSpoofOn() {
        return hwidSpoof;
    }

    public static boolean isRewardBypass() {
        return rewardBypass;
    }

    public static boolean isAntiTrack() {
        return antiTrack;
    }

    public static boolean isHwidAutoRotate() {
        return hwidAutoRotate;
    }

    /**
     * The gate for the high-ban-risk features: off until the player has
     * confirmed the warning dialog in the menu.
     */
    public static boolean isUnsafe() {
        return unsafe;
    }

    // commit, not apply: restartGame SIGKILLs the process right after a
    // toggle, and apply()'s async disk write can still be queued then
    public static void setWebBlocked(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_WEB, value).commit();
        webBlocked = value;
    }

    public static void setHwidSpoof(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_HWID, value).commit();
        hwidSpoof = value;
    }

    public static void setRewardBypass(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_REWARD, value).commit();
        rewardBypass = value;
    }

    public static void setAntiTrack(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_ANTITRACK, value).commit();
        antiTrack = value;
    }

    public static void setHwidAutoRotate(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_GEN_AUTO, value).commit();
        hwidAutoRotate = value;
    }

    public static void setUnsafe(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_UNSAFE, value).commit();
        unsafe = value;
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
        sp.edit().putInt(KEY_GEN, sp.getInt(KEY_GEN, 0) + 1).commit();
    }

    /**
     * Restart the game so a freshly rotated HWID is read from a clean login.
     * The relaunch is scheduled through AlarmManager before the process dies:
     * the alarm lives in the system server and fires after we are gone, so the
     * game cold-starts on its own instead of the player force-closing it.
     */
    public static void restartGame(Context ctx) {
        Context c = ctx.getApplicationContext();
        Intent i = c.getPackageManager().getLaunchIntentForPackage(c.getPackageName());
        AlarmManager am = (AlarmManager) c.getSystemService(Context.ALARM_SERVICE);
        if (i == null || am == null) {
            return; // no launcher intent or alarm service: nothing safe to do
        }
        i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        PendingIntent pi = PendingIntent.getActivity(c, (int) (System.currentTimeMillis() & 0x7fffffff),
                i, PendingIntent.FLAG_ONE_SHOT | PendingIntent.FLAG_IMMUTABLE);
        am.set(AlarmManager.RTC, System.currentTimeMillis() + 400, pi);
        Process.killProcess(Process.myPid());
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
        antiTrack = sp.getBoolean(KEY_ANTITRACK, true);
        hwidAutoRotate = sp.getBoolean(KEY_GEN_AUTO, false);
        unsafe = sp.getBoolean(KEY_UNSAFE, false);
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
        PendingIntent pi = menuIntent(appCtx, 0, false);
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
