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
.field private autoRotateSwitch:Landroid/widget/Switch;

.field private browser:Lmodmenu/IdBrowser;

.field private final dialog:Landroid/app/Dialog;

.field private giveBtn:Landroid/widget/Button;

.field private giveCancelBtn:Landroid/widget/Button;

.field private giveCountEt:Landroid/widget/EditText;

.field private giveGoBtn:Landroid/widget/Button;

.field private giveItemEt:Landroid/widget/EditText;

.field private givePreview:Landroid/widget/TextView;

.field private giveUidEt:Landroid/widget/EditText;

.field private giveVeil:Landroid/view/View;

.field private gmBtn:Landroid/widget/Button;

.field private final host:Landroid/app/Activity;

.field private hwidSwitch:Landroid/widget/Switch;

.field private final p:Lmodmenu/Palette;

.field private restartCancelBtn:Landroid/widget/Button;

.field private restartGoBtn:Landroid/widget/Button;

.field private restartVeil:Landroid/view/View;

.field private rewardSwitch:Landroid/widget/Switch;

.field private root:Landroid/widget/FrameLayout;

.field private rotateBtn:Landroid/widget/Button;

.field private scroller:Landroid/widget/ScrollView;

.field private sheet:Landroid/widget/LinearLayout;

.field private trackSwitch:Landroid/widget/Switch;

.field private unsafeCancelBtn:Landroid/widget/Button;

.field private unsafeConfirmBtn:Landroid/widget/Button;

.field private unsafeSwitch:Landroid/widget/Switch;

.field private unsafeVeil:Landroid/view/View;

.field private webSwitch:Landroid/widget/Switch;


# direct methods
.method private constructor <init>(Landroid/app/Activity;)V
    .locals 2

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    iput-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 124
    invoke-static {p1}, Lmodmenu/Palette;->of(Landroid/content/Context;)Lmodmenu/Palette;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    .line 126
    invoke-static {p1}, Lmodmenu/ModMenu;->loadPrefs(Landroid/content/Context;)V

    .line 127
    new-instance v0, Lmodmenu/ModMenuSheet$1;

    const v1, 0x1030010

    invoke-direct {v0, p0, p1, v1}, Lmodmenu/ModMenuSheet$1;-><init>(Lmodmenu/ModMenuSheet;Landroid/content/Context;I)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    .line 153
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    new-instance v1, Lmodmenu/ModMenuSheet$2;

    invoke-direct {v1, p0, p1}, Lmodmenu/ModMenuSheet$2;-><init>(Lmodmenu/ModMenuSheet;Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 167
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->build()V

    .line 168
    sput-object p0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    .line 169
    return-void
.end method

.method static synthetic access$000(Lmodmenu/ModMenuSheet;)Landroid/view/View;
    .locals 0

    .line 54
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$100(Lmodmenu/ModMenuSheet;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissGive()V

    return-void
.end method

.method static synthetic access$1000(Lmodmenu/ModMenuSheet;)Landroid/widget/ScrollView;
    .locals 0

    .line 54
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->scroller:Landroid/widget/ScrollView;

    return-object p0
.end method

.method static synthetic access$1100(Lmodmenu/ModMenuSheet;)Landroid/widget/Button;
    .locals 0

    .line 54
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$1200(Lmodmenu/ModMenuSheet;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->refreshPreview()V

    return-void
.end method

.method static synthetic access$1300(Lmodmenu/ModMenuSheet;)Landroid/widget/Button;
    .locals 0

    .line 54
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    return-object p0
.end method

.method static synthetic access$200(Lmodmenu/ModMenuSheet;)Landroid/view/View;
    .locals 0

    .line 54
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$300(Lmodmenu/ModMenuSheet;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->cancelUnsafe()V

    return-void
.end method

.method static synthetic access$400(Lmodmenu/ModMenuSheet;)Landroid/view/View;
    .locals 0

    .line 54
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->restartVeil:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$500(Lmodmenu/ModMenuSheet;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissRestart()V

    return-void
.end method

.method static synthetic access$600(Lmodmenu/ModMenuSheet;)Lmodmenu/IdBrowser;
    .locals 0

    .line 54
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->browser:Lmodmenu/IdBrowser;

    return-object p0
.end method

.method static synthetic access$702(Lmodmenu/ModMenuSheet;)Lmodmenu/ModMenuSheet;
    .locals 0

    .line 54
    sput-object p0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    return-object p0
.end method

.method static synthetic access$800(Lmodmenu/ModMenuSheet;)Landroid/app/Dialog;
    .locals 0

    .line 54
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    return-object p0
.end method

.method static synthetic access$900(Lmodmenu/ModMenuSheet;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->openBrowser()V

    return-void
.end method

.method private build()V
    .locals 12

    .line 172
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->scrim:I

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 175
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 176
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v2, -0x1

    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setLayout(II)V

    .line 179
    new-instance v0, Lmodmenu/ModMenuSheet$3;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, p0, v3}, Lmodmenu/ModMenuSheet$3;-><init>(Lmodmenu/ModMenuSheet;Landroid/content/Context;)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    .line 190
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 192
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    .line 193
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 194
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 195
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

    .line 196
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

    .line 198
    new-instance v0, Landroid/view/View;

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v5}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 199
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

    .line 201
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    invoke-direct {p0, v7}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v1, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 202
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 203
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 205
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 206
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v3, "mod_menu_title"

    invoke-static {v1, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 207
    const/high16 v1, 0x41c00000    # 24.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 208
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 209
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v1, v1, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 210
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v1, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 212
    const/16 v5, 0xe

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 213
    const/4 v5, 0x6

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 214
    iget-object v6, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 216
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->webSwitch:Landroid/widget/Switch;

    .line 217
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    .line 218
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->autoRotateSwitch:Landroid/widget/Switch;

    .line 219
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->rewardSwitch:Landroid/widget/Switch;

    .line 220
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->trackSwitch:Landroid/widget/Switch;

    .line 221
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->webSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isWebBlocked()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 222
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isSpoofOn()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 223
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->autoRotateSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isHwidAutoRotate()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 224
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->rewardSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isRewardBypass()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 225
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->trackSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isAntiTrack()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 226
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v7, "mod_web_label"

    invoke-static {v6, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 227
    const-string v8, "mod_web_desc"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->webSwitch:Landroid/widget/Switch;

    .line 226
    invoke-direct {p0, v1, v6, v7, v8}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 228
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v7, "mod_hwid_label"

    invoke-static {v6, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 229
    const-string v8, "mod_hwid_desc"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    .line 228
    invoke-direct {p0, v1, v6, v7, v8}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 230
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v7, "mod_hwid_auto_label"

    invoke-static {v6, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 231
    const-string v8, "mod_hwid_auto_desc"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->autoRotateSwitch:Landroid/widget/Switch;

    .line 230
    invoke-direct {p0, v1, v6, v7, v8}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 232
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v7, "mod_reward_label"

    invoke-static {v6, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 233
    const-string v8, "mod_reward_desc"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->rewardSwitch:Landroid/widget/Switch;

    .line 232
    invoke-direct {p0, v1, v6, v7, v8}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 234
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v7, "mod_antitrack_label"

    invoke-static {v6, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 235
    const-string v8, "mod_antitrack_desc"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->trackSwitch:Landroid/widget/Switch;

    .line 234
    invoke-direct {p0, v1, v6, v7, v8}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 237
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    .line 238
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isUnsafe()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 239
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 242
    const/16 v1, 0xa

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 243
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v8, "mod_unsafe_label"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 244
    const-string v9, "mod_unsafe_desc"

    invoke-static {v8, v9}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    .line 243
    invoke-direct {p0, v6, v7, v8, v9}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v6

    invoke-virtual {v1, v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 246
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

    .line 248
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 249
    const/16 v1, 0x28

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v0, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 250
    invoke-direct {p0, v4}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 251
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->rotateBtn:Landroid/widget/Button;

    invoke-virtual {v4, v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 255
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

    .line 257
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 258
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    invoke-direct {v0, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 259
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 260
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    invoke-virtual {v4, v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 261
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    invoke-static {}, Lmodmenu/ModMenu;->isUnsafe()Z

    move-result v4

    const/16 v6, 0x8

    if-eqz v4, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    const/16 v4, 0x8

    :goto_0
    invoke-virtual {v0, v4}, Landroid/widget/Button;->setVisibility(I)V

    .line 264
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_give_label"

    invoke-static {v0, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->primary:I

    iget-object v9, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v9, v9, Lmodmenu/Palette;->primary:I

    and-int/2addr v9, v10

    or-int/2addr v9, v7

    invoke-direct {p0, v0, v8, v4, v9}, Lmodmenu/ModMenuSheet;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    .line 266
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 267
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    invoke-direct {v0, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 268
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 269
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v9, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    invoke-virtual {v4, v9, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 270
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    invoke-static {}, Lmodmenu/ModMenu;->isUnsafe()Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v6, 0x0

    :cond_1
    invoke-virtual {v0, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 272
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

    .line 276
    new-instance v4, Lmodmenu/ModMenuSheet$4;

    invoke-direct {v4, p0}, Lmodmenu/ModMenuSheet$4;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 282
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 283
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v4, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 284
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 285
    iget-object v6, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 287
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

    .line 289
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 290
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    invoke-direct {v4, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 291
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    iput v1, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 292
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 294
    new-instance v0, Landroid/widget/ScrollView;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->scroller:Landroid/widget/ScrollView;

    .line 295
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->scroller:Landroid/widget/ScrollView;

    invoke-virtual {v0, v8}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    .line 298
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->scroller:Landroid/widget/ScrollView;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v4}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 301
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->scroller:Landroid/widget/ScrollView;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x50

    invoke-direct {v4, v2, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 304
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 306
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 307
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->slideSheetUp()V

    .line 308
    return-void
.end method

.method private cancelUnsafe()V
    .locals 2

    .line 509
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissUnsafe()V

    .line 510
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 511
    return-void
.end method

.method private circle(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 893
    int-to-float v0, p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-direct {p0, p1, p1, v0, p2}, Lmodmenu/ModMenuSheet;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    return-object p1
.end method

.method private dismissGive()V
    .locals 2

    .line 727
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    if-nez v0, :cond_0

    .line 728
    return-void

    .line 730
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 731
    const/4 v0, 0x0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    .line 732
    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    .line 733
    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveCountEt:Landroid/widget/EditText;

    .line 734
    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveUidEt:Landroid/widget/EditText;

    .line 735
    iput-object v0, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    .line 736
    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveCancelBtn:Landroid/widget/Button;

    .line 737
    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveGoBtn:Landroid/widget/Button;

    .line 738
    return-void
.end method

.method private dismissRestart()V
    .locals 3

    .line 582
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->restartVeil:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 583
    const/4 v0, 0x0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->restartVeil:Landroid/view/View;

    .line 584
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v2, "mod_rotate_toast"

    invoke-static {v1, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 585
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 586
    return-void
.end method

.method private dismissUnsafe()V
    .locals 2

    .line 514
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 515
    const/4 v0, 0x0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    .line 516
    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 897
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

.method private field(Ljava/lang/String;Landroid/widget/EditText;)Landroid/widget/LinearLayout;
    .locals 4

    .line 787
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 788
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 789
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 790
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 791
    const/high16 p1, 0x41500000    # 13.0f

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 792
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget p1, p1, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 793
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 794
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 797
    const/4 v3, 0x4

    invoke-direct {p0, v3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iput v3, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 798
    invoke-virtual {v0, p2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 799
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 802
    const/16 p2, 0xc

    invoke-direct {p0, p2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result p2

    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 803
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 804
    return-object v0
.end method

.method private getWindow()Landroid/view/Window;
    .locals 1

    .line 311
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    return-object v0
.end method

.method private input()Landroid/widget/EditText;
    .locals 6

    .line 809
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 810
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 811
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 812
    const/high16 v2, 0x41700000    # 15.0f

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTextSize(F)V

    .line 813
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 814
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    const v3, 0xffffff

    and-int/2addr v2, v3

    const/high16 v4, -0x67000000

    or-int/2addr v2, v4

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 815
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 816
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->onSurface:I

    and-int/2addr v4, v3

    const/high16 v5, 0xa000000

    or-int/2addr v4, v5

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 817
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int/2addr v3, v4

    const/high16 v4, 0x33000000

    or-int/2addr v3, v4

    invoke-virtual {v2, v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 818
    const/16 v1, 0xc

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 819
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 820
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v2

    const/16 v3, 0xa

    invoke-direct {p0, v3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    invoke-direct {p0, v3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/EditText;->setPadding(IIII)V

    .line 821
    return-object v0
.end method

.method private makeButton(Ljava/lang/String;III)Landroid/widget/Button;
    .locals 2

    .line 378
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 379
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 380
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 381
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 382
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 383
    const/16 p3, 0x11

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setGravity(I)V

    .line 384
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 385
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 386
    const/16 p3, 0x18

    invoke-direct {p0, p3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    invoke-direct {p0, p3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result p3

    invoke-virtual {v0, v1, p1, p3, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 387
    const/16 p1, 0x14

    invoke-direct {p0, p1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result p3

    invoke-direct {p0, p3, p2}, Lmodmenu/ModMenuSheet;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    .line 388
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt p3, v1, :cond_0

    .line 391
    new-instance p3, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p4

    .line 392
    invoke-direct {p0, p1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result p1

    const/4 v1, -0x1

    invoke-direct {p0, p1, v1}, Lmodmenu/ModMenuSheet;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-direct {p3, p4, p2, p1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 391
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 394
    :cond_0
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 396
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 397
    return-object v0
.end method

.method private makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;
    .locals 13

    .line 355
    new-instance v0, Landroid/widget/Switch;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 356
    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 357
    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 358
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 359
    const/16 v1, 0x34

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setSwitchMinWidth(I)V

    .line 360
    new-instance v2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 361
    const v3, 0x10100a0

    filled-new-array {v3}, [I

    move-result-object v4

    new-instance v5, Lmodmenu/ModMenuSheet$Pill;

    .line 362
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

    .line 361
    invoke-virtual {v2, v4, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 363
    const v4, -0x10100a0

    filled-new-array {v4}, [I

    move-result-object v5

    new-instance v7, Lmodmenu/ModMenuSheet$Pill;

    .line 364
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

    .line 363
    invoke-virtual {v2, v5, v7}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 365
    new-instance v5, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 366
    filled-new-array {v3}, [I

    move-result-object v3

    new-instance v6, Lmodmenu/ModMenuSheet$Pill;

    .line 367
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

    .line 366
    invoke-virtual {v5, v3, v6}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 368
    filled-new-array {v4}, [I

    move-result-object v3

    new-instance v4, Lmodmenu/ModMenuSheet$Pill;

    .line 369
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

    .line 368
    invoke-virtual {v5, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 370
    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setThumbDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 371
    invoke-virtual {v0, v5}, Landroid/widget/Switch;->setTrackDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 373
    :cond_0
    return-object v0
.end method

.method private openBrowser()V
    .locals 5

    .line 846
    :try_start_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->browser:Lmodmenu/IdBrowser;

    if-nez v0, :cond_0

    .line 847
    new-instance v0, Lmodmenu/IdBrowser;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    new-instance v4, Lmodmenu/ModMenuSheet$10;

    invoke-direct {v4, p0}, Lmodmenu/ModMenuSheet$10;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lmodmenu/IdBrowser;-><init>(Landroid/app/Activity;Lmodmenu/Palette;Landroid/widget/FrameLayout;Ljava/lang/Runnable;)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->browser:Lmodmenu/IdBrowser;

    .line 856
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->browser:Lmodmenu/IdBrowser;

    invoke-virtual {v0}, Lmodmenu/IdBrowser;->open()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 860
    goto :goto_0

    .line 857
    :catch_0
    move-exception v0

    .line 858
    const-string v1, "ModMenu"

    const-string v2, "id browser failed, closing"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 859
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 861
    :goto_0
    return-void
.end method

.method private refreshPreview()V
    .locals 5

    .line 825
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 828
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 829
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 830
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 831
    return-void

    .line 833
    :cond_1
    nop

    .line 835
    :try_start_0
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v2, "item"

    invoke-static {v1, v2, v0}, Lmodmenu/IdNames;->get(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 838
    goto :goto_0

    .line 836
    :catch_0
    move-exception v1

    .line 837
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "item name lookup failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ModMenu"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    .line 839
    :goto_0
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    const-string v3, "#"

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2

    goto :goto_1

    .line 840
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "  "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    goto :goto_2

    :cond_3
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    :goto_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 839
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 841
    return-void

    .line 826
    :cond_4
    :goto_3
    return-void
.end method

.method private requestGameMode()V
    .locals 2

    .line 627
    invoke-static {}, Lmodmenu/ModMenu;->isUnsafe()Z

    move-result v0

    if-nez v0, :cond_0

    .line 628
    return-void

    .line 630
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 631
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    new-instance v1, Lmodmenu/ModMenuSheet$7;

    invoke-direct {v1, p0}, Lmodmenu/ModMenuSheet$7;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-static {v0, v1}, Lmodmenu/GameMode;->request(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 637
    return-void
.end method

.method private requestGive()V
    .locals 10

    .line 746
    const-string v1, "mod_give_bad"

    invoke-static {}, Lmodmenu/ModMenu;->isUnsafe()Z

    move-result v0

    if-nez v0, :cond_0

    .line 747
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissGive()V

    .line 748
    return-void

    .line 754
    :cond_0
    const/4 v2, 0x0

    :try_start_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 755
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveCountEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 756
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveUidEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 757
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const-wide/16 v6, 0x0

    if-nez v3, :cond_1

    move-wide v8, v6

    goto :goto_0

    :cond_1
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 762
    :goto_0
    nop

    .line 767
    if-lez v4, :cond_3

    if-lez v5, :cond_3

    const/16 v0, 0x270f

    if-gt v5, v0, :cond_3

    cmp-long v0, v8, v6

    if-ltz v0, :cond_3

    const-wide v6, 0x38d7ea4c67fffL

    cmp-long v0, v8, v6

    if-lez v0, :cond_2

    goto :goto_1

    .line 773
    :cond_2
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissGive()V

    .line 774
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 775
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    move-wide v6, v8

    new-instance v8, Lmodmenu/ModMenuSheet$9;

    invoke-direct {v8, p0}, Lmodmenu/ModMenuSheet$9;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-static/range {v3 .. v8}, Lmodmenu/GiveItem;->request(Landroid/content/Context;IIJLjava/lang/Runnable;)V

    .line 783
    return-void

    .line 769
    :cond_3
    :goto_1
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {v3, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 770
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 771
    return-void

    .line 758
    :catch_0
    move-exception v0

    .line 759
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {v3, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 760
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 761
    return-void
.end method

.method private round(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 878
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 879
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 880
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 881
    return-object v0
.end method

.method private round(IIFI)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 885
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 886
    invoke-virtual {v0, p4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 887
    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    .line 888
    invoke-virtual {v0, p3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 889
    return-object v0
.end method

.method private roundRect(I)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 871
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 872
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

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

.method private settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;
    .locals 6

    .line 316
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 317
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 318
    const/16 v2, 0x34

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 319
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

    .line 320
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_0

    .line 321
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    iget v3, p1, Lmodmenu/Palette;->onSurface:I

    const v4, 0xffffff

    and-int/2addr v3, v4

    const/high16 v4, 0x14000000

    or-int/2addr v3, v4

    .line 322
    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    .line 323
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->roundRect(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 321
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 326
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 327
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 328
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 329
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 330
    const/high16 p2, 0x41800000    # 16.0f

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 331
    iget p2, p1, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 332
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 333
    new-instance p2, Landroid/widget/TextView;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {p2, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 334
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 335
    const/high16 p3, 0x41600000    # 14.0f

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 336
    iget p1, p1, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 337
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p3, -0x2

    invoke-direct {p1, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 339
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v2

    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 340
    invoke-virtual {v1, p2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 341
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p1, p2, p3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 344
    invoke-virtual {v0, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 345
    new-instance p1, Lmodmenu/ModMenuSheet$5;

    invoke-direct {p1, p0, p4}, Lmodmenu/ModMenuSheet$5;-><init>(Lmodmenu/ModMenuSheet;Landroid/widget/Switch;)V

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 351
    return-object v0
.end method

.method static show(Landroid/app/Activity;Z)Lmodmenu/ModMenuSheet;
    .locals 2

    .line 98
    sget-object v0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    if-eqz v0, :cond_1

    sget-object v0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    iget-object v0, v0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    if-ne v0, p0, :cond_1

    sget-object v0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    iget-object v0, v0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    .line 99
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 100
    if-eqz p1, :cond_0

    .line 101
    sget-object p0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->openBrowser()V

    .line 103
    :cond_0
    sget-object p0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    return-object p0

    .line 106
    :cond_1
    :try_start_0
    new-instance v0, Lmodmenu/ModMenuSheet;

    invoke-direct {v0, p0}, Lmodmenu/ModMenuSheet;-><init>(Landroid/app/Activity;)V

    .line 109
    if-eqz p1, :cond_2

    .line 110
    invoke-direct {v0}, Lmodmenu/ModMenuSheet;->openBrowser()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    :cond_2
    return-object v0

    .line 113
    :catch_0
    move-exception p1

    .line 114
    const-string v0, "ModMenu"

    const-string v1, "menu UI failed"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 115
    instance-of p1, p0, Lmodmenu/ModMenuActivity;

    if-eqz p1, :cond_3

    .line 116
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 118
    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method private showGive()V
    .locals 9

    .line 641
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 642
    return-void

    .line 645
    :cond_0
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 646
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 647
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 648
    const/16 v2, 0x18

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->surface:I

    invoke-direct {p0, v3, v4}, Lmodmenu/ModMenuSheet;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 649
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

    .line 651
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 652
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_give_title"

    invoke-static {v3, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 653
    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 654
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 655
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 656
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 658
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->input()Landroid/widget/EditText;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    .line 659
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v3, "mod_give_item"

    invoke-static {v2, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    invoke-direct {p0, v2, v3}, Lmodmenu/ModMenuSheet;->field(Ljava/lang/String;Landroid/widget/EditText;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 662
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    .line 663
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 664
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 665
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 668
    const/4 v4, 0x4

    invoke-direct {p0, v4}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    iput v5, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 669
    iget-object v5, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    invoke-virtual {v0, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 670
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    new-instance v5, Lmodmenu/ModMenuSheet$8;

    invoke-direct {v5, p0}, Lmodmenu/ModMenuSheet$8;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-virtual {v2, v5}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 685
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->input()Landroid/widget/EditText;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->giveCountEt:Landroid/widget/EditText;

    .line 686
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->giveCountEt:Landroid/widget/EditText;

    const-string v5, "1"

    invoke-virtual {v2, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 687
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v5, "mod_give_count"

    invoke-static {v2, v5}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->giveCountEt:Landroid/widget/EditText;

    invoke-direct {p0, v2, v5}, Lmodmenu/ModMenuSheet;->field(Ljava/lang/String;Landroid/widget/EditText;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 689
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->input()Landroid/widget/EditText;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->giveUidEt:Landroid/widget/EditText;

    .line 690
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->giveUidEt:Landroid/widget/EditText;

    const-string v5, "0"

    invoke-virtual {v2, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 691
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v5, "mod_give_uid"

    invoke-static {v2, v5}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->giveUidEt:Landroid/widget/EditText;

    invoke-direct {p0, v2, v5}, Lmodmenu/ModMenuSheet;->field(Ljava/lang/String;Landroid/widget/EditText;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 693
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v5, "mod_close"

    invoke-static {v2, v5}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v5, v5, Lmodmenu/Palette;->onSurfaceVariant:I

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v6, v6, Lmodmenu/Palette;->onSurface:I

    const v7, 0xffffff

    and-int/2addr v6, v7

    const/high16 v8, 0x14000000

    or-int/2addr v6, v8

    const/4 v8, 0x0

    invoke-direct {p0, v2, v8, v5, v6}, Lmodmenu/ModMenuSheet;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->giveCancelBtn:Landroid/widget/Button;

    .line 695
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v5, "mod_give_go"

    invoke-static {v2, v5}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v5, v5, Lmodmenu/Palette;->primary:I

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v6, v6, Lmodmenu/Palette;->onPrimary:I

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v8, v8, Lmodmenu/Palette;->onPrimary:I

    and-int/2addr v7, v8

    const/high16 v8, 0x1f000000

    or-int/2addr v7, v8

    invoke-direct {p0, v2, v5, v6, v7}, Lmodmenu/ModMenuSheet;->makeButton(Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->giveGoBtn:Landroid/widget/Button;

    .line 697
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 698
    const/4 v5, 0x5

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 699
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 700
    const/16 v6, 0x28

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v7

    invoke-direct {v5, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 701
    invoke-direct {p0, v4}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    iput v4, v5, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 702
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->giveCancelBtn:Landroid/widget/Button;

    invoke-virtual {v2, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 703
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->giveGoBtn:Landroid/widget/Button;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 704
    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v5, v3, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 703
    invoke-virtual {v2, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 705
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v4, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 708
    const/16 v3, 0x10

    invoke-direct {p0, v3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iput v3, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 709
    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 711
    new-instance v2, Landroid/widget/FrameLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 712
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->scrim:I

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 713
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 714
    invoke-virtual {v2, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 715
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x11

    invoke-direct {v1, v5, v5, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 719
    const/16 v3, 0x1c

    invoke-direct {p0, v3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 720
    invoke-virtual {v2, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 721
    iput-object v2, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    .line 722
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 723
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->refreshPreview()V

    .line 724
    return-void
.end method

.method private showRestartConfirm()V
    .locals 8

    .line 520
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->restartVeil:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 521
    return-void

    .line 524
    :cond_0
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 525
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 526
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 527
    const/16 v2, 0x18

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->surface:I

    invoke-direct {p0, v3, v4}, Lmodmenu/ModMenuSheet;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 528
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

    .line 530
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 531
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_restart_title"

    invoke-static {v3, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 532
    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 533
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 534
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 535
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 537
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 538
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_restart_body"

    invoke-static {v3, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 539
    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 540
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 541
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 544
    const/16 v5, 0xa

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 545
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 548
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v3, "mod_restart_later"

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

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->restartCancelBtn:Landroid/widget/Button;

    .line 550
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v3, "mod_restart_now"

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

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->restartGoBtn:Landroid/widget/Button;

    .line 552
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 553
    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 554
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 555
    const/16 v5, 0x28

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v3, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 556
    const/4 v6, 0x4

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 557
    iget-object v6, p0, Lmodmenu/ModMenuSheet;->restartCancelBtn:Landroid/widget/Button;

    invoke-virtual {v2, v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 558
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->restartGoBtn:Landroid/widget/Button;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 559
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    invoke-direct {v6, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 558
    invoke-virtual {v2, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 560
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 563
    const/16 v6, 0x10

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 564
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 566
    new-instance v2, Landroid/widget/FrameLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 567
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v6, v6, Lmodmenu/Palette;->scrim:I

    invoke-direct {v3, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 568
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 569
    invoke-virtual {v2, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 570
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x11

    invoke-direct {v1, v5, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 574
    const/16 v3, 0x1c

    invoke-direct {p0, v3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 575
    invoke-virtual {v2, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 576
    iput-object v2, p0, Lmodmenu/ModMenuSheet;->restartVeil:Landroid/view/View;

    .line 577
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 578
    return-void
.end method

.method private showUnsafeConfirm()V
    .locals 8

    .line 447
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 448
    return-void

    .line 451
    :cond_0
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 452
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 453
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 454
    const/16 v2, 0x18

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->surface:I

    invoke-direct {p0, v3, v4}, Lmodmenu/ModMenuSheet;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 455
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

    .line 457
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 458
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_unsafe_dialog_title"

    invoke-static {v3, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 459
    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 460
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 461
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 462
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 464
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 465
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_unsafe_dialog_body"

    invoke-static {v3, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 466
    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 467
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 468
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 471
    const/16 v5, 0xa

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 472
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 475
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

    .line 477
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

    .line 479
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 480
    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 481
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 482
    const/16 v5, 0x28

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v3, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 483
    const/4 v6, 0x4

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 484
    iget-object v6, p0, Lmodmenu/ModMenuSheet;->unsafeCancelBtn:Landroid/widget/Button;

    invoke-virtual {v2, v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 485
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->unsafeConfirmBtn:Landroid/widget/Button;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 486
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    invoke-direct {v6, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 485
    invoke-virtual {v2, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 487
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 490
    const/16 v6, 0x10

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 491
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 493
    new-instance v2, Landroid/widget/FrameLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 494
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v6, v6, Lmodmenu/Palette;->scrim:I

    invoke-direct {v3, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 495
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 496
    invoke-virtual {v2, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 497
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x11

    invoke-direct {v1, v5, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 501
    const/16 v3, 0x1c

    invoke-direct {p0, v3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 502
    invoke-virtual {v2, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 503
    iput-object v2, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    .line 504
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 505
    return-void
.end method

.method private slideSheetUp()V
    .locals 2

    .line 401
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->scroller:Landroid/widget/ScrollView;

    new-instance v1, Lmodmenu/ModMenuSheet$6;

    invoke-direct {v1, p0}, Lmodmenu/ModMenuSheet$6;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 418
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 422
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->webSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_0

    .line 423
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setWebBlocked(Landroid/content/Context;Z)V

    goto :goto_0

    .line 424
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_1

    .line 425
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setHwidSpoof(Landroid/content/Context;Z)V

    goto :goto_0

    .line 426
    :cond_1
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->autoRotateSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_2

    .line 427
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setHwidAutoRotate(Landroid/content/Context;Z)V

    goto :goto_0

    .line 428
    :cond_2
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->rewardSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_3

    .line 429
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setRewardBypass(Landroid/content/Context;Z)V

    goto :goto_0

    .line 430
    :cond_3
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->trackSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_4

    .line 431
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setAntiTrack(Landroid/content/Context;Z)V

    goto :goto_0

    .line 432
    :cond_4
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_6

    .line 433
    if-eqz p2, :cond_5

    .line 436
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->showUnsafeConfirm()V

    goto :goto_0

    .line 438
    :cond_5
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setUnsafe(Landroid/content/Context;Z)V

    .line 439
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setVisibility(I)V

    .line 440
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setVisibility(I)V

    .line 443
    :cond_6
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 590
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    if-eq p1, v0, :cond_c

    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeCancelBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_0

    goto/16 :goto_3

    .line 592
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeConfirmBtn:Landroid/widget/Button;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_1

    .line 593
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, v1}, Lmodmenu/ModMenu;->setUnsafe(Landroid/content/Context;Z)V

    .line 594
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissUnsafe()V

    .line 595
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 596
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    goto/16 :goto_4

    .line 597
    :cond_1
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    if-eq p1, v0, :cond_b

    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveCancelBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_2

    goto :goto_2

    .line 599
    :cond_2
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveGoBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_3

    .line 600
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->requestGive()V

    goto :goto_4

    .line 601
    :cond_3
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->rotateBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_5

    .line 602
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {v0}, Lmodmenu/ModMenu;->rotateHwid(Landroid/content/Context;)V

    .line 603
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 604
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v0, v2, :cond_4

    .line 605
    const/4 v1, 0x6

    goto :goto_0

    .line 606
    :cond_4
    nop

    .line 604
    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 607
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->showRestartConfirm()V

    goto :goto_4

    .line 608
    :cond_5
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->restartVeil:Landroid/view/View;

    if-eq p1, v0, :cond_a

    iget-object v0, p0, Lmodmenu/ModMenuSheet;->restartCancelBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_6

    goto :goto_1

    .line 610
    :cond_6
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->restartGoBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_7

    .line 611
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1}, Lmodmenu/ModMenu;->restartGame(Landroid/content/Context;)V

    goto :goto_4

    .line 612
    :cond_7
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_8

    .line 613
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->requestGameMode()V

    goto :goto_4

    .line 614
    :cond_8
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_9

    .line 615
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->showGive()V

    goto :goto_4

    .line 617
    :cond_9
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->cancel()V

    goto :goto_4

    .line 609
    :cond_a
    :goto_1
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissRestart()V

    goto :goto_4

    .line 598
    :cond_b
    :goto_2
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissGive()V

    goto :goto_4

    .line 591
    :cond_c
    :goto_3
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->cancelUnsafe()V

    .line 619
    :goto_4
    return-void
.end method
