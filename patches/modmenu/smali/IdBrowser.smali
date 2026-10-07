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
.field private final activity:Lmodmenu/ModMenuActivity;

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

    .line 82
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

    .line 94
    const-string v0, "A-Z"

    const-string v1, "Z-A"

    const-string v2, "ID \u2191"

    const-string v3, "ID \u2193"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lmodmenu/IdBrowser;->SORT_LABELS:[Ljava/lang/String;

    .line 97
    new-instance v0, Lmodmenu/IdBrowser$1;

    invoke-direct {v0}, Lmodmenu/IdBrowser$1;-><init>()V

    sput-object v0, Lmodmenu/IdBrowser;->BY_ID:Ljava/util/Comparator;

    .line 117
    new-instance v0, Lmodmenu/IdBrowser$2;

    invoke-direct {v0}, Lmodmenu/IdBrowser$2;-><init>()V

    sput-object v0, Lmodmenu/IdBrowser;->BY_NAME:Ljava/util/Comparator;

    .line 213
    const/4 v0, -0x1

    sput v0, Lmodmenu/IdBrowser;->rowsSort:I

    return-void
.end method

.method constructor <init>(Lmodmenu/ModMenuActivity;Lmodmenu/Palette;Landroid/widget/FrameLayout;)V
    .locals 18

    .line 242
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 216
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    .line 217
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    .line 218
    new-instance v3, Lmodmenu/IdBrowser$Adapter;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4}, Lmodmenu/IdBrowser$Adapter;-><init>(Lmodmenu/IdBrowser;Lmodmenu/IdBrowser$1;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    .line 220
    const-string v3, ""

    iput-object v3, v0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    .line 221
    iput-object v3, v0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    .line 227
    new-instance v3, Lmodmenu/IdBrowser$3;

    invoke-direct {v3, v0}, Lmodmenu/IdBrowser$3;-><init>(Lmodmenu/IdBrowser;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->listener:Lmodmenu/IdScan$Listener;

    .line 235
    new-instance v3, Lmodmenu/IdBrowser$4;

    invoke-direct {v3, v0}, Lmodmenu/IdBrowser$4;-><init>(Lmodmenu/IdBrowser;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->hideThumb:Ljava/lang/Runnable;

    .line 243
    iput-object v1, v0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    .line 244
    iput-object v2, v0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    .line 246
    const-string v3, "idbrowser"

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v5}, Lmodmenu/ModMenuActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 248
    const-string v6, "sort"

    invoke-interface {v3, v6, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    iput v6, v0, Lmodmenu/IdBrowser;->sort:I

    .line 249
    iget v6, v0, Lmodmenu/IdBrowser;->sort:I

    if-ltz v6, :cond_0

    iget v6, v0, Lmodmenu/IdBrowser;->sort:I

    sget-object v7, Lmodmenu/IdBrowser;->SORT_LABELS:[Ljava/lang/String;

    array-length v7, v7

    if-lt v6, v7, :cond_1

    .line 250
    :cond_0
    iput v5, v0, Lmodmenu/IdBrowser;->sort:I

    .line 252
    :cond_1
    const-string v6, "table"

    invoke-interface {v3, v6, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, v0, Lmodmenu/IdBrowser;->table:Z

    .line 254
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    .line 255
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/4 v6, 0x1

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 258
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 259
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget v7, v2, Lmodmenu/Palette;->surface:I

    const/16 v8, 0x1c

    invoke-direct {v0, v8}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v9

    int-to-float v9, v9

    invoke-direct {v0, v7, v9}, Lmodmenu/IdBrowser;->roundTop(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 260
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

    .line 262
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 263
    const/16 v7, 0x10

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 264
    new-instance v9, Landroid/widget/TextView;

    invoke-direct {v9, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 265
    const-string v11, "id_title"

    invoke-static {v1, v11}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    const/high16 v11, 0x41a00000    # 20.0f

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setTextSize(F)V

    .line 267
    sget-object v11, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 268
    iget v11, v2, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 269
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v12, -0x2

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v11, v5, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v9, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 271
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

    .line 273
    new-instance v11, Lmodmenu/IdBrowser$5;

    invoke-direct {v11, v0}, Lmodmenu/IdBrowser$5;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v9, v11}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 279
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    .line 280
    const/16 v14, 0x24

    invoke-direct {v0, v14}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v14

    invoke-direct {v11, v12, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 279
    invoke-virtual {v3, v9, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 281
    iget-object v9, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v11

    invoke-virtual {v9, v3, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 283
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 284
    const-string v9, "mod_id_desc"

    invoke-static {v1, v9}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 285
    const/high16 v9, 0x41500000    # 13.0f

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 286
    iget v11, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v11}, Landroid/widget/TextView;->setTextColor(I)V

    .line 287
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v11

    .line 288
    const/4 v14, 0x2

    const v17, 0xffffff

    invoke-direct {v0, v14}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v15

    iput v15, v11, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 289
    iget-object v15, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v15, v3, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 291
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    .line 292
    iget-object v3, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 293
    iget-object v3, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget v9, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 294
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 295
    const/16 v9, 0xa

    invoke-direct {v0, v9}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v11

    iput v11, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 296
    iget-object v11, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v15, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    invoke-virtual {v11, v15, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 298
    new-instance v3, Landroid/widget/EditText;

    invoke-direct {v3, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    .line 299
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 300
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const-string v6, "id_search"

    invoke-static {v1, v6}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 301
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    iget v6, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int v6, v6, v17

    const/high16 v11, -0x67000000

    or-int/2addr v6, v11

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 302
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    iget v6, v2, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setTextColor(I)V

    .line 303
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const/high16 v6, 0x41700000    # 15.0f

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setTextSize(F)V

    .line 304
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

    .line 305
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    invoke-direct {v0}, Lmodmenu/IdBrowser;->field()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 306
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const/4 v6, 0x3

    invoke-virtual {v3, v6}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 307
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    new-instance v8, Lmodmenu/IdBrowser$6;

    invoke-direct {v8, v0}, Lmodmenu/IdBrowser$6;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v3, v8}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 320
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 321
    invoke-direct {v0, v9}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v8

    iput v8, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 322
    iget-object v8, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v11, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    invoke-virtual {v8, v11, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 324
    new-instance v3, Landroid/widget/HorizontalScrollView;

    invoke-direct {v3, v1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 325
    invoke-virtual {v3, v5}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 326
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    .line 327
    iget-object v8, v0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v8}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 328
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v8

    .line 329
    invoke-direct {v0, v10}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v11

    iput v11, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 330
    iget-object v11, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v11, v3, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 334
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    .line 335
    iget-object v3, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 336
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

    .line 337
    iget-object v3, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    new-instance v7, Landroid/view/View;

    invoke-direct {v7, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    .line 338
    const/16 v11, 0x1e

    invoke-direct {v0, v11}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v11

    invoke-direct {v8, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 337
    invoke-virtual {v3, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 339
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 340
    const-string v7, "ID"

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 341
    const/high16 v7, 0x41300000    # 11.0f

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 342
    sget-object v8, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 343
    iget v8, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 344
    iget-object v8, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    .line 345
    const/16 v14, 0x3a

    invoke-direct {v0, v14}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v14

    invoke-direct {v11, v14, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 344
    invoke-virtual {v8, v3, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 346
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 347
    const-string v8, "id_col_name"

    invoke-static {v1, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 348
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 349
    iget v8, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 350
    iget-object v8, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v11, v5, v12, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v8, v3, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 352
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 353
    const-string v8, "id_col_cat"

    invoke-static {v1, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 354
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 355
    iget v7, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 356
    iget-object v7, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v12, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v3, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 359
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 360
    invoke-direct {v0, v9}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 361
    iget-object v7, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v8, v0, Lmodmenu/IdBrowser;->tableHead:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v8, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 363
    new-instance v3, Landroid/widget/ListView;

    invoke-direct {v3, v1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    .line 364
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 365
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 366
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    iget-object v4, v0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 371
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setFastScrollEnabled(Z)V

    .line 372
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setVerticalScrollBarEnabled(Z)V

    .line 373
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v4, Lmodmenu/IdBrowser$7;

    invoke-direct {v4, v0}, Lmodmenu/IdBrowser$7;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 380
    new-instance v3, Landroid/widget/FrameLayout;

    invoke-direct {v3, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    .line 384
    iget-object v3, v0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    iget-object v4, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v8, -0x1

    invoke-direct {v7, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 387
    new-instance v3, Landroid/view/View;

    invoke-direct {v3, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    .line 389
    iget-object v3, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/4 v4, 0x2

    invoke-direct {v0, v4}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    iget v7, v2, Lmodmenu/Palette;->onSurface:I

    and-int v7, v7, v17

    const/high16 v9, 0x59000000

    or-int/2addr v7, v9

    invoke-direct {v0, v4, v7}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 390
    iget-object v3, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 391
    iget-object v3, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v3, v10}, Landroid/view/View;->setVisibility(I)V

    .line 392
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 393
    invoke-direct {v0, v10}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    const/16 v7, 0x1c

    invoke-direct {v0, v7}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    const v9, 0x800035

    invoke-direct {v3, v4, v7, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 394
    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 395
    iget-object v4, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 396
    iget-object v3, v0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    iget-object v4, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 397
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v4, Lmodmenu/IdBrowser$8;

    invoke-direct {v4, v0}, Lmodmenu/IdBrowser$8;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 407
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v8, v5, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 409
    invoke-direct {v0, v15}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 410
    iget-object v4, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v6, v0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 412
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 413
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

    and-int v7, v7, v17

    or-int v7, v7, v16

    invoke-direct {v0, v4, v5, v6, v7}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v4

    iput-object v4, v0, Lmodmenu/IdBrowser;->sortBtn:Landroid/widget/Button;

    .line 415
    iget-object v4, v0, Lmodmenu/IdBrowser;->sortBtn:Landroid/widget/Button;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 416
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

    .line 415
    invoke-virtual {v4, v6}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 417
    iget-object v4, v0, Lmodmenu/IdBrowser;->sortBtn:Landroid/widget/Button;

    new-instance v6, Lmodmenu/IdBrowser$9;

    invoke-direct {v6, v0, v1}, Lmodmenu/IdBrowser$9;-><init>(Lmodmenu/IdBrowser;Lmodmenu/ModMenuActivity;)V

    invoke-virtual {v4, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 430
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 431
    const/16 v6, 0x28

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    invoke-direct {v4, v12, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 432
    invoke-direct {v0, v15}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    iput v7, v4, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 433
    iget-object v7, v0, Lmodmenu/IdBrowser;->sortBtn:Landroid/widget/Button;

    invoke-virtual {v3, v7, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 434
    iget-boolean v4, v0, Lmodmenu/IdBrowser;->table:Z

    if-eqz v4, :cond_2

    const-string v4, "id_view_list"

    invoke-static {v1, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 435
    :cond_2
    const-string v4, "id_view_table"

    invoke-static {v1, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_0
    iget v7, v2, Lmodmenu/Palette;->primary:I

    iget v9, v2, Lmodmenu/Palette;->primary:I

    and-int v9, v9, v17

    or-int v9, v9, v16

    .line 434
    invoke-direct {v0, v4, v5, v7, v9}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v4

    iput-object v4, v0, Lmodmenu/IdBrowser;->viewBtn:Landroid/widget/Button;

    .line 437
    iget-object v4, v0, Lmodmenu/IdBrowser;->viewBtn:Landroid/widget/Button;

    new-instance v7, Lmodmenu/IdBrowser$10;

    invoke-direct {v7, v0, v1}, Lmodmenu/IdBrowser$10;-><init>(Lmodmenu/IdBrowser;Lmodmenu/ModMenuActivity;)V

    invoke-virtual {v4, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 446
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 447
    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    invoke-direct {v4, v12, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 448
    invoke-direct {v0, v15}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    iput v7, v4, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 449
    iget-object v7, v0, Lmodmenu/IdBrowser;->viewBtn:Landroid/widget/Button;

    invoke-virtual {v3, v7, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 450
    const-string v4, "id_rescan"

    invoke-static {v1, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v4, v2, Lmodmenu/Palette;->primary:I

    iget v2, v2, Lmodmenu/Palette;->primary:I

    and-int v2, v2, v17

    or-int v2, v2, v16

    invoke-direct {v0, v1, v5, v4, v2}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, v0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    .line 452
    iget-object v1, v0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    new-instance v2, Lmodmenu/IdBrowser$11;

    invoke-direct {v2, v0}, Lmodmenu/IdBrowser$11;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 458
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v2

    invoke-direct {v1, v5, v2, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 459
    iget-object v2, v0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    invoke-virtual {v3, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 460
    iget-object v1, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 462
    invoke-direct {v0}, Lmodmenu/IdBrowser;->applyView()V

    .line 463
    iget-object v1, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    move-object/from16 v3, p3

    invoke-virtual {v3, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 466
    iget-object v1, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v15}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 467
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)J
    .locals 2

    .line 76
    invoke-static {p0}, Lmodmenu/IdBrowser;->num(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$100()Ljava/util/Comparator;
    .locals 1

    .line 76
    sget-object v0, Lmodmenu/IdBrowser;->BY_ID:Ljava/util/Comparator;

    return-object v0
.end method

.method static synthetic access$1000(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 76
    invoke-direct {p0}, Lmodmenu/IdBrowser;->showThumb()V

    return-void
.end method

.method static synthetic access$1100(Lmodmenu/IdBrowser;)I
    .locals 0

    .line 76
    iget p0, p0, Lmodmenu/IdBrowser;->sort:I

    return p0
.end method

.method static synthetic access$1102(Lmodmenu/IdBrowser;I)I
    .locals 0

    .line 76
    iput p1, p0, Lmodmenu/IdBrowser;->sort:I

    return p1
.end method

.method static synthetic access$1200()[Ljava/lang/String;
    .locals 1

    .line 76
    sget-object v0, Lmodmenu/IdBrowser;->SORT_LABELS:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1300(Lmodmenu/IdBrowser;)Landroid/widget/Button;
    .locals 0

    .line 76
    iget-object p0, p0, Lmodmenu/IdBrowser;->sortBtn:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$1400(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 76
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applySort()V

    return-void
.end method

.method static synthetic access$1500(Lmodmenu/IdBrowser;)Z
    .locals 0

    .line 76
    iget-boolean p0, p0, Lmodmenu/IdBrowser;->table:Z

    return p0
.end method

.method static synthetic access$1502(Lmodmenu/IdBrowser;Z)Z
    .locals 0

    .line 76
    iput-boolean p1, p0, Lmodmenu/IdBrowser;->table:Z

    return p1
.end method

.method static synthetic access$1600(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 76
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applyView()V

    return-void
.end method

.method static synthetic access$1700(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 76
    invoke-direct {p0}, Lmodmenu/IdBrowser;->scan()V

    return-void
.end method

.method static synthetic access$1802(Lmodmenu/IdBrowser;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 76
    iput-object p1, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1900(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 76
    invoke-direct {p0}, Lmodmenu/IdBrowser;->rebuildChips()V

    return-void
.end method

.method static synthetic access$200(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 76
    invoke-static {p0}, Lmodmenu/IdBrowser;->fold(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2000(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;
    .locals 0

    .line 76
    iget-object p0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    return-object p0
.end method

.method static synthetic access$2100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;
    .locals 0

    .line 76
    iget-object p0, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    return-object p0
.end method

.method static synthetic access$2200(Lmodmenu/IdBrowser;I)I
    .locals 0

    .line 76
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$2300(Lmodmenu/IdBrowser;II)Landroid/graphics/drawable/GradientDrawable;
    .locals 0

    .line 76
    invoke-direct {p0, p1, p2}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2500(Lmodmenu/IdBrowser;Ljava/lang/String;III)Landroid/widget/Button;
    .locals 0

    .line 76
    invoke-direct {p0, p1, p2, p3, p4}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lmodmenu/IdBrowser;Lmodmenu/IdScan$Result;)V
    .locals 0

    .line 76
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser;->load(Lmodmenu/IdScan$Result;)V

    return-void
.end method

.method static synthetic access$500(Lmodmenu/IdBrowser;)Landroid/view/View;
    .locals 0

    .line 76
    iget-object p0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$602(Lmodmenu/IdBrowser;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 76
    iput-object p1, p0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$700(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 76
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applyFilter()V

    return-void
.end method

.method static synthetic access$800(Lmodmenu/IdBrowser;)Ljava/util/List;
    .locals 0

    .line 76
    iget-object p0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$900(Lmodmenu/IdBrowser;Ljava/lang/String;)V
    .locals 0

    .line 76
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser;->copy(Ljava/lang/String;)V

    return-void
.end method

.method private applyFilter()V
    .locals 4

    .line 690
    iget-object v0, p0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    invoke-static {v0}, Lmodmenu/IdBrowser;->parseTerms(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/IdBrowser;->terms:[Ljava/lang/String;

    .line 691
    iget-object v0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 692
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 693
    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmodmenu/IdBrowser$Row;

    .line 694
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

    .line 695
    goto :goto_1

    .line 697
    :cond_0
    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->match(Lmodmenu/IdBrowser$Row;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 698
    goto :goto_1

    .line 700
    :cond_1
    iget-object v2, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 692
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 702
    :cond_2
    iget-object v0, p0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v0}, Lmodmenu/IdBrowser$Adapter;->notifyDataSetChanged()V

    .line 703
    iget-object v0, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v1, Lmodmenu/IdBrowser$13;

    invoke-direct {v1, p0}, Lmodmenu/IdBrowser$13;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    .line 709
    invoke-direct {p0}, Lmodmenu/IdBrowser;->renderStatus()V

    .line 710
    return-void
.end method

.method private applySort()V
    .locals 2

    .line 571
    sget v0, Lmodmenu/IdBrowser;->rowsSort:I

    iget v1, p0, Lmodmenu/IdBrowser;->sort:I

    if-ne v0, v1, :cond_0

    .line 572
    return-void

    .line 575
    :cond_0
    iget v0, p0, Lmodmenu/IdBrowser;->sort:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 576
    sget-object v0, Lmodmenu/IdBrowser;->BY_ID:Ljava/util/Comparator;

    invoke-static {v0}, Ljava/util/Collections;->reverseOrder(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v0

    goto :goto_0

    .line 577
    :cond_1
    iget v0, p0, Lmodmenu/IdBrowser;->sort:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 578
    sget-object v0, Lmodmenu/IdBrowser;->BY_NAME:Ljava/util/Comparator;

    goto :goto_0

    .line 579
    :cond_2
    iget v0, p0, Lmodmenu/IdBrowser;->sort:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    .line 580
    sget-object v0, Lmodmenu/IdBrowser;->BY_NAME:Ljava/util/Comparator;

    invoke-static {v0}, Ljava/util/Collections;->reverseOrder(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v0

    goto :goto_0

    .line 582
    :cond_3
    sget-object v0, Lmodmenu/IdBrowser;->BY_ID:Ljava/util/Comparator;

    .line 584
    :goto_0
    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 585
    iget v0, p0, Lmodmenu/IdBrowser;->sort:I

    sput v0, Lmodmenu/IdBrowser;->rowsSort:I

    .line 586
    return-void
.end method

.method private applyView()V
    .locals 4

    .line 594
    iget-object v0, p0, Lmodmenu/IdBrowser;->viewBtn:Landroid/widget/Button;

    iget-boolean v1, p0, Lmodmenu/IdBrowser;->table:Z

    .line 595
    iget-object v2, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    .line 594
    if-eqz v1, :cond_0

    const-string v1, "id_view_list"

    invoke-static {v2, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 595
    :cond_0
    const-string v1, "id_view_table"

    invoke-static {v2, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 594
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 596
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

    .line 597
    iget-boolean v0, p0, Lmodmenu/IdBrowser;->table:Z

    .line 602
    iget-object v1, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    .line 597
    if-eqz v0, :cond_2

    .line 598
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    const v3, 0xffffff

    and-int/2addr v2, v3

    const/high16 v3, 0x33000000

    or-int/2addr v2, v3

    invoke-direct {v0, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 600
    iget-object v0, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setDividerHeight(I)V

    goto :goto_2

    .line 602
    :cond_2
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 603
    iget-object v0, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 605
    :goto_2
    iget-object v0, p0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v0}, Lmodmenu/IdBrowser$Adapter;->notifyDataSetChanged()V

    .line 606
    return-void
.end method

.method private chip(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .locals 4

    .line 637
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 638
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 639
    const/high16 p2, 0x41500000    # 13.0f

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 640
    const/16 p2, 0x11

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 641
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

    .line 642
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p2, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 645
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    iput v1, p2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 646
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 647
    iget-object p2, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    invoke-direct {p0, v0, p2}, Lmodmenu/IdBrowser;->styleChip(Landroid/widget/TextView;Z)V

    .line 648
    new-instance p2, Lmodmenu/IdBrowser$12;

    invoke-direct {p2, p0, p1}, Lmodmenu/IdBrowser$12;-><init>(Lmodmenu/IdBrowser;Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 656
    return-object v0
.end method

.method private copy(Ljava/lang/String;)V
    .locals 3

    .line 815
    nop

    .line 817
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "clipboard"

    .line 818
    invoke-virtual {v1, v2}, Lmodmenu/ModMenuActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    .line 819
    if-eqz v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 820
    const-string v2, "miniworld-id"

    invoke-static {v2, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 821
    const/4 p1, 0x1

    goto :goto_0

    .line 826
    :cond_0
    const/4 p1, 0x0

    :goto_0
    goto :goto_1

    .line 823
    :catch_0
    move-exception p1

    const/4 p1, 0x0

    .line 827
    :goto_1
    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    iget-object v2, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

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

    .line 828
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 829
    return-void
.end method

.method private display(Lmodmenu/IdScan$Entry;)Ljava/lang/String;
    .locals 3

    .line 679
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    iget-object v1, p1, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    iget-object v2, p1, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lmodmenu/IdNames;->get(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 680
    if-eqz v0, :cond_0

    .line 681
    return-object v0

    .line 683
    :cond_0
    iget-object v0, p1, Lmodmenu/IdScan$Entry;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 684
    iget-object p1, p1, Lmodmenu/IdScan$Entry;->name:Ljava/lang/String;

    return-object p1

    .line 686
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

    .line 875
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-virtual {v0, p1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result p1

    return p1
.end method

.method private field()Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    .line 848
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 849
    iget-object v1, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v1, v1, Lmodmenu/Palette;->onSurface:I

    const v2, 0xffffff

    and-int/2addr v1, v2

    const/high16 v3, 0xa000000

    or-int/2addr v1, v3

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 850
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    iget-object v3, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int/2addr v2, v3

    const/high16 v3, 0x33000000

    or-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 851
    const/16 v1, 0xe

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 852
    return-object v0
.end method

.method private static fold(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 164
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 165
    const-string p0, ""

    return-object p0

    .line 167
    :cond_0
    sget-object v0, Ljava/text/Normalizer$Form;->NFD:Ljava/text/Normalizer$Form;

    invoke-static {p0, v0}, Ljava/text/Normalizer;->normalize(Ljava/lang/CharSequence;Ljava/text/Normalizer$Form;)Ljava/lang/String;

    move-result-object p0

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 169
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_4

    .line 170
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 171
    const/16 v3, 0x300

    if-lt v2, v3, :cond_1

    const/16 v3, 0x36f

    if-gt v2, v3, :cond_1

    .line 172
    goto :goto_1

    .line 174
    :cond_1
    const/16 v3, 0x111

    if-ne v2, v3, :cond_2

    .line 175
    const/16 v2, 0x64

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 176
    :cond_2
    const/16 v3, 0x110

    if-ne v2, v3, :cond_3

    .line 177
    const/16 v2, 0x44

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 179
    :cond_3
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 169
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 182
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private load(Lmodmenu/IdScan$Result;)V
    .locals 10

    .line 514
    iput-object p1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    .line 515
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-static {v0}, Lmodmenu/IdNames;->lang(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 516
    sget-object v1, Lmodmenu/IdBrowser;->rowsFor:Lmodmenu/IdScan$Result;

    if-ne p1, v1, :cond_0

    sget-object v1, Lmodmenu/IdBrowser;->rows:Ljava/util/List;

    if-eqz v1, :cond_0

    sget-object v1, Lmodmenu/IdBrowser;->rowsLang:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 517
    sget-object p1, Lmodmenu/IdBrowser;->rows:Ljava/util/List;

    iput-object p1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    goto/16 :goto_4

    .line 523
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0x7530

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 524
    invoke-static {}, Lmodmenu/IdIndex;->keys()[Ljava/lang/String;

    move-result-object v2

    .line 525
    new-instance v3, Ljava/util/HashSet;

    array-length v4, v2

    mul-int/lit8 v4, v4, 0x2

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 526
    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    array-length v6, v2

    if-ge v5, v6, :cond_1

    .line 527
    aget-object v6, v2, v5

    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 528
    aget-object v6, v2, v5

    const/16 v7, 0x23

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 529
    new-instance v7, Lmodmenu/IdScan$Entry;

    aget-object v8, v2, v5

    add-int/lit8 v9, v6, 0x1

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    aget-object v9, v2, v5

    .line 530
    invoke-virtual {v9, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const-string v9, ""

    invoke-direct {v7, v8, v9, v6, v9}, Lmodmenu/IdScan$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 531
    new-instance v6, Lmodmenu/IdBrowser$Row;

    invoke-direct {p0, v7}, Lmodmenu/IdBrowser;->display(Lmodmenu/IdScan$Entry;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lmodmenu/IdBrowser$Row;-><init>(Lmodmenu/IdScan$Entry;Ljava/lang/String;)V

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 526
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 533
    :cond_1
    iget-object v2, p1, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-nez v2, :cond_6

    .line 534
    nop

    :goto_1
    iget-object v2, p1, Lmodmenu/IdScan$Result;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v4, v2, :cond_6

    .line 535
    iget-object v2, p1, Lmodmenu/IdScan$Result;->entries:Ljava/util/List;

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmodmenu/IdScan$Entry;

    .line 538
    iget-object v5, v2, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    const-string v6, "recipe"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string v5, "craft"

    goto :goto_2

    :cond_2
    iget-object v5, v2, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    .line 539
    :goto_2
    invoke-static {v5}, Lmodmenu/IdIndex;->itemCat(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 542
    iget-object v6, v2, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-static {v6}, Lmodmenu/IdIndex;->inItemSpace(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 543
    goto :goto_3

    .line 545
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

    .line 546
    goto :goto_3

    .line 548
    :cond_4
    iget-object v6, v2, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 549
    new-instance v6, Lmodmenu/IdScan$Entry;

    iget-object v7, v2, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    iget-object v8, v2, Lmodmenu/IdScan$Entry;->name:Ljava/lang/String;

    iget-object v2, v2, Lmodmenu/IdScan$Entry;->src:Ljava/lang/String;

    invoke-direct {v6, v7, v8, v5, v2}, Lmodmenu/IdScan$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v6

    .line 551
    :cond_5
    new-instance v5, Lmodmenu/IdBrowser$Row;

    invoke-direct {p0, v2}, Lmodmenu/IdBrowser;->display(Lmodmenu/IdScan$Entry;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v2, v6}, Lmodmenu/IdBrowser$Row;-><init>(Lmodmenu/IdScan$Entry;Ljava/lang/String;)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 534
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 554
    :cond_6
    sput-object v1, Lmodmenu/IdBrowser;->rows:Ljava/util/List;

    .line 555
    sput-object p1, Lmodmenu/IdBrowser;->rowsFor:Lmodmenu/IdScan$Result;

    .line 556
    sput-object v0, Lmodmenu/IdBrowser;->rowsLang:Ljava/lang/String;

    .line 557
    const/4 p1, -0x1

    sput p1, Lmodmenu/IdBrowser;->rowsSort:I

    .line 558
    sget-object p1, Lmodmenu/IdBrowser;->rows:Ljava/util/List;

    iput-object p1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    .line 560
    :goto_4
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applySort()V

    .line 561
    invoke-direct {p0}, Lmodmenu/IdBrowser;->rebuildChips()V

    .line 562
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applyFilter()V

    .line 563
    return-void
.end method

.method private match(Lmodmenu/IdBrowser$Row;)Z
    .locals 6

    .line 738
    iget-object v0, p0, Lmodmenu/IdBrowser;->terms:[Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 739
    return v1

    .line 741
    :cond_0
    const/4 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lmodmenu/IdBrowser;->terms:[Ljava/lang/String;

    array-length v3, v3

    if-ge v2, v3, :cond_4

    .line 742
    iget-object v3, p0, Lmodmenu/IdBrowser;->terms:[Ljava/lang/String;

    aget-object v3, v3, v2

    .line 743
    const-string v4, "cat:"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 744
    iget-object v4, p1, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v4, v4, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    const/4 v5, 0x4

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 745
    return v0

    .line 747
    :cond_1
    const-string v4, "#"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 748
    iget-object v4, p1, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v4, v4, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 749
    return v0

    .line 751
    :cond_2
    iget-object v4, p1, Lmodmenu/IdBrowser$Row;->key:Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 752
    return v0

    .line 741
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 755
    :cond_4
    return v1
.end method

.method private static matchWrap()Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .line 870
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method private static num(Ljava/lang/String;)J
    .locals 6

    .line 128
    const-wide/16 v0, -0x1

    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 129
    const-wide/16 v4, 0x0

    cmp-long p0, v2, v4

    if-gez p0, :cond_0

    goto :goto_0

    :cond_0
    move-wide v0, v2

    :goto_0
    return-wide v0

    .line 130
    :catch_0
    move-exception p0

    .line 131
    return-wide v0
.end method

.method private static parseTerms(Ljava/lang/String;)[Ljava/lang/String;
    .locals 6

    .line 717
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 718
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 719
    return-object v1

    .line 721
    :cond_0
    const-string v0, "\\s+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 722
    new-instance v0, Ljava/util/ArrayList;

    array-length v2, p0

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 723
    const/4 v2, 0x0

    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_4

    .line 724
    aget-object v3, p0, v2

    invoke-static {v3}, Lmodmenu/IdBrowser;->fold(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 725
    const-string v4, "cat:"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x4

    if-eq v4, v5, :cond_3

    .line 726
    :cond_1
    const-string v4, "#"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    .line 729
    goto :goto_1

    .line 731
    :cond_2
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 723
    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 733
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

    .line 832
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 833
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 834
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 835
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 836
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 837
    const/16 p3, 0x11

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setGravity(I)V

    .line 838
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 839
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 840
    const/16 p3, 0x14

    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v2

    invoke-virtual {v0, v1, p1, v2, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 841
    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p1

    invoke-direct {p0, p1, p2}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    .line 842
    new-instance p2, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p4

    .line 843
    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p3

    const/4 v1, -0x1

    invoke-direct {p0, p3, v1}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p3

    invoke-direct {p2, p4, p1, p3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 842
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 844
    return-object v0
.end method

.method private rebuildChips()V
    .locals 6

    .line 609
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 610
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 611
    iget-object v3, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmodmenu/IdBrowser$Row;

    iget-object v3, v3, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v3, v3, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 610
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 613
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 614
    const/4 v3, 0x0

    :goto_1
    sget-object v4, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    array-length v4, v4

    if-ge v3, v4, :cond_2

    .line 615
    sget-object v4, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 616
    sget-object v4, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 614
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 619
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

    .line 620
    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 621
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 623
    :cond_3
    goto :goto_2

    .line 626
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

    .line 627
    iput-object v4, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    .line 629
    :cond_5
    iget-object v0, p0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 630
    iget-object v0, p0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v5, "id_all"

    invoke-static {v3, v5}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v4, v3}, Lmodmenu/IdBrowser;->chip(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 631
    nop

    :goto_3
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_6

    .line 632
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

    .line 631
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 634
    :cond_6
    return-void
.end method

.method private renderStatus()V
    .locals 4

    .line 786
    invoke-static {}, Lmodmenu/IdScan;->scanning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 787
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_scanning"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 788
    return-void

    .line 790
    :cond_0
    iget-object v0, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    iget-object v0, v0, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 793
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

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

    .line 794
    return-void

    .line 796
    :cond_1
    iget-object v0, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 797
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_nodata"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 798
    return-void

    .line 800
    :cond_2
    iget-object v0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 801
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_empty"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 802
    return-void

    .line 804
    :cond_3
    iget-object v0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_4

    .line 805
    iget-object v0, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 806
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

    .line 807
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_items"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 808
    iget-object v1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    iget-boolean v1, v1, Lmodmenu/IdScan$Result;->inMap:Z

    if-nez v1, :cond_5

    .line 809
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u00b7 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_hint_map"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 811
    :cond_5
    iget-object v1, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 812
    return-void
.end method

.method private round(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 863
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 864
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 865
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 866
    return-object v0
.end method

.method private roundTop(IF)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 856
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 857
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 858
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

    .line 859
    return-object v0
.end method

.method private scan()V
    .locals 1

    .line 509
    invoke-static {}, Lmodmenu/IdScan;->request()V

    .line 510
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-virtual {v0}, Lmodmenu/ModMenuActivity;->finish()V

    .line 511
    return-void
.end method

.method private showThumb()V
    .locals 9

    .line 765
    iget-object v0, p0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v0}, Lmodmenu/IdBrowser$Adapter;->getCount()I

    move-result v0

    .line 766
    iget-object v1, p0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v1

    .line 767
    iget-object v2, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v2

    .line 768
    iget-object v3, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v3

    sub-int/2addr v3, v2

    const/4 v4, 0x1

    add-int/2addr v3, v4

    .line 769
    if-lez v0, :cond_2

    if-lez v1, :cond_2

    if-lt v3, v0, :cond_0

    goto :goto_1

    .line 773
    :cond_0
    iget-object v5, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 774
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

    .line 775
    iget v3, v5, Landroid/widget/FrameLayout$LayoutParams;->height:I

    sub-int/2addr v1, v3

    int-to-float v1, v1

    .line 776
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

    .line 777
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 778
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 779
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 780
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 781
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    iget-object v1, p0, Lmodmenu/IdBrowser;->hideThumb:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 782
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    iget-object v1, p0, Lmodmenu/IdBrowser;->hideThumb:Ljava/lang/Runnable;

    const-wide/16 v2, 0x4b0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 783
    return-void

    .line 770
    :cond_2
    :goto_1
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 771
    return-void
.end method

.method private styleChip(Landroid/widget/TextView;Z)V
    .locals 3

    .line 660
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 661
    nop

    .line 665
    iget-object v1, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    .line 661
    if-eqz p2, :cond_0

    .line 662
    iget p2, v1, Lmodmenu/Palette;->primary:I

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 663
    iget-object p2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget p2, p2, Lmodmenu/Palette;->onPrimary:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 665
    :cond_0
    iget p2, v1, Lmodmenu/Palette;->onSurface:I

    const v1, 0xffffff

    and-int/2addr p2, v1

    const/high16 v2, 0xf000000

    or-int/2addr p2, v2

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 666
    const/4 p2, 0x1

    invoke-direct {p0, p2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p2

    iget-object v2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int/2addr v1, v2

    const/high16 v2, 0x4d000000    # 1.3421773E8f

    or-int/2addr v1, v2

    invoke-virtual {v0, p2, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 667
    iget-object p2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget p2, p2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 669
    :goto_0
    const/16 p2, 0x10

    invoke-direct {p0, p2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 670
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 671
    return-void
.end method


# virtual methods
.method close()V
    .locals 2

    .line 500
    iget-object v0, p0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 503
    const/4 v0, 0x0

    invoke-static {v0}, Lmodmenu/IdScan;->setListener(Lmodmenu/IdScan$Listener;)V

    .line 504
    return-void
.end method

.method isShowing()Z
    .locals 1

    .line 470
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

    .line 476
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-static {v0}, Lmodmenu/IdNames;->reset(Landroid/content/Context;)V

    .line 477
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-static {v0}, Lmodmenu/IdScan;->current(Landroid/content/Context;)Lmodmenu/IdScan$Result;

    move-result-object v0

    .line 478
    if-nez v0, :cond_0

    .line 482
    invoke-static {}, Lmodmenu/IdScan;->request()V

    .line 483
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-virtual {v0}, Lmodmenu/ModMenuActivity;->finish()V

    .line 484
    return-void

    .line 486
    :cond_0
    iget-object v1, p0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 487
    iget-object v1, p0, Lmodmenu/IdBrowser;->listener:Lmodmenu/IdScan$Listener;

    invoke-static {v1}, Lmodmenu/IdScan;->setListener(Lmodmenu/IdScan$Listener;)V

    .line 490
    invoke-direct {p0, v0}, Lmodmenu/IdBrowser;->load(Lmodmenu/IdScan$Result;)V

    .line 491
    iget-object v0, v0, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 494
    invoke-static {}, Lmodmenu/IdScan;->request()V

    .line 496
    :cond_1
    invoke-direct {p0}, Lmodmenu/IdBrowser;->renderStatus()V

    .line 497
    return-void
.end method
