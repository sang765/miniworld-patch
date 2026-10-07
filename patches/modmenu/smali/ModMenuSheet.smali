.class public final Lmodmenu/ModMenuSheet;
.super Ljava/lang/Object;
.source "ModMenuSheet.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmodmenu/ModMenuSheet$Pill;
    }
.end annotation


# static fields
.field private static current:Lmodmenu/ModMenuSheet;


# instance fields
.field private browser:Lmodmenu/IdBrowser;

.field private final dialog:Landroid/app/Dialog;

.field private gmBtn:Landroid/widget/Button;

.field private final host:Landroid/app/Activity;

.field private hwidSwitch:Landroid/widget/Switch;

.field private final p:Lmodmenu/Palette;

.field private rewardSwitch:Landroid/widget/Switch;

.field private root:Landroid/widget/FrameLayout;

.field private rotateBtn:Landroid/widget/Button;

.field private sheet:Landroid/widget/LinearLayout;

.field private unsafeCancelBtn:Landroid/widget/Button;

.field private unsafeConfirmBtn:Landroid/widget/Button;

.field private unsafeSwitch:Landroid/widget/Switch;

.field private unsafeVeil:Landroid/view/View;

.field private webSwitch:Landroid/widget/Switch;


# direct methods
.method private constructor <init>(Landroid/app/Activity;)V
    .locals 2

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    iput-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 100
    invoke-static {p1}, Lmodmenu/Palette;->of(Landroid/content/Context;)Lmodmenu/Palette;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    .line 102
    invoke-static {p1}, Lmodmenu/ModMenu;->loadPrefs(Landroid/content/Context;)V

    .line 103
    new-instance v0, Lmodmenu/ModMenuSheet$1;

    const v1, 0x1030010

    invoke-direct {v0, p0, p1, v1}, Lmodmenu/ModMenuSheet$1;-><init>(Lmodmenu/ModMenuSheet;Landroid/content/Context;I)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    .line 120
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    new-instance v1, Lmodmenu/ModMenuSheet$2;

    invoke-direct {v1, p0, p1}, Lmodmenu/ModMenuSheet$2;-><init>(Lmodmenu/ModMenuSheet;Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 134
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->build()V

    .line 135
    sput-object p0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    .line 136
    return-void
.end method

.method static synthetic access$000(Lmodmenu/ModMenuSheet;)Landroid/view/View;
    .locals 0

    .line 48
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$100(Lmodmenu/ModMenuSheet;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->cancelUnsafe()V

    return-void
.end method

.method static synthetic access$200(Lmodmenu/ModMenuSheet;)Lmodmenu/IdBrowser;
    .locals 0

    .line 48
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->browser:Lmodmenu/IdBrowser;

    return-object p0
.end method

.method static synthetic access$302(Lmodmenu/ModMenuSheet;)Lmodmenu/ModMenuSheet;
    .locals 0

    .line 48
    sput-object p0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    return-object p0
.end method

.method static synthetic access$400(Lmodmenu/ModMenuSheet;)Landroid/app/Dialog;
    .locals 0

    .line 48
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    return-object p0
.end method

.method static synthetic access$500(Lmodmenu/ModMenuSheet;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->openBrowser()V

    return-void
.end method

.method static synthetic access$600(Lmodmenu/ModMenuSheet;)Landroid/widget/LinearLayout;
    .locals 0

    .line 48
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    return-object p0
.end method

.method static synthetic access$700(Lmodmenu/ModMenuSheet;)Landroid/widget/Button;
    .locals 0

    .line 48
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    return-object p0
.end method

.method private build()V
    .locals 12

    .line 139
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->scrim:I

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 142
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 143
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v2, -0x1

    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setLayout(II)V

    .line 146
    new-instance v0, Lmodmenu/ModMenuSheet$3;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, p0, v3}, Lmodmenu/ModMenuSheet$3;-><init>(Lmodmenu/ModMenuSheet;Landroid/content/Context;)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    .line 157
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 159
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    .line 160
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 161
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 162
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->surface:I

    const/16 v5, 0x1c

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    int-to-float v6, v6

    invoke-direct {p0, v4, v6}, Lmodmenu/ModMenuSheet;->roundTop(IF)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 163
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    const/16 v4, 0x14

    invoke-direct {p0, v4}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    const/16 v7, 0xc

    invoke-direct {p0, v7}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v7

    invoke-direct {p0, v4}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v8

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    invoke-virtual {v0, v6, v7, v8, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 165
    new-instance v0, Landroid/view/View;

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v5}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 166
    const/16 v5, 0x20

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    const/4 v7, 0x4

    invoke-direct {p0, v7}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v8

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    int-to-float v1, v1

    iget-object v9, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v9, v9, Lmodmenu/Palette;->onSurfaceVariant:I

    const v10, 0xffffff

    and-int/2addr v9, v10

    const/high16 v11, 0x66000000

    or-int/2addr v9, v11

    invoke-direct {p0, v6, v8, v1, v9}, Lmodmenu/ModMenuSheet;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 168
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    invoke-direct {p0, v7}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v1, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 169
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 170
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 172
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 173
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v3, "mod_menu_title"

    invoke-static {v1, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    const/high16 v1, 0x41c00000    # 24.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 175
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 176
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v1, v1, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 177
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v1, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 179
    const/16 v5, 0xe

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 180
    const/4 v5, 0x6

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 181
    iget-object v6, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 183
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->webSwitch:Landroid/widget/Switch;

    .line 184
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    .line 185
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->rewardSwitch:Landroid/widget/Switch;

    .line 186
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->webSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isWebBlocked()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 187
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isSpoofOn()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 188
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->rewardSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isRewardBypass()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 189
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v7, "mod_web_label"

    invoke-static {v6, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 190
    const-string v8, "mod_web_desc"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->webSwitch:Landroid/widget/Switch;

    .line 189
    invoke-direct {p0, v1, v6, v7, v8}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 191
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v7, "mod_hwid_label"

    invoke-static {v6, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 192
    const-string v8, "mod_hwid_desc"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    .line 191
    invoke-direct {p0, v1, v6, v7, v8}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 193
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v7, "mod_reward_label"

    invoke-static {v6, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 194
    const-string v8, "mod_reward_desc"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->rewardSwitch:Landroid/widget/Switch;

    .line 193
    invoke-direct {p0, v1, v6, v7, v8}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 196
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    .line 197
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isUnsafe()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 198
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 201
    const/16 v1, 0xa

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 202
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v8, "mod_unsafe_label"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 203
    const-string v9, "mod_unsafe_desc"

    invoke-static {v8, v9}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    .line 202
    invoke-direct {p0, v6, v7, v8, v9}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v6

    invoke-virtual {v1, v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 205
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v1, "mod_rotate"

    invoke-static {v0, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v1, v1, Lmodmenu/Palette;->primary:I

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v6, v6, Lmodmenu/Palette;->onPrimary:I

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v7, v7, Lmodmenu/Palette;->onPrimary:I

    and-int/2addr v7, v10

    const/high16 v8, 0x1f000000

    or-int/2addr v7, v8

    invoke-direct {p0, v0, v1, v6, v7}, Lmodmenu/ModMenuSheet;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->rotateBtn:Landroid/widget/Button;

    .line 207
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 208
    const/16 v1, 0x28

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v0, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 209
    invoke-direct {p0, v4}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 210
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->rotateBtn:Landroid/widget/Button;

    invoke-virtual {v4, v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 214
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_gm_label"

    invoke-static {v0, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->primary:I

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v6, v6, Lmodmenu/Palette;->primary:I

    and-int/2addr v6, v10

    const/high16 v7, 0x14000000

    or-int/2addr v6, v7

    const/4 v8, 0x0

    invoke-direct {p0, v0, v8, v4, v6}, Lmodmenu/ModMenuSheet;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    .line 216
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 217
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    invoke-direct {v0, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 218
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 219
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    invoke-virtual {v4, v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 220
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    invoke-static {}, Lmodmenu/ModMenu;->isUnsafe()Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    const/16 v4, 0x8

    :goto_0
    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 222
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_id_label"

    invoke-static {v0, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->primary:I

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v6, v6, Lmodmenu/Palette;->primary:I

    and-int/2addr v6, v10

    or-int/2addr v6, v7

    invoke-direct {p0, v0, v8, v4, v6}, Lmodmenu/ModMenuSheet;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v0

    .line 226
    new-instance v4, Lmodmenu/ModMenuSheet$4;

    invoke-direct {v4, p0}, Lmodmenu/ModMenuSheet$4;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 232
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 233
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v4, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 234
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 235
    iget-object v6, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 237
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_close"

    invoke-static {v0, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->primary:I

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v6, v6, Lmodmenu/Palette;->primary:I

    and-int/2addr v6, v10

    or-int/2addr v6, v7

    invoke-direct {p0, v0, v8, v4, v6}, Lmodmenu/ModMenuSheet;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v0

    .line 239
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 240
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    invoke-direct {v4, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 241
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    iput v1, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 242
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 244
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x50

    invoke-direct {v4, v2, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 247
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 249
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 250
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->slideSheetUp()V

    .line 251
    return-void
.end method

.method private cancelUnsafe()V
    .locals 2

    .line 444
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissUnsafe()V

    .line 445
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 446
    return-void
.end method

.method private circle(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 544
    int-to-float v0, p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-direct {p0, p1, p1, v0, p2}, Lmodmenu/ModMenuSheet;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    return-object p1
.end method

.method private dismissUnsafe()V
    .locals 2

    .line 449
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 450
    const/4 v0, 0x0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    .line 451
    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 548
    int-to-float p1, p1

    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

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

.method private getWindow()Landroid/view/Window;
    .locals 1

    .line 254
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    return-object v0
.end method

.method private makeButton(Ljava/lang/String;III)Landroid/widget/Button;
    .locals 2

    .line 321
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 322
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 323
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 324
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 325
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 326
    const/16 p3, 0x11

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setGravity(I)V

    .line 327
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 328
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 329
    const/16 p3, 0x18

    invoke-direct {p0, p3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    invoke-direct {p0, p3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result p3

    invoke-virtual {v0, v1, p1, p3, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 330
    const/16 p1, 0x14

    invoke-direct {p0, p1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result p3

    invoke-direct {p0, p3, p2}, Lmodmenu/ModMenuSheet;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    .line 331
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt p3, v1, :cond_0

    .line 334
    new-instance p3, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p4

    .line 335
    invoke-direct {p0, p1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result p1

    const/4 v1, -0x1

    invoke-direct {p0, p1, v1}, Lmodmenu/ModMenuSheet;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-direct {p3, p4, p2, p1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 334
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 337
    :cond_0
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 339
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 340
    return-object v0
.end method

.method private makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;
    .locals 13

    .line 298
    new-instance v0, Landroid/widget/Switch;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 299
    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 300
    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 301
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 302
    const/16 v1, 0x34

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setSwitchMinWidth(I)V

    .line 303
    new-instance v2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 304
    const v3, 0x10100a0

    filled-new-array {v3}, [I

    move-result-object v4

    new-instance v5, Lmodmenu/ModMenuSheet$Pill;

    .line 305
    const/16 v6, 0x14

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v7

    const/4 v8, -0x1

    invoke-direct {p0, v7, v8}, Lmodmenu/ModMenuSheet;->circle(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v8

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v9

    invoke-direct {v5, v7, v8, v9}, Lmodmenu/ModMenuSheet$Pill;-><init>(Landroid/graphics/drawable/GradientDrawable;II)V

    .line 304
    invoke-virtual {v2, v4, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 306
    const v4, -0x10100a0

    filled-new-array {v4}, [I

    move-result-object v5

    new-instance v7, Lmodmenu/ModMenuSheet$Pill;

    .line 307
    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v8

    iget v9, p1, Lmodmenu/Palette;->thumbOff:I

    invoke-direct {p0, v8, v9}, Lmodmenu/ModMenuSheet;->circle(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v8

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v9

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v7, v8, v9, v6}, Lmodmenu/ModMenuSheet$Pill;-><init>(Landroid/graphics/drawable/GradientDrawable;II)V

    .line 306
    invoke-virtual {v2, v5, v7}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 308
    new-instance v5, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 309
    filled-new-array {v3}, [I

    move-result-object v3

    new-instance v6, Lmodmenu/ModMenuSheet$Pill;

    .line 310
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v7

    const/16 v8, 0x20

    invoke-direct {p0, v8}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v9

    const/16 v10, 0x10

    invoke-direct {p0, v10}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v11

    int-to-float v11, v11

    iget v12, p1, Lmodmenu/Palette;->primary:I

    invoke-direct {p0, v7, v9, v11, v12}, Lmodmenu/ModMenuSheet;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v9

    invoke-direct {p0, v8}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v11

    invoke-direct {v6, v7, v9, v11}, Lmodmenu/ModMenuSheet$Pill;-><init>(Landroid/graphics/drawable/GradientDrawable;II)V

    .line 309
    invoke-virtual {v5, v3, v6}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 311
    filled-new-array {v4}, [I

    move-result-object v3

    new-instance v4, Lmodmenu/ModMenuSheet$Pill;

    .line 312
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {p0, v8}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v7

    invoke-direct {p0, v10}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v9

    int-to-float v9, v9

    iget p1, p1, Lmodmenu/Palette;->trackOff:I

    invoke-direct {p0, v6, v7, v9, p1}, Lmodmenu/ModMenuSheet;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    invoke-direct {p0, v8}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v4, p1, v1, v6}, Lmodmenu/ModMenuSheet$Pill;-><init>(Landroid/graphics/drawable/GradientDrawable;II)V

    .line 311
    invoke-virtual {v5, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 313
    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setThumbDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 314
    invoke-virtual {v0, v5}, Landroid/widget/Switch;->setTrackDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 316
    :cond_0
    return-object v0
.end method

.method private openBrowser()V
    .locals 5

    .line 497
    :try_start_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->browser:Lmodmenu/IdBrowser;

    if-nez v0, :cond_0

    .line 498
    new-instance v0, Lmodmenu/IdBrowser;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    new-instance v4, Lmodmenu/ModMenuSheet$8;

    invoke-direct {v4, p0}, Lmodmenu/ModMenuSheet$8;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lmodmenu/IdBrowser;-><init>(Landroid/app/Activity;Lmodmenu/Palette;Landroid/widget/FrameLayout;Ljava/lang/Runnable;)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->browser:Lmodmenu/IdBrowser;

    .line 507
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->browser:Lmodmenu/IdBrowser;

    invoke-virtual {v0}, Lmodmenu/IdBrowser;->open()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 511
    goto :goto_0

    .line 508
    :catch_0
    move-exception v0

    .line 509
    const-string v1, "ModMenu"

    const-string v2, "id browser failed, closing"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 510
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 512
    :goto_0
    return-void
.end method

.method private requestGameMode()V
    .locals 2

    .line 482
    invoke-static {}, Lmodmenu/ModMenu;->isUnsafe()Z

    move-result v0

    if-nez v0, :cond_0

    .line 483
    return-void

    .line 485
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 486
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    new-instance v1, Lmodmenu/ModMenuSheet$7;

    invoke-direct {v1, p0}, Lmodmenu/ModMenuSheet$7;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-static {v0, v1}, Lmodmenu/GameMode;->request(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 492
    return-void
.end method

.method private round(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 529
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 530
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 531
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 532
    return-object v0
.end method

.method private round(IIFI)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 536
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 537
    invoke-virtual {v0, p4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 538
    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    .line 539
    invoke-virtual {v0, p3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 540
    return-object v0
.end method

.method private roundRect(I)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 522
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 523
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 524
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 525
    return-object v0
.end method

.method private roundTop(IF)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 515
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 516
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 517
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

    .line 518
    return-object v0
.end method

.method private settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;
    .locals 6

    .line 259
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 260
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 261
    const/16 v2, 0x34

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 262
    const/16 v2, 0x8

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    const/4 v4, 0x6

    invoke-direct {p0, v4}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v2

    invoke-direct {p0, v4}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    invoke-virtual {v0, v3, v5, v2, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 263
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_0

    .line 264
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    iget v3, p1, Lmodmenu/Palette;->onSurface:I

    const v4, 0xffffff

    and-int/2addr v3, v4

    const/high16 v4, 0x14000000

    or-int/2addr v3, v4

    .line 265
    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    .line 266
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->roundRect(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 264
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 269
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 270
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 271
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 272
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 273
    const/high16 p2, 0x41800000    # 16.0f

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 274
    iget p2, p1, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 275
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 276
    new-instance p2, Landroid/widget/TextView;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {p2, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 277
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 278
    const/high16 p3, 0x41600000    # 14.0f

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 279
    iget p1, p1, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 280
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p3, -0x2

    invoke-direct {p1, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 282
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v2

    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 283
    invoke-virtual {v1, p2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 284
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p1, p2, p3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 287
    invoke-virtual {v0, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 288
    new-instance p1, Lmodmenu/ModMenuSheet$5;

    invoke-direct {p1, p0, p4}, Lmodmenu/ModMenuSheet$5;-><init>(Lmodmenu/ModMenuSheet;Landroid/widget/Switch;)V

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 294
    return-object v0
.end method

.method static show(Landroid/app/Activity;Z)Lmodmenu/ModMenuSheet;
    .locals 2

    .line 74
    sget-object v0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    if-eqz v0, :cond_1

    sget-object v0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    iget-object v0, v0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    if-ne v0, p0, :cond_1

    sget-object v0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    iget-object v0, v0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    .line 75
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 76
    if-eqz p1, :cond_0

    .line 77
    sget-object p0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->openBrowser()V

    .line 79
    :cond_0
    sget-object p0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    return-object p0

    .line 82
    :cond_1
    :try_start_0
    new-instance v0, Lmodmenu/ModMenuSheet;

    invoke-direct {v0, p0}, Lmodmenu/ModMenuSheet;-><init>(Landroid/app/Activity;)V

    .line 85
    if-eqz p1, :cond_2

    .line 86
    invoke-direct {v0}, Lmodmenu/ModMenuSheet;->openBrowser()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    :cond_2
    return-object v0

    .line 89
    :catch_0
    move-exception p1

    .line 90
    const-string v0, "ModMenu"

    const-string v1, "menu UI failed"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 91
    instance-of p1, p0, Lmodmenu/ModMenuActivity;

    if-eqz p1, :cond_3

    .line 92
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 94
    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method private showUnsafeConfirm()V
    .locals 8

    .line 382
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 383
    return-void

    .line 386
    :cond_0
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 387
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 388
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 389
    const/16 v2, 0x18

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->surface:I

    invoke-direct {p0, v3, v4}, Lmodmenu/ModMenuSheet;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 390
    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    const/16 v4, 0x14

    invoke-direct {p0, v4}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v2

    const/16 v5, 0x8

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    invoke-virtual {v0, v3, v4, v2, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 392
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 393
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_unsafe_dialog_title"

    invoke-static {v3, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 394
    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 395
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 396
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 397
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 399
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 400
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_unsafe_dialog_body"

    invoke-static {v3, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 401
    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 402
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 403
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 406
    const/16 v5, 0xa

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 407
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 410
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v3, "mod_unsafe_cancel"

    invoke-static {v2, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurfaceVariant:I

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v5, v5, Lmodmenu/Palette;->onSurface:I

    const v6, 0xffffff

    and-int/2addr v5, v6

    const/high16 v7, 0x14000000

    or-int/2addr v5, v7

    const/4 v7, 0x0

    invoke-direct {p0, v2, v7, v3, v5}, Lmodmenu/ModMenuSheet;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->unsafeCancelBtn:Landroid/widget/Button;

    .line 412
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v3, "mod_unsafe_confirm"

    invoke-static {v2, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->primary:I

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v5, v5, Lmodmenu/Palette;->onPrimary:I

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v7, v7, Lmodmenu/Palette;->onPrimary:I

    and-int/2addr v6, v7

    const/high16 v7, 0x1f000000

    or-int/2addr v6, v7

    invoke-direct {p0, v2, v3, v5, v6}, Lmodmenu/ModMenuSheet;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->unsafeConfirmBtn:Landroid/widget/Button;

    .line 414
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 415
    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 416
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 417
    const/16 v5, 0x28

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v3, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 418
    const/4 v6, 0x4

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 419
    iget-object v6, p0, Lmodmenu/ModMenuSheet;->unsafeCancelBtn:Landroid/widget/Button;

    invoke-virtual {v2, v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 420
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->unsafeConfirmBtn:Landroid/widget/Button;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 421
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    invoke-direct {v6, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 420
    invoke-virtual {v2, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 422
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 425
    const/16 v6, 0x10

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 426
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 428
    new-instance v2, Landroid/widget/FrameLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 429
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v6, v6, Lmodmenu/Palette;->scrim:I

    invoke-direct {v3, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 430
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 431
    invoke-virtual {v2, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 432
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x11

    invoke-direct {v1, v5, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 436
    const/16 v3, 0x1c

    invoke-direct {p0, v3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 437
    invoke-virtual {v2, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 438
    iput-object v2, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    .line 439
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 440
    return-void
.end method

.method private slideSheetUp()V
    .locals 2

    .line 344
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    new-instance v1, Lmodmenu/ModMenuSheet$6;

    invoke-direct {v1, p0}, Lmodmenu/ModMenuSheet$6;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->post(Ljava/lang/Runnable;)Z

    .line 358
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 362
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->webSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_0

    .line 363
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setWebBlocked(Landroid/content/Context;Z)V

    goto :goto_0

    .line 364
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_1

    .line 365
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setHwidSpoof(Landroid/content/Context;Z)V

    goto :goto_0

    .line 366
    :cond_1
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->rewardSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_2

    .line 367
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setRewardBypass(Landroid/content/Context;Z)V

    goto :goto_0

    .line 368
    :cond_2
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_4

    .line 369
    if-eqz p2, :cond_3

    .line 372
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->showUnsafeConfirm()V

    goto :goto_0

    .line 374
    :cond_3
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setUnsafe(Landroid/content/Context;Z)V

    .line 375
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setVisibility(I)V

    .line 378
    :cond_4
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 455
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    if-eq p1, v0, :cond_5

    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeCancelBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_0

    goto :goto_1

    .line 457
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeConfirmBtn:Landroid/widget/Button;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p1, v0, :cond_1

    .line 458
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, v2}, Lmodmenu/ModMenu;->setUnsafe(Landroid/content/Context;Z)V

    .line 459
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissUnsafe()V

    .line 460
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_2

    .line 461
    :cond_1
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->rotateBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_3

    .line 462
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {v0}, Lmodmenu/ModMenu;->rotateHwid(Landroid/content/Context;)V

    .line 463
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 464
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-lt v0, v3, :cond_2

    .line 465
    const/4 v2, 0x6

    goto :goto_0

    .line 466
    :cond_2
    nop

    .line 464
    :goto_0
    invoke-virtual {p1, v2}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 467
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v2, "mod_rotate_toast"

    invoke-static {v0, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 468
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_2

    .line 469
    :cond_3
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_4

    .line 470
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->requestGameMode()V

    goto :goto_2

    .line 472
    :cond_4
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->cancel()V

    goto :goto_2

    .line 456
    :cond_5
    :goto_1
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->cancelUnsafe()V

    .line 474
    :goto_2
    return-void
.end method
