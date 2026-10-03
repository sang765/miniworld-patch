package modmenu;

import android.app.Activity;
import android.content.Intent;

import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.internal.zbm;

import org.appplay.lib.sdk.GoogleLoginSDK;

import java.lang.reflect.Method;

/**
 * Legacy Google sign-in fallback for devices running MicroG/GmsCore.
 *
 * GoogleLoginSDK signs in through Identity One-Tap, whose service MicroG does
 * not provide; when beginSignIn fails this retries via the legacy
 * GoogleSignInApi with the same web client id, so the id token handed back is
 * still a genuine Google-signed one - the only thing the server validates.
 *
 * The work lives here instead of inside GoogleLoginSDK because the game's
 * primary dex sits a few method ids below the 64K limit, while classes8 has
 * room; callGame is private over there, so delivery goes through reflection.
 * legacySignIn's result arrives as request code 0xf4a1c, which the stub in
 * GoogleLoginSDK.OnActivityResult routes to onResult.
 */
public final class GmsCompat {
    private static final String CLIENT_ID =
            "64961101293-acdj2rrf77cn1n81fk4srh0s6242o4mp.apps.googleusercontent.com";
    private static final int LEGACY_RC = 0xf4a1c;

    private GmsCompat() {}

    public static void legacySignIn(GoogleLoginSDK sdk, Activity activity) {
        try {
            GoogleSignInOptions opts = new GoogleSignInOptions.Builder(
                    GoogleSignInOptions.DEFAULT_SIGN_IN)
                    .requestIdToken(CLIENT_ID)
                    .build();
            activity.startActivityForResult(
                    GoogleSignIn.getClient(activity, opts).getSignInIntent(), LEGACY_RC);
        } catch (Exception e) {
            deliver(sdk, -1, "");
        }
    }

    public static void onResult(GoogleLoginSDK sdk, Intent data) {
        if (data == null) {
            deliver(sdk, 0, "");
            return;
        }
        try {
            GoogleSignInAccount account = zbm.zbd(data).getSignInAccount();
            if (account == null) {
                deliver(sdk, -1, "");
                return;
            }
            String token = account.getIdToken();
            if (token == null) {
                deliver(sdk, -1, "");
                return;
            }
            deliver(sdk, 1, token);
        } catch (Exception e) {
            deliver(sdk, -1, "");
        }
    }

    private static void deliver(GoogleLoginSDK sdk, int code, String token) {
        try {
            Method callGame = sdk.getClass().getDeclaredMethod(
                    "callGame", int.class, String.class);
            callGame.setAccessible(true);
            callGame.invoke(sdk, code, token);
        } catch (Exception e) {
            // Swallowing beats crashing here: without the method the game's
            // login flow times out on its own instead of being misled, and a
            // reflection surprise must not take the whole game down.
        }
    }
}
