package modmenu;

import android.animation.ObjectAnimator;
import android.app.Activity;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.WindowManager;
import android.view.animation.PathInterpolator;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

/**
 * The mod menu, built as a Material You bottom sheet: a dark scrim, a
 * rounded surface with a drag handle, settings-style rows, and pill buttons.
 *
 * Built entirely in code: the build pipeline only allows the aapt1->aapt2
 * entry rename in res/, so no layout, style or drawable resource can be
 * added. Colors come from Palette (wallpaper-seeded, dark-mode aware) and
 * all shapes are GradientDrawables - no theme attributes are resolved.
 *
 * Switch is the framework widget with hand-built drawables, not androidx
 * SwitchCompat: the source APK ships abc_switch_thumb_material.xml with
 * drawable="@null" items, so any appcompat tint path throws
 * Resources$NotFoundException - and this activity runs in the game's
 * process, taking the game down with it.
 */
public class ModMenuActivity extends Activity
        implements CompoundButton.OnCheckedChangeListener, View.OnClickListener {

    /** Scan-completion notification extra: reopen straight into the browser. */
    public static final String EXTRA_OPEN_IDS = "open_ids";

    private Switch webSwitch;
    private Switch hwidSwitch;
    private Switch rewardSwitch;
    private Switch unsafeSwitch;
    private Button rotateBtn;
    private Button unsafeCancelBtn;
    private Button unsafeConfirmBtn;
    private LinearLayout sheet;
    private FrameLayout root;
    private IdBrowser browser;
    /** The confirm card's full-screen scrim; null while the dialog is closed. */
    private View unsafeVeil;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // guarantee statics match the stored prefs before the switches read them
        ModMenu.loadPrefs(this);
        try {
            buildMenu();
            slideSheetUp();
            // the scan-completion notification lands here: the scan already
            // ran, so go straight to the list instead of sitting on the menu
            if (getIntent() != null
                    && getIntent().getBooleanExtra(EXTRA_OPEN_IDS, false)) {
                openBrowser();
            }
        } catch (RuntimeException e) {
            Log.e("ModMenu", "menu UI failed, closing", e);
            finish();
        }
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        // the same tap delivered to a live instance rather than a fresh one
        if (intent != null && intent.getBooleanExtra(EXTRA_OPEN_IDS, false)) {
            openBrowser();
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        // the engine pumps its script queue from the game loop, which this
        // window pauses: a wanted scan ships right here, as the game is
        // about to run again. menuClosed never throws - it runs on the
        // game's main thread, where that would reach its crash handler
        IdScan.menuClosed(this);
    }

    @Override
    protected void onDestroy() {
        IdScan.setListener(null);
        super.onDestroy();
    }

    private void buildMenu() {
        Palette p = Palette.of(this);
        getWindow().setBackgroundDrawable(new ColorDrawable(p.scrim));
        // base Theme carries backgroundDimAmount=0.6 and only FLAG_DIM_BEHIND
        // applies it: clearing it keeps our 70% scrim the single darkening
        // over the game this window now sits on top of
        getWindow().clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);

        root = new FrameLayout(this);
        root.setOnClickListener(this); // tap the scrim to dismiss

        sheet = new LinearLayout(this);
        sheet.setOrientation(LinearLayout.VERTICAL);
        sheet.setClickable(true); // consume taps so only the scrim dismisses
        sheet.setBackground(roundTop(p.surface, dp(28)));
        sheet.setPadding(dp(20), dp(12), dp(20), dp(28));

        View handle = new View(this);
        handle.setBackground(round(dp(32), dp(4), dp(2),
                (p.onSurfaceVariant & 0x00FFFFFF) | 0x66000000));
        LinearLayout.LayoutParams hLp = new LinearLayout.LayoutParams(dp(32), dp(4));
        hLp.gravity = Gravity.CENTER_HORIZONTAL;
        sheet.addView(handle, hLp);

        TextView title = new TextView(this);
        title.setText(I18n.t(this, "mod_menu_title"));
        title.setTextSize(24);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(p.onSurface);
        LinearLayout.LayoutParams tLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        tLp.topMargin = dp(14);
        tLp.bottomMargin = dp(6);
        sheet.addView(title, tLp);

        webSwitch = makeSwitch(p);
        hwidSwitch = makeSwitch(p);
        rewardSwitch = makeSwitch(p);
        webSwitch.setChecked(ModMenu.isWebBlocked());
        hwidSwitch.setChecked(ModMenu.isSpoofOn());
        rewardSwitch.setChecked(ModMenu.isRewardBypass());
        sheet.addView(settingRow(p, I18n.t(this, "mod_web_label"),
                I18n.t(this, "mod_web_desc"), webSwitch));
        sheet.addView(settingRow(p, I18n.t(this, "mod_hwid_label"),
                I18n.t(this, "mod_hwid_desc"), hwidSwitch));
        sheet.addView(settingRow(p, I18n.t(this, "mod_reward_label"),
                I18n.t(this, "mod_reward_desc"), rewardSwitch));

        unsafeSwitch = makeSwitch(p);
        unsafeSwitch.setChecked(ModMenu.isUnsafe());
        LinearLayout.LayoutParams uLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        uLp.topMargin = dp(10);
        sheet.addView(settingRow(p, I18n.t(this, "mod_unsafe_label"),
                I18n.t(this, "mod_unsafe_desc"), unsafeSwitch), uLp);

        rotateBtn = makeButton(I18n.t(this, "mod_rotate"), p.primary, p.onPrimary,
                (p.onPrimary & 0x00FFFFFF) | 0x1F000000);
        LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(40));
        rLp.topMargin = dp(20);
        sheet.addView(rotateBtn, rLp);

        Button idBtn = makeButton(I18n.t(this, "mod_id_label"), 0, p.primary,
                (p.primary & 0x00FFFFFF) | 0x14000000);
        // its own listener: makeButton wires every pill to onClick, whose
        // default action is closing the menu
        idBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openBrowser();
            }
        });
        LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(40));
        iLp.topMargin = dp(6);
        sheet.addView(idBtn, iLp);

        Button close = makeButton(I18n.t(this, "mod_close"), 0, p.primary,
                (p.primary & 0x00FFFFFF) | 0x14000000);
        LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(40));
        cLp.topMargin = dp(6);
        sheet.addView(close, cLp);

        root.addView(sheet, new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM));
        setContentView(root);
    }

    /** Settings row: title + summary on the left, switch on the right. */
    private LinearLayout settingRow(Palette p, String label, String summary, Switch sw) {
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(52));
        row.setPadding(dp(8), dp(6), dp(8), dp(6));
        if (Build.VERSION.SDK_INT >= 21) {
            row.setBackground(new RippleDrawable(
                    ColorStateList.valueOf((p.onSurface & 0x00FFFFFF) | 0x14000000),
                    null, roundRect(dp(16))));
        }

        LinearLayout col = new LinearLayout(this);
        col.setOrientation(LinearLayout.VERTICAL);
        TextView t = new TextView(this);
        t.setText(label);
        t.setTextSize(16);
        t.setTextColor(p.onSurface);
        col.addView(t);
        TextView s = new TextView(this);
        s.setText(summary);
        s.setTextSize(14);
        s.setTextColor(p.onSurfaceVariant);
        LinearLayout.LayoutParams sLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        sLp.topMargin = dp(2);
        col.addView(s, sLp);
        row.addView(col, new LinearLayout.LayoutParams(0,
                LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        row.addView(sw);
        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sw.performClick();
            }
        });
        return row;
    }

    private Switch makeSwitch(Palette p) {
        Switch sw = new Switch(this);
        sw.setText("");
        sw.setOnCheckedChangeListener(this);
        if (Build.VERSION.SDK_INT >= 21) {
            sw.setSwitchMinWidth(dp(52));
            StateListDrawable thumb = new StateListDrawable();
            thumb.addState(new int[]{android.R.attr.state_checked},
                    new Pill(circle(dp(20), Color.WHITE), dp(20), dp(20)));
            thumb.addState(new int[]{-android.R.attr.state_checked},
                    new Pill(circle(dp(20), p.thumbOff), dp(20), dp(20)));
            StateListDrawable track = new StateListDrawable();
            track.addState(new int[]{android.R.attr.state_checked},
                    new Pill(round(dp(52), dp(32), dp(16), p.primary), dp(52), dp(32)));
            track.addState(new int[]{-android.R.attr.state_checked},
                    new Pill(round(dp(52), dp(32), dp(16), p.trackOff), dp(52), dp(32)));
            sw.setThumbDrawable(thumb);
            sw.setTrackDrawable(track);
        }
        return sw;
    }

    /** M3 filled (or text, with color 0) pill button. */
    private Button makeButton(String text, int bg, int fg, int ripple) {
        Button b = new Button(this);
        b.setText(text);
        b.setAllCaps(false);
        b.setTextSize(14);
        b.setTextColor(fg);
        b.setGravity(Gravity.CENTER);
        b.setMinHeight(0);
        b.setMinWidth(0);
        b.setPadding(dp(24), 0, dp(24), 0);
        GradientDrawable pill = round(dp(20), bg);
        if (Build.VERSION.SDK_INT >= 21) {
            // the mask is always opaque-white: ripple bounds come from its
            // alpha, while a transparent content pill would erase them
            b.setBackground(new RippleDrawable(ColorStateList.valueOf(ripple), pill,
                    round(dp(20), Color.WHITE)));
        } else {
            b.setBackground(pill);
        }
        b.setOnClickListener(this);
        return b;
    }

    private void slideSheetUp() {
        sheet.post(new Runnable() {
            @Override
            public void run() {
                // ObjectAnimator instead of View.animate(): the class behind
                // animate()'s return type is not binary-stable across SDKs
                ObjectAnimator a = ObjectAnimator.ofFloat(sheet, "translationY",
                        sheet.getHeight(), 0f);
                a.setDuration(300);
                if (Build.VERSION.SDK_INT >= 21) {
                    a.setInterpolator(new PathInterpolator(0.05f, 0f, 0f, 1f));
                }
                a.start();
            }
        });
    }

    @Override
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        if (buttonView == webSwitch) {
            ModMenu.setWebBlocked(this, isChecked);
        } else if (buttonView == hwidSwitch) {
            ModMenu.setHwidSpoof(this, isChecked);
        } else if (buttonView == rewardSwitch) {
            ModMenu.setRewardBypass(this, isChecked);
        } else if (buttonView == unsafeSwitch) {
            if (isChecked) {
                // the pref only follows a confirmed warning, so cancelling
                // leaves it off - turning it off needs no dialog
                showUnsafeConfirm();
            } else {
                ModMenu.setUnsafe(this, false);
            }
        }
    }

    /** Confirm card over the sheet: the switch sticks only through "anyway". */
    private void showUnsafeConfirm() {
        if (unsafeVeil != null) {
            return;
        }
        Palette p = Palette.of(this);

        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setClickable(true); // consume taps so only the veil outside cancels
        card.setBackground(round(dp(24), p.surface));
        card.setPadding(dp(24), dp(20), dp(24), dp(8));

        TextView title = new TextView(this);
        title.setText(I18n.t(this, "mod_unsafe_dialog_title"));
        title.setTextSize(18);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(p.onSurface);
        card.addView(title);

        TextView body = new TextView(this);
        body.setText(I18n.t(this, "mod_unsafe_dialog_body"));
        body.setTextSize(14);
        body.setTextColor(p.onSurfaceVariant);
        LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        bLp.topMargin = dp(10);
        card.addView(body, bLp);

        // one listener for all three: makeButton wires every pill to onClick
        unsafeCancelBtn = makeButton(I18n.t(this, "mod_unsafe_cancel"),
                0, p.onSurfaceVariant, (p.onSurface & 0x00FFFFFF) | 0x14000000);
        unsafeConfirmBtn = makeButton(I18n.t(this, "mod_unsafe_confirm"),
                p.primary, p.onPrimary, (p.onPrimary & 0x00FFFFFF) | 0x1F000000);
        LinearLayout buttons = new LinearLayout(this);
        buttons.setGravity(Gravity.RIGHT);
        LinearLayout.LayoutParams kLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, dp(40));
        kLp.rightMargin = dp(4);
        buttons.addView(unsafeCancelBtn, kLp);
        buttons.addView(unsafeConfirmBtn, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, dp(40)));
        LinearLayout.LayoutParams gLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        gLp.topMargin = dp(16);
        card.addView(buttons, gLp);

        FrameLayout veil = new FrameLayout(this);
        veil.setBackground(new ColorDrawable(p.scrim));
        veil.setClickable(true);
        veil.setOnClickListener(this); // tap outside = cancel
        FrameLayout.LayoutParams vLp = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER);
        vLp.leftMargin = vLp.rightMargin = dp(28);
        veil.addView(card, vLp);
        unsafeVeil = veil;
        root.addView(veil);
    }

    /** Back to off: flipping the switch re-enters onCheckedChanged with false. */
    private void cancelUnsafe() {
        dismissUnsafe();
        unsafeSwitch.setChecked(false);
    }

    private void dismissUnsafe() {
        root.removeView(unsafeVeil);
        unsafeVeil = null;
    }

    @Override
    public void onClick(View v) {
        if (v == unsafeVeil || v == unsafeCancelBtn) {
            cancelUnsafe();
        } else if (v == unsafeConfirmBtn) {
            ModMenu.setUnsafe(this, true);
            dismissUnsafe();
        } else if (v == rotateBtn) {
            ModMenu.rotateHwid(this);
            hwidSwitch.setChecked(true); // rotation only matters while spoofing is on
            v.performHapticFeedback(Build.VERSION.SDK_INT >= 23
                    ? HapticFeedbackConstants.CONTEXT_CLICK
                    : HapticFeedbackConstants.VIRTUAL_KEY);
            Toast.makeText(this, I18n.t(this, "mod_rotate_toast"),
                    Toast.LENGTH_SHORT).show();
        } else {
            finish(); // close button or scrim tap
        }
    }

    /** Menu button: bring the ID browser panel up over the sheet. */
    private void openBrowser() {
        try {
            if (browser == null) {
                browser = new IdBrowser(this, Palette.of(this), root);
            }
            browser.open();
        } catch (RuntimeException e) {
            Log.e("ModMenu", "id browser failed, closing", e);
            finish();
        }
    }

    @Override
    public void onBackPressed() {
        // the confirm card sits over everything: back cancels it first,
        // before the browser panel or the menu itself
        if (unsafeVeil != null) {
            cancelUnsafe();
            return;
        }
        // the browser is a panel of this activity, not an activity of its
        // own: back has to close it before it closes the menu
        if (browser != null && browser.isShowing()) {
            browser.close();
            return;
        }
        super.onBackPressed();
    }

    private GradientDrawable roundTop(int color, float radius) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadii(new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
        return d;
    }

    private GradientDrawable roundRect(int radius) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(Color.WHITE);
        d.setCornerRadius(radius);
        return d;
    }

    private GradientDrawable round(int radius, int color) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(radius);
        return d;
    }

    private GradientDrawable round(int w, int h, float radius, int color) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setSize(w, h);
        d.setCornerRadius(radius);
        return d;
    }

    private GradientDrawable circle(int size, int color) {
        return round(size, size, size / 2f, color);
    }

    int dp(int value) {
        return (int) (value * getResources().getDisplayMetrics().density + 0.5f);
    }

    /**
     * GradientDrawable reports no intrinsic size, which collapses the
     * framework Switch's thumb measuring - carry an explicit one.
     */
    private static final class Pill extends Drawable {
        private final GradientDrawable shape;
        private final int w;
        private final int h;

        Pill(GradientDrawable shape, int w, int h) {
            this.shape = shape;
            this.w = w;
            this.h = h;
        }

        @Override
        public void draw(Canvas canvas) {
            shape.setBounds(getBounds());
            shape.draw(canvas);
        }

        @Override
        public void setAlpha(int alpha) {
            shape.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter cf) {
            shape.setColorFilter(cf);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        @Override
        public int getIntrinsicWidth() {
            return w;
        }

        @Override
        public int getIntrinsicHeight() {
            return h;
        }
    }
}
