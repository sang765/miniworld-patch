.class final Lmodmenu/IdBrowser;
.super Ljava/lang/Object;
.source "IdBrowser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmodmenu/IdBrowser$Adapter;,
        Lmodmenu/IdBrowser$Row;,
        Lmodmenu/IdBrowser$Holder;
    }
.end annotation


# static fields
.field private static final BY_ID:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lmodmenu/IdBrowser$Row;",
            ">;"
        }
    .end annotation
.end field

.field private static final BY_NAME:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lmodmenu/IdBrowser$Row;",
            ">;"
        }
    .end annotation
.end field

.field private static final CAT_ORDER:[Ljava/lang/String;

.field private static final PREFS:Ljava/lang/String; = "idbrowser"

.field private static final SORT_LABELS:[Ljava/lang/String;

.field private static rows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lmodmenu/IdBrowser$Row;",
            ">;"
        }
    .end annotation
.end field

.field private static rowsFor:Lmodmenu/IdScan$Result;

.field private static rowsLang:Ljava/lang/String;

.field private static rowsSort:I


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final adapter:Lmodmenu/IdBrowser$Adapter;

.field private all:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lmodmenu/IdBrowser$Row;",
            ">;"
        }
    .end annotation
.end field

.field private cat:Ljava/lang/String;

.field private final chips:Landroid/widget/LinearLayout;

.field private final closer:Ljava/lang/Runnable;

.field private final hideThumb:Ljava/lang/Runnable;

.field private last:Lmodmenu/IdScan$Result;

.field private final list:Landroid/widget/ListView;

.field private final listWrap:Landroid/widget/FrameLayout;

.field private final listener:Lmodmenu/IdScan$Listener;

.field private final p:Lmodmenu/Palette;

.field private final panel:Landroid/widget/LinearLayout;

.field private query:Ljava/lang/String;

.field private final rescan:Landroid/widget/Button;

.field private final search:Landroid/widget/EditText;

.field private final shown:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lmodmenu/IdBrowser$Row;",
            ">;"
        }
    .end annotation
.end field

.field private sort:I

.field private final sortBtn:Landroid/widget/Button;

.field private final status:Landroid/widget/TextView;

.field private table:Z

.field private final tableHead:Landroid/widget/LinearLayout;

.field private terms:[Ljava/lang/String;

.field private final thumb:Landroid/view/View;

.field private final viewBtn:Landroid/widget/Button;


# direct methods
.method static constructor <clinit>()V
    .locals 41

    .line 83
    const-string v39, "tower"

    const-string v40, "other"

    const-string v1, "item"

    const-string v2, "plugin"

    const-string v3, "block"

    const-string v4, "tool"

    const-string v5, "weapon"

    const-string v6, "equip"

    const-string v7, "armor"

    const-string v8, "food"

    const-string v9, "projectile"

    const-string v10, "buff"

    const-string v11, "effect"

    const-string v12, "sound"

    const-string v13, "skin"

    const-string v14, "role"

    const-string v15, "avatar"

    const-string v16, "mob"

    const-string v17, "monster"

    const-string v18, "pet"

    const-string v19, "summon"

    const-string v20, "craft"

    const-string v21, "task"

    const-string v22, "achievement"

    const-string v23, "horse"

    const-string v24, "mount"

    const-string v25, "crop"

    const-string v26, "seed"

    const-string v27, "furniture"

    const-string v28, "home"

    const-string v29, "shop"

    const-string v30, "mall"

    const-string v31, "trade"

    const-string v32, "npc"

    const-string v33, "activity"

    const-string v34, "award"

    const-string v35, "bag"

    const-string v36, "emoji"

    const-string v37, "festival"

    const-string v38, "title"

    filled-new-array/range {v1 .. v40}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    .line 95
    const-string v0, "A-Z"

    const-string v1, "Z-A"

    const-string v2, "ID \u2191"

    const-string v3, "ID \u2193"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lmodmenu/IdBrowser;->SORT_LABELS:[Ljava/lang/String;

    .line 98
    new-instance v0, Lmodmenu/IdBrowser$1;

    invoke-direct {v0}, Lmodmenu/IdBrowser$1;-><init>()V

    sput-object v0, Lmodmenu/IdBrowser;->BY_ID:Ljava/util/Comparator;

    .line 118
    new-instance v0, Lmodmenu/IdBrowser$2;

    invoke-direct {v0}, Lmodmenu/IdBrowser$2;-><init>()V

    sput-object v0, Lmodmenu/IdBrowser;->BY_NAME:Ljava/util/Comparator;

    .line 216
    const/4 v0, -0x1

    sput v0, Lmodmenu/IdBrowser;->rowsSort:I

    return-void
.end method

.method constructor <init>(Landroid/app/Activity;Lmodmenu/Palette;Landroid/widget/FrameLayout;Ljava/lang/Runnable;)V
    .locals 17

    .line 245
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 219
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    .line 220
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    .line 221
    new-instance v3, Lmodmenu/IdBrowser$Adapter;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4}, Lmodmenu/IdBrowser$Adapter;-><init>(Lmodmenu/IdBrowser;Lmodmenu/IdBrowser$1;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    .line 223
    const-string v3, ""

    iput-object v3, v0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    .line 224
    iput-object v3, v0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    .line 230
    new-instance v3, Lmodmenu/IdBrowser$3;

    invoke-direct {v3, v0}, Lmodmenu/IdBrowser$3;-><init>(Lmodmenu/IdBrowser;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->listener:Lmodmenu/IdScan$Listener;

    .line 238
    new-instance v3, Lmodmenu/IdBrowser$4;

    invoke-direct {v3, v0}, Lmodmenu/IdBrowser$4;-><init>(Lmodmenu/IdBrowser;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->hideThumb:Ljava/lang/Runnable;

    .line 246
    iput-object v1, v0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    .line 247
    iput-object v2, v0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    .line 248
    move-object/from16 v3, p4

    iput-object v3, v0, Lmodmenu/IdBrowser;->closer:Ljava/lang/Runnable;

    .line 250
    const-string v3, "idbrowser"

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v5}, Landroid/app/Activity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 252
    const-string v6, "sort"

    invoke-interface {v3, v6, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    iput v6, v0, Lmodmenu/IdBrowser;->sort:I

    .line 253
    iget v6, v0, Lmodmenu/IdBrowser;->sort:I

    if-ltz v6, :cond_0

    iget v6, v0, Lmodmenu/IdBrowser;->sort:I

    sget-object v7, Lmodmenu/IdBrowser;->SORT_LABELS:[Ljava/lang/String;

    array-length v7, v7

    if-lt v6, v7, :cond_1

    .line 254
    :cond_0
    iput v5, v0, Lmodmenu/IdBrowser;->sort:I

    .line 256
    :cond_1
    const-string v6, "table"

    invoke-interface {v3, v6, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, v0, Lmodmenu/IdBrowser;->table:Z

    .line 258
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    .line 259
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/4 v6, 0x1

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 262
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 263
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget v7, v2, Lmodmenu/Palette;->surface:I

    const/16 v8, 0x1c

    invoke-direct {v0, v8}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v9

    int-to-float v9, v9

    invoke-direct {v0, v7, v9}, Lmodmenu/IdBrowser;->roundTop(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 264
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/16 v7, 0x14

    invoke-direct {v0, v7}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v9

    const/16 v10, 0xc

    invoke-direct {v0, v10}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v11

    invoke-direct {v0, v7}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v12

    invoke-direct {v0, v7}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    invoke-virtual {v3, v9, v11, v12, v7}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 266
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 267
    const/16 v7, 0x10

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 268
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 269
    const-string v11, "id_title"

    invoke-static {v1, v11}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 270
    const/high16 v11, 0x41a00000    # 20.0f

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setTextSize(F)V

    .line 271
    sget-object v11, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 272
    iget v11, v2, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 273
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v11, v5, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v9, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 275
    const-string v9, "mod_close"

    invoke-static {v1, v9}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iget v11, v2, Lmodmenu/Palette;->primary:I

    iget v14, v2, Lmodmenu/Palette;->primary:I

    const v15, 0xffffff

    and-int/2addr v14, v15

    const/high16 v16, 0x14000000

    or-int v14, v14, v16

    invoke-direct {v0, v9, v5, v11, v14}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v9

    .line 277
    new-instance v11, Lmodmenu/IdBrowser$5;

    invoke-direct {v11, v0}, Lmodmenu/IdBrowser$5;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v9, v11}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 283
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    .line 284
    const/16 v14, 0x24

    invoke-direct {v0, v14}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v14

    invoke-direct {v11, v12, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 283
    invoke-virtual {v3, v9, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 285
    iget-object v9, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v11

    invoke-virtual {v9, v3, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 287
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 288
    const-string v9, "mod_id_desc"

    invoke-static {v1, v9}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    const/high16 v9, 0x41500000    # 13.0f

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 290
    iget v11, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 291
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v11

    .line 292
    const/4 v14, 0x2

    const p4, 0xffffff

    invoke-direct {v0, v14}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v15

    iput v15, v11, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 293
    iget-object v15, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v15, v3, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 295
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    .line 296
    iget-object v3, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 297
    iget-object v3, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget v9, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 298
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 299
    const/16 v9, 0xa

    invoke-direct {v0, v9}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v11

    iput v11, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 300
    iget-object v11, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v15, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    invoke-virtual {v11, v15, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 302
    new-instance v3, Landroid/widget/EditText;

    invoke-direct {v3, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    .line 303
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 304
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const-string v6, "id_search"

    invoke-static {v1, v6}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 305
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    iget v6, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int v6, v6, p4

    const/high16 v11, -0x67000000

    or-int/2addr v6, v11

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 306
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    iget v6, v2, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setTextColor(I)V

    .line 307
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const/high16 v6, 0x41700000    # 15.0f

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setTextSize(F)V

    .line 308
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const/16 v6, 0xe

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v11

    const/16 v15, 0x8

    invoke-direct {v0, v15}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v8

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v6

    invoke-direct {v0, v15}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v14

    invoke-virtual {v3, v11, v8, v6, v14}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 309
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    invoke-direct {v0}, Lmodmenu/IdBrowser;->field()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 310
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const/4 v6, 0x3

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 311
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    new-instance v8, Lmodmenu/IdBrowser$6;

    invoke-direct {v8, v0}, Lmodmenu/IdBrowser$6;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v3, v8}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 324
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 325
    invoke-direct {v0, v9}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v8

    iput v8, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 326
    iget-object v8, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v11, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    invoke-virtual {v8, v11, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 328
    new-instance v3, Landroid/widget/HorizontalScrollView;

    invoke-direct {v3, v1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 329
    invoke-virtual {v3, v5}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 330
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    .line 331
    iget-object v8, v0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v8}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 332
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v8

    .line 333
    invoke-direct {v0, v10}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v11

    iput v11, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 334
    iget-object v11, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v11, v3, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 338
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    .line 339
    iget-object v3, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 340
    iget-object v3, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    invoke-direct {v0, v10}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    const/4 v8, 0x6

    invoke-direct {v0, v8}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v8

    const/4 v10, 0x4

    invoke-direct {v0, v10}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v11

    const/4 v14, 0x6

    invoke-direct {v0, v14}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v14

    invoke-virtual {v3, v7, v8, v11, v14}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 345
    iget-object v3, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    new-instance v7, Landroid/view/View;

    invoke-direct {v7, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    .line 346
    const/16 v11, 0x1e

    invoke-direct {v0, v11}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v11

    invoke-direct {v8, v11, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 345
    invoke-virtual {v3, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 347
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 348
    const-string v7, "ID"

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 349
    const/high16 v7, 0x41300000    # 11.0f

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 350
    sget-object v8, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 351
    iget v8, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 352
    iget-object v8, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    .line 353
    const/16 v14, 0x3a

    invoke-direct {v0, v14}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v14

    invoke-direct {v11, v14, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 352
    invoke-virtual {v8, v3, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 354
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 355
    const-string v8, "id_col_name"

    invoke-static {v1, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 356
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 357
    iget v8, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 358
    iget-object v8, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v11, v5, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v3, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 360
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 361
    const-string v8, "id_col_cat"

    invoke-static {v1, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 362
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 363
    iget v7, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 364
    iget-object v7, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v3, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 367
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 368
    invoke-direct {v0, v9}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 369
    iget-object v7, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v8, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v8, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 371
    new-instance v3, Landroid/widget/ListView;

    invoke-direct {v3, v1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    .line 372
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 373
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 374
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    iget-object v4, v0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 379
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setFastScrollEnabled(Z)V

    .line 380
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setVerticalScrollBarEnabled(Z)V

    .line 381
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v4, Lmodmenu/IdBrowser$7;

    invoke-direct {v4, v0}, Lmodmenu/IdBrowser$7;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 388
    new-instance v3, Landroid/widget/FrameLayout;

    invoke-direct {v3, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    .line 392
    iget-object v3, v0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    iget-object v4, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v8, -0x1

    invoke-direct {v7, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 395
    new-instance v3, Landroid/view/View;

    invoke-direct {v3, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    .line 397
    iget-object v3, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/4 v4, 0x2

    invoke-direct {v0, v4}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    iget v7, v2, Lmodmenu/Palette;->onSurface:I

    and-int v7, v7, p4

    const/high16 v9, 0x59000000

    or-int/2addr v7, v9

    invoke-direct {v0, v4, v7}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 398
    iget-object v3, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 399
    iget-object v3, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v3, v10}, Landroid/view/View;->setVisibility(I)V

    .line 400
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 401
    invoke-direct {v0, v10}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    const/16 v7, 0x1c

    invoke-direct {v0, v7}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    const v9, 0x800035

    invoke-direct {v3, v4, v7, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 402
    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 403
    iget-object v4, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 404
    iget-object v3, v0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    iget-object v4, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 405
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v4, Lmodmenu/IdBrowser$8;

    invoke-direct {v4, v0}, Lmodmenu/IdBrowser$8;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 415
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v8, v5, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 417
    invoke-direct {v0, v15}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 418
    iget-object v4, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 420
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 421
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u21c5 "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v6, Lmodmenu/IdBrowser;->SORT_LABELS:[Ljava/lang/String;

    iget v7, v0, Lmodmenu/IdBrowser;->sort:I

    aget-object v6, v6, v7

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget v6, v2, Lmodmenu/Palette;->primary:I

    iget v7, v2, Lmodmenu/Palette;->primary:I

    and-int v7, v7, p4

    or-int v7, v7, v16

    invoke-direct {v0, v4, v5, v6, v7}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v4

    iput-object v4, v0, Lmodmenu/IdBrowser;->sortBtn:Landroid/widget/Button;

    .line 423
    iget-object v4, v0, Lmodmenu/IdBrowser;->sortBtn:Landroid/widget/Button;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 424
    const-string v7, "id_sort"

    invoke-static {v1, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v7, Lmodmenu/IdBrowser;->SORT_LABELS:[Ljava/lang/String;

    iget v9, v0, Lmodmenu/IdBrowser;->sort:I

    aget-object v7, v7, v9

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 423
    invoke-virtual {v4, v6}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 425
    iget-object v4, v0, Lmodmenu/IdBrowser;->sortBtn:Landroid/widget/Button;

    new-instance v6, Lmodmenu/IdBrowser$9;

    invoke-direct {v6, v0, v1}, Lmodmenu/IdBrowser$9;-><init>(Lmodmenu/IdBrowser;Landroid/app/Activity;)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 438
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 439
    const/16 v6, 0x28

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    invoke-direct {v4, v12, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 440
    invoke-direct {v0, v15}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    iput v7, v4, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 441
    iget-object v7, v0, Lmodmenu/IdBrowser;->sortBtn:Landroid/widget/Button;

    invoke-virtual {v3, v7, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 442
    iget-boolean v4, v0, Lmodmenu/IdBrowser;->table:Z

    if-eqz v4, :cond_2

    const-string v4, "id_view_list"

    invoke-static {v1, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 443
    :cond_2
    const-string v4, "id_view_table"

    invoke-static {v1, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_0
    iget v7, v2, Lmodmenu/Palette;->primary:I

    iget v9, v2, Lmodmenu/Palette;->primary:I

    and-int v9, v9, p4

    or-int v9, v9, v16

    .line 442
    invoke-direct {v0, v4, v5, v7, v9}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v4

    iput-object v4, v0, Lmodmenu/IdBrowser;->viewBtn:Landroid/widget/Button;

    .line 445
    iget-object v4, v0, Lmodmenu/IdBrowser;->viewBtn:Landroid/widget/Button;

    new-instance v7, Lmodmenu/IdBrowser$10;

    invoke-direct {v7, v0, v1}, Lmodmenu/IdBrowser$10;-><init>(Lmodmenu/IdBrowser;Landroid/app/Activity;)V

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 454
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 455
    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    invoke-direct {v4, v12, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 456
    invoke-direct {v0, v15}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    iput v7, v4, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 457
    iget-object v7, v0, Lmodmenu/IdBrowser;->viewBtn:Landroid/widget/Button;

    invoke-virtual {v3, v7, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 458
    const-string v4, "id_rescan"

    invoke-static {v1, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v4, v2, Lmodmenu/Palette;->primary:I

    iget v2, v2, Lmodmenu/Palette;->primary:I

    and-int v2, v2, p4

    or-int v2, v2, v16

    invoke-direct {v0, v1, v5, v4, v2}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, v0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    .line 460
    iget-object v1, v0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    new-instance v2, Lmodmenu/IdBrowser$11;

    invoke-direct {v2, v0}, Lmodmenu/IdBrowser$11;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 466
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v2

    invoke-direct {v1, v5, v2, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 467
    iget-object v2, v0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    invoke-virtual {v3, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 468
    iget-object v1, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 470
    invoke-direct {v0}, Lmodmenu/IdBrowser;->applyView()V

    .line 471
    iget-object v1, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    move-object/from16 v3, p3

    invoke-virtual {v3, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 474
    iget-object v1, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v15}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 475
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)J
    .locals 2

    .line 77
    invoke-static {p0}, Lmodmenu/IdBrowser;->num(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$100()Ljava/util/Comparator;
    .locals 1

    .line 77
    sget-object v0, Lmodmenu/IdBrowser;->BY_ID:Ljava/util/Comparator;

    return-object v0
.end method

.method static synthetic access$1000(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 77
    invoke-direct {p0}, Lmodmenu/IdBrowser;->showThumb()V

    return-void
.end method

.method static synthetic access$1100(Lmodmenu/IdBrowser;)I
    .locals 0

    .line 77
    iget p0, p0, Lmodmenu/IdBrowser;->sort:I

    return p0
.end method

.method static synthetic access$1102(Lmodmenu/IdBrowser;I)I
    .locals 0

    .line 77
    iput p1, p0, Lmodmenu/IdBrowser;->sort:I

    return p1
.end method

.method static synthetic access$1200()[Ljava/lang/String;
    .locals 1

    .line 77
    sget-object v0, Lmodmenu/IdBrowser;->SORT_LABELS:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1300(Lmodmenu/IdBrowser;)Landroid/widget/Button;
    .locals 0

    .line 77
    iget-object p0, p0, Lmodmenu/IdBrowser;->sortBtn:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$1400(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 77
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applySort()V

    return-void
.end method

.method static synthetic access$1500(Lmodmenu/IdBrowser;)Z
    .locals 0

    .line 77
    iget-boolean p0, p0, Lmodmenu/IdBrowser;->table:Z

    return p0
.end method

.method static synthetic access$1502(Lmodmenu/IdBrowser;Z)Z
    .locals 0

    .line 77
    iput-boolean p1, p0, Lmodmenu/IdBrowser;->table:Z

    return p1
.end method

.method static synthetic access$1600(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 77
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applyView()V

    return-void
.end method

.method static synthetic access$1700(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 77
    invoke-direct {p0}, Lmodmenu/IdBrowser;->scan()V

    return-void
.end method

.method static synthetic access$1802(Lmodmenu/IdBrowser;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 77
    iput-object p1, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1900(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 77
    invoke-direct {p0}, Lmodmenu/IdBrowser;->rebuildChips()V

    return-void
.end method

.method static synthetic access$200(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 77
    invoke-static {p0}, Lmodmenu/IdBrowser;->fold(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2000(Lmodmenu/IdBrowser;)Landroid/app/Activity;
    .locals 0

    .line 77
    iget-object p0, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$2100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;
    .locals 0

    .line 77
    iget-object p0, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    return-object p0
.end method

.method static synthetic access$2200(Lmodmenu/IdBrowser;I)I
    .locals 0

    .line 77
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$2300(Lmodmenu/IdBrowser;II)Landroid/graphics/drawable/GradientDrawable;
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2500(Lmodmenu/IdBrowser;Ljava/lang/String;III)Landroid/widget/Button;
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2, p3, p4}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lmodmenu/IdBrowser;Lmodmenu/IdScan$Result;)V
    .locals 0

    .line 77
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser;->load(Lmodmenu/IdScan$Result;)V

    return-void
.end method

.method static synthetic access$500(Lmodmenu/IdBrowser;)Landroid/view/View;
    .locals 0

    .line 77
    iget-object p0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$602(Lmodmenu/IdBrowser;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 77
    iput-object p1, p0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$700(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 77
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applyFilter()V

    return-void
.end method

.method static synthetic access$800(Lmodmenu/IdBrowser;)Ljava/util/List;
    .locals 0

    .line 77
    iget-object p0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$900(Lmodmenu/IdBrowser;Ljava/lang/String;)V
    .locals 0

    .line 77
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser;->copy(Ljava/lang/String;)V

    return-void
.end method

.method private applyFilter()V
    .locals 4

    .line 698
    iget-object v0, p0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    invoke-static {v0}, Lmodmenu/IdBrowser;->parseTerms(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/IdBrowser;->terms:[Ljava/lang/String;

    .line 699
    iget-object v0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 700
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 701
    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmodmenu/IdBrowser$Row;

    .line 702
    iget-object v2, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    iget-object v2, v1, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v2, v2, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    iget-object v3, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 703
    goto :goto_1

    .line 705
    :cond_0
    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->match(Lmodmenu/IdBrowser$Row;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 706
    goto :goto_1

    .line 708
    :cond_1
    iget-object v2, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 700
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 710
    :cond_2
    iget-object v0, p0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v0}, Lmodmenu/IdBrowser$Adapter;->notifyDataSetChanged()V

    .line 711
    iget-object v0, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v1, Lmodmenu/IdBrowser$13;

    invoke-direct {v1, p0}, Lmodmenu/IdBrowser$13;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    .line 717
    invoke-direct {p0}, Lmodmenu/IdBrowser;->renderStatus()V

    .line 718
    return-void
.end method

.method private applySort()V
    .locals 2

    .line 579
    sget v0, Lmodmenu/IdBrowser;->rowsSort:I

    iget v1, p0, Lmodmenu/IdBrowser;->sort:I

    if-ne v0, v1, :cond_0

    .line 580
    return-void

    .line 583
    :cond_0
    iget v0, p0, Lmodmenu/IdBrowser;->sort:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 584
    sget-object v0, Lmodmenu/IdBrowser;->BY_ID:Ljava/util/Comparator;

    invoke-static {v0}, Ljava/util/Collections;->reverseOrder(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v0

    goto :goto_0

    .line 585
    :cond_1
    iget v0, p0, Lmodmenu/IdBrowser;->sort:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 586
    sget-object v0, Lmodmenu/IdBrowser;->BY_NAME:Ljava/util/Comparator;

    goto :goto_0

    .line 587
    :cond_2
    iget v0, p0, Lmodmenu/IdBrowser;->sort:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    .line 588
    sget-object v0, Lmodmenu/IdBrowser;->BY_NAME:Ljava/util/Comparator;

    invoke-static {v0}, Ljava/util/Collections;->reverseOrder(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v0

    goto :goto_0

    .line 590
    :cond_3
    sget-object v0, Lmodmenu/IdBrowser;->BY_ID:Ljava/util/Comparator;

    .line 592
    :goto_0
    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 593
    iget v0, p0, Lmodmenu/IdBrowser;->sort:I

    sput v0, Lmodmenu/IdBrowser;->rowsSort:I

    .line 594
    return-void
.end method

.method private applyView()V
    .locals 4

    .line 602
    iget-object v0, p0, Lmodmenu/IdBrowser;->viewBtn:Landroid/widget/Button;

    iget-boolean v1, p0, Lmodmenu/IdBrowser;->table:Z

    .line 603
    iget-object v2, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    .line 602
    if-eqz v1, :cond_0

    const-string v1, "id_view_list"

    invoke-static {v2, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 603
    :cond_0
    const-string v1, "id_view_table"

    invoke-static {v2, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 602
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 604
    iget-object v0, p0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    iget-boolean v1, p0, Lmodmenu/IdBrowser;->table:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    const/16 v1, 0x8

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 605
    iget-boolean v0, p0, Lmodmenu/IdBrowser;->table:Z

    .line 610
    iget-object v1, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    .line 605
    if-eqz v0, :cond_2

    .line 606
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    const v3, 0xffffff

    and-int/2addr v2, v3

    const/high16 v3, 0x33000000

    or-int/2addr v2, v3

    invoke-direct {v0, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 608
    iget-object v0, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setDividerHeight(I)V

    goto :goto_2

    .line 610
    :cond_2
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 611
    iget-object v0, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 613
    :goto_2
    iget-object v0, p0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v0}, Lmodmenu/IdBrowser$Adapter;->notifyDataSetChanged()V

    .line 614
    return-void
.end method

.method private chip(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .locals 4

    .line 645
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 646
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 647
    const/high16 p2, 0x41500000    # 13.0f

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 648
    const/16 p2, 0x11

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 649
    const/16 p2, 0xe

    invoke-direct {p0, p2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    const/4 v2, 0x7

    invoke-direct {p0, v2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v3

    invoke-direct {p0, p2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p2

    invoke-direct {p0, v2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v2

    invoke-virtual {v0, v1, v3, p2, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 650
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p2, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 653
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    iput v1, p2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 654
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 655
    iget-object p2, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    invoke-direct {p0, v0, p2}, Lmodmenu/IdBrowser;->styleChip(Landroid/widget/TextView;Z)V

    .line 656
    new-instance p2, Lmodmenu/IdBrowser$12;

    invoke-direct {p2, p0, p1}, Lmodmenu/IdBrowser$12;-><init>(Lmodmenu/IdBrowser;Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 664
    return-object v0
.end method

.method private copy(Ljava/lang/String;)V
    .locals 3

    .line 823
    nop

    .line 825
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    const-string v2, "clipboard"

    .line 826
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    .line 827
    if-eqz v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 828
    const-string v2, "miniworld-id"

    invoke-static {v2, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 829
    const/4 p1, 0x1

    goto :goto_0

    .line 834
    :cond_0
    const/4 p1, 0x0

    :goto_0
    goto :goto_1

    .line 831
    :catch_0
    move-exception p1

    const/4 p1, 0x0

    .line 835
    :goto_1
    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    iget-object v2, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    if-eqz p1, :cond_1

    const-string p1, "id_copied"

    goto :goto_2

    :cond_1
    const-string p1, "mod_crash_failed"

    :goto_2
    invoke-static {v2, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 836
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 837
    return-void
.end method

.method private display(Lmodmenu/IdScan$Entry;)Ljava/lang/String;
    .locals 3

    .line 687
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    iget-object v1, p1, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    iget-object v2, p1, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lmodmenu/IdNames;->get(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 688
    if-eqz v0, :cond_0

    .line 689
    return-object v0

    .line 691
    :cond_0
    iget-object v0, p1, Lmodmenu/IdScan$Entry;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 692
    iget-object p1, p1, Lmodmenu/IdScan$Entry;->name:Ljava/lang/String;

    return-object p1

    .line 694
    :cond_1
    iget-object v0, p1, Lmodmenu/IdScan$Entry;->src:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2

    iget-object p1, p1, Lmodmenu/IdScan$Entry;->src:Ljava/lang/String;

    goto :goto_0

    :cond_2
    iget-object p1, p1, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    :goto_0
    return-object p1
.end method

.method private dp(I)I
    .locals 1

    .line 883
    int-to-float p1, p1

    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private field()Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    .line 856
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 857
    iget-object v1, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v1, v1, Lmodmenu/Palette;->onSurface:I

    const v2, 0xffffff

    and-int/2addr v1, v2

    const/high16 v3, 0xa000000

    or-int/2addr v1, v3

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 858
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    iget-object v3, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int/2addr v2, v3

    const/high16 v3, 0x33000000

    or-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 859
    const/16 v1, 0xe

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 860
    return-object v0
.end method

.method private static fold(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 165
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 166
    const-string p0, ""

    return-object p0

    .line 168
    :cond_0
    sget-object v0, Ljava/text/Normalizer$Form;->NFD:Ljava/text/Normalizer$Form;

    invoke-static {p0, v0}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object p0

    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 170
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 171
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 172
    const/16 v3, 0x300

    if-lt v2, v3, :cond_1

    const/16 v3, 0x36f

    if-gt v2, v3, :cond_1

    .line 173
    goto :goto_1

    .line 175
    :cond_1
    const/16 v3, 0x111

    if-ne v2, v3, :cond_2

    .line 176
    const/16 v2, 0x64

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 177
    :cond_2
    const/16 v3, 0x110

    if-ne v2, v3, :cond_3

    .line 178
    const/16 v2, 0x44

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 180
    :cond_3
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 170
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 183
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private load(Lmodmenu/IdScan$Result;)V
    .locals 10

    .line 522
    iput-object p1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    .line 523
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lmodmenu/IdNames;->lang(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 524
    sget-object v1, Lmodmenu/IdBrowser;->rowsFor:Lmodmenu/IdScan$Result;

    if-ne p1, v1, :cond_0

    sget-object v1, Lmodmenu/IdBrowser;->rows:Ljava/util/List;

    if-eqz v1, :cond_0

    sget-object v1, Lmodmenu/IdBrowser;->rowsLang:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 525
    sget-object p1, Lmodmenu/IdBrowser;->rows:Ljava/util/List;

    iput-object p1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    goto/16 :goto_4

    .line 531
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0x7530

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 532
    invoke-static {}, Lmodmenu/IdIndex;->keys()[Ljava/lang/String;

    move-result-object v2

    .line 533
    new-instance v3, Ljava/util/HashSet;

    array-length v4, v2

    mul-int/lit8 v4, v4, 0x2

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 534
    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    array-length v6, v2

    if-ge v5, v6, :cond_1

    .line 535
    aget-object v6, v2, v5

    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 536
    aget-object v6, v2, v5

    const/16 v7, 0x23

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 537
    new-instance v7, Lmodmenu/IdScan$Entry;

    aget-object v8, v2, v5

    add-int/lit8 v9, v6, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    aget-object v9, v2, v5

    .line 538
    invoke-virtual {v9, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const-string v9, ""

    invoke-direct {v7, v8, v9, v6, v9}, Lmodmenu/IdScan$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 539
    new-instance v6, Lmodmenu/IdBrowser$Row;

    invoke-direct {p0, v7}, Lmodmenu/IdBrowser;->display(Lmodmenu/IdScan$Entry;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lmodmenu/IdBrowser$Row;-><init>(Lmodmenu/IdScan$Entry;Ljava/lang/String;)V

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 534
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 541
    :cond_1
    iget-object v2, p1, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-nez v2, :cond_6

    .line 542
    nop

    :goto_1
    iget-object v2, p1, Lmodmenu/IdScan$Result;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v4, v2, :cond_6

    .line 543
    iget-object v2, p1, Lmodmenu/IdScan$Result;->entries:Ljava/util/List;

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmodmenu/IdScan$Entry;

    .line 546
    iget-object v5, v2, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    const-string v6, "recipe"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, "craft"

    goto :goto_2

    :cond_2
    iget-object v5, v2, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    .line 547
    :goto_2
    invoke-static {v5}, Lmodmenu/IdIndex;->itemCat(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 550
    iget-object v6, v2, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-static {v6}, Lmodmenu/IdIndex;->inItemSpace(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 551
    goto :goto_3

    .line 553
    :cond_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "#"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v2, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 554
    goto :goto_3

    .line 556
    :cond_4
    iget-object v6, v2, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 557
    new-instance v6, Lmodmenu/IdScan$Entry;

    iget-object v7, v2, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    iget-object v8, v2, Lmodmenu/IdScan$Entry;->name:Ljava/lang/String;

    iget-object v2, v2, Lmodmenu/IdScan$Entry;->src:Ljava/lang/String;

    invoke-direct {v6, v7, v8, v5, v2}, Lmodmenu/IdScan$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v6

    .line 559
    :cond_5
    new-instance v5, Lmodmenu/IdBrowser$Row;

    invoke-direct {p0, v2}, Lmodmenu/IdBrowser;->display(Lmodmenu/IdScan$Entry;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v2, v6}, Lmodmenu/IdBrowser$Row;-><init>(Lmodmenu/IdScan$Entry;Ljava/lang/String;)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 542
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 562
    :cond_6
    sput-object v1, Lmodmenu/IdBrowser;->rows:Ljava/util/List;

    .line 563
    sput-object p1, Lmodmenu/IdBrowser;->rowsFor:Lmodmenu/IdScan$Result;

    .line 564
    sput-object v0, Lmodmenu/IdBrowser;->rowsLang:Ljava/lang/String;

    .line 565
    const/4 p1, -0x1

    sput p1, Lmodmenu/IdBrowser;->rowsSort:I

    .line 566
    sget-object p1, Lmodmenu/IdBrowser;->rows:Ljava/util/List;

    iput-object p1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    .line 568
    :goto_4
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applySort()V

    .line 569
    invoke-direct {p0}, Lmodmenu/IdBrowser;->rebuildChips()V

    .line 570
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applyFilter()V

    .line 571
    return-void
.end method

.method private match(Lmodmenu/IdBrowser$Row;)Z
    .locals 6

    .line 746
    iget-object v0, p0, Lmodmenu/IdBrowser;->terms:[Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 747
    return v1

    .line 749
    :cond_0
    const/4 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lmodmenu/IdBrowser;->terms:[Ljava/lang/String;

    array-length v3, v3

    if-ge v2, v3, :cond_4

    .line 750
    iget-object v3, p0, Lmodmenu/IdBrowser;->terms:[Ljava/lang/String;

    aget-object v3, v3, v2

    .line 751
    const-string v4, "cat:"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 752
    iget-object v4, p1, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v4, v4, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    const/4 v5, 0x4

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 753
    return v0

    .line 755
    :cond_1
    const-string v4, "#"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 756
    iget-object v4, p1, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v4, v4, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 757
    return v0

    .line 759
    :cond_2
    iget-object v4, p1, Lmodmenu/IdBrowser$Row;->key:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 760
    return v0

    .line 749
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 763
    :cond_4
    return v1
.end method

.method private static matchWrap()Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .line 878
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method private static num(Ljava/lang/String;)J
    .locals 6

    .line 129
    const-wide/16 v0, -0x1

    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    const-wide/16 v4, 0x0

    cmp-long p0, v2, v4

    if-gez p0, :cond_0

    goto :goto_0

    :cond_0
    move-wide v0, v2

    :goto_0
    return-wide v0

    .line 131
    :catch_0
    move-exception p0

    .line 132
    return-wide v0
.end method

.method private static parseTerms(Ljava/lang/String;)[Ljava/lang/String;
    .locals 6

    .line 725
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 726
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 727
    return-object v1

    .line 729
    :cond_0
    const-string v0, "\\s+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 730
    new-instance v0, Ljava/util/ArrayList;

    array-length v2, p0

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 731
    const/4 v2, 0x0

    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_4

    .line 732
    aget-object v3, p0, v2

    invoke-static {v3}, Lmodmenu/IdBrowser;->fold(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 733
    const-string v4, "cat:"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x4

    if-eq v4, v5, :cond_3

    .line 734
    :cond_1
    const-string v4, "#"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    .line 737
    goto :goto_1

    .line 739
    :cond_2
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 731
    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 741
    :cond_4
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_5

    goto :goto_2

    :cond_5
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p0

    new-array p0, p0, [Ljava/lang/String;

    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, [Ljava/lang/String;

    :goto_2
    return-object v1
.end method

.method private pill(Ljava/lang/String;III)Landroid/widget/Button;
    .locals 3

    .line 840
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 841
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 842
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 843
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 844
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 845
    const/16 p3, 0x11

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setGravity(I)V

    .line 846
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 847
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 848
    const/16 p3, 0x14

    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v2

    invoke-virtual {v0, v1, p1, v2, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 849
    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p1

    invoke-direct {p0, p1, p2}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    .line 850
    new-instance p2, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p4

    .line 851
    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p3

    const/4 v1, -0x1

    invoke-direct {p0, p3, v1}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p3

    invoke-direct {p2, p4, p1, p3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 850
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 852
    return-object v0
.end method

.method private rebuildChips()V
    .locals 6

    .line 617
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 618
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 619
    iget-object v3, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmodmenu/IdBrowser$Row;

    iget-object v3, v3, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v3, v3, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 618
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 621
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 622
    const/4 v3, 0x0

    :goto_1
    sget-object v4, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    array-length v4, v4

    if-ge v3, v4, :cond_2

    .line 623
    sget-object v4, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 624
    sget-object v4, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 622
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 627
    :cond_2
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 628
    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 629
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 631
    :cond_3
    goto :goto_2

    .line 634
    :cond_4
    iget-object v3, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const-string v4, ""

    if-lez v3, :cond_5

    iget-object v3, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 635
    iput-object v4, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    .line 637
    :cond_5
    iget-object v0, p0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 638
    iget-object v0, p0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    const-string v5, "id_all"

    invoke-static {v3, v5}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v4, v3}, Lmodmenu/IdBrowser;->chip(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 639
    nop

    :goto_3
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_6

    .line 640
    iget-object v0, p0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {p0, v3, v4}, Lmodmenu/IdBrowser;->chip(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 639
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 642
    :cond_6
    return-void
.end method

.method private renderStatus()V
    .locals 4

    .line 794
    invoke-static {}, Lmodmenu/IdScan;->scanning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 795
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    const-string v2, "id_scanning"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 796
    return-void

    .line 798
    :cond_0
    iget-object v0, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    iget-object v0, v0, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 801
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    const-string v3, "id_fail"

    invoke-static {v2, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    iget-object v2, v2, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 802
    return-void

    .line 804
    :cond_1
    iget-object v0, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 805
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    const-string v2, "id_nodata"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 806
    return-void

    .line 808
    :cond_2
    iget-object v0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 809
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    const-string v2, "id_empty"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 810
    return-void

    .line 812
    :cond_3
    iget-object v0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_4

    .line 813
    iget-object v0, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 814
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 815
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    const-string v2, "id_items"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 816
    iget-object v1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    iget-boolean v1, v1, Lmodmenu/IdScan$Result;->inMap:Z

    if-nez v1, :cond_5

    .line 817
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u00b7 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    const-string v2, "id_hint_map"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 819
    :cond_5
    iget-object v1, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 820
    return-void
.end method

.method private round(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 871
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 872
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 873
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 874
    return-object v0
.end method

.method private roundTop(IF)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 864
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 865
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 866
    const/16 p1, 0x8

    new-array p1, p1, [F

    const/4 v1, 0x0

    aput p2, p1, v1

    const/4 v1, 0x1

    aput p2, p1, v1

    const/4 v1, 0x2

    aput p2, p1, v1

    const/4 v1, 0x3

    aput p2, p1, v1

    const/4 p2, 0x4

    const/4 v1, 0x0

    aput v1, p1, p2

    const/4 p2, 0x5

    aput v1, p1, p2

    const/4 p2, 0x6

    aput v1, p1, p2

    const/4 p2, 0x7

    aput v1, p1, p2

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 867
    return-object v0
.end method

.method private scan()V
    .locals 1

    .line 517
    invoke-static {}, Lmodmenu/IdScan;->request()V

    .line 518
    iget-object v0, p0, Lmodmenu/IdBrowser;->closer:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 519
    return-void
.end method

.method private showThumb()V
    .locals 9

    .line 773
    iget-object v0, p0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v0}, Lmodmenu/IdBrowser$Adapter;->getCount()I

    move-result v0

    .line 774
    iget-object v1, p0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v1

    .line 775
    iget-object v2, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v2

    .line 776
    iget-object v3, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v3

    sub-int/2addr v3, v2

    const/4 v4, 0x1

    add-int/2addr v3, v4

    .line 777
    if-lez v0, :cond_2

    if-lez v1, :cond_2

    if-lt v3, v0, :cond_0

    goto :goto_1

    .line 781
    :cond_0
    iget-object v5, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 782
    const/16 v6, 0x18

    invoke-direct {p0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v6

    int-to-float v7, v1

    int-to-float v3, v3

    int-to-float v8, v0

    div-float/2addr v3, v8

    mul-float v7, v7, v3

    float-to-int v3, v7

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, v5, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 783
    iget v3, v5, Landroid/widget/FrameLayout$LayoutParams;->height:I

    sub-int/2addr v1, v3

    int-to-float v1, v1

    .line 784
    if-gt v0, v4, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    int-to-float v2, v2

    sub-int/2addr v0, v4

    int-to-float v0, v0

    div-float v0, v2, v0

    :goto_0
    mul-float v1, v1, v0

    float-to-int v0, v1

    iput v0, v5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 785
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 786
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 787
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 788
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 789
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    iget-object v1, p0, Lmodmenu/IdBrowser;->hideThumb:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 790
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    iget-object v1, p0, Lmodmenu/IdBrowser;->hideThumb:Ljava/lang/Runnable;

    const-wide/16 v2, 0x4b0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 791
    return-void

    .line 778
    :cond_2
    :goto_1
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 779
    return-void
.end method

.method private styleChip(Landroid/widget/TextView;Z)V
    .locals 3

    .line 668
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 669
    nop

    .line 673
    iget-object v1, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    .line 669
    if-eqz p2, :cond_0

    .line 670
    iget p2, v1, Lmodmenu/Palette;->primary:I

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 671
    iget-object p2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget p2, p2, Lmodmenu/Palette;->onPrimary:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 673
    :cond_0
    iget p2, v1, Lmodmenu/Palette;->onSurface:I

    const v1, 0xffffff

    and-int/2addr p2, v1

    const/high16 v2, 0xf000000

    or-int/2addr p2, v2

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 674
    const/4 p2, 0x1

    invoke-direct {p0, p2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p2

    iget-object v2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int/2addr v1, v2

    const/high16 v2, 0x4d000000    # 1.3421773E8f

    or-int/2addr v1, v2

    invoke-virtual {v0, p2, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 675
    iget-object p2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget p2, p2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 677
    :goto_0
    const/16 p2, 0x10

    invoke-direct {p0, p2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 678
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 679
    return-void
.end method


# virtual methods
.method close()V
    .locals 2

    .line 508
    iget-object v0, p0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 511
    const/4 v0, 0x0

    invoke-static {v0}, Lmodmenu/IdScan;->setListener(Lmodmenu/IdScan$Listener;)V

    .line 512
    return-void
.end method

.method isShowing()Z
    .locals 1

    .line 478
    iget-object v0, p0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method open()V
    .locals 3

    .line 484
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lmodmenu/IdNames;->reset(Landroid/content/Context;)V

    .line 485
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Landroid/app/Activity;

    invoke-static {v0}, Lmodmenu/IdScan;->current(Landroid/content/Context;)Lmodmenu/IdScan$Result;

    move-result-object v0

    .line 486
    if-nez v0, :cond_0

    .line 490
    invoke-static {}, Lmodmenu/IdScan;->request()V

    .line 491
    iget-object v0, p0, Lmodmenu/IdBrowser;->closer:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 492
    return-void

    .line 494
    :cond_0
    iget-object v1, p0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 495
    iget-object v1, p0, Lmodmenu/IdBrowser;->listener:Lmodmenu/IdScan$Listener;

    invoke-static {v1}, Lmodmenu/IdScan;->setListener(Lmodmenu/IdScan$Listener;)V

    .line 498
    invoke-direct {p0, v0}, Lmodmenu/IdBrowser;->load(Lmodmenu/IdScan$Result;)V

    .line 499
    iget-object v0, v0, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 502
    invoke-static {}, Lmodmenu/IdScan;->request()V

    .line 504
    :cond_1
    invoke-direct {p0}, Lmodmenu/IdBrowser;->renderStatus()V

    .line 505
    return-void
.end method
