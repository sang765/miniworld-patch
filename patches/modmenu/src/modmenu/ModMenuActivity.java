package modmenu;

import android.app.Activity;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.appcompat.widget.SwitchCompat;

/**
 * The on/off menu opened from the startup notification.
 *
 * Built in code: the build pipeline only allows the aapt1->aapt2 entry rename
 * in res/, so no layout or style resource can be added. The activity inherits
 * the application theme (AppCompat light, no action bar) and is declared
 * exported=false - only our own PendingIntent starts it.
 */
public class ModMenuActivity extends Activity
        implements CompoundButton.OnCheckedChangeListener, View.OnClickListener {

    private SwitchCompat webSwitch;
    private SwitchCompat hwidSwitch;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(24);
        root.setPadding(pad, dp(48), pad, dp(32));

        TextView title = new TextView(this);
        title.setText("Mod Menu");
        title.setTextSize(24);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        root.addView(title);

        webSwitch = new SwitchCompat(this);
        webSwitch.setText("Chặn WebView / trình duyệt");
        webSwitch.setChecked(ModMenu.isWebBlocked());
        webSwitch.setOnCheckedChangeListener(this);
        webSwitch.setPadding(0, dp(28), 0, 0);
        root.addView(webSwitch);

        hwidSwitch = new SwitchCompat(this);
        hwidSwitch.setText("Giả mạo HWID");
        hwidSwitch.setChecked(ModMenu.isSpoofOn());
        hwidSwitch.setOnCheckedChangeListener(this);
        hwidSwitch.setPadding(0, dp(16), 0, 0);
        root.addView(hwidSwitch);

        Button close = new Button(this);
        close.setText("Đóng");
        close.setOnClickListener(this);
        LinearLayout.LayoutParams closeLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        closeLp.topMargin = dp(28);
        root.addView(close, closeLp);

        setContentView(root);
    }

    @Override
    public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
        if (buttonView == webSwitch) {
            ModMenu.setWebBlocked(this, isChecked);
        } else if (buttonView == hwidSwitch) {
            ModMenu.setHwidSpoof(this, isChecked);
        }
    }

    @Override
    public void onClick(View v) {
        finish();
    }

    private int dp(int value) {
        return (int) (value * getResources().getDisplayMetrics().density + 0.5f);
    }
}
