package modmenu;

import android.os.Handler;
import android.os.Looper;

import org.appplay.lib.CommonNatives;

/**
 * Rewarded-ad bypass.
 *
 * "The ad finished" is purely a client signal: the TradPlus, AnyThink and
 * MAX listeners all end in onWatchAD(1001) plus the DeliverAdEvent Lua
 * event carrying [platformId, positionId, 1001]. Firing that exact pair from
 * the reqSdkAD stub grants the reward with no ad ever loading - which also
 * covers devices where AdSDKFactory falls back to EmptyAd for low RAM.
 *
 * The pair is delayed past the reqSdkAD return so Lua has finished entering
 * its waiting state, and only one grant may be in flight so a double tap
 * cannot pay out twice.
 */
public final class AdReward {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static volatile boolean pending;

    private AdReward() {}

    public static void fire(final int platformId, final int positionId) {
        if (pending) {
            return;
        }
        pending = true;
        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                pending = false;
                CommonNatives.javaCallLuaEvent("DeliverAdEvent",
                        new Object[]{platformId, positionId, 1001});
                CommonNatives.onWatchAD(1001);
            }
        }, 800);
    }
}
