package modmenu;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

/**
 * The ID browser: search, filter and copy every id the game defines.
 *
 * A full-height panel over the sheet, built in code like the rest of the menu
 * - the pipeline still allows no layout resource. IdIndex supplies every id
 * the catalogs define, IdScan whatever a run of the VM adds on top; this
 * class merges the two, sorts by id and renders, and it says what it knows:
 * a scan that surfaced nothing new means the registry had not loaded yet
 * (status says so), and a scan taken outside a map carries the plugin-items
 * hint instead of hiding them. A scan
 * never runs while the panel is up - our window has the game paused behind
 * it, so its script loop is not pumping - which is why opening with no data
 * and Scan again both close the window: the scan ships on the way out and
 * the result comes back as a notification that reopens this panel.
 *
 * Each row shows the id over its display name: the localized text the game
 * keeps in its own catalogs (IdNames) when this language has one, the
 * scanned label otherwise - the filter matches all of them - with the
 * game's own icon on the left (IdIcons), or the cross glyph when it ships
 * none for that id.
 *
 * Categories are the raw keys the scan produced (item, buff, skin, ...): they
 * are the ids' own vocabulary, not menu chrome, so they stay untranslated
 * while the surrounding UI follows I18n.
 */
final class IdBrowser {
    /**
     * Chip order, fixed so a category never jumps around between opens.
     * 'recipe' is absent because the merge relabels those rows into craft -
     * both names address crafting's ids, and one row should own one chip.
     */
    private static final String[] CAT_ORDER = {
            "item", "plugin", "block", "tool", "weapon", "equip", "armor",
            "food", "projectile", "buff", "effect", "sound", "skin", "role",
            "avatar", "mob", "monster", "pet", "summon", "craft", "task",
            "achievement", "horse", "mount", "crop", "seed", "furniture",
            "home", "shop", "mall", "trade", "npc", "activity", "award",
            "bag", "emoji", "festival", "title", "tower", "other"};

    /** Numeric id order; ids that are not numbers follow, alphabetically. */
    private static final Comparator<IdScan.Entry> BY_ID =
            new Comparator<IdScan.Entry>() {
                @Override
                public int compare(IdScan.Entry a, IdScan.Entry b) {
                    long x = num(a.id), y = num(b.id);
                    if (x >= 0 && y >= 0) {
                        return x < y ? -1 : (x == y ? 0 : 1);
                    }
                    if (x >= 0) {
                        return -1;
                    }
                    if (y >= 0) {
                        return 1;
                    }
                    return a.id.compareTo(b.id);
                }
            };

    private static long num(String s) {
        try {
            long v = Long.parseLong(s);
            return v < 0 ? -1 : v;
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    private final ModMenuActivity activity;
    private final Palette p;
    private final LinearLayout panel;
    private final LinearLayout chips;
    private final TextView status;
    private final EditText search;
    private final ListView list;
    /** List plus the thin scrolling bar drawn over its right edge. */
    private final FrameLayout listWrap;
    private final View thumb;
    private final Button rescan;

    private final List<IdScan.Entry> all = new ArrayList<IdScan.Entry>();
    private final List<IdScan.Entry> shown = new ArrayList<IdScan.Entry>();
    private final Adapter adapter = new Adapter();

    private String cat = "";
    private String query = "";
    private IdScan.Result last;

    private final IdScan.Listener listener = new IdScan.Listener() {
        @Override
        public void onDone(IdScan.Result r) {
            load(r);
        }
    };

    /** Fades the bar out once the list has been still for a moment. */
    private final Runnable hideThumb = new Runnable() {
        @Override
        public void run() {
            thumb.animate().alpha(0f).setDuration(250).start();
        }
    };

    IdBrowser(ModMenuActivity activity, Palette p, FrameLayout parent) {
        this.activity = activity;
        this.p = p;

        panel = new LinearLayout(activity);
        panel.setOrientation(LinearLayout.VERTICAL);
        // consume every tap: an unhandled one would fall through to the
        // sheet's scrim listener and close the menu underneath the browser
        panel.setClickable(true);
        panel.setBackground(roundTop(p.surface, dp(28)));
        panel.setPadding(dp(20), dp(12), dp(20), dp(20));

        LinearLayout head = new LinearLayout(activity);
        head.setGravity(Gravity.CENTER_VERTICAL);
        TextView title = new TextView(activity);
        title.setText(I18n.t(activity, "id_title"));
        title.setTextSize(20);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        title.setTextColor(p.onSurface);
        head.addView(title, new LinearLayout.LayoutParams(0,
                LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        Button close = pill(I18n.t(activity, "mod_close"), 0, p.primary,
                (p.primary & 0x00FFFFFF) | 0x14000000);
        close.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                close();
            }
        });
        head.addView(close, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, dp(36)));
        panel.addView(head, matchWrap());

        TextView sub = new TextView(activity);
        sub.setText(I18n.t(activity, "mod_id_desc"));
        sub.setTextSize(13);
        sub.setTextColor(p.onSurfaceVariant);
        LinearLayout.LayoutParams subLp = matchWrap();
        subLp.topMargin = dp(2);
        panel.addView(sub, subLp);

        status = new TextView(activity);
        status.setTextSize(13);
        status.setTextColor(p.onSurfaceVariant);
        LinearLayout.LayoutParams stLp = matchWrap();
        stLp.topMargin = dp(10);
        panel.addView(status, stLp);

        search = new EditText(activity);
        search.setSingleLine(true);
        search.setHint(I18n.t(activity, "id_search"));
        search.setHintTextColor((p.onSurfaceVariant & 0x00FFFFFF) | 0x99000000);
        search.setTextColor(p.onSurface);
        search.setTextSize(15);
        search.setPadding(dp(14), dp(8), dp(14), dp(8));
        search.setBackground(field());
        search.setImeOptions(android.view.inputmethod.EditorInfo.IME_ACTION_SEARCH);
        search.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int a, int b, int c) {}

            @Override
            public void onTextChanged(CharSequence s, int a, int b, int c) {}

            @Override
            public void afterTextChanged(Editable s) {
                query = s.toString().trim().toLowerCase();
                applyFilter();
            }
        });
        LinearLayout.LayoutParams seLp = matchWrap();
        seLp.topMargin = dp(10);
        panel.addView(search, seLp);

        HorizontalScrollView scroller = new HorizontalScrollView(activity);
        scroller.setHorizontalScrollBarEnabled(false);
        chips = new LinearLayout(activity);
        scroller.addView(chips);
        LinearLayout.LayoutParams chLp = matchWrap();
        chLp.topMargin = dp(12);
        panel.addView(scroller, chLp);

        list = new ListView(activity);
        list.setDivider(null);
        list.setDividerHeight(0);
        list.setAdapter(adapter);
        // the framework fast-scroller is a fat arrowed thumb that parked over
        // the rows' Copy buttons; scrolling gets a thin M3-style bar drawn on
        // top of the list instead, and the system scrollbar stays off so no
        // second bar doubles it
        list.setFastScrollEnabled(false);
        list.setVerticalScrollBarEnabled(false);
        list.setOnItemClickListener(new android.widget.AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(android.widget.AdapterView<?> parent, View view,
                                    int position, long id) {
                copy(shown.get(position).id);
            }
        });
        listWrap = new FrameLayout(activity);
        // width comes from MATCH_PARENT, not from weight: in a vertical
        // LinearLayout weight only distributes height, so 0 width here would
        // measure the rows at EXACTLY(0) and nothing would ever draw
        listWrap.addView(list, new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT));
        thumb = new View(activity);
        // plain, non-clickable view: taps fall through to the list underneath
        thumb.setBackground(round(dp(2), (p.onSurface & 0x00FFFFFF) | 0x59000000));
        thumb.setAlpha(0f);
        thumb.setVisibility(View.INVISIBLE);
        FrameLayout.LayoutParams thLp = new FrameLayout.LayoutParams(
                dp(4), dp(28), Gravity.TOP | Gravity.END);
        thLp.rightMargin = dp(3);
        thumb.setLayoutParams(thLp);
        listWrap.addView(thumb);
        list.setOnScrollListener(new android.widget.AbsListView.OnScrollListener() {
            @Override
            public void onScroll(android.widget.AbsListView v, int first,
                                  int visible, int total) {
                showThumb();
            }

            @Override
            public void onScrollStateChanged(android.widget.AbsListView v, int state) {}
        });
        LinearLayout.LayoutParams lLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, 0, 1f);
        lLp.topMargin = dp(8);
        panel.addView(listWrap, lLp);

        LinearLayout foot = new LinearLayout(activity);
        rescan = pill(I18n.t(activity, "id_rescan"), 0, p.primary,
                (p.primary & 0x00FFFFFF) | 0x14000000);
        rescan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                scan();
            }
        });
        LinearLayout.LayoutParams rsLp = new LinearLayout.LayoutParams(0, dp(40), 1f);
        foot.addView(rescan, rsLp);
        panel.addView(foot, matchWrap());

        parent.addView(panel, new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT));
        panel.setVisibility(View.GONE);
    }

    boolean isShowing() {
        return panel.getVisibility() == View.VISIBLE;
    }

    void open() {
        // the player may have switched the game's language since last time
        IdNames.reset();
        IdScan.Result c = IdScan.current(activity);
        if (c == null) {
            // nothing scanned in this run yet, and this window is the one
            // place the script cannot run: leave so the scan ships on the
            // way out, and come back through the completion notification
            IdScan.request();
            activity.finish();
            return;
        }
        panel.setVisibility(View.VISIBLE);
        IdScan.setListener(listener);
        if (c != last) {
            load(c);
        }
        if (c.error != null) {
            // the status keeps the error visible; the retry itself is armed
            // for the next menu close
            IdScan.request();
        }
        renderStatus();
    }

    void close() {
        panel.setVisibility(View.GONE);
        // nobody is watching any more: a result landing now has to announce
        // itself instead of loading into a hidden panel
        IdScan.setListener(null);
    }

    private void scan() {
        // the script ships when this window goes away, so ask for the scan
        // by leaving; the result returns as a notification
        IdScan.request();
        activity.finish();
    }

    private void load(IdScan.Result r) {
        last = r;
        all.clear();
        // The catalogs first: every id they define, already categorized,
        // listed even when no scan ever ran - that is where the coverage
        // used to fall short. The scan only adds what the catalogs have
        // never heard of: a plugin id, a runtime record.
        String[] keys = IdIndex.keys();
        Set<String> index = new HashSet<String>(keys.length * 2);
        for (int i = 0; i < keys.length; i++) {
            index.add(keys[i]);
            int hash = keys[i].indexOf('#');
            all.add(new IdScan.Entry(keys[i].substring(hash + 1), "",
                    keys[i].substring(0, hash), ""));
        }
        if (r.error == null) {
            for (int i = 0; i < r.entries.size(); i++) {
                IdScan.Entry e = r.entries.get(i);
                // recipe and craft address crafting's ids (gen_idnames
                // maps both catalogs there): one row, one chip
                String c = e.cat.equals("recipe") ? "craft" : e.cat;
                if (IdIndex.itemCat(c)) {
                    // the catalogs own this id space - their category
                    // outranks a constant-name guess like WEAPON_* -> 0
                    if (IdIndex.inItemSpace(e.id)) {
                        continue;
                    }
                } else if (index.contains(c + "#" + e.id)) {
                    continue;
                }
                all.add(c.equals(e.cat) ? e
                        : new IdScan.Entry(e.id, e.name, c, e.src));
            }
        }
        // scan order is discovery order; readers look for ids, so sort by
        // id - the non-numeric ones, plugin-style, follow
        Collections.sort(all, BY_ID);
        rebuildChips();
        applyFilter();
    }

    private void rebuildChips() {
        Set<String> found = new LinkedHashSet<String>();
        for (int i = 0; i < all.size(); i++) {
            found.add(all.get(i).cat);
        }
        List<String> cats = new ArrayList<String>();
        for (int i = 0; i < CAT_ORDER.length; i++) {
            if (found.contains(CAT_ORDER[i])) {
                cats.add(CAT_ORDER[i]);
            }
        }
        for (String c : found) {
            if (!cats.contains(c)) {
                cats.add(c);
            }
        }
        // a category that vanished with the last scan would otherwise keep
        // filtering into an empty set with no chip left to show it
        if (cat.length() > 0 && !found.contains(cat)) {
            cat = "";
        }
        chips.removeAllViews();
        chips.addView(chip("", I18n.t(activity, "id_all")));
        for (int i = 0; i < cats.size(); i++) {
            chips.addView(chip(cats.get(i), cats.get(i)));
        }
    }

    private View chip(final String value, String label) {
        final TextView t = new TextView(activity);
        t.setText(label);
        t.setTextSize(13);
        t.setGravity(Gravity.CENTER);
        t.setPadding(dp(14), dp(7), dp(14), dp(7));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        lp.rightMargin = dp(8);
        t.setLayoutParams(lp);
        styleChip(t, value.equals(cat));
        t.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                cat = value;
                rebuildChips();
                applyFilter();
            }
        });
        return t;
    }

    private void styleChip(TextView t, boolean selected) {
        GradientDrawable d = new GradientDrawable();
        if (selected) {
            d.setColor(p.primary);
            t.setTextColor(p.onPrimary);
        } else {
            d.setColor((p.onSurface & 0x00FFFFFF) | 0x0F000000);
            d.setStroke(dp(1), (p.onSurfaceVariant & 0x00FFFFFF) | 0x4D000000);
            t.setTextColor(p.onSurfaceVariant);
        }
        d.setCornerRadius(dp(16));
        t.setBackground(d);
    }

    /**
     * The row's name: the game's own text for it, else its scanned label,
     * else - a catalog row the game left nameless - the id itself, so no
     * seeded row ever renders blank.
     */
    private String display(IdScan.Entry e) {
        String name = IdNames.get(activity, e.cat, e.id);
        if (name != null) {
            return name;
        }
        if (e.name.length() > 0) {
            return e.name;
        }
        return e.src.length() > 0 ? e.src : e.id;
    }

    private void applyFilter() {
        shown.clear();
        for (int i = 0; i < all.size(); i++) {
            IdScan.Entry e = all.get(i);
            if (cat.length() > 0 && !e.cat.equals(cat)) {
                continue;
            }
            if (query.length() > 0
                    && !e.id.toLowerCase().contains(query)
                    && !e.name.toLowerCase().contains(query)
                    && !display(e).toLowerCase().contains(query)) {
                continue;
            }
            shown.add(e);
        }
        adapter.notifyDataSetChanged();
        list.post(new Runnable() {
            @Override
            public void run() {
                showThumb();
            }
        });
        renderStatus();
    }

    /**
     * The M3 scrolling bar: sized to the share of rows on screen, parked at
     * the scroll position, visible only while the list is moving. Hidden
     * entirely when everything fits - a bar over a list that cannot scroll
     * is noise.
     */
    private void showThumb() {
        int n = adapter.getCount();
        int h = listWrap.getHeight();
        int first = list.getFirstVisiblePosition();
        int visible = list.getLastVisiblePosition() - first + 1;
        if (n <= 0 || h <= 0 || visible >= n) {
            thumb.setVisibility(View.INVISIBLE);
            return;
        }
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) thumb.getLayoutParams();
        lp.height = Math.max(dp(24), Math.min(h, (int) (h * (visible / (float) n))));
        lp.topMargin = (int) ((h - lp.height)
                * (n <= 1 ? 0f : first / (float) (n - 1)));
        thumb.setLayoutParams(lp);
        thumb.setVisibility(View.VISIBLE);
        thumb.animate().cancel();
        thumb.setAlpha(1f);
        thumb.removeCallbacks(hideThumb);
        thumb.postDelayed(hideThumb, 1200);
    }

    private void renderStatus() {
        if (IdScan.scanning()) {
            status.setText(I18n.t(activity, "id_scanning"));
            return;
        }
        if (last != null && last.error != null) {
            // the raw reason beside the message: timeout, timeout(ran),
            // nopath and a Lua error all point at different fixes
            status.setText(I18n.t(activity, "id_fail") + " (" + last.error + ")");
            return;
        }
        if (all.isEmpty()) {
            status.setText(I18n.t(activity, "id_nodata"));
            return;
        }
        if (shown.isEmpty()) {
            status.setText(I18n.t(activity, "id_empty"));
            return;
        }
        String n = (shown.size() == all.size())
                ? String.valueOf(all.size())
                : shown.size() + "/" + all.size();
        String text = n + " " + I18n.t(activity, "id_items");
        if (last != null && !last.inMap) {
            text += " · " + I18n.t(activity, "id_hint_map");
        }
        status.setText(text);
    }

    private void copy(String text) {
        boolean ok = false;
        try {
            ClipboardManager cm = (ClipboardManager)
                    activity.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null && text.length() > 0) {
                cm.setPrimaryClip(ClipData.newPlainText("miniworld-id", text));
                ok = true;
            }
        } catch (RuntimeException e) {
            // the clipboard can be pinned by a device policy - report it
            // instead of pretending the id was copied
        }
        Toast.makeText(activity, I18n.t(activity, ok ? "id_copied" : "mod_crash_failed"),
                Toast.LENGTH_SHORT).show();
    }

    private Button pill(String text, int bg, int fg, int ripple) {
        Button b = new Button(activity);
        b.setText(text);
        b.setAllCaps(false);
        b.setTextSize(14);
        b.setTextColor(fg);
        b.setGravity(Gravity.CENTER);
        b.setMinHeight(0);
        b.setMinWidth(0);
        b.setPadding(dp(20), 0, dp(20), 0);
        GradientDrawable shape = round(dp(20), bg);
        b.setBackground(new RippleDrawable(ColorStateList.valueOf(ripple), shape,
                round(dp(20), android.graphics.Color.WHITE)));
        return b;
    }

    private GradientDrawable field() {
        GradientDrawable d = new GradientDrawable();
        d.setColor((p.onSurface & 0x00FFFFFF) | 0x0A000000);
        d.setStroke(dp(1), (p.onSurfaceVariant & 0x00FFFFFF) | 0x33000000);
        d.setCornerRadius(dp(14));
        return d;
    }

    private GradientDrawable roundTop(int color, float radius) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadii(new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
        return d;
    }

    private GradientDrawable round(int radius, int color) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(radius);
        return d;
    }

    private static LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
    }

    private int dp(int value) {
        return activity.dp(value);
    }

    private static final class Holder {
        TextView id;
        TextView name;
        /** The row's icon, with the cross glyph underneath it while the game
         *  ships no icon for the id. */
        ImageView pic;
        TextView none;
        Button copy;
    }

    private final class Adapter extends BaseAdapter {
        @Override
        public int getCount() {
            return shown.size();
        }

        @Override
        public IdScan.Entry getItem(int position) {
            return shown.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            final IdScan.Entry e = shown.get(position);
            LinearLayout row;
            Holder h;
            if (convertView instanceof LinearLayout
                    && convertView.getTag() instanceof Holder) {
                row = (LinearLayout) convertView;
                h = (Holder) row.getTag();
            } else {
                row = new LinearLayout(activity);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPadding(dp(12), dp(8), dp(4), dp(8));
                row.setBackground(new RippleDrawable(
                        ColorStateList.valueOf((p.onSurface & 0x00FFFFFF) | 0x14000000),
                        null, round(dp(12), android.graphics.Color.WHITE)));
                h = new Holder();
                h.id = new TextView(activity);
                h.id.setTextSize(14);
                h.id.setTypeface(Typeface.MONOSPACE);
                h.id.setTextColor(p.onSurface);
                h.name = new TextView(activity);
                h.name.setTextSize(13);
                h.name.setTextColor(p.onSurfaceVariant);
                h.name.setSingleLine(true);
                h.name.setEllipsize(android.text.TextUtils.TruncateAt.END);
                h.none = new TextView(activity);
                h.none.setText("✗");
                h.none.setTextSize(14);
                h.none.setTextColor(p.onSurfaceVariant);
                h.none.setGravity(Gravity.CENTER);
                h.none.setVisibility(View.VISIBLE);
                h.pic = new ImageView(activity);
                h.pic.setScaleType(ImageView.ScaleType.FIT_CENTER);
                h.pic.setVisibility(View.GONE);
                FrameLayout iconWrap = new FrameLayout(activity);
                iconWrap.addView(h.pic, new FrameLayout.LayoutParams(
                        FrameLayout.LayoutParams.MATCH_PARENT,
                        FrameLayout.LayoutParams.MATCH_PARENT));
                iconWrap.addView(h.none, new FrameLayout.LayoutParams(
                        FrameLayout.LayoutParams.MATCH_PARENT,
                        FrameLayout.LayoutParams.MATCH_PARENT));
                LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(
                        dp(26), dp(26));
                iLp.rightMargin = dp(10);
                iLp.gravity = Gravity.CENTER_VERTICAL;
                row.addView(iconWrap, iLp);
                LinearLayout col = new LinearLayout(activity);
                col.setOrientation(LinearLayout.VERTICAL);
                col.addView(h.id);
                LinearLayout.LayoutParams nLp = new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        LinearLayout.LayoutParams.WRAP_CONTENT);
                nLp.topMargin = dp(1);
                col.addView(h.name, nLp);
                row.addView(col, new LinearLayout.LayoutParams(0,
                        LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
                h.copy = pill(I18n.t(activity, "id_copy"), 0, p.primary,
                        (p.primary & 0x00FFFFFF) | 0x14000000);
                h.copy.setTextSize(13);
                row.addView(h.copy, new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.WRAP_CONTENT, dp(32)));
                row.setTag(h);
            }
            h.id.setText(e.id);
            h.name.setText(display(e));
            Bitmap bmp = IdIcons.get(e.cat, e.id);
            if (bmp != null) {
                h.pic.setImageBitmap(bmp);
                h.pic.setVisibility(View.VISIBLE);
                h.none.setVisibility(View.GONE);
            } else {
                h.pic.setImageDrawable(null);
                h.pic.setVisibility(View.GONE);
                h.none.setVisibility(View.VISIBLE);
            }
            h.copy.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    copy(e.id);
                }
            });
            return row;
        }
    }
}
