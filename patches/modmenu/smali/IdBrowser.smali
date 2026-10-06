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

.field private last:Lmodmenu/IdScan$Result;

.field private final list:Landroid/widget/ListView;

.field private final p:Lmodmenu/Palette;

.field private final panel:Landroid/widget/LinearLayout;

.field private query:Ljava/lang/String;

.field private final rescan:Landroid/widget/Button;

.field private scanning:Z

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


# direct methods
.method static constructor <clinit>()V
    .locals 21

    .line 44
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
    .locals 17

    .line 67
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    .line 59
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    .line 60
    new-instance v3, Lmodmenu/IdBrowser$Adapter;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4}, Lmodmenu/IdBrowser$Adapter;-><init>(Lmodmenu/IdBrowser;Lmodmenu/IdBrowser$1;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    .line 62
    const-string v3, ""

    iput-object v3, v0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    .line 63
    iput-object v3, v0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    .line 68
    iput-object v1, v0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    .line 69
    iput-object v2, v0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    .line 71
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    .line 72
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 75
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 76
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget v6, v2, Lmodmenu/Palette;->surface:I

    const/16 v7, 0x1c

    invoke-direct {v0, v7}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    int-to-float v7, v7

    invoke-direct {v0, v6, v7}, Lmodmenu/IdBrowser;->roundTop(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 77
    iget-object v3, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/16 v6, 0x14

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    const/16 v8, 0xc

    invoke-direct {v0, v8}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v9

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v10

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v6

    invoke-virtual {v3, v7, v9, v10, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 79
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 80
    const/16 v6, 0x10

    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 81
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 82
    const-string v7, "id_title"

    invoke-static {v1, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    const/high16 v7, 0x41a00000    # 20.0f

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 84
    sget-object v7, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 85
    iget v7, v2, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 86
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, 0x0

    const/4 v10, -0x2

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-direct {v7, v9, v10, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 88
    const-string v6, "mod_close"

    invoke-static {v1, v6}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget v7, v2, Lmodmenu/Palette;->primary:I

    iget v12, v2, Lmodmenu/Palette;->primary:I

    const v13, 0xffffff

    and-int/2addr v12, v13

    const/high16 v14, 0x14000000

    or-int/2addr v12, v14

    invoke-direct {v0, v6, v9, v7, v12}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v6

    .line 90
    new-instance v7, Lmodmenu/IdBrowser$1;

    invoke-direct {v7, v0}, Lmodmenu/IdBrowser$1;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 96
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    .line 97
    const/16 v12, 0x24

    invoke-direct {v0, v12}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v12

    invoke-direct {v7, v10, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 96
    invoke-virtual {v3, v6, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 98
    iget-object v6, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v7

    invoke-virtual {v6, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 101
    const-string v6, "mod_id_desc"

    invoke-static {v1, v6}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    const/high16 v6, 0x41500000    # 13.0f

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 103
    iget v7, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setTextColor(I)V

    .line 104
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v7

    .line 105
    const/4 v10, 0x2

    invoke-direct {v0, v10}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v10

    iput v10, v7, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 106
    iget-object v10, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 108
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    .line 109
    iget-object v3, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 110
    iget-object v3, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget v6, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 111
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 112
    const/16 v6, 0xa

    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 113
    iget-object v7, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v10, v0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    invoke-virtual {v7, v10, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 115
    new-instance v3, Landroid/widget/EditText;

    invoke-direct {v3, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    .line 116
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    invoke-virtual {v3, v5}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 117
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const-string v7, "id_search"

    invoke-static {v1, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 118
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    iget v7, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int/2addr v7, v13

    const/high16 v10, -0x67000000

    or-int/2addr v7, v10

    invoke-virtual {v3, v7}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 119
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    iget v7, v2, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v3, v7}, Landroid/widget/EditText;->setTextColor(I)V

    .line 120
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const/high16 v7, 0x41700000    # 15.0f

    invoke-virtual {v3, v7}, Landroid/widget/EditText;->setTextSize(F)V

    .line 121
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const/16 v7, 0xe

    invoke-direct {v0, v7}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v10

    const/16 v12, 0x8

    invoke-direct {v0, v12}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v15

    invoke-direct {v0, v7}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    const v16, 0xffffff

    invoke-direct {v0, v12}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v13

    invoke-virtual {v3, v10, v15, v7, v13}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 122
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    invoke-direct {v0}, Lmodmenu/IdBrowser;->field()Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 123
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    const/4 v7, 0x3

    invoke-virtual {v3, v7}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 124
    iget-object v3, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    new-instance v7, Lmodmenu/IdBrowser$2;

    invoke-direct {v7, v0}, Lmodmenu/IdBrowser$2;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v3, v7}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 137
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 138
    invoke-direct {v0, v6}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 139
    iget-object v6, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v7, v0, Lmodmenu/IdBrowser;->search:Landroid/widget/EditText;

    invoke-virtual {v6, v7, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 141
    new-instance v3, Landroid/widget/HorizontalScrollView;

    invoke-direct {v3, v1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 142
    invoke-virtual {v3, v9}, Landroid/widget/HorizontalScrollView;->setHorizontalScrollBarEnabled(Z)V

    .line 143
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v6, v0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    .line 144
    iget-object v6, v0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v6}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 145
    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v6

    .line 146
    invoke-direct {v0, v8}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v7

    iput v7, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 147
    iget-object v7, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 149
    new-instance v3, Landroid/widget/ListView;

    invoke-direct {v3, v1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    .line 150
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 151
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v9}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 152
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    iget-object v4, v0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 153
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v3, v5}, Landroid/widget/ListView;->setFastScrollEnabled(Z)V

    .line 154
    iget-object v3, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    new-instance v4, Lmodmenu/IdBrowser$3;

    invoke-direct {v4, v0}, Lmodmenu/IdBrowser$3;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 161
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v9, v9, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 162
    invoke-direct {v0, v12}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 163
    iget-object v4, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    iget-object v5, v0, Lmodmenu/IdBrowser;->list:Landroid/widget/ListView;

    invoke-virtual {v4, v5, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 165
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-direct {v3, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 166
    const-string v4, "id_rescan"

    invoke-static {v1, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget v5, v2, Lmodmenu/Palette;->primary:I

    iget v6, v2, Lmodmenu/Palette;->primary:I

    and-int v6, v6, v16

    or-int/2addr v6, v14

    invoke-direct {v0, v4, v9, v5, v6}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v4

    iput-object v4, v0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    .line 168
    iget-object v4, v0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    new-instance v5, Lmodmenu/IdBrowser$4;

    invoke-direct {v5, v0}, Lmodmenu/IdBrowser$4;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x28

    invoke-direct {v0, v5}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v6

    invoke-direct {v4, v9, v6, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 175
    invoke-direct {v0, v12}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v6

    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 176
    iget-object v6, v0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    invoke-virtual {v3, v6, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 177
    const-string v4, "id_copy_all"

    invoke-static {v1, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v4, v2, Lmodmenu/Palette;->primary:I

    iget v6, v2, Lmodmenu/Palette;->onPrimary:I

    iget v2, v2, Lmodmenu/Palette;->onPrimary:I

    and-int v2, v2, v16

    const/high16 v7, 0x1f000000

    or-int/2addr v2, v7

    invoke-direct {v0, v1, v4, v6, v2}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v1

    .line 179
    new-instance v2, Lmodmenu/IdBrowser$5;

    invoke-direct {v2, v0}, Lmodmenu/IdBrowser$5;-><init>(Lmodmenu/IdBrowser;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 192
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v5}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v4

    invoke-direct {v2, v9, v4, v11}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 193
    iget-object v1, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-static {}, Lmodmenu/IdBrowser;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 195
    iget-object v1, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    move-object/from16 v3, p3

    invoke-virtual {v3, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 198
    iget-object v1, v0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v12}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 199
    return-void
.end method

.method static synthetic access$1000(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Lmodmenu/IdBrowser;->rebuildChips()V

    return-void
.end method

.method static synthetic access$102(Lmodmenu/IdBrowser;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 43
    iput-object p1, p0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1102(Lmodmenu/IdBrowser;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 43
    iput-object p1, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1200(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;
    .locals 0

    .line 43
    iget-object p0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    return-object p0
.end method

.method static synthetic access$1300(Lmodmenu/IdBrowser;I)I
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$1400(Lmodmenu/IdBrowser;)Lmodmenu/Palette;
    .locals 0

    .line 43
    iget-object p0, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    return-object p0
.end method

.method static synthetic access$1500(Lmodmenu/IdBrowser;II)Landroid/graphics/drawable/GradientDrawable;
    .locals 0

    .line 43
    invoke-direct {p0, p1, p2}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1700(Lmodmenu/IdBrowser;Ljava/lang/String;III)Landroid/widget/Button;
    .locals 0

    .line 43
    invoke-direct {p0, p1, p2, p3, p4}, Lmodmenu/IdBrowser;->pill(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Lmodmenu/IdBrowser;->applyFilter()V

    return-void
.end method

.method static synthetic access$300(Lmodmenu/IdBrowser;)Ljava/util/List;
    .locals 0

    .line 43
    iget-object p0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$400(Lmodmenu/IdBrowser;Ljava/lang/String;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser;->copy(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lmodmenu/IdBrowser;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Lmodmenu/IdBrowser;->scan()V

    return-void
.end method

.method static synthetic access$602(Lmodmenu/IdBrowser;Z)Z
    .locals 0

    .line 43
    iput-boolean p1, p0, Lmodmenu/IdBrowser;->scanning:Z

    return p1
.end method

.method static synthetic access$700(Lmodmenu/IdBrowser;)Landroid/widget/Button;
    .locals 0

    .line 43
    iget-object p0, p0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$802(Lmodmenu/IdBrowser;Lmodmenu/IdScan$Result;)Lmodmenu/IdScan$Result;
    .locals 0

    .line 43
    iput-object p1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    return-object p1
.end method

.method static synthetic access$900(Lmodmenu/IdBrowser;)Ljava/util/List;
    .locals 0

    .line 43
    iget-object p0, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    return-object p0
.end method

.method private applyFilter()V
    .locals 4

    .line 303
    iget-object v0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 304
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 305
    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmodmenu/IdScan$Entry;

    .line 306
    iget-object v2, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    iget-object v2, v1, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    iget-object v3, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 307
    goto :goto_1

    .line 309
    :cond_0
    iget-object v2, p0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v2, v1, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    .line 310
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, v1, Lmodmenu/IdScan$Entry;->name:Ljava/lang/String;

    .line 311
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lmodmenu/IdBrowser;->query:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 312
    goto :goto_1

    .line 314
    :cond_1
    iget-object v2, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 304
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 316
    :cond_2
    iget-object v0, p0, Lmodmenu/IdBrowser;->adapter:Lmodmenu/IdBrowser$Adapter;

    invoke-virtual {v0}, Lmodmenu/IdBrowser$Adapter;->notifyDataSetChanged()V

    .line 317
    invoke-direct {p0}, Lmodmenu/IdBrowser;->renderStatus()V

    .line 318
    return-void
.end method

.method private chip(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
    .locals 4

    .line 266
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 267
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    const/high16 p2, 0x41500000    # 13.0f

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 269
    const/16 p2, 0x11

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 270
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

    .line 271
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p2, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 274
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    iput v1, p2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 275
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 276
    iget-object p2, p0, Lmodmenu/IdBrowser;->cat:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    invoke-direct {p0, v0, p2}, Lmodmenu/IdBrowser;->styleChip(Landroid/widget/TextView;Z)V

    .line 277
    new-instance p2, Lmodmenu/IdBrowser$7;

    invoke-direct {p2, p0, p1}, Lmodmenu/IdBrowser$7;-><init>(Lmodmenu/IdBrowser;Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 285
    return-object v0
.end method

.method private copy(Ljava/lang/String;)V
    .locals 3

    .line 349
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "clipboard"

    .line 350
    invoke-virtual {v1, v2}, Lmodmenu/ModMenuActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    .line 351
    if-eqz v1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 354
    const-string v2, "miniworld-id"

    invoke-static {v2, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 355
    iget-object p1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_copied"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 356
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 360
    goto :goto_0

    .line 352
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "no clipboard"

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 357
    :catch_0
    move-exception p1

    .line 358
    iget-object p1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "mod_crash_failed"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 359
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 361
    :goto_0
    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 407
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-virtual {v0, p1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result p1

    return p1
.end method

.method private field()Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    .line 380
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 381
    iget-object v1, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v1, v1, Lmodmenu/Palette;->onSurface:I

    const v2, 0xffffff

    and-int/2addr v1, v2

    const/high16 v3, 0xa000000

    or-int/2addr v1, v3

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 382
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    iget-object v3, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int/2addr v2, v3

    const/high16 v3, 0x33000000

    or-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 383
    const/16 v1, 0xe

    invoke-direct {p0, v1}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 384
    return-object v0
.end method

.method private static matchWrap()Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .line 402
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method private pill(Ljava/lang/String;III)Landroid/widget/Button;
    .locals 3

    .line 364
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 365
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 366
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 367
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 368
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 369
    const/16 p3, 0x11

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setGravity(I)V

    .line 370
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 371
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 372
    const/16 p3, 0x14

    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v1

    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result v2

    invoke-virtual {v0, v1, p1, v2, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 373
    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p1

    invoke-direct {p0, p1, p2}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    .line 374
    new-instance p2, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p4

    .line 375
    invoke-direct {p0, p3}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p3

    const/4 v1, -0x1

    invoke-direct {p0, p3, v1}, Lmodmenu/IdBrowser;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p3

    invoke-direct {p2, p4, p1, p3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 374
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 376
    return-object v0
.end method

.method private rebuildChips()V
    .locals 5

    .line 243
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 244
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 245
    iget-object v3, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmodmenu/IdScan$Entry;

    iget-object v3, v3, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 244
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 247
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 248
    const/4 v3, 0x0

    :goto_1
    sget-object v4, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    array-length v4, v4

    if-ge v3, v4, :cond_2

    .line 249
    sget-object v4, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 250
    sget-object v4, Lmodmenu/IdBrowser;->CAT_ORDER:[Ljava/lang/String;

    aget-object v4, v4, v3

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 253
    :cond_2
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 254
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 255
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    :cond_3
    goto :goto_2

    .line 258
    :cond_4
    iget-object v0, p0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 259
    iget-object v0, p0, Lmodmenu/IdBrowser;->chips:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v4, "id_all"

    invoke-static {v3, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-direct {p0, v4, v3}, Lmodmenu/IdBrowser;->chip(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 260
    nop

    :goto_3
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_5

    .line 261
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

    .line 260
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 263
    :cond_5
    return-void
.end method

.method private renderStatus()V
    .locals 3

    .line 321
    iget-boolean v0, p0, Lmodmenu/IdBrowser;->scanning:Z

    if-eqz v0, :cond_0

    .line 322
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_scanning"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 323
    return-void

    .line 325
    :cond_0
    iget-object v0, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    iget-object v0, v0, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 326
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_fail"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 327
    return-void

    .line 329
    :cond_1
    iget-object v0, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 330
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_nodata"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 331
    return-void

    .line 333
    :cond_2
    iget-object v0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 334
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_empty"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 335
    return-void

    .line 337
    :cond_3
    iget-object v0, p0, Lmodmenu/IdBrowser;->shown:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_4

    .line 338
    iget-object v0, p0, Lmodmenu/IdBrowser;->all:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 339
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

    .line 340
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

    .line 341
    iget-object v1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    iget-boolean v1, v1, Lmodmenu/IdScan$Result;->inMap:Z

    if-nez v1, :cond_5

    .line 342
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

    .line 344
    :cond_5
    iget-object v1, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 345
    return-void
.end method

.method private round(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 395
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 396
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 397
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 398
    return-object v0
.end method

.method private roundTop(IF)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 388
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 389
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 390
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

    .line 391
    return-object v0
.end method

.method private scan()V
    .locals 3

    .line 220
    iget-boolean v0, p0, Lmodmenu/IdBrowser;->scanning:Z

    if-eqz v0, :cond_0

    .line 221
    return-void

    .line 223
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmodmenu/IdBrowser;->scanning:Z

    .line 224
    iget-object v0, p0, Lmodmenu/IdBrowser;->rescan:Landroid/widget/Button;

    const/high16 v1, 0x3f000000    # 0.5f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAlpha(F)V

    .line 225
    iget-object v0, p0, Lmodmenu/IdBrowser;->status:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    const-string v2, "id_scanning"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 226
    iget-object v0, p0, Lmodmenu/IdBrowser;->activity:Lmodmenu/ModMenuActivity;

    new-instance v1, Lmodmenu/IdBrowser$6;

    invoke-direct {v1, p0}, Lmodmenu/IdBrowser$6;-><init>(Lmodmenu/IdBrowser;)V

    invoke-static {v0, v1}, Lmodmenu/IdScan;->scan(Landroid/content/Context;Lmodmenu/IdScan$Listener;)V

    .line 240
    return-void
.end method

.method private styleChip(Landroid/widget/TextView;Z)V
    .locals 3

    .line 289
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 290
    nop

    .line 294
    iget-object v1, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    .line 290
    if-eqz p2, :cond_0

    .line 291
    iget p2, v1, Lmodmenu/Palette;->primary:I

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 292
    iget-object p2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget p2, p2, Lmodmenu/Palette;->onPrimary:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_0

    .line 294
    :cond_0
    iget p2, v1, Lmodmenu/Palette;->onSurface:I

    const v1, 0xffffff

    and-int/2addr p2, v1

    const/high16 v2, 0xf000000

    or-int/2addr p2, v2

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 295
    const/4 p2, 0x1

    invoke-direct {p0, p2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p2

    iget-object v2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int/2addr v1, v2

    const/high16 v2, 0x4d000000    # 1.3421773E8f

    or-int/2addr v1, v2

    invoke-virtual {v0, p2, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 296
    iget-object p2, p0, Lmodmenu/IdBrowser;->p:Lmodmenu/Palette;

    iget p2, p2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 298
    :goto_0
    const/16 p2, 0x10

    invoke-direct {p0, p2}, Lmodmenu/IdBrowser;->dp(I)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 299
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 300
    return-void
.end method


# virtual methods
.method close()V
    .locals 2

    .line 216
    iget-object v0, p0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 217
    return-void
.end method

.method isShowing()Z
    .locals 1

    .line 202
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

    .line 206
    iget-object v0, p0, Lmodmenu/IdBrowser;->panel:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 207
    invoke-direct {p0}, Lmodmenu/IdBrowser;->renderStatus()V

    .line 210
    iget-boolean v0, p0, Lmodmenu/IdBrowser;->scanning:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lmodmenu/IdBrowser;->last:Lmodmenu/IdScan$Result;

    iget-object v0, v0, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 211
    :cond_0
    invoke-direct {p0}, Lmodmenu/IdBrowser;->scan()V

    .line 213
    :cond_1
    return-void
.end method
