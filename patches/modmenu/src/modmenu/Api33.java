package modmenu;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;

/**
 * The Android 13 notification permission. Only called from call sites guarded
 * by Build.VERSION.SDK_INT >= 33, so checkSelfPermission / requestPermissions
 * are never resolved on runtimes that lack them.
 */
final class Api33 {
    private static final String PERMISSION = "android.permission.POST_NOTIFICATIONS";
    private static final int REQUEST_CODE = 0x6d77;

    private Api33() {}

    static boolean canPost(Context ctx) {
        return ctx.checkSelfPermission(PERMISSION) == PackageManager.PERMISSION_GRANTED;
    }

    static void request(Activity activity) {
        activity.requestPermissions(new String[]{PERMISSION}, REQUEST_CODE);
    }
}
