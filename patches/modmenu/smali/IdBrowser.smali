.class final Lmodmenu/IdBrowser;
.super Ljava/lang/Object;
.source "IdBrowser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmodmenu/IdBrowser$Adapter;,
        Lmodmenu/IdBrowser$Holder;
    }
.end annotation


# static fields
.field private static final CAT_ORDER:[Ljava/lang/String;


# instance fields
.field private final activity:Lmodmenu/ModMenuActivity;

.field private final adapter:Lmodmenu/IdBrowser$Adapter;

.field private final all:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lmodmenu/IdScan$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private cat:Ljava/lang/String;

.field private final chips:Landroid/widget/LinearLayout;

.field private deferred:Z

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
            "Lmodmenu/IdScan$Entry;",
            ">;"
        }
    .end annotation
.end field

.field private final status:Landroid/widget/TextView;

.field private final thumb:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 48
    const-string v19, "npc"

    const-string v20, "other"

    const-string v1, "item"

    const-string v2, "plugin"

    const-string v3, "buff"

    const-string v4, "effect"

    const-string v5, "sound"

    const-string v6, "skin"

    const-string v7, "role"

    const-string v8, "avatar"

    const-string v9, "block"

    const-string v10, "recipe"

    const-string v11, "craft"

    const-string v12, "projectile"

    const-string v13, "summon"

    const-string v14, "pet"

    const-string v15, "mob"

    const-string v16, "monster"

    const-string v17, "tool"

    const-string v18, "food"

    filled-new-array/range {v1 .. v20}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lmodmenu/ModMenuActivity;Lmodmenu/Palette;Landroid/widget/FrameLayout;)V
    .locals 18

    .line 91
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    .line 66
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    .line 67
    new-instance v3, Lmodmenu/IdBrowser$Adapter;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4}, Lmodmenu/IdBrowser$Adapter;-><init>(Lmodmenu/IdBrowser;Lmodmenu/IdBrowser$1;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    .line 69
    const-string v3, ""

    iput-object v3, v0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    .line 70
    iput-object v3, v0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    .line 76
    new-instance v3, Lmodmenu/IdBrowser$1;

    invoke-direct {v3, v0}, Lmodmenu/IdBrowser$1;-><init>(Lmodmenu/IdBrowser;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->listener:Lmodmenu/IdScan$Listener;

    .line 84
    new-instance v3, Lmodmenu/IdBrowser$2;

    invoke-direct {v3, v0}, Lmodmenu/IdBrowser$2;-><init>(Lmodmenu/IdBrowser;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->hideThumb:Ljava/lang/Runnable;

    .line 92
    iput-object v1, v0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    .line 93
    iput-object v2, v0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    .line 95
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    .line 96
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 99
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 100
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget v6, v2, Lmodmenu/Palette;->surface:I

    const/16 v7, 0x1c

    invoke-direct {v0, v7}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v8

    int-to-float v8, v8

    invoke-direct {v0, v6, v8}, Lmodmenu/IdBrowser;->roundTop(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 101
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/16 v6, 0x14

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v8

    const/16 v9, 0xc

    invoke-direct {v0, v9}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v10

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v11

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v6

    invoke-virtual {v3, v8, v10, v11, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 103
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 104
    const/16 v6, 0x10

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 105
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 106
    const-string v8, "id_title"

    invoke-static {v1, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    const/high16 v8, 0x41a00000    # 20.0f

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextSize(F)V

    .line 108
    sget-object v8, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 109
    iget v8, v2, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 110
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, 0x0

    const/4 v11, -0x2

    const/high16 v12, 0x3f800000    # 1.0f

    invoke-direct {v8, v10, v11, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    const-string v6, "mod_close"

    invoke-static {v1, v6}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget v8, v2, Lmodmenu/Palette;->primary:I

    iget v13, v2, Lmodmenu/Palette;->primary:I

    const v14, 0xffffff

    and-int/2addr v13, v14

    const/high16 v15, 0x14000000

    or-int/2addr v13, v15

    invoke-direct {v0, v6, v10, v8, v13}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v6

    .line 114
    new-instance v8, Lmodmenu/IdBrowser$3;

    invoke-direct {v8, v0}, Lmodmenu/IdBrowser$3;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v6, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    .line 121
    const/16 v13, 0x24

    invoke-direct {v0, v13}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v13

    invoke-direct {v8, v11, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 120
    invoke-virtual {v3, v6, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    iget-object v6, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v8

    invoke-virtual {v6, v3, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 124
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 125
    const-string v6, "mod_id_desc"

    invoke-static {v1, v6}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    const/high16 v6, 0x41500000    # 13.0f

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 127
    iget v8, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 128
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v8

    .line 129
    const/4 v11, 0x2

    invoke-direct {v0, v11}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v13

    iput v13, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 130
    iget-object v13, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v13, v3, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    .line 133
    iget-object v3, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 134
    iget-object v3, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget v6, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 135
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 136
    const/16 v6, 0xa

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v8

    iput v8, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 137
    iget-object v8, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v13, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    invoke-virtual {v8, v13, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 139
    new-instance v3, Landroid/widget/EditText;

    invoke-direct {v3, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    .line 140
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 141
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const-string v5, "id_search"

    invoke-static {v1, v5}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 142
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    iget v5, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int/2addr v5, v14

    const/high16 v8, -0x67000000

    or-int/2addr v5, v8

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 143
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    iget v5, v2, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setTextColor(I)V

    .line 144
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const/high16 v5, 0x41700000    # 15.0f

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setTextSize(F)V

    .line 145
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const/16 v5, 0xe

    invoke-direct {v0, v5}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v8

    const/16 v13, 0x8

    const v16, 0xffffff

    invoke-direct {v0, v13}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v14

    invoke-direct {v0, v5}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v5

    const/high16 v17, 0x14000000

    invoke-direct {v0, v13}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v15

    invoke-virtual {v3, v8, v14, v5, v15}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 146
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    invoke-direct {v0}, Lmodmenu/IdBrowser;->field()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 147
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const/4 v5, 0x3

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 148
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    new-instance v8, Lmodmenu/IdBrowser$4;

    invoke-direct {v8, v0}, Lmodmenu/IdBrowser$4;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v3, v8}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 161
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 162
    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 163
    iget-object v6, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v8, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    invoke-virtual {v6, v8, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 165
    new-instance v3, Landroid/widget/HorizontalScrollView;

    invoke-direct {v3, v1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 166
    invoke-virtual {v3, v10}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 167
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    .line 168
    iget-object v6, v0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v6}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 169
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    .line 170
    invoke-direct {v0, v9}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v8

    iput v8, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 171
    iget-object v8, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v8, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    new-instance v3, Landroid/widget/ListView;

    invoke-direct {v3, v1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    .line 174
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 175
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v10}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 176
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    iget-object v4, v0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 181
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v10}, Landroid/widget/ListView;->setFastScrollEnabled(Z)V

    .line 182
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v10}, Landroid/widget/ListView;->setVerticalScrollBarEnabled(Z)V

    .line 183
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v4, Lmodmenu/IdBrowser$5;

    invoke-direct {v4, v0}, Lmodmenu/IdBrowser$5;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 190
    new-instance v3, Landroid/widget/FrameLayout;

    invoke-direct {v3, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    .line 194
    iget-object v3, v0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    iget-object v4, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v8, -0x1

    invoke-direct {v6, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v4, v6}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 197
    new-instance v3, Landroid/view/View;

    invoke-direct {v3, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    .line 199
    iget-object v3, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-direct {v0, v11}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    iget v6, v2, Lmodmenu/Palette;->onSurface:I

    and-int v6, v6, v16

    const/high16 v9, 0x59000000

    or-int/2addr v6, v9

    invoke-direct {v0, v4, v6}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 200
    iget-object v3, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setAlpha(F)V

    .line 201
    iget-object v3, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/4 v4, 0x4

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 202
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 203
    invoke-direct {v0, v4}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    invoke-direct {v0, v7}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v6

    const v7, 0x800035

    invoke-direct {v3, v4, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 204
    invoke-direct {v0, v5}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 205
    iget-object v4, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 206
    iget-object v3, v0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    iget-object v4, v0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 207
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v4, Lmodmenu/IdBrowser$6;

    invoke-direct {v4, v0}, Lmodmenu/IdBrowser$6;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 217
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v8, v10, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 219
    invoke-direct {v0, v13}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 220
    iget-object v4, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    invoke-virtual {v4, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 222
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 223
    const-string v4, "id_rescan"

    invoke-static {v1, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v4, v2, Lmodmenu/Palette;->primary:I

    iget v2, v2, Lmodmenu/Palette;->primary:I

    and-int v2, v2, v16

    or-int v2, v2, v17

    invoke-direct {v0, v1, v10, v4, v2}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, v0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    .line 225
    iget-object v1, v0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    new-instance v2, Lmodmenu/IdBrowser$7;

    invoke-direct {v2, v0}, Lmodmenu/IdBrowser$7;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 231
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v2, 0x28

    invoke-direct {v0, v2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v2

    invoke-direct {v1, v10, v2, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 232
    iget-object v2, v0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    invoke-virtual {v3, v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 233
    iget-object v1, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 235
    iget-object v1, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    move-object/from16 v3, p3

    invoke-virtual {v3, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 238
    iget-object v1, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v13}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 239
    return-void
.end method

.method static synthetic access$100(Lmodmenu/IdBrowser;Lmodmenu/IdScan$Result;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser;->load(Lmodmenu/IdScan$Result;)V

    return-void
.end method

.method static synthetic access$1000(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lmodmenu/IdBrowser;->rebuildChips()V

    return-void
.end method

.method static synthetic access$1100(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;
    .locals 0

    .line 47
    iget-object p0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    return-object p0
.end method

.method static synthetic access$1200(Lmodmenu/IdBrowser;I)I
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$1300(Lmodmenu/IdBrowser;)Lmodmenu/Palette;
    .locals 0

    .line 47
    iget-object p0, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    return-object p0
.end method

.method static synthetic access$1400(Lmodmenu/IdBrowser;II)Landroid/graphics/drawable/GradientDrawable;
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1600(Lmodmenu/IdBrowser;Ljava/lang/String;III)Landroid/widget/Button;
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2, p3, p4}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lmodmenu/IdBrowser;)Landroid/view/View;
    .locals 0

    .line 47
    iget-object p0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$302(Lmodmenu/IdBrowser;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 47
    iput-object p1, p0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applyFilter()V

    return-void
.end method

.method static synthetic access$500(Lmodmenu/IdBrowser;)Ljava/util/List;
    .locals 0

    .line 47
    iget-object p0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$600(Lmodmenu/IdBrowser;Ljava/lang/String;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser;->copy(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lmodmenu/IdBrowser;->showThumb()V

    return-void
.end method

.method static synthetic access$800(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lmodmenu/IdBrowser;->scan()V

    return-void
.end method

.method static synthetic access$902(Lmodmenu/IdBrowser;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 47
    iput-object p1, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    return-object p1
.end method

.method private applyFilter()V
    .locals 4

    .line 352
    iget-object v0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 353
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 354
    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmodmenu/IdScan$Entry;

    .line 355
    iget-object v2, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    iget-object v2, v1, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    iget-object v3, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 356
    goto :goto_1

    .line 358
    :cond_0
    iget-object v2, p0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v2, v1, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    .line 359
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, v1, Lmodmenu/IdScan$Entry;->name:Ljava/lang/String;

    .line 360
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 361
    goto :goto_1

    .line 363
    :cond_1
    iget-object v2, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 353
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 365
    :cond_2
    iget-object v0, p0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v0}, Lmodmenu/IdBrowser$Adapter;->notifyDataSetChanged()V

    .line 366
    iget-object v0, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v1, Lmodmenu/IdBrowser$9;

    invoke-direct {v1, p0}, Lmodmenu/IdBrowser$9;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    .line 372
    invoke-direct {p0}, Lmodmenu/IdBrowser;->renderStatus()V

    .line 373
    return-void
.end method

.method private chip(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .locals 4

    .line 315
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 316
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 317
    const/high16 p2, 0x41500000    # 13.0f

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 318
    const/16 p2, 0x11

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 319
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

    .line 320
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p2, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 323
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    iput v1, p2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 324
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 325
    iget-object p2, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    invoke-direct {p0, v0, p2}, Lmodmenu/IdBrowser;->styleChip(Landroid/widget/TextView;Z)V

    .line 326
    new-instance p2, Lmodmenu/IdBrowser$8;

    invoke-direct {p2, p0, p1}, Lmodmenu/IdBrowser$8;-><init>(Lmodmenu/IdBrowser;Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 334
    return-object v0
.end method

.method private copy(Ljava/lang/String;)V
    .locals 3

    .line 436
    nop

    .line 438
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "clipboard"

    .line 439
    invoke-virtual {v1, v2}, Lmodmenu/ModMenuActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    .line 440
    if-eqz v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 441
    const-string v2, "miniworld-id"

    invoke-static {v2, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 442
    const/4 p1, 0x1

    goto :goto_0

    .line 447
    :cond_0
    const/4 p1, 0x0

    :goto_0
    goto :goto_1

    .line 444
    :catch_0
    move-exception p1

    const/4 p1, 0x0

    .line 448
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

    .line 449
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 450
    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 496
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-virtual {v0, p1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result p1

    return p1
.end method

.method private field()Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    .line 469
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 470
    iget-object v1, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v1, v1, Lmodmenu/Palette;->onSurface:I

    const v2, 0xffffff

    and-int/2addr v1, v2

    const/high16 v3, 0xa000000

    or-int/2addr v1, v3

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 471
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    iget-object v3, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int/2addr v2, v3

    const/high16 v3, 0x33000000

    or-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 472
    const/16 v1, 0xe

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 473
    return-object v0
.end method

.method private load(Lmodmenu/IdScan$Result;)V
    .locals 1

    .line 276
    iput-object p1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    .line 277
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmodmenu/IdBrowser;->deferred:Z

    .line 278
    iget-object v0, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 279
    iget-object v0, p1, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 280
    iget-object v0, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    iget-object p1, p1, Lmodmenu/IdScan$Result;->entries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 282
    :cond_0
    invoke-direct {p0}, Lmodmenu/IdBrowser;->rebuildChips()V

    .line 283
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applyFilter()V

    .line 284
    return-void
.end method

.method private static matchWrap()Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .line 491
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method private pill(Ljava/lang/String;III)Landroid/widget/Button;
    .locals 3

    .line 453
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 454
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 455
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 456
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 457
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 458
    const/16 p3, 0x11

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setGravity(I)V

    .line 459
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 460
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 461
    const/16 p3, 0x14

    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v2

    invoke-virtual {v0, v1, p1, v2, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 462
    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p1

    invoke-direct {p0, p1, p2}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    .line 463
    new-instance p2, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p4

    .line 464
    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p3

    const/4 v1, -0x1

    invoke-direct {p0, p3, v1}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p3

    invoke-direct {p2, p4, p1, p3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 463
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 465
    return-object v0
.end method

.method private rebuildChips()V
    .locals 6

    .line 287
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 288
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 289
    iget-object v3, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmodmenu/IdScan$Entry;

    iget-object v3, v3, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 288
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 291
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 292
    const/4 v3, 0x0

    :goto_1
    sget-object v4, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    array-length v4, v4

    if-ge v3, v4, :cond_2

    .line 293
    sget-object v4, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 294
    sget-object v4, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 292
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 297
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

    .line 298
    invoke-interface {v2, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 299
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    :cond_3
    goto :goto_2

    .line 304
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

    .line 305
    iput-object v4, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    .line 307
    :cond_5
    iget-object v0, p0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 308
    iget-object v0, p0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v5, "id_all"

    invoke-static {v3, v5}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v4, v3}, Lmodmenu/IdBrowser;->chip(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 309
    nop

    :goto_3
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_6

    .line 310
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

    .line 309
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 312
    :cond_6
    return-void
.end method

.method private renderStatus()V
    .locals 4

    .line 403
    invoke-static {}, Lmodmenu/IdScan;->scanning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 404
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_scanning"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 405
    return-void

    .line 407
    :cond_0
    iget-boolean v0, p0, Lmodmenu/IdBrowser;->deferred:Z

    if-eqz v0, :cond_1

    .line 408
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_deferred"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 409
    return-void

    .line 411
    :cond_1
    iget-object v0, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    iget-object v0, v0, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 414
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

    .line 415
    return-void

    .line 417
    :cond_2
    iget-object v0, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 418
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_nodata"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 419
    return-void

    .line 421
    :cond_3
    iget-object v0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 422
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_empty"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 423
    return-void

    .line 425
    :cond_4
    iget-object v0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_5

    .line 426
    iget-object v0, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 427
    :cond_5
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

    .line 428
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

    .line 429
    iget-object v1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    iget-boolean v1, v1, Lmodmenu/IdScan$Result;->inMap:Z

    if-nez v1, :cond_6

    .line 430
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

    .line 432
    :cond_6
    iget-object v1, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 433
    return-void
.end method

.method private round(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 484
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 485
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 486
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 487
    return-object v0
.end method

.method private roundTop(IF)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 477
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 478
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 479
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

    .line 480
    return-object v0
.end method

.method private scan()V
    .locals 1

    .line 270
    invoke-static {}, Lmodmenu/IdScan;->request()V

    .line 271
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmodmenu/IdBrowser;->deferred:Z

    .line 272
    invoke-direct {p0}, Lmodmenu/IdBrowser;->renderStatus()V

    .line 273
    return-void
.end method

.method private showThumb()V
    .locals 9

    .line 382
    iget-object v0, p0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v0}, Lmodmenu/IdBrowser$Adapter;->getCount()I

    move-result v0

    .line 383
    iget-object v1, p0, Lmodmenu/IdBrowser;->listWrap:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getHeight()I

    move-result v1

    .line 384
    iget-object v2, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v2

    .line 385
    iget-object v3, p0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getLastVisiblePosition()I

    move-result v3

    sub-int/2addr v3, v2

    const/4 v4, 0x1

    add-int/2addr v3, v4

    .line 386
    if-lez v0, :cond_2

    if-lez v1, :cond_2

    if-lt v3, v0, :cond_0

    goto :goto_1

    .line 390
    :cond_0
    iget-object v5, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 391
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

    .line 392
    iget v3, v5, Landroid/widget/FrameLayout$LayoutParams;->height:I

    sub-int/2addr v1, v3

    int-to-float v1, v1

    .line 393
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

    .line 394
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v0, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 395
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 396
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 397
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 398
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    iget-object v1, p0, Lmodmenu/IdBrowser;->hideThumb:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 399
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    iget-object v1, p0, Lmodmenu/IdBrowser;->hideThumb:Ljava/lang/Runnable;

    const-wide/16 v2, 0x4b0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 400
    return-void

    .line 387
    :cond_2
    :goto_1
    iget-object v0, p0, Lmodmenu/IdBrowser;->thumb:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 388
    return-void
.end method

.method private styleChip(Landroid/widget/TextView;Z)V
    .locals 3

    .line 338
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 339
    nop

    .line 343
    iget-object v1, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    .line 339
    if-eqz p2, :cond_0

    .line 340
    iget p2, v1, Lmodmenu/Palette;->primary:I

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 341
    iget-object p2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget p2, p2, Lmodmenu/Palette;->onPrimary:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 343
    :cond_0
    iget p2, v1, Lmodmenu/Palette;->onSurface:I

    const v1, 0xffffff

    and-int/2addr p2, v1

    const/high16 v2, 0xf000000

    or-int/2addr p2, v2

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 344
    const/4 p2, 0x1

    invoke-direct {p0, p2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p2

    iget-object v2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int/2addr v1, v2

    const/high16 v2, 0x4d000000    # 1.3421773E8f

    or-int/2addr v1, v2

    invoke-virtual {v0, p2, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 345
    iget-object p2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget p2, p2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 347
    :goto_0
    const/16 p2, 0x10

    invoke-direct {p0, p2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 348
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 349
    return-void
.end method


# virtual methods
.method close()V
    .locals 2

    .line 266
    iget-object v0, p0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 267
    return-void
.end method

.method isShowing()Z
    .locals 1

    .line 242
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
    .locals 2

    .line 246
    iget-object v0, p0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 247
    iget-object v0, p0, Lmodmenu/IdBrowser;->listener:Lmodmenu/IdScan$Listener;

    invoke-static {v0}, Lmodmenu/IdScan;->setListener(Lmodmenu/IdScan$Listener;)V

    .line 248
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-static {v0}, Lmodmenu/IdScan;->current(Landroid/content/Context;)Lmodmenu/IdScan$Result;

    move-result-object v0

    .line 249
    if-eqz v0, :cond_0

    iget-object v1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    if-eq v0, v1, :cond_0

    .line 250
    invoke-direct {p0, v0}, Lmodmenu/IdBrowser;->load(Lmodmenu/IdScan$Result;)V

    .line 252
    :cond_0
    if-nez v0, :cond_1

    .line 255
    invoke-static {}, Lmodmenu/IdScan;->request()V

    .line 256
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmodmenu/IdBrowser;->deferred:Z

    goto :goto_0

    .line 257
    :cond_1
    iget-object v0, v0, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-eqz v0, :cond_2

    .line 260
    invoke-static {}, Lmodmenu/IdScan;->request()V

    .line 262
    :cond_2
    :goto_0
    invoke-direct {p0}, Lmodmenu/IdBrowser;->renderStatus()V

    .line 263
    return-void
.end method
