package androidx.appcompat.widget;

/**
 * Compile-time stub: SwitchCompat ships inside the game's dex, not in
 * android.jar, but is not part of what this build produces. regen.sh compiles
 * it to a side directory used only as javac classpath - it never reaches d8.
 * The constructor signature matches the real class; everything else used by
 * ModMenuActivity is inherited from CompoundButton.
 */
public class SwitchCompat extends android.widget.CompoundButton {
    public SwitchCompat(android.content.Context context) {
        super(context);
    }
}
