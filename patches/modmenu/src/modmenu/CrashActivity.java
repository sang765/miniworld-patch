package modmenu;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;

/**
 * What the player gets after the game dies: the report, where it lives, and
 * three ways to carry it out of the device - copy, save into shared
 * storage, share - plus the report text itself, selectable.
 *
 * Built entirely in code, like the menu: the pipeline only lets the
 * aapt1->aapt2 entry rename touch res/, so no layout, style or drawable can
 * be added. It inherits the application theme and sets its own background
 * and colors rather than resolving theme attributes - the same route the
 * menu takes, and a crash screen must not depend on the very resources that
 * may have been the problem. onCreate is wrapped: a screen that cannot
 * build has to close itself rather than feed the crash loop guard.
 */
public class CrashActivity extends Activity implements View.OnClickListener {
    static final String EXTRA_PATH = "modmenu.crash.PATH";
    static final String EXTRA_SUMMARY = "modmenu.crash.SUMMARY";
    static final String EXTRA_TEXT = "modmenu.crash.TEXT";

    private static final String TAG = CrashReport.TAG;

    /** The report a stored copy can reach; long enough that nothing real clips. */
    private static final int MAX_VIEW_CHARS = 128 * 1024;

    private static final int BG = 0xFF101418;
    private static final int SURFACE = 0xFF232A33;
    private static final int TEXT = 0xFFE6E6EB;
    private static final int MUTED = 0xFF9AA4AF;
    private static final int ERROR = 0xFFFF6B6B;
    private static final int SUMMARY = 0xFFFFB4A9;
    private static final int PRIMARY = 0xFF3B82F6;
    private static final int MONO = 0xFFC9D1D9;

    private String report = "";
    private String path = "";
    private Button copyBtn;
    private Button saveBtn;
    private Button shareBtn;
    private Button closeBtn;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            build();
        } catch (Throwable t) {
            // a crash screen that throws must close, not loop back into the
            // handler that is watching this very activity
            Log.e(TAG, "crash screen failed, closing", t);
            finish();
        }
    }

    private void build() {
        Intent from = getIntent();
        String summary = from == null ? null : from.getStringExtra(EXTRA_SUMMARY);
        path = from == null ? "" : safe(from.getStringExtra(EXTRA_PATH));
        String carried = from == null ? null : from.getStringExtra(EXTRA_TEXT);

        // the stored copy is authoritative - the intent carries a cut one so
        // it stays well inside a binder transaction
        String stored = CrashReport.read(path);
        report = stored != null ? stored : carried;
        if (report == null) {
            report = "The crash reached the handler, but no report could be "
                    + "collected on this device.\n\n"
                    + "The log for this process can still be pulled:\n"
                    + "  adb logcat -d -v time > logcat.txt\n";
        }
        if (report.length() > MAX_VIEW_CHARS) {
            int cut = MAX_VIEW_CHARS;
            if (Character.isLowSurrogate(report.charAt(cut))) {
                cut--;
            }
            report = report.substring(0, cut)
                    + "\n... (open the saved file for the rest)\n";
        }

        getWindow().setBackgroundDrawable(new ColorDrawable(BG));

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(BG);
        root.addView(header(summary), new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT));

        TextView body = new TextView(this);
        body.setText(report);
        body.setTextSize(11);
        body.setTextColor(MONO);
        body.setTypeface(Typeface.MONOSPACE);
        body.setTextIsSelectable(true);
        body.setPadding(dp(16), dp(4), dp(16), dp(24));
        ScrollView scroll = new ScrollView(this);
        scroll.addView(body);
        root.addView(scroll, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f));

        setContentView(root);
    }

    /** Title, where the report is, and the actions - the part that never scrolls. */
    private LinearLayout header(String summary) {
        LinearLayout head = new LinearLayout(this);
        head.setOrientation(LinearLayout.VERTICAL);
        head.setPadding(dp(16), dp(20), dp(16), dp(8));

        head.addView(label(I18n.t(this, "mod_crash_title"), 22, ERROR,
                Typeface.DEFAULT_BOLD), matchWrap());
        head.addView(label(I18n.t(this, "mod_crash_hint"), 13, MUTED,
                Typeface.DEFAULT), withTop(dp(4)));
        if (summary != null && summary.length() > 0) {
            head.addView(label(summary, 13, SUMMARY, Typeface.MONOSPACE),
                    withTop(dp(12)));
        }

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        copyBtn = pill(I18n.t(this, "mod_crash_copy"), PRIMARY, Color.WHITE);
        saveBtn = pill(I18n.t(this, "mod_crash_save"), PRIMARY, Color.WHITE);
        shareBtn = pill(I18n.t(this, "mod_crash_share"), PRIMARY, Color.WHITE);
        row.addView(copyBtn, weighted(0));
        row.addView(saveBtn, weighted(dp(8)));
        row.addView(shareBtn, weighted(dp(8)));
        head.addView(row, withTop(dp(16)));

        closeBtn = pill(I18n.t(this, "mod_close"), SURFACE, MUTED);
        head.addView(closeBtn, withTop(dp(8)));
        return head;
    }

    private void copyReport() {
        try {
            ClipboardManager cm = (ClipboardManager)
                    getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm == null) {
                throw new IllegalStateException("no clipboard service");
            }
            cm.setPrimaryClip(ClipData.newPlainText(
                    "Mini World mod crash report", report));
            toast(I18n.t(this, "mod_crash_copied"));
        } catch (Throwable t) {
            Log.e(TAG, "copy failed", t);
            toast(I18n.t(this, "mod_crash_failed"));
        }
    }

    /**
     * Exports a second copy into storage the player can actually reach with
     * a file manager or adb. The app-specific directory needs no permission
     * on any supported API, which is why it is chosen over shared storage.
     */
    private void saveReport() {
        try {
            File external = getExternalFilesDir(null);
            File dir = external != null ? new File(external, "crashes")
                    : CrashReport.dir(this);
            if (dir == null) {
                throw new IllegalStateException("no storage available");
            }
            if (!dir.isDirectory() && !dir.mkdirs()) {
                throw new IllegalStateException("cannot create " + dir);
            }
            File out = new File(dir, "crash-" + System.currentTimeMillis() + ".txt");
            FileOutputStream os = new FileOutputStream(out);
            try {
                os.write(report.getBytes("UTF-8"));
            } finally {
                os.close();
            }
            toast(I18n.t(this, "mod_crash_saved") + " " + out.getAbsolutePath());
        } catch (Throwable t) {
            Log.e(TAG, "save failed", t);
            toast(I18n.t(this, "mod_crash_failed"));
        }
    }

    private void shareReport() {
        try {
            Intent send = new Intent(Intent.ACTION_SEND)
                    .setType("text/plain")
                    .putExtra(Intent.EXTRA_SUBJECT, "Mini World mod crash report")
                    // the intent-bounded copy: a chooser hands the text to a
                    // binder transaction of its own
                    .putExtra(Intent.EXTRA_TEXT,
                            CrashReport.forIntent(report, path));
            startActivity(Intent.createChooser(send,
                    I18n.t(this, "mod_crash_share")));
        } catch (Throwable t) {
            Log.e(TAG, "share failed", t);
            toast(I18n.t(this, "mod_crash_failed"));
        }
    }

    @Override
    public void onClick(View v) {
        if (v == copyBtn) {
            copyReport();
        } else if (v == saveBtn) {
            saveReport();
        } else if (v == shareBtn) {
            shareReport();
        } else if (v == closeBtn) {
            finish();
        }
    }

    private TextView label(String text, float sp, int color, Typeface face) {
        TextView t = new TextView(this);
        t.setText(text);
        t.setTextSize(sp);
        t.setTextColor(color);
        t.setTypeface(face);
        return t;
    }

    /** The menu's pill button, so the two screens are built the same way. */
    private Button pill(String text, int bg, int fg) {
        Button b = new Button(this);
        b.setText(text);
        b.setAllCaps(false);
        b.setTextSize(14);
        b.setTextColor(fg);
        b.setGravity(Gravity.CENTER);
        b.setMinHeight(0);
        b.setMinWidth(0);
        b.setPadding(dp(8), 0, dp(8), 0);
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(bg);
        shape.setCornerRadius(dp(20));
        if (Build.VERSION.SDK_INT >= 21) {
            // the mask is opaque white: ripple bounds come from its alpha,
            // while a transparent content pill would erase them
            b.setBackground(new RippleDrawable(
                    ColorStateList.valueOf((fg & 0x00FFFFFF) | 0x22000000),
                    shape, new GradientDrawable()));
        } else {
            b.setBackground(shape);
        }
        b.setOnClickListener(this);
        return b;
    }

    private void toast(String message) {
        Toast.makeText(this, message, Toast.LENGTH_LONG).show();
    }

    private static String safe(String value) {
        return value == null ? "" : value;
    }

    private LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
    }

    private LinearLayout.LayoutParams withTop(int margin) {
        LinearLayout.LayoutParams lp = matchWrap();
        lp.topMargin = margin;
        return lp;
    }

    private LinearLayout.LayoutParams weighted(int leftMargin) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                0, dp(40), 1f);
        lp.leftMargin = leftMargin;
        return lp;
    }

    private int dp(int value) {
        return (int) (value * getResources().getDisplayMetrics().density + 0.5f);
    }
}
