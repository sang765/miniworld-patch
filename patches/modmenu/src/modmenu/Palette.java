package modmenu;

import android.app.WallpaperColors;
import android.app.WallpaperManager;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.os.Build;

/**
 * Material You tones for the menu.
 *
 * The hue comes from the launcher wallpaper when the system publishes one
 * (API 27+) and otherwise from the Material baseline purple; every role is
 * re-derived from that seed in HSL, so dark mode only changes each tone's
 * target lightness while keeping the user's hue.
 */
final class Palette {
    final int primary;
    final int onPrimary;
    final int surface;
    final int onSurface;
    final int onSurfaceVariant;
    final int trackOff;
    final int thumbOff;
    final int scrim;

    private Palette(int primary, int onPrimary, int surface, int onSurface,
                    int onSurfaceVariant, int trackOff, int thumbOff, int scrim) {
        this.primary = primary;
        this.onPrimary = onPrimary;
        this.surface = surface;
        this.onSurface = onSurface;
        this.onSurfaceVariant = onSurfaceVariant;
        this.trackOff = trackOff;
        this.thumbOff = thumbOff;
        this.scrim = scrim;
    }

    static Palette of(Context ctx) {
        boolean night = (ctx.getResources().getConfiguration().uiMode
                & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
        float h = 0.75f; // baseline purple, hue 270
        float s = 0.35f;
        if (Build.VERSION.SDK_INT >= 27) {
            WallpaperColors wc = WallpaperManager.getInstance(ctx)
                    .getWallpaperColors(WallpaperManager.FLAG_SYSTEM);
            if (wc != null) {
                float[] seed = toHsl(wc.getPrimaryColor().toArgb());
                // a near-grey wallpaper carries no hue worth following
                if (seed[1] >= 0.10f) {
                    h = seed[0];
                    s = Math.min(seed[1], 0.65f);
                }
            }
        }
        return new Palette(
                night ? tone(h, s, 0.80f) : tone(h, Math.min(s, 0.55f), 0.40f),
                night ? tone(h, s, 0.20f) : 0xFFFFFFFF,
                tone(h, 0.05f, night ? 0.10f : 0.98f),
                tone(h, 0.05f, night ? 0.92f : 0.12f),
                tone(h, 0.05f, night ? 0.78f : 0.33f),
                tone(h, 0.10f, night ? 0.28f : 0.90f),
                tone(h, 0.08f, night ? 0.65f : 0.70f),
                0xB3000000);
    }

    private static float[] toHsl(int color) {
        float r = ((color >> 16) & 0xFF) / 255f;
        float g = ((color >> 8) & 0xFF) / 255f;
        float b = (color & 0xFF) / 255f;
        float max = Math.max(r, Math.max(g, b));
        float min = Math.min(r, Math.min(g, b));
        float l = (max + min) / 2f;
        if (max == min) {
            return new float[]{0f, 0f, l};
        }
        float d = max - min;
        float sat = l > 0.5f ? d / (2f - max - min) : d / (max + min);
        float hue;
        if (max == r) {
            hue = (g - b) / d + (g < b ? 6f : 0f);
        } else if (max == g) {
            hue = (b - r) / d + 2f;
        } else {
            hue = (r - g) / d + 4f;
        }
        return new float[]{hue / 6f, sat, l};
    }

    private static int tone(float h, float s, float l) {
        if (s == 0f) {
            int v = clamp(Math.round(l * 255f));
            return 0xFF000000 | (v << 16) | (v << 8) | v;
        }
        float q = l < 0.5f ? l * (1f + s) : l + s - l * s;
        float p = 2f * l - q;
        int r = clamp(Math.round(hue(p, q, h + 1f / 3f) * 255f));
        int g = clamp(Math.round(hue(p, q, h) * 255f));
        int b = clamp(Math.round(hue(p, q, h - 1f / 3f) * 255f));
        return 0xFF000000 | (r << 16) | (g << 8) | b;
    }

    private static float hue(float p, float q, float t) {
        if (t < 0f) {
            t += 1f;
        }
        if (t > 1f) {
            t -= 1f;
        }
        if (t < 1f / 6f) {
            return p + (q - p) * 6f * t;
        }
        if (t < 1f / 2f) {
            return q;
        }
        if (t < 2f / 3f) {
            return p + (q - p) * (2f / 3f - t) * 6f;
        }
        return p;
    }

    private static int clamp(int v) {
        return v < 0 ? 0 : (v > 255 ? 255 : v);
    }
}
