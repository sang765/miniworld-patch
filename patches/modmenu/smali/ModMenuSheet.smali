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

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    iput-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 119
    invoke-static {p1}, Lmodmenu/Palette;->of(Landroid/content/Context;)Lmodmenu/Palette;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    .line 121
    invoke-static {p1}, Lmodmenu/ModMenu;->loadPrefs(Landroid/content/Context;)V

    .line 122
    new-instance v0, Lmodmenu/ModMenuSheet$1;

    const v1, 0x1030010

    invoke-direct {v0, p0, p1, v1}, Lmodmenu/ModMenuSheet$1;-><init>(Lmodmenu/ModMenuSheet;Landroid/content/Context;I)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    .line 144
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    new-instance v1, Lmodmenu/ModMenuSheet$2;

    invoke-direct {v1, p0, p1}, Lmodmenu/ModMenuSheet$2;-><init>(Lmodmenu/ModMenuSheet;Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 158
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->build()V

    .line 159
    sput-object p0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    .line 160
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

.method static synthetic access$1000(Lmodmenu/ModMenuSheet;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->refreshPreview()V

    return-void
.end method

.method static synthetic access$1100(Lmodmenu/ModMenuSheet;)Landroid/widget/Button;
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

.method static synthetic access$400(Lmodmenu/ModMenuSheet;)Lmodmenu/IdBrowser;
    .locals 0

    .line 54
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->browser:Lmodmenu/IdBrowser;

    return-object p0
.end method

.method static synthetic access$502(Lmodmenu/ModMenuSheet;)Lmodmenu/ModMenuSheet;
    .locals 0

    .line 54
    sput-object p0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    return-object p0
.end method

.method static synthetic access$600(Lmodmenu/ModMenuSheet;)Landroid/app/Dialog;
    .locals 0

    .line 54
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    return-object p0
.end method

.method static synthetic access$700(Lmodmenu/ModMenuSheet;)V
    .locals 0

    .line 54
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->openBrowser()V

    return-void
.end method

.method static synthetic access$800(Lmodmenu/ModMenuSheet;)Landroid/widget/ScrollView;
    .locals 0

    .line 54
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->scroller:Landroid/widget/ScrollView;

    return-object p0
.end method

.method static synthetic access$900(Lmodmenu/ModMenuSheet;)Landroid/widget/Button;
    .locals 0

    .line 54
    iget-object p0, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    return-object p0
.end method

.method private build()V
    .locals 12

    .line 163
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->scrim:I

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 166
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 167
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v2, -0x1

    invoke-virtual {v0, v2, v2}, Landroid/view/Window;->setLayout(II)V

    .line 170
    new-instance v0, Lmodmenu/ModMenuSheet$3;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, p0, v3}, Lmodmenu/ModMenuSheet$3;-><init>(Lmodmenu/ModMenuSheet;Landroid/content/Context;)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    .line 181
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    .line 184
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 185
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 186
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

    .line 187
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

    .line 189
    new-instance v0, Landroid/view/View;

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v5}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 190
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

    .line 192
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    invoke-direct {p0, v7}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v1, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 193
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 194
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 196
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 197
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v3, "mod_menu_title"

    invoke-static {v1, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 198
    const/high16 v1, 0x41c00000    # 24.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 199
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 200
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v1, v1, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 201
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v1, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 203
    const/16 v5, 0xe

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    iput v5, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 204
    const/4 v5, 0x6

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 205
    iget-object v6, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 207
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->webSwitch:Landroid/widget/Switch;

    .line 208
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    .line 209
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->rewardSwitch:Landroid/widget/Switch;

    .line 210
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->trackSwitch:Landroid/widget/Switch;

    .line 211
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->webSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isWebBlocked()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 212
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isSpoofOn()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 213
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->rewardSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isRewardBypass()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 214
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->trackSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isAntiTrack()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 215
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v7, "mod_web_label"

    invoke-static {v6, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 216
    const-string v8, "mod_web_desc"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->webSwitch:Landroid/widget/Switch;

    .line 215
    invoke-direct {p0, v1, v6, v7, v8}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 217
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v7, "mod_hwid_label"

    invoke-static {v6, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 218
    const-string v8, "mod_hwid_desc"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    .line 217
    invoke-direct {p0, v1, v6, v7, v8}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 219
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v7, "mod_reward_label"

    invoke-static {v6, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 220
    const-string v8, "mod_reward_desc"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->rewardSwitch:Landroid/widget/Switch;

    .line 219
    invoke-direct {p0, v1, v6, v7, v8}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 221
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v7, "mod_antitrack_label"

    invoke-static {v6, v7}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 222
    const-string v8, "mod_antitrack_desc"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->trackSwitch:Landroid/widget/Switch;

    .line 221
    invoke-direct {p0, v1, v6, v7, v8}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 224
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    invoke-direct {p0, v0}, Lmodmenu/ModMenuSheet;->makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    .line 225
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isUnsafe()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 226
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 229
    const/16 v1, 0xa

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 230
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v7, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v8, "mod_unsafe_label"

    invoke-static {v7, v8}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    .line 231
    const-string v9, "mod_unsafe_desc"

    invoke-static {v8, v9}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    .line 230
    invoke-direct {p0, v6, v7, v8, v9}, Lmodmenu/ModMenuSheet;->settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;

    move-result-object v6

    invoke-virtual {v1, v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 233
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

    .line 235
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 236
    const/16 v1, 0x28

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v0, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 237
    invoke-direct {p0, v4}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 238
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->rotateBtn:Landroid/widget/Button;

    invoke-virtual {v4, v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 242
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

    .line 244
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 245
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    invoke-direct {v0, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 246
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 247
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    invoke-virtual {v4, v6, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 248
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

    .line 251
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

    .line 253
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 254
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    invoke-direct {v0, v2, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 255
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    iput v4, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 256
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    iget-object v9, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    invoke-virtual {v4, v9, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 257
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    invoke-static {}, Lmodmenu/ModMenu;->isUnsafe()Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v6, 0x0

    :cond_1
    invoke-virtual {v0, v6}, Landroid/widget/Button;->setVisibility(I)V

    .line 259
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

    .line 263
    new-instance v4, Lmodmenu/ModMenuSheet$4;

    invoke-direct {v4, p0}, Lmodmenu/ModMenuSheet$4;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 269
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 270
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v4, v2, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 271
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 272
    iget-object v6, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 274
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

    .line 276
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 277
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    invoke-direct {v4, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 278
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    iput v1, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 279
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 281
    new-instance v0, Landroid/widget/ScrollView;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->scroller:Landroid/widget/ScrollView;

    .line 282
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->scroller:Landroid/widget/ScrollView;

    invoke-virtual {v0, v8}, Landroid/widget/ScrollView;->setVerticalScrollBarEnabled(Z)V

    .line 285
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->scroller:Landroid/widget/ScrollView;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->sheet:Landroid/widget/LinearLayout;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v4, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v4}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 288
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->scroller:Landroid/widget/ScrollView;

    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x50

    invoke-direct {v4, v2, v3, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {v0, v1, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 291
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v3}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 293
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 294
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->slideSheetUp()V

    .line 295
    return-void
.end method

.method private cancelUnsafe()V
    .locals 2

    .line 494
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissUnsafe()V

    .line 495
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 496
    return-void
.end method

.method private circle(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 805
    int-to-float v0, p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-direct {p0, p1, p1, v0, p2}, Lmodmenu/ModMenuSheet;->round(IIFI)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    return-object p1
.end method

.method private dismissGive()V
    .locals 2

    .line 639
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    if-nez v0, :cond_0

    .line 640
    return-void

    .line 642
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 643
    const/4 v0, 0x0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    .line 644
    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    .line 645
    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveCountEt:Landroid/widget/EditText;

    .line 646
    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveUidEt:Landroid/widget/EditText;

    .line 647
    iput-object v0, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    .line 648
    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveCancelBtn:Landroid/widget/Button;

    .line 649
    iput-object v0, p0, Lmodmenu/ModMenuSheet;->giveGoBtn:Landroid/widget/Button;

    .line 650
    return-void
.end method

.method private dismissUnsafe()V
    .locals 2

    .line 499
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 500
    const/4 v0, 0x0

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    .line 501
    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 809
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

    .line 699
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 700
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 701
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 702
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 703
    const/high16 p1, 0x41500000    # 13.0f

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 704
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget p1, p1, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 705
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 706
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 709
    const/4 v3, 0x4

    invoke-direct {p0, v3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iput v3, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 710
    invoke-virtual {v0, p2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 711
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 714
    const/16 p2, 0xc

    invoke-direct {p0, p2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result p2

    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 715
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 716
    return-object v0
.end method

.method private getWindow()Landroid/view/Window;
    .locals 1

    .line 298
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    return-object v0
.end method

.method private input()Landroid/widget/EditText;
    .locals 6

    .line 721
    new-instance v0, Landroid/widget/EditText;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 722
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 723
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 724
    const/high16 v2, 0x41700000    # 15.0f

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTextSize(F)V

    .line 725
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setTextColor(I)V

    .line 726
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v2, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    const v3, 0xffffff

    and-int/2addr v2, v3

    const/high16 v4, -0x67000000

    or-int/2addr v2, v4

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setHintTextColor(I)V

    .line 727
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 728
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->onSurface:I

    and-int/2addr v4, v3

    const/high16 v5, 0xa000000

    or-int/2addr v4, v5

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 729
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->onSurfaceVariant:I

    and-int/2addr v3, v4

    const/high16 v4, 0x33000000

    or-int/2addr v3, v4

    invoke-virtual {v2, v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 730
    const/16 v1, 0xc

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 731
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 732
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

    .line 733
    return-object v0
.end method

.method private makeButton(Ljava/lang/String;III)Landroid/widget/Button;
    .locals 2

    .line 365
    new-instance v0, Landroid/widget/Button;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 366
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 367
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 368
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 369
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 370
    const/16 p3, 0x11

    invoke-virtual {v0, p3}, Landroid/widget/Button;->setGravity(I)V

    .line 371
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 372
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 373
    const/16 p3, 0x18

    invoke-direct {p0, p3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    invoke-direct {p0, p3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result p3

    invoke-virtual {v0, v1, p1, p3, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 374
    const/16 p1, 0x14

    invoke-direct {p0, p1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result p3

    invoke-direct {p0, p3, p2}, Lmodmenu/ModMenuSheet;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p2

    .line 375
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt p3, v1, :cond_0

    .line 378
    new-instance p3, Landroid/graphics/drawable/RippleDrawable;

    invoke-static {p4}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p4

    .line 379
    invoke-direct {p0, p1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result p1

    const/4 v1, -0x1

    invoke-direct {p0, p1, v1}, Lmodmenu/ModMenuSheet;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object p1

    invoke-direct {p3, p4, p2, p1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 378
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 381
    :cond_0
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 383
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 384
    return-object v0
.end method

.method private makeSwitch(Lmodmenu/Palette;)Landroid/widget/Switch;
    .locals 13

    .line 342
    new-instance v0, Landroid/widget/Switch;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    .line 343
    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 344
    invoke-virtual {v0, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 345
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 346
    const/16 v1, 0x34

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setSwitchMinWidth(I)V

    .line 347
    new-instance v2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 348
    const v3, 0x10100a0

    filled-new-array {v3}, [I

    move-result-object v4

    new-instance v5, Lmodmenu/ModMenuSheet$Pill;

    .line 349
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

    .line 348
    invoke-virtual {v2, v4, v5}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 350
    const v4, -0x10100a0

    filled-new-array {v4}, [I

    move-result-object v5

    new-instance v7, Lmodmenu/ModMenuSheet$Pill;

    .line 351
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

    .line 350
    invoke-virtual {v2, v5, v7}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 352
    new-instance v5, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 353
    filled-new-array {v3}, [I

    move-result-object v3

    new-instance v6, Lmodmenu/ModMenuSheet$Pill;

    .line 354
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

    .line 353
    invoke-virtual {v5, v3, v6}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 355
    filled-new-array {v4}, [I

    move-result-object v3

    new-instance v4, Lmodmenu/ModMenuSheet$Pill;

    .line 356
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

    .line 355
    invoke-virtual {v5, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 357
    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setThumbDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 358
    invoke-virtual {v0, v5}, Landroid/widget/Switch;->setTrackDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 360
    :cond_0
    return-object v0
.end method

.method private openBrowser()V
    .locals 5

    .line 758
    :try_start_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->browser:Lmodmenu/IdBrowser;

    if-nez v0, :cond_0

    .line 759
    new-instance v0, Lmodmenu/IdBrowser;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    new-instance v4, Lmodmenu/ModMenuSheet$10;

    invoke-direct {v4, p0}, Lmodmenu/ModMenuSheet$10;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-direct {v0, v1, v2, v3, v4}, Lmodmenu/IdBrowser;-><init>(Landroid/app/Activity;Lmodmenu/Palette;Landroid/widget/FrameLayout;Ljava/lang/Runnable;)V

    iput-object v0, p0, Lmodmenu/ModMenuSheet;->browser:Lmodmenu/IdBrowser;

    .line 768
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->browser:Lmodmenu/IdBrowser;

    invoke-virtual {v0}, Lmodmenu/IdBrowser;->open()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 772
    goto :goto_0

    .line 769
    :catch_0
    move-exception v0

    .line 770
    const-string v1, "ModMenu"

    const-string v2, "id browser failed, closing"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 771
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 773
    :goto_0
    return-void
.end method

.method private refreshPreview()V
    .locals 5

    .line 737
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    if-nez v0, :cond_0

    goto/16 :goto_3

    .line 740
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 741
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 742
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 743
    return-void

    .line 745
    :cond_1
    nop

    .line 747
    :try_start_0
    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v2, "item"

    invoke-static {v1, v2, v0}, Lmodmenu/IdNames;->get(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 750
    goto :goto_0

    .line 748
    :catch_0
    move-exception v1

    .line 749
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

    .line 751
    :goto_0
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    const-string v3, "#"

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2

    goto :goto_1

    .line 752
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

    .line 751
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 753
    return-void

    .line 738
    :cond_4
    :goto_3
    return-void
.end method

.method private requestGameMode()V
    .locals 2

    .line 539
    invoke-static {}, Lmodmenu/ModMenu;->isUnsafe()Z

    move-result v0

    if-nez v0, :cond_0

    .line 540
    return-void

    .line 542
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 543
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    new-instance v1, Lmodmenu/ModMenuSheet$7;

    invoke-direct {v1, p0}, Lmodmenu/ModMenuSheet$7;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-static {v0, v1}, Lmodmenu/GameMode;->request(Landroid/content/Context;Ljava/lang/Runnable;)V

    .line 549
    return-void
.end method

.method private requestGive()V
    .locals 10

    .line 658
    const-string v1, "mod_give_bad"

    invoke-static {}, Lmodmenu/ModMenu;->isUnsafe()Z

    move-result v0

    if-nez v0, :cond_0

    .line 659
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissGive()V

    .line 660
    return-void

    .line 666
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

    .line 667
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveCountEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 668
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveUidEt:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 669
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

    .line 674
    :goto_0
    nop

    .line 679
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

    .line 685
    :cond_2
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissGive()V

    .line 686
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 687
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    move-wide v6, v8

    new-instance v8, Lmodmenu/ModMenuSheet$9;

    invoke-direct {v8, p0}, Lmodmenu/ModMenuSheet$9;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-static/range {v3 .. v8}, Lmodmenu/GiveItem;->request(Landroid/content/Context;IIJLjava/lang/Runnable;)V

    .line 695
    return-void

    .line 681
    :cond_3
    :goto_1
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {v3, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 682
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 683
    return-void

    .line 670
    :catch_0
    move-exception v0

    .line 671
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {v3, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 672
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 673
    return-void
.end method

.method private round(II)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 790
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 791
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 792
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 793
    return-object v0
.end method

.method private round(IIFI)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 797
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 798
    invoke-virtual {v0, p4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 799
    invoke-virtual {v0, p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setSize(II)V

    .line 800
    invoke-virtual {v0, p3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 801
    return-object v0
.end method

.method private roundRect(I)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 783
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 784
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 785
    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 786
    return-object v0
.end method

.method private roundTop(IF)Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 776
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 777
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 778
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

    .line 779
    return-object v0
.end method

.method private settingRow(Lmodmenu/Palette;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Switch;)Landroid/widget/LinearLayout;
    .locals 6

    .line 303
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 304
    const/16 v1, 0x10

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 305
    const/16 v2, 0x34

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 306
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

    .line 307
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_0

    .line 308
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    iget v3, p1, Lmodmenu/Palette;->onSurface:I

    const v4, 0xffffff

    and-int/2addr v3, v4

    const/high16 v4, 0x14000000

    or-int/2addr v3, v4

    .line 309
    invoke-static {v3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    .line 310
    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v1

    invoke-direct {p0, v1}, Lmodmenu/ModMenuSheet;->roundRect(I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 308
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 313
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v1, v2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 314
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 315
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 316
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 317
    const/high16 p2, 0x41800000    # 16.0f

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 318
    iget p2, p1, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 319
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 320
    new-instance p2, Landroid/widget/TextView;

    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {p2, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 321
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 322
    const/high16 p3, 0x41600000    # 14.0f

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 323
    iget p1, p1, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 324
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p3, -0x2

    invoke-direct {p1, p3, p3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 326
    const/4 v2, 0x2

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v2

    iput v2, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 327
    invoke-virtual {v1, p2, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 328
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {p1, p2, p3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v1, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 331
    invoke-virtual {v0, p4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 332
    new-instance p1, Lmodmenu/ModMenuSheet$5;

    invoke-direct {p1, p0, p4}, Lmodmenu/ModMenuSheet$5;-><init>(Lmodmenu/ModMenuSheet;Landroid/widget/Switch;)V

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 338
    return-object v0
.end method

.method static show(Landroid/app/Activity;Z)Lmodmenu/ModMenuSheet;
    .locals 2

    .line 93
    sget-object v0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    if-eqz v0, :cond_1

    sget-object v0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    iget-object v0, v0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    if-ne v0, p0, :cond_1

    sget-object v0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    iget-object v0, v0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    .line 94
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 95
    if-eqz p1, :cond_0

    .line 96
    sget-object p0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->openBrowser()V

    .line 98
    :cond_0
    sget-object p0, Lmodmenu/ModMenuSheet;->current:Lmodmenu/ModMenuSheet;

    return-object p0

    .line 101
    :cond_1
    :try_start_0
    new-instance v0, Lmodmenu/ModMenuSheet;

    invoke-direct {v0, p0}, Lmodmenu/ModMenuSheet;-><init>(Landroid/app/Activity;)V

    .line 104
    if-eqz p1, :cond_2

    .line 105
    invoke-direct {v0}, Lmodmenu/ModMenuSheet;->openBrowser()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    :cond_2
    return-object v0

    .line 108
    :catch_0
    move-exception p1

    .line 109
    const-string v0, "ModMenu"

    const-string v1, "menu UI failed"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 110
    instance-of p1, p0, Lmodmenu/ModMenuActivity;

    if-eqz p1, :cond_3

    .line 111
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 113
    :cond_3
    const/4 p0, 0x0

    return-object p0
.end method

.method private showGive()V
    .locals 9

    .line 553
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 554
    return-void

    .line 557
    :cond_0
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 558
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 559
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 560
    const/16 v2, 0x18

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->surface:I

    invoke-direct {p0, v3, v4}, Lmodmenu/ModMenuSheet;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 561
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

    .line 563
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 564
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_give_title"

    invoke-static {v3, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 565
    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 566
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 567
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 568
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 570
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->input()Landroid/widget/EditText;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    .line 571
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v3, "mod_give_item"

    invoke-static {v2, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    invoke-direct {p0, v2, v3}, Lmodmenu/ModMenuSheet;->field(Ljava/lang/String;Landroid/widget/EditText;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 574
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    .line 575
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    const/high16 v3, 0x41500000    # 13.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 576
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 577
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v3, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 580
    const/4 v4, 0x4

    invoke-direct {p0, v4}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    iput v5, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 581
    iget-object v5, p0, Lmodmenu/ModMenuSheet;->givePreview:Landroid/widget/TextView;

    invoke-virtual {v0, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 582
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->giveItemEt:Landroid/widget/EditText;

    new-instance v5, Lmodmenu/ModMenuSheet$8;

    invoke-direct {v5, p0}, Lmodmenu/ModMenuSheet$8;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-virtual {v2, v5}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 597
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->input()Landroid/widget/EditText;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->giveCountEt:Landroid/widget/EditText;

    .line 598
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->giveCountEt:Landroid/widget/EditText;

    const-string v5, "1"

    invoke-virtual {v2, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 599
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v5, "mod_give_count"

    invoke-static {v2, v5}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->giveCountEt:Landroid/widget/EditText;

    invoke-direct {p0, v2, v5}, Lmodmenu/ModMenuSheet;->field(Ljava/lang/String;Landroid/widget/EditText;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 601
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->input()Landroid/widget/EditText;

    move-result-object v2

    iput-object v2, p0, Lmodmenu/ModMenuSheet;->giveUidEt:Landroid/widget/EditText;

    .line 602
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->giveUidEt:Landroid/widget/EditText;

    const-string v5, "0"

    invoke-virtual {v2, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 603
    iget-object v2, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v5, "mod_give_uid"

    invoke-static {v2, v5}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->giveUidEt:Landroid/widget/EditText;

    invoke-direct {p0, v2, v5}, Lmodmenu/ModMenuSheet;->field(Ljava/lang/String;Landroid/widget/EditText;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 605
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

    .line 607
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

    .line 609
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v5, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 610
    const/4 v5, 0x5

    invoke-virtual {v2, v5}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 611
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 612
    const/16 v6, 0x28

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v7

    invoke-direct {v5, v3, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 613
    invoke-direct {p0, v4}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v4

    iput v4, v5, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 614
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->giveCancelBtn:Landroid/widget/Button;

    invoke-virtual {v2, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 615
    iget-object v4, p0, Lmodmenu/ModMenuSheet;->giveGoBtn:Landroid/widget/Button;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 616
    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v5, v3, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 615
    invoke-virtual {v2, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 617
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v4, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 620
    const/16 v3, 0x10

    invoke-direct {p0, v3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iput v3, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 621
    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 623
    new-instance v2, Landroid/widget/FrameLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 624
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->scrim:I

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 625
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 626
    invoke-virtual {v2, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 627
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x11

    invoke-direct {v1, v5, v5, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 631
    const/16 v3, 0x1c

    invoke-direct {p0, v3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 632
    invoke-virtual {v2, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 633
    iput-object v2, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    .line 634
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 635
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->refreshPreview()V

    .line 636
    return-void
.end method

.method private showUnsafeConfirm()V
    .locals 8

    .line 432
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 433
    return-void

    .line 436
    :cond_0
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 437
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 438
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setClickable(Z)V

    .line 439
    const/16 v2, 0x18

    invoke-direct {p0, v2}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iget-object v4, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v4, v4, Lmodmenu/Palette;->surface:I

    invoke-direct {p0, v3, v4}, Lmodmenu/ModMenuSheet;->round(II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 440
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

    .line 442
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 443
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_unsafe_dialog_title"

    invoke-static {v3, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 444
    const/high16 v3, 0x41900000    # 18.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 445
    sget-object v3, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 446
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 447
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 449
    new-instance v2, Landroid/widget/TextView;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 450
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v4, "mod_unsafe_dialog_body"

    invoke-static {v3, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 451
    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 452
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v3, v3, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 453
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v3, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 456
    const/16 v5, 0xa

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    iput v5, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 457
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 460
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

    .line 462
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

    .line 464
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 465
    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 466
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 467
    const/16 v5, 0x28

    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    invoke-direct {v3, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 468
    const/4 v6, 0x4

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 469
    iget-object v6, p0, Lmodmenu/ModMenuSheet;->unsafeCancelBtn:Landroid/widget/Button;

    invoke-virtual {v2, v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 470
    iget-object v3, p0, Lmodmenu/ModMenuSheet;->unsafeConfirmBtn:Landroid/widget/Button;

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    .line 471
    invoke-direct {p0, v5}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v5

    invoke-direct {v6, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 470
    invoke-virtual {v2, v3, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 472
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 475
    const/16 v6, 0x10

    invoke-direct {p0, v6}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v6

    iput v6, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 476
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 478
    new-instance v2, Landroid/widget/FrameLayout;

    iget-object v3, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 479
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    iget-object v6, p0, Lmodmenu/ModMenuSheet;->p:Lmodmenu/Palette;

    iget v6, v6, Lmodmenu/Palette;->scrim:I

    invoke-direct {v3, v6}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 480
    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setClickable(Z)V

    .line 481
    invoke-virtual {v2, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 482
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v3, 0x11

    invoke-direct {v1, v5, v4, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 486
    const/16 v3, 0x1c

    invoke-direct {p0, v3}, Lmodmenu/ModMenuSheet;->dp(I)I

    move-result v3

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 487
    invoke-virtual {v2, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 488
    iput-object v2, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    .line 489
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->root:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 490
    return-void
.end method

.method private slideSheetUp()V
    .locals 2

    .line 388
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->scroller:Landroid/widget/ScrollView;

    new-instance v1, Lmodmenu/ModMenuSheet$6;

    invoke-direct {v1, p0}, Lmodmenu/ModMenuSheet$6;-><init>(Lmodmenu/ModMenuSheet;)V

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->post(Ljava/lang/Runnable;)Z

    .line 405
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 409
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->webSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_0

    .line 410
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setWebBlocked(Landroid/content/Context;Z)V

    goto :goto_0

    .line 411
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_1

    .line 412
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setHwidSpoof(Landroid/content/Context;Z)V

    goto :goto_0

    .line 413
    :cond_1
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->rewardSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_2

    .line 414
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setRewardBypass(Landroid/content/Context;Z)V

    goto :goto_0

    .line 415
    :cond_2
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->trackSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_3

    .line 416
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setAntiTrack(Landroid/content/Context;Z)V

    goto :goto_0

    .line 417
    :cond_3
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_5

    .line 418
    if-eqz p2, :cond_4

    .line 421
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->showUnsafeConfirm()V

    goto :goto_0

    .line 423
    :cond_4
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lmodmenu/ModMenu;->setUnsafe(Landroid/content/Context;Z)V

    .line 424
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setVisibility(I)V

    .line 425
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setVisibility(I)V

    .line 428
    :cond_5
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 505
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeVeil:Landroid/view/View;

    if-eq p1, v0, :cond_9

    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeCancelBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_0

    goto/16 :goto_2

    .line 507
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->unsafeConfirmBtn:Landroid/widget/Button;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p1, v0, :cond_1

    .line 508
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {p1, v2}, Lmodmenu/ModMenu;->setUnsafe(Landroid/content/Context;Z)V

    .line 509
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissUnsafe()V

    .line 510
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 511
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_3

    .line 512
    :cond_1
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveVeil:Landroid/view/View;

    if-eq p1, v0, :cond_8

    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveCancelBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_2

    goto :goto_1

    .line 514
    :cond_2
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveGoBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_3

    .line 515
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->requestGive()V

    goto :goto_3

    .line 516
    :cond_3
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->rotateBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_5

    .line 517
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    invoke-static {v0}, Lmodmenu/ModMenu;->rotateHwid(Landroid/content/Context;)V

    .line 518
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->hwidSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 519
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x17

    if-lt v0, v3, :cond_4

    .line 520
    const/4 v2, 0x6

    goto :goto_0

    .line 521
    :cond_4
    nop

    .line 519
    :goto_0
    invoke-virtual {p1, v2}, Landroid/view/View;->performHapticFeedback(I)Z

    .line 522
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    iget-object v0, p0, Lmodmenu/ModMenuSheet;->host:Landroid/app/Activity;

    const-string v2, "mod_rotate_toast"

    invoke-static {v0, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 523
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    goto :goto_3

    .line 524
    :cond_5
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->gmBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_6

    .line 525
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->requestGameMode()V

    goto :goto_3

    .line 526
    :cond_6
    iget-object v0, p0, Lmodmenu/ModMenuSheet;->giveBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_7

    .line 527
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->showGive()V

    goto :goto_3

    .line 529
    :cond_7
    iget-object p1, p0, Lmodmenu/ModMenuSheet;->dialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->cancel()V

    goto :goto_3

    .line 513
    :cond_8
    :goto_1
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->dismissGive()V

    goto :goto_3

    .line 506
    :cond_9
    :goto_2
    invoke-direct {p0}, Lmodmenu/ModMenuSheet;->cancelUnsafe()V

    .line 531
    :goto_3
    return-void
.end method
