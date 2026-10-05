package modmenu;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.os.SystemClock;
import android.util.Log;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;

/**
 * Collects, stores and reads the text CrashActivity puts on screen.
 *
 * Every call here happens while the process is on its way down, so nothing
 * is allowed to throw: a logcat that will not read, a storage that will not
 * mount or a package that will not resolve all degrade to a line in the
 * report instead of costing the player the report itself. Reports are
 * written to the app's private files directory - always writable, no
 * permission, survives the process - named after their own timestamp so the
 * newest ones sort first and the oldest can be pruned.
 */
final class CrashReport {
    static final String TAG = "MWCrash";
    static final String DIR_NAME = "mwcrash";
    private static final String MARKER = "launch.txt";
    static final int MAX_STORED = 10;

    private static final int LOGCAT_LINES = 200;
    private static final int LOGCAT_CHARS = 32 * 1024;
    private static final int TRACE_CHARS = 16 * 1024;
    /** Intent extras ride a binder transaction: keep them far under its limit. */
    private static final int INTENT_CHARS = 48 * 1024;
    private static final int READ_CHARS = 512 * 1024;

    private CrashReport() {}

    /** The report directory, created on demand; null when it cannot exist. */
    static File dir(Context ctx) {
        try {
            File d = new File(ctx.getFilesDir(), DIR_NAME);
            if (d.isDirectory() || d.mkdirs()) {
                return d;
            }
        } catch (Throwable t) {
            Log.w(TAG, "report dir unavailable", t);
        }
        return null;
    }

    /** Where the report stamped `ts` belongs, before it is written. */
    static String pathFor(Context ctx, long ts) {
        File d = dir(ctx);
        return d == null ? null
                : new File(d, "crash-" + ts + ".txt").getAbsolutePath();
    }

    static String build(Context ctx, Thread thread, Throwable error,
                        String path, String logcat) {
        StringBuilder sb = new StringBuilder(8192);
        sb.append("=== Mini World mod - crash report ===\n");
        sb.append("time: ").append(clock()).append('\n');
        sb.append("elapsed: ").append(SystemClock.elapsedRealtime()).append(" ms\n");
        // android.os.Process, spelled out: java.lang.Process below is the logcat
        sb.append("pid: ").append(android.os.Process.myPid()).append('\n');
        if (path != null) {
            sb.append("file: ").append(path).append('\n');
        }

        sb.append("\n-- app --\n");
        sb.append("package: ").append(ctx.getPackageName()).append('\n');
        try {
            PackageInfo pi = ctx.getPackageManager().getPackageInfo(ctx.getPackageName(), 0);
            sb.append("version: ").append(pi.versionName)
                    .append(" (").append(pi.versionCode).append(")\n");
        } catch (Throwable t) {
            sb.append("version: unknown (").append(t).append(")\n");
        }
        String process = ctx.getApplicationInfo().processName;
        sb.append("process: ").append(process == null ? ctx.getPackageName() : process).append('\n');
        sb.append("mods: webview=").append(flag(ModMenu.isWebBlocked()))
                .append(" hwid=").append(flag(ModMenu.isSpoofOn()))
                .append(" reward=").append(flag(ModMenu.isRewardBypass()))
                .append(" kbdmouse=").append(flag(ModMenu.isKbMouseOn()))
                .append(" crosshair=").append(flag(ModMenu.isCrosshairOn())).append('\n');

        sb.append("\n-- device --\n");
        sb.append("manufacturer: ").append(Build.MANUFACTURER).append('\n');
        sb.append("model: ").append(Build.MODEL).append('\n');
        sb.append("device: ").append(Build.DEVICE).append('\n');
        sb.append("product: ").append(Build.PRODUCT).append('\n');
        sb.append("hardware: ").append(Build.HARDWARE).append('\n');
        sb.append("android: ").append(Build.VERSION.RELEASE)
                .append(" (sdk ").append(Build.VERSION.SDK_INT).append(")\n");
        sb.append("abi: ").append(abis()).append('\n');
        sb.append("locale: ").append(Locale.getDefault()).append('\n');
        sb.append("fingerprint: ").append(Build.FINGERPRINT).append('\n');

        sb.append("\n-- thread --\n");
        if (thread == null) {
            sb.append("unknown\n");
        } else {
            sb.append(thread.getName()).append(" (id=").append(thread.getId())
                    .append(") state=").append(thread.getState())
                    .append(" priority=").append(thread.getPriority()).append('\n');
        }

        sb.append("\n-- exception --\n").append(trace(error));

        sb.append("\n-- logcat (this app, last ").append(LOGCAT_LINES).append(" lines) --\n");
        if (logcat == null || logcat.length() == 0) {
            sb.append("unavailable - the platform did not let this app read its own log\n");
        } else {
            sb.append(logcat);
            if (logcat.charAt(logcat.length() - 1) != '\n') {
                sb.append('\n');
            }
        }
        return sb.toString();
    }

    static String summary(Throwable error) {
        if (error == null) {
            return "unknown error";
        }
        String s = String.valueOf(error);
        return s.length() > 160 ? s.substring(0, 160) : s;
    }

    /** Writes the report and returns the path, or null when nothing landed. */
    static String save(Context ctx, long ts, String text) {
        String path = pathFor(ctx, ts);
        if (path == null || text == null) {
            return null;
        }
        try {
            FileOutputStream out = new FileOutputStream(path);
            try {
                out.write(text.getBytes("UTF-8"));
            } finally {
                out.close();
            }
            prune(dir(ctx));
            return path;
        } catch (Throwable t) {
            Log.w(TAG, "report not written to " + path, t);
            return null;
        }
    }

    /** Reads a stored report; null when it is not there or not readable. */
    static String read(String path) {
        if (path == null || path.length() == 0) {
            return null;
        }
        try {
            File f = new File(path);
            if (!f.isFile()) {
                return null;
            }
            byte[] buf = new byte[(int) Math.min(f.length(), READ_CHARS)];
            FileInputStream in = new FileInputStream(f);
            try {
                int off = 0;
                while (off < buf.length) {
                    int n = in.read(buf, off, buf.length - off);
                    if (n < 0) {
                        break;
                    }
                    off += n;
                }
                return new String(buf, 0, off, "UTF-8");
            } finally {
                in.close();
            }
        } catch (Throwable t) {
            Log.w(TAG, "report not readable: " + path, t);
            return null;
        }
    }

    /** The report as it travels in an Intent, cut on a code-point boundary. */
    static String forIntent(String text, String path) {
        if (text == null) {
            return "";
        }
        if (text.length() <= INTENT_CHARS) {
            return text;
        }
        int cut = INTENT_CHARS;
        if (Character.isLowSurrogate(text.charAt(cut))) {
            cut--;
        }
        return text.substring(0, cut)
                + "\n... (truncated - full report: " + path + ")\n";
    }

    /**
     * The log the crash was sitting in, best effort.
     *
     * Read on its own thread and joined with a deadline: logcat has to drain
     * and exit, but if it ever did not, the report must still reach the
     * screen rather than wait for it. A thread abandoned here dies with the
     * process seconds later anyway.
     */
    static String logcat() {
        final StringBuilder out = new StringBuilder();
        Thread reader = new Thread(new Runnable() {
            @Override
            public void run() {
                Process process = null;
                try {
                    process = new ProcessBuilder("/system/bin/logcat", "-d",
                            "-v", "time", "-t", String.valueOf(LOGCAT_LINES))
                            .redirectErrorStream(true).start();
                    BufferedReader in = new BufferedReader(
                            new InputStreamReader(process.getInputStream(), "UTF-8"));
                    try {
                        String line;
                        int lines = 0;
                        while (lines < LOGCAT_LINES && out.length() < LOGCAT_CHARS
                                && (line = in.readLine()) != null) {
                            synchronized (out) {
                                out.append(line).append('\n');
                            }
                            lines++;
                        }
                    } finally {
                        in.close();
                    }
                } catch (Throwable t) {
                    // restricted or missing: the report says so instead
                } finally {
                    if (process != null) {
                        process.destroy();
                    }
                }
            }
        }, "mw-crash-logcat");
        reader.setDaemon(true);
        try {
            reader.start();
            reader.join(2000);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        synchronized (out) {
            return out.toString();
        }
    }

    /**
     * When the crash screen was last requested, 0 if never. Two crashes
     * inside LOOP_WINDOW_MS mean the screen itself is what crashed, so the
     * next one is reported but does not open it again.
     */
    static long lastLaunch(Context ctx) {
        File d = dir(ctx);
        if (d == null) {
            return 0;
        }
        try {
            String raw = read(new File(d, MARKER).getAbsolutePath());
            return raw == null ? 0 : Long.parseLong(raw.trim());
        } catch (Throwable t) {
            return 0;
        }
    }

    static void stampLaunch(Context ctx, long ts) {
        File d = dir(ctx);
        if (d == null) {
            return;
        }
        try {
            FileOutputStream out = new FileOutputStream(new File(d, MARKER));
            try {
                out.write(Long.toString(ts).getBytes("UTF-8"));
            } finally {
                out.close();
            }
        } catch (Throwable t) {
            Log.w(TAG, "launch marker not written", t);
        }
    }

    private static void prune(File dir) {
        if (dir == null) {
            return;
        }
        File[] files = dir.listFiles();
        if (files == null) {
            return;
        }
        Arrays.sort(files);
        int stored = 0;
        for (File f : files) {
            if (f.getName().startsWith("crash-")) {
                stored++;
            }
        }
        int excess = stored - MAX_STORED;
        for (File f : files) {
            if (excess <= 0) {
                return;
            }
            if (f.getName().startsWith("crash-") && f.delete()) {
                excess--;
            }
        }
    }

    private static String trace(Throwable error) {
        if (error == null) {
            return "unknown (no throwable reached the handler)\n";
        }
        String s = Log.getStackTraceString(error);
        if (s == null || s.length() == 0) {
            s = String.valueOf(error) + '\n';
        }
        if (s.length() > TRACE_CHARS) {
            s = s.substring(0, TRACE_CHARS) + "\n... (stack trace truncated)\n";
        }
        return s;
    }

    private static String abis() {
        if (Build.VERSION.SDK_INT >= 21) {
            String[] list = Build.SUPPORTED_ABIS;
            if (list == null || list.length == 0) {
                return "unknown";
            }
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < list.length; i++) {
                if (i > 0) {
                    sb.append(',');
                }
                sb.append(list[i]);
            }
            return sb.toString();
        }
        return Build.CPU_ABI;
    }

    private static String flag(boolean on) {
        return on ? "on" : "off";
    }

    // Locale.US: a report parsed elsewhere must not follow a locale whose
    // default calendar is not Gregorian.
    private static String clock() {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS Z", Locale.US)
                .format(new Date());
    }
}
