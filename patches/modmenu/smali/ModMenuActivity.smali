.class public Lmodmenu/ModMenuActivity;
.super Landroid/app/Activity;
.source "ModMenuActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private hwidSwitch:Landroid/widget/Switch;

.field private webSwitch:Landroid/widget/Switch;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private buildMenu()V
    .locals 6

    .line 46
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 47
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 48
    const/16 v1, 0x18

    invoke-direct {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v1

    .line 49
    const/16 v2, 0x30

    invoke-direct {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    const/16 v3, 0x20

    invoke-direct {p0, v3}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v3

    invoke-virtual {v0, v1, v2, v1, v3}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 51
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 52
    const-string v2, "Mod Menu"

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    const/high16 v2, 0x41c00000    # 24.0f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 54
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 55
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 57
    new-instance v1, Landroid/widget/Switch;

    invoke-direct {v1, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    .line 58
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    const-string v2, "Ch\u1eb7n WebView / tr\u00ecnh duy\u1ec7t"

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 59
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isWebBlocked()Z

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setChecked(Z)V

    .line 60
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    invoke-virtual {v1, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 61
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    const/16 v2, 0x1c

    invoke-direct {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v3, v4, v4}, Landroid/widget/Switch;->setPadding(IIII)V

    .line 62
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 64
    new-instance v1, Landroid/widget/Switch;

    invoke-direct {v1, p0}, Landroid/widget/Switch;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    .line 65
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    const-string v3, "Gi\u1ea3 m\u1ea1o HWID"

    invoke-virtual {v1, v3}, Landroid/widget/Switch;->setText(Ljava/lang/CharSequence;)V

    .line 66
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    invoke-static {}, Lmodmenu/ModMenu;->isSpoofOn()Z

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 67
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    invoke-virtual {v1, p0}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 68
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    const/16 v3, 0x10

    invoke-direct {p0, v3}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v3

    invoke-virtual {v1, v4, v3, v4, v4}, Landroid/widget/Switch;->setPadding(IIII)V

    .line 69
    iget-object v1, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 71
    new-instance v1, Landroid/widget/Button;

    invoke-direct {v1, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 72
    const-string v3, "\u0110\u00f3ng"

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 73
    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 76
    invoke-direct {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    iput v2, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 77
    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    invoke-virtual {p0, v0}, Lmodmenu/ModMenuActivity;->setContentView(Landroid/view/View;)V

    .line 80
    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 97
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


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 84
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_0

    .line 85
    invoke-static {p0, p2}, Lmodmenu/ModMenu;->setWebBlocked(Landroid/content/Context;Z)V

    goto :goto_0

    .line 86
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroid/widget/Switch;

    if-ne p1, v0, :cond_1

    .line 87
    invoke-static {p0, p2}, Lmodmenu/ModMenu;->setHwidSpoof(Landroid/content/Context;Z)V

    .line 89
    :cond_1
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 93
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->finish()V

    .line 94
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 35
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 38
    :try_start_0
    invoke-direct {p0}, Lmodmenu/ModMenuActivity;->buildMenu()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    goto :goto_0

    .line 39
    :catch_0
    move-exception p1

    .line 40
    const-string v0, "ModMenu"

    const-string v1, "menu UI failed, closing"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 41
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->finish()V

    .line 43
    :goto_0
    return-void
.end method
