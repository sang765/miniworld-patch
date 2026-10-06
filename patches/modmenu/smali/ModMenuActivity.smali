.class public Lmodmenu/ModMenuActivity;
.super Landroid/app/Activity;
.source "ModMenuActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmodmenu/ModMenuActivity$Pill;
    }
.end annotation


# static fields
.field public static final EXTRA_OPEN_IDS:Ljava/lang/String; = "open_ids"


# instance fields
.field private browser:Lmodmenu/IdBrowser;

.field private hwidSwitch:Landroid/widget/Switch;

.field private rewardSwitch:Landroid/widget/Switch;

.field private root:Landroid/widget/FrameLayout;

.field private rotateBtn:Landroid/widget/Button;

.field private sheet:Landroid/widget/LinearLayout;

.field private webSwitch:Landroid/widget/Switch;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lmodmenu/ModMenuActivity;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lmodmenu/ModMenuActivity;->openBrowser()V

    return-void
.end method

.method static synthetic access$100(Lmodmenu/ModMenuActivity;)Landroid/widget/LinearLayout;
    .locals 0

    .line 48
    iget-object p0, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method private buildMenu()V
    .locals 12

    .line 109
    invoke-static {p0}, Lmodmenu/Palette;->of(Landroid/content/Context;)Lmodmenu/Palette;

    move-result-object v0

    .line 110
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    iget v3, v0, Lmodmenu/Palette;->scrim:I

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 114
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 116
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lmodmenu/ModMenuActivity;->root:Landroid/widget/FrameLayout;

    .line 117
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v1, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 119
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    .line 120
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 121
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 122
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    iget v4, v0, Lmodmenu/Palette;->surface:I

    const/16 v5, 0x1c

    invoke-virtual {p0, v5}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    int-to-float v6, v6

    invoke-direct {p0, v4, v6}, Lmodmenu/ModMenuActivity;->roundTop(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 123
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    const/16 v4, 0x14

    invoke-virtual {p0, v4}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    const/16 v7, 0xc

    invoke-virtual {p0, v7}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v7

    invoke-virtual {p0, v4}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v8

    invoke-virtual {p0, v5}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v5

    invoke-virtual {v1, v6, v7, v8, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 125
    new-instance v1, Landroid/view/View;

    invoke-direct {v1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 126
    const/16 v5, 0x20

    invoke-virtual {p0, v5}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    const/4 v7, 0x4

    invoke-virtual {p0, v7}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v8

    invoke-virtual {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    int-to-float v2, v2

    iget v9, v0, Lmodmenu/Palette;->onSurfaceVariant:I

    const v10, 0xffffff

    and-int/2addr v9, v10

    const/high16 v11, 0x66000000

    or-int/2addr v9, v11

    invoke-direct {p0, v6, v8, v2, v9}, Lmodmenu/ModMenuActivity;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 128
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v5}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v5

    invoke-virtual {p0, v7}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    invoke-direct {v2, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 129
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 130
    iget-object v3, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 133
    const-string v2, "mod_menu_title"

    invoke-static {p0, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    const/high16 v2, 0x41c00000    # 24.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 135
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 136
    iget v2, v0, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 137
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 139
    const/16 v5, 0xe

    invoke-virtual {p0, v5}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v5

    iput v5, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 140
    const/4 v5, 0x6

    invoke-virtual {p0, v5}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    iput v6, v2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 141
    iget-object v6, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 143
    invoke-direct {p0, v0}, Lmodmenu/ModMenuActivity;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v1

    iput-object v1, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    .line 144
    invoke-direct {p0, v0}, Lmodmenu/ModMenuActivity;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v1

    iput-object v1, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    .line 145
    invoke-direct {p0, v0}, Lmodmenu/ModMenuActivity;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v1

    iput-object v1, p0, Lmodmenu/ModMenuActivity;->rewardSwitch:Landroid/widget/Switch;

    .line 146
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isWebBlocked()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 147
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isSpoofOn()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 148
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->rewardSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isRewardBypass()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 149
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    const-string v2, "mod_web_label"

    invoke-static {p0, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 150
    const-string v6, "mod_web_desc"

    invoke-static {p0, v6}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    .line 149
    invoke-direct {p0, v0, v2, v6, v7}, Lmodmenu/ModMenuActivity;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 151
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    const-string v2, "mod_hwid_label"

    invoke-static {p0, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 152
    const-string v6, "mod_hwid_desc"

    invoke-static {p0, v6}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    .line 151
    invoke-direct {p0, v0, v2, v6, v7}, Lmodmenu/ModMenuActivity;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 153
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    const-string v2, "mod_reward_label"

    invoke-static {p0, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 154
    const-string v6, "mod_reward_desc"

    invoke-static {p0, v6}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuActivity;->rewardSwitch:Landroid/widget/Switch;

    .line 153
    invoke-direct {p0, v0, v2, v6, v7}, Lmodmenu/ModMenuActivity;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 156
    const-string v1, "mod_rotate"

    invoke-static {p0, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, v0, Lmodmenu/Palette;->primary:I

    iget v6, v0, Lmodmenu/Palette;->onPrimary:I

    iget v7, v0, Lmodmenu/Palette;->onPrimary:I

    and-int/2addr v7, v10

    const/high16 v8, 0x1f000000

    or-int/2addr v7, v8

    invoke-direct {p0, v1, v2, v6, v7}, Lmodmenu/ModMenuActivity;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v1

    iput-object v1, p0, Lmodmenu/ModMenuActivity;->rotateBtn:Landroid/widget/Button;

    .line 158
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 159
    const/16 v2, 0x28

    invoke-virtual {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    const/4 v7, -0x1

    invoke-direct {v1, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 160
    invoke-virtual {p0, v4}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v4

    iput v4, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 161
    iget-object v4, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lmodmenu/ModMenuActivity;->rotateBtn:Landroid/widget/Button;

    invoke-virtual {v4, v6, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    const-string v1, "mod_id_label"

    invoke-static {p0, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v4, v0, Lmodmenu/Palette;->primary:I

    iget v6, v0, Lmodmenu/Palette;->primary:I

    and-int/2addr v6, v10

    const/high16 v8, 0x14000000

    or-int/2addr v6, v8

    const/4 v9, 0x0

    invoke-direct {p0, v1, v9, v4, v6}, Lmodmenu/ModMenuActivity;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v1

    .line 167
    new-instance v4, Lmodmenu/ModMenuActivity$1;

    invoke-direct {v4, p0}, Lmodmenu/ModMenuActivity$1;-><init>(Lmodmenu/ModMenuActivity;)V

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 173
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 174
    invoke-virtual {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    invoke-direct {v4, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 175
    invoke-virtual {p0, v5}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 176
    iget-object v6, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v1, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 178
    const-string v1, "mod_close"

    invoke-static {p0, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v4, v0, Lmodmenu/Palette;->primary:I

    iget v0, v0, Lmodmenu/Palette;->primary:I

    and-int/2addr v0, v10

    or-int/2addr v0, v8

    invoke-direct {p0, v1, v9, v4, v0}, Lmodmenu/ModMenuActivity;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v0

    .line 180
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 181
    invoke-virtual {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    invoke-direct {v1, v7, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 182
    invoke-virtual {p0, v5}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 183
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 185
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->root:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v4, 0x50

    invoke-direct {v2, v7, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 188
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->root:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Lmodmenu/ModMenuActivity;->setContentView(Landroid/view/View;)V

    .line 189
    return-void
.end method

.method private circle(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 374
    int-to-float v0, p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-direct {p0, p1, p1, v0, p2}, Lmodmenu/ModMenuActivity;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    return-object p1
.end method

.method private makeButton(Ljava/lang/String;III)Landroid/widget/Button;
    .locals 2

    .line 255
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 256
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 257
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 258
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 259
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 260
    const/16 p3, 0x11

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setGravity(I)V

    .line 261
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 262
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 263
    const/16 p3, 0x18

    invoke-virtual {p0, p3}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v1

    invoke-virtual {p0, p3}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result p3

    invoke-virtual {v0, v1, p1, p3, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 264
    const/16 p1, 0x14

    invoke-virtual {p0, p1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result p3

    invoke-direct {p0, p3, p2}, Lmodmenu/ModMenuActivity;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    .line 265
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt p3, v1, :cond_0

    .line 268
    new-instance p3, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p4

    .line 269
    invoke-virtual {p0, p1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result p1

    const/4 v1, -0x1

    invoke-direct {p0, p1, v1}, Lmodmenu/ModMenuActivity;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-direct {p3, p4, p2, p1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 268
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 271
    :cond_0
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 273
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 274
    return-object v0
.end method

.method private makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;
    .locals 13

    .line 232
    new-instance v0, Landroid/widget/Switch;

    invoke-direct {v0, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 233
    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 234
    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 235
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 236
    const/16 v1, 0x34

    invoke-virtual {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setSwitchMinWidth(I)V

    .line 237
    new-instance v2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 238
    const v3, 0x10100a0

    filled-new-array {v3}, [I

    move-result-object v4

    new-instance v5, Lmodmenu/ModMenuActivity$Pill;

    .line 239
    const/16 v6, 0x14

    invoke-virtual {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v7

    const/4 v8, -0x1

    invoke-direct {p0, v7, v8}, Lmodmenu/ModMenuActivity;->circle(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v8

    invoke-virtual {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v9

    invoke-direct {v5, v7, v8, v9}, Lmodmenu/ModMenuActivity$Pill;-><init>(Landroid/graphics/drawable/GradientDrawable;II)V

    .line 238
    invoke-virtual {v2, v4, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 240
    const v4, -0x10100a0

    filled-new-array {v4}, [I

    move-result-object v5

    new-instance v7, Lmodmenu/ModMenuActivity$Pill;

    .line 241
    invoke-virtual {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v8

    iget v9, p1, Lmodmenu/Palette;->thumbOff:I

    invoke-direct {p0, v8, v9}, Lmodmenu/ModMenuActivity;->circle(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v8

    invoke-virtual {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v9

    invoke-virtual {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    invoke-direct {v7, v8, v9, v6}, Lmodmenu/ModMenuActivity$Pill;-><init>(Landroid/graphics/drawable/GradientDrawable;II)V

    .line 240
    invoke-virtual {v2, v5, v7}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 242
    new-instance v5, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 243
    filled-new-array {v3}, [I

    move-result-object v3

    new-instance v6, Lmodmenu/ModMenuActivity$Pill;

    .line 244
    invoke-virtual {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v7

    const/16 v8, 0x20

    invoke-virtual {p0, v8}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v9

    const/16 v10, 0x10

    invoke-virtual {p0, v10}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v11

    int-to-float v11, v11

    iget v12, p1, Lmodmenu/Palette;->primary:I

    invoke-direct {p0, v7, v9, v11, v12}, Lmodmenu/ModMenuActivity;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v9

    invoke-virtual {p0, v8}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v11

    invoke-direct {v6, v7, v9, v11}, Lmodmenu/ModMenuActivity$Pill;-><init>(Landroid/graphics/drawable/GradientDrawable;II)V

    .line 243
    invoke-virtual {v5, v3, v6}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 245
    filled-new-array {v4}, [I

    move-result-object v3

    new-instance v4, Lmodmenu/ModMenuActivity$Pill;

    .line 246
    invoke-virtual {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    invoke-virtual {p0, v8}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v7

    invoke-virtual {p0, v10}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v9

    int-to-float v9, v9

    iget p1, p1, Lmodmenu/Palette;->trackOff:I

    invoke-direct {p0, v6, v7, v9, p1}, Lmodmenu/ModMenuActivity;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-virtual {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v1

    invoke-virtual {p0, v8}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    invoke-direct {v4, p1, v1, v6}, Lmodmenu/ModMenuActivity$Pill;-><init>(Landroid/graphics/drawable/GradientDrawable;II)V

    .line 245
    invoke-virtual {v5, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 247
    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setThumbDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 248
    invoke-virtual {v0, v5}, Landroid/widget/Switch;->setTrackDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 250
    :cond_0
    return-object v0
.end method

.method private openBrowser()V
    .locals 3

    .line 323
    :try_start_0
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->browser:Lmodmenu/IdBrowser;

    if-nez v0, :cond_0

    .line 324
    new-instance v0, Lmodmenu/IdBrowser;

    invoke-static {p0}, Lmodmenu/Palette;->of(Landroid/content/Context;)Lmodmenu/Palette;

    move-result-object v1

    iget-object v2, p0, Lmodmenu/ModMenuActivity;->root:Landroid/widget/FrameLayout;

    invoke-direct {v0, p0, v1, v2}, Lmodmenu/IdBrowser;-><init>(Lmodmenu/ModMenuActivity;Lmodmenu/Palette;Landroid/widget/FrameLayout;)V

    iput-object v0, p0, Lmodmenu/ModMenuActivity;->browser:Lmodmenu/IdBrowser;

    .line 326
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->browser:Lmodmenu/IdBrowser;

    invoke-virtual {v0}, Lmodmenu/IdBrowser;->open()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    goto :goto_0

    .line 327
    :catch_0
    move-exception v0

    .line 328
    const-string v1, "ModMenu"

    const-string v2, "id browser failed, closing"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 329
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->finish()V

    .line 331
    :goto_0
    return-void
.end method

.method private round(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 359
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 360
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 361
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 362
    return-object v0
.end method

.method private round(IIFI)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 366
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 367
    invoke-virtual {v0, p4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 368
    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    .line 369
    invoke-virtual {v0, p3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 370
    return-object v0
.end method

.method private roundRect(I)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 352
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 353
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 354
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 355
    return-object v0
.end method

.method private roundTop(IF)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 345
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 346
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 347
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

    .line 348
    return-object v0
.end method

.method private settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;
    .locals 6

    .line 193
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 194
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 195
    const/16 v2, 0x34

    invoke-virtual {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 196
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v3

    const/4 v4, 0x6

    invoke-virtual {p0, v4}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v5

    invoke-virtual {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    invoke-virtual {p0, v4}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v4

    invoke-virtual {v0, v3, v5, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 197
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_0

    .line 198
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    iget v3, p1, Lmodmenu/Palette;->onSurface:I

    const v4, 0xffffff

    and-int/2addr v3, v4

    const/high16 v4, 0x14000000

    or-int/2addr v3, v4

    .line 199
    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    .line 200
    invoke-virtual {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v1

    invoke-direct {p0, v1}, Lmodmenu/ModMenuActivity;->roundRect(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 198
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 203
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 204
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 205
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 206
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 207
    const/high16 p2, 0x41800000    # 16.0f

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 208
    iget p2, p1, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 209
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 210
    new-instance p2, Landroid/widget/TextView;

    invoke-direct {p2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 211
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 212
    const/high16 p3, 0x41600000    # 14.0f

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 213
    iget p1, p1, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 214
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p3, -0x2

    invoke-direct {p1, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 216
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 217
    invoke-virtual {v1, p2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 218
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p1, p2, p3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 221
    invoke-virtual {v0, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 222
    new-instance p1, Lmodmenu/ModMenuActivity$2;

    invoke-direct {p1, p0, p4}, Lmodmenu/ModMenuActivity$2;-><init>(Lmodmenu/ModMenuActivity;Landroid/widget/Switch;)V

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 228
    return-object v0
.end method

.method private slideSheetUp()V
    .locals 2

    .line 278
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    new-instance v1, Lmodmenu/ModMenuActivity$3;

    invoke-direct {v1, p0}, Lmodmenu/ModMenuActivity$3;-><init>(Lmodmenu/ModMenuActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 292
    return-void
.end method


# virtual methods
.method dp(I)I
    .locals 1

    .line 378
    int-to-float p1, p1

    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->getResources()Landroid/content/res/Resources;

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

.method public onBackPressed()V
    .locals 1

    .line 337
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->browser:Lmodmenu/IdBrowser;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lmodmenu/ModMenuActivity;->browser:Lmodmenu/IdBrowser;

    invoke-virtual {v0}, Lmodmenu/IdBrowser;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 338
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->browser:Lmodmenu/IdBrowser;

    invoke-virtual {v0}, Lmodmenu/IdBrowser;->close()V

    .line 339
    return-void

    .line 341
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 342
    return-void
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 296
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_0

    .line 297
    invoke-static {p0, p2}, Lmodmenu/ModMenu;->setWebBlocked(Landroid/content/Context;Z)V

    goto :goto_0

    .line 298
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_1

    .line 299
    invoke-static {p0, p2}, Lmodmenu/ModMenu;->setHwidSpoof(Landroid/content/Context;Z)V

    goto :goto_0

    .line 300
    :cond_1
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->rewardSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_2

    .line 301
    invoke-static {p0, p2}, Lmodmenu/ModMenu;->setRewardBypass(Landroid/content/Context;Z)V

    .line 303
    :cond_2
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 307
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->rotateBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_1

    .line 308
    invoke-static {p0}, Lmodmenu/ModMenu;->rotateHwid(Landroid/content/Context;)V

    .line 309
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 310
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v0, v2, :cond_0

    .line 311
    const/4 v1, 0x6

    goto :goto_0

    .line 312
    :cond_0
    nop

    .line 310
    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 313
    const-string p1, "mod_rotate_toast"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 314
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 316
    :cond_1
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->finish()V

    .line 318
    :goto_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 64
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 67
    invoke-static {p0}, Lmodmenu/ModMenu;->loadPrefs(Landroid/content/Context;)V

    .line 69
    :try_start_0
    invoke-direct {p0}, Lmodmenu/ModMenuActivity;->buildMenu()V

    .line 70
    invoke-direct {p0}, Lmodmenu/ModMenuActivity;->slideSheetUp()V

    .line 73
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 74
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "open_ids"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 75
    invoke-direct {p0}, Lmodmenu/ModMenuActivity;->openBrowser()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 80
    :cond_0
    goto :goto_0

    .line 77
    :catch_0
    move-exception p1

    .line 78
    const-string v0, "ModMenu"

    const-string v1, "menu UI failed, closing"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 79
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->finish()V

    .line 81
    :goto_0
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 104
    const/4 v0, 0x0

    invoke-static {v0}, Lmodmenu/IdScan;->setListener(Lmodmenu/IdScan$Listener;)V

    .line 105
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 106
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 85
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 87
    if-eqz p1, :cond_0

    const-string v0, "open_ids"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 88
    invoke-direct {p0}, Lmodmenu/ModMenuActivity;->openBrowser()V

    .line 90
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 0

    .line 94
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 99
    invoke-static {p0}, Lmodmenu/IdScan;->menuClosed(Landroid/content/Context;)V

    .line 100
    return-void
.end method
