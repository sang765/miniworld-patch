package modmenu;

import android.content.Context;
import android.content.res.Resources;

/**
 * Menu and notification strings, resolved from the package resources at
 * runtime.
 *
 * Every locale lives in its own modmenu_strings.xml under
 * patches/modmenu/res (one values-* directory per language) beside the game's
 * own resources, so Android's normal resource selection picks the language
 * and falls back to the English default - no Java table.
 * The name is looked up dynamically instead of through an R class because
 * regen.sh compiles against a plain android.jar, and the committed smali must
 * stay free of resource ids.
 *
 * Callers pass a Context at use time: the mod classes can be initialized
 * before any Context exists, and resource selection needs the app
 * configuration.
 */
public final class I18n {
    private I18n() {}

    public static String t(Context ctx, String key) {
        Resources res = ctx.getResources();
        int id = res.getIdentifier(key, "string", ctx.getPackageName());
        // id 0 means the resource copy step did not run; show the key rather
        // than throw from the notification path.
        return id != 0 ? res.getString(id) : key;
    }
}
