package modmenu;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

/**
 * Standalone menu activity, the fallback entry: it hosts the same
 * ModMenuSheet as a dialog, which is the normal path now (the notification
 * opens the sheet on the live game window through ModMenuReceiver, so the
 * game never pauses and voice chat keeps running). This activity is only
 * started when there is no live game window to attach to.
 */
public class ModMenuActivity extends Activity {

    /** Scan-completion notification extra: reopen straight into the browser. */
    public static final String EXTRA_OPEN_IDS = "open_ids";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // show() builds the sheet, logs its own failures and finishes this
        // activity through the sheet's dismiss handler
        ModMenuSheet.show(this, getIntent() != null
                && getIntent().getBooleanExtra(EXTRA_OPEN_IDS, false));
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        // the same tap delivered to a live instance rather than a fresh one
        if (intent != null && intent.getBooleanExtra(EXTRA_OPEN_IDS, false)) {
            ModMenuSheet.show(this, true);
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        // the sheet's dismiss already ships the scan in the normal flow;
        // this covers the paths where the activity goes away under it
        IdScan.menuClosed(this);
    }

    @Override
    protected void onDestroy() {
        IdScan.setListener(null);
        super.onDestroy();
    }
}
