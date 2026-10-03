package modmenu;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;

/**
 * NotificationChannel and the channel-taking Builder - API 26+. This class is
 * only ever referenced from a Build.VERSION.SDK_INT >= 26 branch, so the
 * missing types below are never resolved on older runtimes.
 */
final class Api26 {
    private static final String CHANNEL_ID = "mod_menu";
    private static final String CHANNEL_NAME = "Mod Menu";

    private Api26() {}

    static Notification build(Context ctx, NotificationManager nm, String title,
                              String text, PendingIntent intent) {
        if (nm.getNotificationChannel(CHANNEL_ID) == null) {
            nm.createNotificationChannel(new NotificationChannel(
                    CHANNEL_ID, CHANNEL_NAME, NotificationManager.IMPORTANCE_DEFAULT));
        }
        return new Notification.Builder(ctx, CHANNEL_ID)
                .setContentTitle(title)
                .setContentText(text)
                .setSmallIcon(ctx.getApplicationInfo().icon)
                .setContentIntent(intent)
                .build();
    }
}
