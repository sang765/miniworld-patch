package modmenu;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

/**
 * Notification tap: open the menu as a dialog on the live game window.
 *
 * The old entry started ModMenuActivity on top of the game, which paused it
 * - loop, rendering and voice chat all stopped while the sheet was up. A
 * broadcast runs against the already-running game activity instead, so the
 * menu appears over a game that keeps playing. onReceive runs on the main
 * thread, which is where the dialog has to be built.
 */
public class ModMenuReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context ctx, Intent intent) {
        Activity host = ModMenu.gameActivity();
        if (host == null) {
            // the window died after the notification was posted; the old
            // standalone activity is the only menu left. Android 12+ refuses
            // an activity start bounced through a notification tap
            // (trampoline) - it is attempted anyway for older versions, and
            // a silent denial there is the same as doing nothing
            try {
                ctx.startActivity(new Intent(ctx, ModMenuActivity.class)
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK
                                | Intent.FLAG_ACTIVITY_SINGLE_TOP)
                        .putExtra(ModMenuActivity.EXTRA_OPEN_IDS, intent != null
                                && intent.getBooleanExtra(
                                        ModMenuActivity.EXTRA_OPEN_IDS, false)));
            } catch (RuntimeException e) {
                Log.w("ModMenu", "no live game window to open the menu on", e);
            }
            return;
        }
        ModMenuSheet.show(host, intent != null
                && intent.getBooleanExtra(ModMenuActivity.EXTRA_OPEN_IDS, false));
    }
}
