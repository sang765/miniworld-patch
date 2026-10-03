package modmenu;

import android.app.Activity;
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
 * few minutes in case the permission dialog is still on screen.
 */
public final class ModMenu {
    private static final String PREF_NAME = "mw_mod_menu";
    private static final String KEY_WEB = "webview";
    private static final String KEY_HWID = "hwid";

    private static final String TITLE = "Mini World";
    private static final String TEXT = "Thông báo của mod menu, click để mở menu";
    private static final int NOTIF_ID = 1071;
    private static final long[] RETRY_MS = {2000, 5000, 10000, 20000, 40000, 80000, 160000};

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static volatile boolean webBlocked = true;
    private static volatile boolean hwidSpoof = true;

    private static Context appCtx;
    private static boolean loaded;
    private static boolean notifyStarted;
    private static boolean posted;
    private static int retryIdx;

    private ModMenu() {}

    /** Injected at the head of GoogleApplication.onCreate, before any stub can run. */
    public static void onAppCreate(Context ctx) {
        loadPrefs(ctx);
    }

    /** Injected at the head of AppPlayBaseActivity.onCreate. */
    public static void onGameStart(final Activity activity) {
        loadPrefs(activity);
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

    /** Toggle checks called by the WebView-block and HWID-spoof stubs. */
    public static boolean isWebBlocked() {
        return webBlocked;
    }

    public static boolean isSpoofOn() {
        return hwidSpoof;
    }

    public static void setWebBlocked(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_WEB, value).apply();
        webBlocked = value;
    }

    public static void setHwidSpoof(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_HWID, value).apply();
        hwidSpoof = value;
    }

    public static void loadPrefs(Context ctx) {
        if (loaded) {
            return;
        }
        appCtx = ctx.getApplicationContext();
        SharedPreferences sp = prefs(appCtx);
        webBlocked = sp.getBoolean(KEY_WEB, true);
        hwidSpoof = sp.getBoolean(KEY_HWID, true);
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
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK),
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
        NotificationManager nm = (NotificationManager)
                appCtx.getSystemService(Context.NOTIFICATION_SERVICE);
        Notification n = Build.VERSION.SDK_INT >= 26
                ? Api26.build(appCtx, nm, TITLE, TEXT, pi)
                : legacyBuild(pi);
        nm.notify(NOTIF_ID, n);
        posted = true;
    }

    // pre-26 path; the channel-taking Builder exists only on 26+
    private static Notification legacyBuild(PendingIntent pi) {
        return new Notification.Builder(appCtx)
                .setContentTitle(TITLE)
                .setContentText(TEXT)
                .setSmallIcon(appCtx.getApplicationInfo().icon)
                .setContentIntent(pi)
                .setAutoCancel(true)
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
