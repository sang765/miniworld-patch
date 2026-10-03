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


# instance fields
.field private hwidSwitch:Landroid/widget/Switch;

.field private kbSwitch:Landroid/widget/Switch;

.field private rewardSwitch:Landroid/widget/Switch;

.field private rotateBtn:Landroid/widget/Button;

.field private sheet:Landroid/widget/LinearLayout;

.field private webSwitch:Landroid/widget/Switch;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lmodmenu/ModMenuActivity;)Landroid/widget/LinearLayout;
    .locals 0

    .line 46
    iget-object p0, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method private buildMenu()V
    .locals 13

    .line 72
    invoke-static {p0}, Lmodmenu/Palette;->of(Landroid/content/Context;)Lmodmenu/Palette;

    move-result-object v0

    .line 73
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    iget v3, v0, Lmodmenu/Palette;->scrim:I

    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 75
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 76
    invoke-virtual {v1, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    .line 79
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 80
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 81
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    iget v4, v0, Lmodmenu/Palette;->surface:I

    const/16 v5, 0x1c

    invoke-direct {p0, v5}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    int-to-float v6, v6

    invoke-direct {p0, v4, v6}, Lmodmenu/ModMenuActivity;->roundTop(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 82
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    const/16 v4, 0x14

    invoke-direct {p0, v4}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    const/16 v7, 0xc

    invoke-direct {p0, v7}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v7

    invoke-direct {p0, v4}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v8

    invoke-direct {p0, v5}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v5

    invoke-virtual {v2, v6, v7, v8, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 84
    new-instance v2, Landroid/view/View;

    invoke-direct {v2, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 85
    const/16 v5, 0x20

    invoke-direct {p0, v5}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    const/4 v7, 0x4

    invoke-direct {p0, v7}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v8

    const/4 v9, 0x2

    invoke-direct {p0, v9}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v9

    int-to-float v9, v9

    iget v10, v0, Lmodmenu/Palette;->onSurfaceVariant:I

    const v11, 0xffffff

    and-int/2addr v10, v11

    const/high16 v12, 0x66000000

    or-int/2addr v10, v12

    invoke-direct {p0, v6, v8, v9, v10}, Lmodmenu/ModMenuActivity;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 87
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v5}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v7}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v7

    invoke-direct {v6, v5, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 88
    iput v3, v6, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 89
    iget-object v3, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 92
    const-string v3, "menu.title"

    invoke-static {v3}, Lmodmenu/I18n;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    const/high16 v3, 0x41c00000    # 24.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 94
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 95
    iget v3, v0, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 96
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    invoke-direct {v3, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 98
    const/16 v6, 0xe

    invoke-direct {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 99
    const/4 v6, 0x6

    invoke-direct {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v7

    iput v7, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 100
    iget-object v7, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 102
    invoke-direct {p0, v0}, Lmodmenu/ModMenuActivity;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    .line 103
    invoke-direct {p0, v0}, Lmodmenu/ModMenuActivity;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    .line 104
    invoke-direct {p0, v0}, Lmodmenu/ModMenuActivity;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuActivity;->rewardSwitch:Landroid/widget/Switch;

    .line 105
    invoke-direct {p0, v0}, Lmodmenu/ModMenuActivity;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuActivity;->kbSwitch:Landroid/widget/Switch;

    .line 106
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isWebBlocked()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 107
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isSpoofOn()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 108
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->rewardSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isRewardBypass()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 109
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->kbSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 110
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    const-string v3, "web.label"

    invoke-static {v3}, Lmodmenu/I18n;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 111
    const-string v7, "web.desc"

    invoke-static {v7}, Lmodmenu/I18n;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    .line 110
    invoke-direct {p0, v0, v3, v7, v8}, Lmodmenu/ModMenuActivity;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 112
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    const-string v3, "hwid.label"

    invoke-static {v3}, Lmodmenu/I18n;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 113
    const-string v7, "hwid.desc"

    invoke-static {v7}, Lmodmenu/I18n;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    .line 112
    invoke-direct {p0, v0, v3, v7, v8}, Lmodmenu/ModMenuActivity;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 114
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    const-string v3, "reward.label"

    invoke-static {v3}, Lmodmenu/I18n;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 115
    const-string v7, "reward.desc"

    invoke-static {v7}, Lmodmenu/I18n;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuActivity;->rewardSwitch:Landroid/widget/Switch;

    .line 114
    invoke-direct {p0, v0, v3, v7, v8}, Lmodmenu/ModMenuActivity;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 116
    iget-object v2, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    const-string v3, "kb.label"

    invoke-static {v3}, Lmodmenu/I18n;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 117
    const-string v7, "kb.desc"

    invoke-static {v7}, Lmodmenu/I18n;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuActivity;->kbSwitch:Landroid/widget/Switch;

    .line 116
    invoke-direct {p0, v0, v3, v7, v8}, Lmodmenu/ModMenuActivity;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 119
    const-string v2, "rotate"

    invoke-static {v2}, Lmodmenu/I18n;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget v3, v0, Lmodmenu/Palette;->primary:I

    iget v7, v0, Lmodmenu/Palette;->onPrimary:I

    iget v8, v0, Lmodmenu/Palette;->onPrimary:I

    and-int/2addr v8, v11

    const/high16 v9, 0x1f000000

    or-int/2addr v8, v9

    invoke-direct {p0, v2, v3, v7, v8}, Lmodmenu/ModMenuActivity;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuActivity;->rotateBtn:Landroid/widget/Button;

    .line 121
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 122
    const/16 v3, 0x28

    invoke-direct {p0, v3}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v7

    const/4 v8, -0x1

    invoke-direct {v2, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 123
    invoke-direct {p0, v4}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v4

    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 124
    iget-object v4, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    iget-object v7, p0, Lmodmenu/ModMenuActivity;->rotateBtn:Landroid/widget/Button;

    invoke-virtual {v4, v7, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 126
    const-string v2, "close"

    invoke-static {v2}, Lmodmenu/I18n;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget v4, v0, Lmodmenu/Palette;->primary:I

    iget v0, v0, Lmodmenu/Palette;->primary:I

    and-int/2addr v0, v11

    const/high16 v7, 0x14000000

    or-int/2addr v0, v7

    const/4 v7, 0x0

    invoke-direct {p0, v2, v7, v4, v0}, Lmodmenu/ModMenuActivity;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v0

    .line 128
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 129
    invoke-direct {p0, v3}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v3

    invoke-direct {v2, v8, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 130
    invoke-direct {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v3

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 131
    iget-object v3, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 133
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x50

    invoke-direct {v2, v8, v5, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v1, v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 136
    invoke-virtual {p0, v1}, Lmodmenu/ModMenuActivity;->setContentView(Landroid/view/View;)V

    .line 137
    return-void
.end method

.method private circle(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 300
    int-to-float v0, p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-direct {p0, p1, p1, v0, p2}, Lmodmenu/ModMenuActivity;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    return-object p1
.end method

.method private dp(I)I
    .locals 1

    .line 304
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

.method private makeButton(Ljava/lang/String;III)Landroid/widget/Button;
    .locals 2

    .line 203
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 204
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 205
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 206
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 207
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 208
    const/16 p3, 0x11

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setGravity(I)V

    .line 209
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 210
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 211
    const/16 p3, 0x18

    invoke-direct {p0, p3}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v1

    invoke-direct {p0, p3}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result p3

    invoke-virtual {v0, v1, p1, p3, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 212
    const/16 p1, 0x14

    invoke-direct {p0, p1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result p3

    invoke-direct {p0, p3, p2}, Lmodmenu/ModMenuActivity;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    .line 213
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt p3, v1, :cond_0

    .line 216
    new-instance p3, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p4

    .line 217
    invoke-direct {p0, p1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result p1

    const/4 v1, -0x1

    invoke-direct {p0, p1, v1}, Lmodmenu/ModMenuActivity;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-direct {p3, p4, p2, p1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 216
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 219
    :cond_0
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 221
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 222
    return-object v0
.end method

.method private makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;
    .locals 13

    .line 180
    new-instance v0, Landroid/widget/Switch;

    invoke-direct {v0, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 181
    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 182
    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 183
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 184
    const/16 v1, 0x34

    invoke-direct {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setSwitchMinWidth(I)V

    .line 185
    new-instance v2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 186
    const v3, 0x10100a0

    filled-new-array {v3}, [I

    move-result-object v4

    new-instance v5, Lmodmenu/ModMenuActivity$Pill;

    .line 187
    const/16 v6, 0x14

    invoke-direct {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v7

    const/4 v8, -0x1

    invoke-direct {p0, v7, v8}, Lmodmenu/ModMenuActivity;->circle(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-direct {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v8

    invoke-direct {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v9

    invoke-direct {v5, v7, v8, v9}, Lmodmenu/ModMenuActivity$Pill;-><init>(Landroid/graphics/drawable/GradientDrawable;II)V

    .line 186
    invoke-virtual {v2, v4, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 188
    const v4, -0x10100a0

    filled-new-array {v4}, [I

    move-result-object v5

    new-instance v7, Lmodmenu/ModMenuActivity$Pill;

    .line 189
    invoke-direct {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v8

    iget v9, p1, Lmodmenu/Palette;->thumbOff:I

    invoke-direct {p0, v8, v9}, Lmodmenu/ModMenuActivity;->circle(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v8

    invoke-direct {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v9

    invoke-direct {p0, v6}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    invoke-direct {v7, v8, v9, v6}, Lmodmenu/ModMenuActivity$Pill;-><init>(Landroid/graphics/drawable/GradientDrawable;II)V

    .line 188
    invoke-virtual {v2, v5, v7}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 190
    new-instance v5, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 191
    filled-new-array {v3}, [I

    move-result-object v3

    new-instance v6, Lmodmenu/ModMenuActivity$Pill;

    .line 192
    invoke-direct {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v7

    const/16 v8, 0x20

    invoke-direct {p0, v8}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v9

    const/16 v10, 0x10

    invoke-direct {p0, v10}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v11

    int-to-float v11, v11

    iget v12, p1, Lmodmenu/Palette;->primary:I

    invoke-direct {p0, v7, v9, v11, v12}, Lmodmenu/ModMenuActivity;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-direct {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v9

    invoke-direct {p0, v8}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v11

    invoke-direct {v6, v7, v9, v11}, Lmodmenu/ModMenuActivity$Pill;-><init>(Landroid/graphics/drawable/GradientDrawable;II)V

    .line 191
    invoke-virtual {v5, v3, v6}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 193
    filled-new-array {v4}, [I

    move-result-object v3

    new-instance v4, Lmodmenu/ModMenuActivity$Pill;

    .line 194
    invoke-direct {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    invoke-direct {p0, v8}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v7

    invoke-direct {p0, v10}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v9

    int-to-float v9, v9

    iget p1, p1, Lmodmenu/Palette;->trackOff:I

    invoke-direct {p0, v6, v7, v9, p1}, Lmodmenu/ModMenuActivity;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-direct {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v1

    invoke-direct {p0, v8}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v6

    invoke-direct {v4, p1, v1, v6}, Lmodmenu/ModMenuActivity$Pill;-><init>(Landroid/graphics/drawable/GradientDrawable;II)V

    .line 193
    invoke-virtual {v5, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 195
    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setThumbDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 196
    invoke-virtual {v0, v5}, Landroid/widget/Switch;->setTrackDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 198
    :cond_0
    return-object v0
.end method

.method private round(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 285
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 286
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 287
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 288
    return-object v0
.end method

.method private round(IIFI)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 292
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 293
    invoke-virtual {v0, p4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 294
    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    .line 295
    invoke-virtual {v0, p3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 296
    return-object v0
.end method

.method private roundRect(I)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 278
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 279
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 280
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 281
    return-object v0
.end method

.method private roundTop(IF)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 271
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 272
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 273
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

    .line 274
    return-object v0
.end method

.method private settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;
    .locals 6

    .line 141
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 142
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 143
    const/16 v2, 0x34

    invoke-direct {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 144
    const/16 v2, 0x8

    invoke-direct {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v3

    const/4 v4, 0x6

    invoke-direct {p0, v4}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v4}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v4

    invoke-virtual {v0, v3, v5, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 145
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_0

    .line 146
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    iget v3, p1, Lmodmenu/Palette;->onSurface:I

    const v4, 0xffffff

    and-int/2addr v3, v4

    const/high16 v4, 0x14000000

    or-int/2addr v3, v4

    .line 147
    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    .line 148
    invoke-direct {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v1

    invoke-direct {p0, v1}, Lmodmenu/ModMenuActivity;->roundRect(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 146
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 151
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 152
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 153
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 154
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    const/high16 p2, 0x41800000    # 16.0f

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 156
    iget p2, p1, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 157
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 158
    new-instance p2, Landroid/widget/TextView;

    invoke-direct {p2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 159
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 160
    const/high16 p3, 0x41600000    # 14.0f

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 161
    iget p1, p1, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 162
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p3, -0x2

    invoke-direct {p1, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 164
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 165
    invoke-virtual {v1, p2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 166
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p1, p2, p3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 169
    invoke-virtual {v0, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 170
    new-instance p1, Lmodmenu/ModMenuActivity$1;

    invoke-direct {p1, p0, p4}, Lmodmenu/ModMenuActivity$1;-><init>(Lmodmenu/ModMenuActivity;Landroid/widget/Switch;)V

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 176
    return-object v0
.end method

.method private slideSheetUp()V
    .locals 2

    .line 226
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->sheet:Landroid/widget/LinearLayout;

    new-instance v1, Lmodmenu/ModMenuActivity$2;

    invoke-direct {v1, p0}, Lmodmenu/ModMenuActivity$2;-><init>(Lmodmenu/ModMenuActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 240
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 244
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_0

    .line 245
    invoke-static {p0, p2}, Lmodmenu/ModMenu;->setWebBlocked(Landroid/content/Context;Z)V

    goto :goto_0

    .line 246
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_1

    .line 247
    invoke-static {p0, p2}, Lmodmenu/ModMenu;->setHwidSpoof(Landroid/content/Context;Z)V

    goto :goto_0

    .line 248
    :cond_1
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->rewardSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_2

    .line 249
    invoke-static {p0, p2}, Lmodmenu/ModMenu;->setRewardBypass(Landroid/content/Context;Z)V

    goto :goto_0

    .line 250
    :cond_2
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->kbSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_3

    .line 251
    invoke-static {p0, p2}, Lmodmenu/ModMenu;->setKbMouse(Landroid/content/Context;Z)V

    .line 253
    :cond_3
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 257
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->rotateBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_1

    .line 258
    invoke-static {p0}, Lmodmenu/ModMenu;->rotateHwid(Landroid/content/Context;)V

    .line 259
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 260
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v0, v2, :cond_0

    .line 261
    const/4 v1, 0x6

    goto :goto_0

    .line 262
    :cond_0
    nop

    .line 260
    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 263
    const-string p1, "rotate.toast"

    invoke-static {p1}, Lmodmenu/I18n;->t(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 264
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_1

    .line 266
    :cond_1
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->finish()V

    .line 268
    :goto_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 58
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 61
    invoke-static {p0}, Lmodmenu/ModMenu;->loadPrefs(Landroid/content/Context;)V

    .line 63
    :try_start_0
    invoke-direct {p0}, Lmodmenu/ModMenuActivity;->buildMenu()V

    .line 64
    invoke-direct {p0}, Lmodmenu/ModMenuActivity;->slideSheetUp()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    goto :goto_0

    .line 65
    :catch_0
    move-exception p1

    .line 66
    const-string v0, "ModMenu"

    const-string v1, "menu UI failed, closing"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 67
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->finish()V

    .line 69
    :goto_0
    return-void
.end method
