package modmenu;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;

/**
 * Turns the uncaught exception that is about to kill the process into
 * something the player can hand back: a stored report, a crash screen and a
 * notification that still opens it if the platform refuses to start an
 * activity from the background.
 *
 * The handler never swallows anything. It collects, hands the throwable to
 * whichever handler was installed before this one (Android's own logs and
 * kills the process exactly as it did without the mod), and only then
 * returns - so a bug in this class cannot turn a crash into a zombie
 * process, and a bug in the game is still reported as one.
 *
 * Installed from ModMenu.onAppCreate, the head of the game's own
 * Application.onCreate, so nothing that runs later can beat it to the
 * thread's handler. Any crash SDK that installs afterwards chains through
 * us; anything that installed before becomes our previous handler, which
 * keeps the same chain in either direction.
 */
final class CrashHandler implements Thread.UncaughtExceptionHandler {
    private static final String TAG = CrashReport.TAG;
    private static final int NOTIF_ID = 1072;

    /**
     * Two crashes closer together than this mean the crash screen is the
     * thing that crashed. The report is still written - it is the evidence -
     * but no second screen is opened, which is what stops a crash loop from
     * cycling through a screen that cannot render.
     */
    private static final long LOOP_WINDOW_MS = 10000;

    private static Context ctx;
    private static Thread.UncaughtExceptionHandler previous;
    private static boolean installed;
    private static boolean handling;

    private CrashHandler() {}

    static void install(Context context) {
        if (installed) {
            return;
        }
        try {
            ctx = context.getApplicationContext();
            previous = Thread.getDefaultUncaughtExceptionHandler();
            Thread.setDefaultUncaughtExceptionHandler(new CrashHandler());
            installed = true;
            Log.d(TAG, "crash handler installed");
        } catch (Throwable t) {
            // leave installed false: the next hook (onGameStart) retries
            Log.w(TAG, "crash handler not installed", t);
        }
    }

    @Override
    public void uncaughtException(Thread thread, Throwable error) {
        if (handling) {
            // a second crash while the first one was still being collected
            passThrough(thread, error);
            return;
        }
        handling = true;
        try {
            collect(thread, error);
        } catch (Throwable t) {
            Log.e(TAG, "crash collection failed", t);
        }
        passThrough(thread, error);
    }

    private void collect(Thread thread, Throwable error) {
        Context c = ctx;
        if (c == null) {
            Log.w(TAG, "no context, crash not reported");
            return;
        }
        long now = System.currentTimeMillis();
        boolean loop = now - CrashReport.lastLaunch(c) < LOOP_WINDOW_MS;
        CrashReport.stampLaunch(c, now);

        String path = CrashReport.pathFor(c, now);
        String text = CrashReport.build(c, thread, error, path,
                CrashReport.logcat());
        path = CrashReport.save(c, now, text);

        if (loop) {
            Log.w(TAG, "crash within " + LOOP_WINDOW_MS + "ms of the last one, "
                    + "report saved, screen skipped: " + path);
            return;
        }
        Intent intent = screenIntent(c, path, text, CrashReport.summary(error));
        startScreen(c, intent);
        postNotification(c, intent);
    }

    private static Intent screenIntent(Context c, String path, String text, String summary) {
        return new Intent(c, CrashActivity.class)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP)
                .putExtra(CrashActivity.EXTRA_PATH, path == null ? "" : path)
                .putExtra(CrashActivity.EXTRA_SUMMARY, summary)
                .putExtra(CrashActivity.EXTRA_TEXT, CrashReport.forIntent(text, path));
    }

    /**
     * The activity is started from a non-activity context on a thread that is
     * about to die, so the call has to reach system_server before we hand the
     * throwable on - which it does: startActivity is synchronous up to that
     * point, and the launch then proceeds in a freshly spawned process after
     * this one is gone.
     */
    private static void startScreen(Context c, Intent intent) {
        try {
            c.startActivity(intent);
            Log.d(TAG, "crash screen requested");
        } catch (Throwable t) {
            Log.w(TAG, "crash screen not started", t);
        }
    }

    /**
     * A background crash may not be allowed to start an activity on this
     * platform, and on Android 13 the player may not have granted the menu
     * its notification permission yet. Try both: one of them is enough, and
     * a failure of either must not cost the other.
     */
    private static void postNotification(Context c, Intent intent) {
        try {
            NotificationManager nm = (NotificationManager)
                    c.getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm == null) {
                return;
            }
            PendingIntent pi = PendingIntent.getActivity(c, 1, intent,
                    PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
            String title = I18n.t(c, "mod_crash_notif_title");
            String text = I18n.t(c, "mod_crash_notif_text");
            Notification n = Build.VERSION.SDK_INT >= 26
                    ? Api26.build(c, nm, title, text, pi)
                    : legacy(c, title, text, pi);
            // not cancelled on tap: the report outlives the tap on it
            nm.notify(NOTIF_ID, n);
            Log.d(TAG, "crash notification posted");
        } catch (Throwable t) {
            Log.w(TAG, "crash notification failed", t);
        }
    }

    // pre-26 path; the channel-taking Builder exists only on 26+
    private static Notification legacy(Context c, String title, String text,
                                       PendingIntent pi) {
        return new Notification.Builder(c)
                .setContentTitle(title)
                .setContentText(text)
                .setSmallIcon(c.getApplicationInfo().icon)
                .setContentIntent(pi)
                .build();
    }

    /** Hands the throwable on exactly as it would have travelled without us. */
    private void passThrough(Thread thread, Throwable error) {
        Thread.UncaughtExceptionHandler handler = previous;
        if (handler != null && handler != this) {
            try {
                handler.uncaughtException(thread, error);
                return;
            } catch (Throwable t) {
                Log.w(TAG, "previous handler failed", t);
            }
        }
        // no handler to hand to: reproduce what the platform would have done
        try {
            Log.e(TAG, "FATAL", error);
            android.os.Process.killProcess(android.os.Process.myPid());
            System.exit(10);
        } catch (Throwable t) {
            Log.w(TAG, "cannot terminate", t);
        }
    }
}
