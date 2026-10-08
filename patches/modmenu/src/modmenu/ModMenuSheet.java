package modmenu;

import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.Dialog;
import android.content.DialogInterface;
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
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.Log;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.WindowManager;
import android.view.animation.PathInterpolator;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

/**
 * The mod menu, as a dialog window on the game's own activity.
 *
 * It used to be a separate activity: covering the game window paused it,
 * which stopped the engine's script loop and rendering - and with them the
 * in-game voice chat, so opening the menu mid-call muted everything. A
 * dialog is a child window of the host activity's token instead: the game
 * stays resumed behind it, its loop keeps pumping, the scene keeps
 * rendering and the mic keeps working while the sheet is up.
 *
 * Dismissing it does what the activity's onPause/onDestroy did: ships the
 * id scan (the loop that runs it never stopped) and drops the scan
 * listener. Notification taps reach it through ModMenuReceiver; a live
 * game window missing means the old ModMenuActivity entry is still used.
 */
public final class ModMenuSheet implements View.OnClickListener,
        CompoundButton.OnCheckedChangeListener {

    private static ModMenuSheet current;

    private final Activity host;
    private final Palette p;
    private final Dialog dialog;

    private Switch webSwitch;
    private Switch hwidSwitch;
    private Switch rewardSwitch;
    private Switch unsafeSwitch;
    private Button rotateBtn;
    /** Only on screen while the unsafe master switch is on. */
    private Button gmBtn;
    /** Only on screen while the unsafe master switch is on. */
    private Button giveBtn;
    private Button unsafeCancelBtn;
    private Button unsafeConfirmBtn;
    private LinearLayout sheet;
    private FrameLayout root;
    private IdBrowser browser;
    /** The confirm card's full-screen scrim; null while the dialog is closed. */
    private View unsafeVeil;
    /** The give card's full-screen scrim; null while it is closed. */
    private View giveVeil;
    private EditText giveItemEt;
    private EditText giveCountEt;
    private EditText giveUidEt;
    private TextView givePreview;
    private Button giveCancelBtn;
    private Button giveGoBtn;

    /** Show the menu on `host`; a second tap reuses the open sheet. */
    static ModMenuSheet show(Activity host, boolean openIds) {
        if (current != null && current.host == host
                && current.dialog.isShowing()) {
            if (openIds) {
                current.openBrowser();
            }
            return current;
        }
        try {
            ModMenuSheet s = new ModMenuSheet(host);
            // the scan-completion notification lands here: the scan already
            // ran, so go straight to the list instead of sitting on the menu
            if (openIds) {
                s.openBrowser();
            }
            return s;
        } catch (RuntimeException e) {
            Log.e("ModMenu", "menu UI failed", e);
            if (host instanceof ModMenuActivity) {
                host.finish();
            }
            return null;
        }
    }

    private ModMenuSheet(Activity host) {
        this.host = host;
        this.p = Palette.of(host);
        // guarantee statics match the stored prefs before the switches read them
        ModMenu.loadPrefs(host);
        dialog = new Dialog(host, android.R.style.Theme_Translucent_NoTitleBar) {
            @Override
            public void onBackPressed() {
                // strictest layer first: the give card, the confirm card,
                // then the browser panel, then the menu itself - never
                // whatever the game does with back, which stays untouched
                // below this window
                if (giveVeil != null) {
                    dismissGive();
                    return;
                }
                if (unsafeVeil != null) {
                    cancelUnsafe(); // reverts the switch, the pref never took
                    return;
                }
                if (browser != null && browser.isShowing()) {
                    browser.close();
                    return;
                }
                cancel();
            }
        };
        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() {
            @Override
            public void onDismiss(DialogInterface d) {
                // what the old activity did in onPause/onDestroy: nobody is
                // watching any more, and the wanted scan ships now - the
                // game loop it runs on never stopped this time
                IdScan.setListener(null);
                IdScan.menuClosed(host);
                current = null;
                if (host instanceof ModMenuActivity) {
                    host.finish();
                }
            }
        });
        build();
        current = this;
    }

    private void build() {
        getWindow().setBackgroundDrawable(new ColorDrawable(p.scrim));
        // the scrim color above is the only darkening: a dialog window
        // would dim behind on its own on top of it
        getWindow().clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        getWindow().setLayout(WindowManager.LayoutParams.MATCH_PARENT,
                WindowManager.LayoutParams.MATCH_PARENT);

        root = new FrameLayout(host) {
            @Override
            protected void onDetachedFromWindow() {
                super.onDetachedFromWindow();
                // the host is going away (or the dialog just closed): close
                // the sheet so the scan still ships and no window outlives
                // the activity it was attached to. cancel() is a no-op when
                // this detach came from a dismiss already in progress.
                dialog.cancel();
            }
        };
        root.setOnClickListener(this); // tap the scrim to dismiss

        sheet = new LinearLayout(host);
        sheet.setOrientation(LinearLayout.VERTICAL);
        sheet.setClickable(true); // consume taps so only the scrim dismisses
        sheet.setBackground(roundTop(p.surface, dp(28)));
        sheet.setPadding(dp(20), dp(12), dp(20), dp(28));

        View handle = new View(host);
        handle.setBackground(round(dp(32), dp(4), dp(2),
                (p.onSurfaceVariant & 0x00FFFFFF) | 0x66000000));
        LinearLayout.LayoutParams hLp = new LinearLayout.LayoutParams(dp(32), dp(4));
        hLp.gravity = Gravity.CENTER_HORIZONTAL;
        sheet.addView(handle, hLp);

        TextView title = new TextView(host);
        title.setText(I18n.t(host, "mod_menu_title"));
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
        sheet.addView(settingRow(p, I18n.t(host, "mod_web_label"),
                I18n.t(host, "mod_web_desc"), webSwitch));
        sheet.addView(settingRow(p, I18n.t(host, "mod_hwid_label"),
                I18n.t(host, "mod_hwid_desc"), hwidSwitch));
        sheet.addView(settingRow(p, I18n.t(host, "mod_reward_label"),
                I18n.t(host, "mod_reward_desc"), rewardSwitch));

        unsafeSwitch = makeSwitch(p);
        unsafeSwitch.setChecked(ModMenu.isUnsafe());
        LinearLayout.LayoutParams uLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        uLp.topMargin = dp(10);
        sheet.addView(settingRow(p, I18n.t(host, "mod_unsafe_label"),
                I18n.t(host, "mod_unsafe_desc"), unsafeSwitch), uLp);

        rotateBtn = makeButton(I18n.t(host, "mod_rotate"), p.primary, p.onPrimary,
                (p.onPrimary & 0x00FFFFFF) | 0x1F000000);
        LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(40));
        rLp.topMargin = dp(20);
        sheet.addView(rotateBtn, rLp);

        // an unsafe-only action: on screen only while the master switch is
        // on, and checked again at dispatch time in case it flipped
        gmBtn = makeButton(I18n.t(host, "mod_gm_label"), 0, p.primary,
                (p.primary & 0x00FFFFFF) | 0x14000000);
        LinearLayout.LayoutParams gLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(40));
        gLp.topMargin = dp(6);
        sheet.addView(gmBtn, gLp);
        gmBtn.setVisibility(ModMenu.isUnsafe() ? View.VISIBLE : View.GONE);

        // an unsafe-only action, same gate and same recheck as the switch
        giveBtn = makeButton(I18n.t(host, "mod_give_label"), 0, p.primary,
                (p.primary & 0x00FFFFFF) | 0x14000000);
        LinearLayout.LayoutParams giLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(40));
        giLp.topMargin = dp(6);
        sheet.addView(giveBtn, giLp);
        giveBtn.setVisibility(ModMenu.isUnsafe() ? View.VISIBLE : View.GONE);

        Button idBtn = makeButton(I18n.t(host, "mod_id_label"), 0, p.primary,
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

        Button close = makeButton(I18n.t(host, "mod_close"), 0, p.primary,
                (p.primary & 0x00FFFFFF) | 0x14000000);
        LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp(40));
        cLp.topMargin = dp(6);
        sheet.addView(close, cLp);

        root.addView(sheet, new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM));
        dialog.setContentView(root, new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
        dialog.show();
        slideSheetUp();
    }

    private android.view.Window getWindow() {
        return dialog.getWindow();
    }

    /** Settings row: title + summary on the left, switch on the right. */
    private LinearLayout settingRow(Palette p, String label, String summary, Switch sw) {
        LinearLayout row = new LinearLayout(host);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(52));
        row.setPadding(dp(8), dp(6), dp(8), dp(6));
        if (Build.VERSION.SDK_INT >= 21) {
            row.setBackground(new RippleDrawable(
                    ColorStateList.valueOf((p.onSurface & 0x00FFFFFF) | 0x14000000),
                    null, roundRect(dp(16))));
        }

        LinearLayout col = new LinearLayout(host);
        col.setOrientation(LinearLayout.VERTICAL);
        TextView t = new TextView(host);
        t.setText(label);
        t.setTextSize(16);
        t.setTextColor(p.onSurface);
        col.addView(t);
        TextView s = new TextView(host);
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
        Switch sw = new Switch(host);
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
        Button b = new Button(host);
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
            ModMenu.setWebBlocked(host, isChecked);
        } else if (buttonView == hwidSwitch) {
            ModMenu.setHwidSpoof(host, isChecked);
        } else if (buttonView == rewardSwitch) {
            ModMenu.setRewardBypass(host, isChecked);
        } else if (buttonView == unsafeSwitch) {
            if (isChecked) {
                // the pref only follows a confirmed warning, so cancelling
                // leaves it off - turning it off needs no dialog
                showUnsafeConfirm();
            } else {
                ModMenu.setUnsafe(host, false);
                gmBtn.setVisibility(View.GONE);
                giveBtn.setVisibility(View.GONE);
            }
        }
    }

    /** Confirm card over the sheet: the switch sticks only through "anyway". */
    private void showUnsafeConfirm() {
        if (unsafeVeil != null) {
            return;
        }

        LinearLayout card = new LinearLayout(host);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setClickable(true); // consume taps so only the veil outside cancels
        card.setBackground(round(dp(24), p.surface));
        card.setPadding(dp(24), dp(20), dp(24), dp(8));

        TextView title = new TextView(host);
        title.setText(I18n.t(host, "mod_unsafe_dialog_title"));
        title.setTextSize(18);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(p.onSurface);
        card.addView(title);

        TextView body = new TextView(host);
        body.setText(I18n.t(host, "mod_unsafe_dialog_body"));
        body.setTextSize(14);
        body.setTextColor(p.onSurfaceVariant);
        LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        bLp.topMargin = dp(10);
        card.addView(body, bLp);

        // one listener for all three: makeButton wires every pill to onClick
        unsafeCancelBtn = makeButton(I18n.t(host, "mod_unsafe_cancel"),
                0, p.onSurfaceVariant, (p.onSurface & 0x00FFFFFF) | 0x14000000);
        unsafeConfirmBtn = makeButton(I18n.t(host, "mod_unsafe_confirm"),
                p.primary, p.onPrimary, (p.onPrimary & 0x00FFFFFF) | 0x1F000000);
        LinearLayout buttons = new LinearLayout(host);
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

        FrameLayout veil = new FrameLayout(host);
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
            ModMenu.setUnsafe(host, true);
            dismissUnsafe();
            gmBtn.setVisibility(View.VISIBLE);
            giveBtn.setVisibility(View.VISIBLE);
        } else if (v == giveVeil || v == giveCancelBtn) {
            dismissGive();
        } else if (v == giveGoBtn) {
            requestGive();
        } else if (v == rotateBtn) {
            ModMenu.rotateHwid(host);
            hwidSwitch.setChecked(true); // rotation only matters while spoofing is on
            v.performHapticFeedback(Build.VERSION.SDK_INT >= 23
                    ? HapticFeedbackConstants.CONTEXT_CLICK
                    : HapticFeedbackConstants.VIRTUAL_KEY);
            Toast.makeText(host, I18n.t(host, "mod_rotate_toast"),
                    Toast.LENGTH_SHORT).show();
        } else if (v == gmBtn) {
            requestGameMode();
        } else if (v == giveBtn) {
            showGive();
        } else {
            dialog.cancel(); // close button or scrim tap
        }
    }

    /**
     * Dispatch the gamemode switch and hold the button down for the round
     * trip; GameMode posts the result toast itself, so it is seen even if
     * the sheet is dismissed before the script lands.
     */
    private void requestGameMode() {
        if (!ModMenu.isUnsafe()) {
            return; // the gate, rechecked: the pref can flip while this is up
        }
        gmBtn.setEnabled(false);
        GameMode.request(host, new Runnable() {
            @Override
            public void run() {
                gmBtn.setEnabled(true);
            }
        });
    }

    /** Give card over the sheet: item id, count and the recipient's UID. */
    private void showGive() {
        if (giveVeil != null) {
            return;
        }

        LinearLayout card = new LinearLayout(host);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setClickable(true); // consume taps so only the veil outside dismisses
        card.setBackground(round(dp(24), p.surface));
        card.setPadding(dp(24), dp(20), dp(24), dp(8));

        TextView title = new TextView(host);
        title.setText(I18n.t(host, "mod_give_title"));
        title.setTextSize(18);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(p.onSurface);
        card.addView(title);

        giveItemEt = input();
        card.addView(field(I18n.t(host, "mod_give_item"), giveItemEt));
        // the id alone means nothing at a glance: look the name up as it is
        // typed, the same table the ID browser lists
        givePreview = new TextView(host);
        givePreview.setTextSize(13);
        givePreview.setTextColor(p.onSurfaceVariant);
        LinearLayout.LayoutParams pLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        pLp.topMargin = dp(4);
        card.addView(givePreview, pLp);
        giveItemEt.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int a, int b, int c) {
            }

            @Override
            public void onTextChanged(CharSequence s, int a, int b, int c) {
            }

            @Override
            public void afterTextChanged(Editable s) {
                refreshPreview();
            }
        });

        giveCountEt = input();
        giveCountEt.setText("1");
        card.addView(field(I18n.t(host, "mod_give_count"), giveCountEt));

        giveUidEt = input();
        giveUidEt.setText("0");
        card.addView(field(I18n.t(host, "mod_give_uid"), giveUidEt));

        giveCancelBtn = makeButton(I18n.t(host, "mod_close"),
                0, p.onSurfaceVariant, (p.onSurface & 0x00FFFFFF) | 0x14000000);
        giveGoBtn = makeButton(I18n.t(host, "mod_give_go"),
                p.primary, p.onPrimary, (p.onPrimary & 0x00FFFFFF) | 0x1F000000);
        LinearLayout buttons = new LinearLayout(host);
        buttons.setGravity(Gravity.RIGHT);
        LinearLayout.LayoutParams kLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, dp(40));
        kLp.rightMargin = dp(4);
        buttons.addView(giveCancelBtn, kLp);
        buttons.addView(giveGoBtn, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, dp(40)));
        LinearLayout.LayoutParams gLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        gLp.topMargin = dp(16);
        card.addView(buttons, gLp);

        FrameLayout veil = new FrameLayout(host);
        veil.setBackground(new ColorDrawable(p.scrim));
        veil.setClickable(true);
        veil.setOnClickListener(this); // tap outside = dismiss this card only
        FrameLayout.LayoutParams vLp = new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT,
                Gravity.CENTER);
        vLp.leftMargin = vLp.rightMargin = dp(28);
        veil.addView(card, vLp);
        giveVeil = veil;
        root.addView(veil);
        refreshPreview();
    }

    private void dismissGive() {
        if (giveVeil == null) {
            return;
        }
        root.removeView(giveVeil);
        giveVeil = null;
        giveItemEt = null;
        giveCountEt = null;
        giveUidEt = null;
        givePreview = null;
        giveCancelBtn = null;
        giveGoBtn = null;
    }

    /**
     * Read the form, then hand off to GiveItem, which posts its own toast
     * so the result is seen even if the sheet is dismissed first. Bad input
     * stays on this thread: there is nothing to wait for.
     */
    private void requestGive() {
        if (!ModMenu.isUnsafe()) {
            dismissGive();
            return; // the gate, rechecked: the pref can flip while this is up
        }
        final int item;
        final int count;
        final long uid;
        try {
            item = Integer.parseInt(giveItemEt.getText().toString().trim());
            count = Integer.parseInt(giveCountEt.getText().toString().trim());
            String u = giveUidEt.getText().toString().trim();
            uid = u.length() == 0 ? 0L : Long.parseLong(u);
        } catch (NumberFormatException e) {
            Toast.makeText(host, I18n.t(host, "mod_give_bad"),
                    Toast.LENGTH_SHORT).show();
            return;
        }
        // item 0 and below do not exist, count 0 is not a give, and the
        // script carries the uin as a Lua number - past 2^53 a double stops
        // naming one exactly, so refuse instead of shipping a rounded
        // recipient
        if (item <= 0 || count <= 0 || count > 9999 || uid < 0
                || uid > 999999999999999L) {
            Toast.makeText(host, I18n.t(host, "mod_give_bad"),
                    Toast.LENGTH_SHORT).show();
            return;
        }
        dismissGive();
        giveBtn.setEnabled(false);
        GiveItem.request(host, item, count, uid, new Runnable() {
            @Override
            public void run() {
                if (giveBtn != null) {
                    giveBtn.setEnabled(true);
                }
            }
        });
    }

    /** Label above an input; the input takes the full card width. */
    private LinearLayout field(String label, EditText input) {
        LinearLayout col = new LinearLayout(host);
        col.setOrientation(LinearLayout.VERTICAL);
        TextView l = new TextView(host);
        l.setText(label);
        l.setTextSize(13);
        l.setTextColor(p.onSurfaceVariant);
        col.addView(l);
        LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        iLp.topMargin = dp(4);
        col.addView(input, iLp);
        LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        cLp.topMargin = dp(12);
        col.setLayoutParams(cLp);
        return col;
    }

    /** Outlined number field, matching the sheet's cards. */
    private EditText input() {
        EditText e = new EditText(host);
        e.setInputType(InputType.TYPE_CLASS_NUMBER);
        e.setSingleLine(true);
        e.setTextSize(15);
        e.setTextColor(p.onSurface);
        e.setHintTextColor((p.onSurfaceVariant & 0x00FFFFFF) | 0x99000000);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor((p.onSurface & 0x00FFFFFF) | 0x0A000000);
        bg.setStroke(dp(1), (p.onSurfaceVariant & 0x00FFFFFF) | 0x33000000);
        bg.setCornerRadius(dp(12));
        e.setBackground(bg); // before the padding: setBackground resets it
        e.setPadding(dp(12), dp(10), dp(12), dp(10));
        return e;
    }

    private void refreshPreview() {
        if (givePreview == null || giveItemEt == null) {
            return;
        }
        String id = giveItemEt.getText().toString().trim();
        if (id.length() == 0) {
            givePreview.setText("");
            return;
        }
        String name = null;
        try {
            name = IdNames.get(host, "item", id);
        } catch (RuntimeException e) {
            Log.d("ModMenu", "item name lookup failed: " + e);
        }
        givePreview.setText(name == null || name.length() == 0
                ? "#" + id : "#" + id + "  " + name);
    }

    /** Menu button: bring the ID browser panel up over the sheet. */
    private void openBrowser() {
        try {
            if (browser == null) {
                browser = new IdBrowser(host, p, root, new Runnable() {
                    @Override
                    public void run() {
                        // "leave so the scan ships on the way out" - closing
                        // the sheet is leaving now, without pausing the game
                        dialog.cancel();
                    }
                });
            }
            browser.open();
        } catch (RuntimeException e) {
            Log.e("ModMenu", "id browser failed, closing", e);
            dialog.cancel();
        }
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

    private int dp(int value) {
        return (int) (value * host.getResources().getDisplayMetrics().density + 0.5f);
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
