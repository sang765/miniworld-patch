.class public Lmodmenu/ModMenuActivity;
.super Landroid/app/Activity;
.source "ModMenuActivity.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private hwidSwitch:Landroidx/appcompat/widget/SwitchCompat;

.field private webSwitch:Landroidx/appcompat/widget/SwitchCompat;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 83
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

    .line 70
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroidx/appcompat/widget/SwitchCompat;

    if-ne p1, v0, :cond_0

    .line 71
    invoke-static {p0, p2}, Lmodmenu/ModMenu;->setWebBlocked(Landroid/content/Context;Z)V

    goto :goto_0

    .line 72
    :cond_0
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroidx/appcompat/widget/SwitchCompat;

    if-ne p1, v0, :cond_1

    .line 73
    invoke-static {p0, p2}, Lmodmenu/ModMenu;->setHwidSpoof(Landroid/content/Context;Z)V

    .line 75
    :cond_1
    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 79
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->finish()V

    .line 80
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 30
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 32
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 33
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 34
    const/16 v0, 0x18

    invoke-direct {p0, v0}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v0

    .line 35
    const/16 v1, 0x30

    invoke-direct {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v1

    const/16 v2, 0x20

    invoke-direct {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    invoke-virtual {p1, v0, v1, v0, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 37
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 38
    const-string v1, "Mod Menu"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    const/high16 v1, 0x41c00000    # 24.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 40
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 41
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 43
    new-instance v0, Landroidx/appcompat/widget/SwitchCompat;

    invoke-direct {v0, p0}, Landroidx/appcompat/widget/SwitchCompat;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroidx/appcompat/widget/SwitchCompat;

    .line 44
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroidx/appcompat/widget/SwitchCompat;

    const-string v1, "Ch\u1eb7n WebView / tr\u00ecnh duy\u1ec7t"

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SwitchCompat;->setText(Ljava/lang/CharSequence;)V

    .line 45
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroidx/appcompat/widget/SwitchCompat;

    invoke-static {}, Lmodmenu/ModMenu;->isWebBlocked()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 46
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 47
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroidx/appcompat/widget/SwitchCompat;

    const/16 v1, 0x1c

    invoke-direct {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2, v3, v3}, Landroidx/appcompat/widget/SwitchCompat;->setPadding(IIII)V

    .line 48
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->webSwitch:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 50
    new-instance v0, Landroidx/appcompat/widget/SwitchCompat;

    invoke-direct {v0, p0}, Landroidx/appcompat/widget/SwitchCompat;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroidx/appcompat/widget/SwitchCompat;

    .line 51
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroidx/appcompat/widget/SwitchCompat;

    const-string v2, "Gi\u1ea3 m\u1ea1o HWID"

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/SwitchCompat;->setText(Ljava/lang/CharSequence;)V

    .line 52
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroidx/appcompat/widget/SwitchCompat;

    invoke-static {}, Lmodmenu/ModMenu;->isSpoofOn()Z

    move-result v2

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    .line 53
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 54
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroidx/appcompat/widget/SwitchCompat;

    const/16 v2, 0x10

    invoke-direct {p0, v2}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v2

    invoke-virtual {v0, v3, v2, v3, v3}, Landroidx/appcompat/widget/SwitchCompat;->setPadding(IIII)V

    .line 55
    iget-object v0, p0, Lmodmenu/ModMenuActivity;->hwidSwitch:Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 57
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 58
    const-string v2, "\u0110\u00f3ng"

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 59
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 62
    invoke-direct {p0, v1}, Lmodmenu/ModMenuActivity;->dp(I)I

    move-result v1

    iput v1, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 63
    invoke-virtual {p1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    invoke-virtual {p0, p1}, Lmodmenu/ModMenuActivity;->setContentView(Landroid/view/View;)V

    .line 66
    return-void
.end method
