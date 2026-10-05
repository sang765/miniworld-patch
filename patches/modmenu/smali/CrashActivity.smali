.class public Lmodmenu/CrashActivity;
.super Landroid/app/Activity;
.source "CrashActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final BG:I = -0xefebe8

.field private static final ERROR:I = -0x9495

.field static final EXTRA_PATH:Ljava/lang/String; = "modmenu.crash.PATH"

.field static final EXTRA_SUMMARY:Ljava/lang/String; = "modmenu.crash.SUMMARY"

.field static final EXTRA_TEXT:Ljava/lang/String; = "modmenu.crash.TEXT"

.field private static final MAX_VIEW_CHARS:I = 0x20000

.field private static final MONO:I = -0x362e27

.field private static final MUTED:I = -0x655b51

.field private static final PRIMARY:I = -0xc47d0a

.field private static final SUMMARY:I = -0x4b57

.field private static final SURFACE:I = -0xdcd5cd

.field private static final TAG:Ljava/lang/String; = "MWCrash"

.field private static final TEXT:I = -0x191915


# instance fields
.field private closeBtn:Landroid/widget/Button;

.field private copyBtn:Landroid/widget/Button;

.field private path:Ljava/lang/String;

.field private report:Ljava/lang/String;

.field private saveBtn:Landroid/widget/Button;

.field private shareBtn:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 60
    const-string v0, ""

    iput-object v0, p0, Lmodmenu/CrashActivity;->report:Ljava/lang/String;

    .line 61
    iput-object v0, p0, Lmodmenu/CrashActivity;->path:Ljava/lang/String;

    return-void
.end method

.method private build()V
    .locals 8

    .line 81
    invoke-virtual {p0}, Lmodmenu/CrashActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 82
    const/4 v1, 0x0

    if-nez v0, :cond_0

    move-object v2, v1

    goto :goto_0

    :cond_0
    const-string v2, "modmenu.crash.SUMMARY"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 83
    :goto_0
    if-nez v0, :cond_1

    const-string v3, ""

    goto :goto_1

    :cond_1
    const-string v3, "modmenu.crash.PATH"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lmodmenu/CrashActivity;->safe(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_1
    iput-object v3, p0, Lmodmenu/CrashActivity;->path:Ljava/lang/String;

    .line 84
    if-nez v0, :cond_2

    goto :goto_2

    :cond_2
    const-string v1, "modmenu.crash.TEXT"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 88
    :goto_2
    iget-object v0, p0, Lmodmenu/CrashActivity;->path:Ljava/lang/String;

    invoke-static {v0}, Lmodmenu/CrashReport;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 89
    if-eqz v0, :cond_3

    move-object v1, v0

    :cond_3
    iput-object v1, p0, Lmodmenu/CrashActivity;->report:Ljava/lang/String;

    .line 90
    iget-object v0, p0, Lmodmenu/CrashActivity;->report:Ljava/lang/String;

    if-nez v0, :cond_4

    .line 91
    const-string v0, "The crash reached the handler, but no report could be collected on this device.\n\nThe log for this process can still be pulled:\n  adb logcat -d -v time > logcat.txt\n"

    iput-object v0, p0, Lmodmenu/CrashActivity;->report:Ljava/lang/String;

    .line 96
    :cond_4
    iget-object v0, p0, Lmodmenu/CrashActivity;->report:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/high16 v3, 0x20000

    if-le v0, v3, :cond_6

    .line 97
    nop

    .line 98
    iget-object v0, p0, Lmodmenu/CrashActivity;->report:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 99
    const v3, 0x1ffff

    .line 101
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lmodmenu/CrashActivity;->report:Ljava/lang/String;

    invoke-virtual {v4, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "\n... (open the saved file for the rest)\n"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lmodmenu/CrashActivity;->report:Ljava/lang/String;

    .line 105
    :cond_6
    invoke-virtual {p0}, Lmodmenu/CrashActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const v4, -0xefebe8

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v3}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 107
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 108
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 109
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 110
    invoke-direct {p0, v2}, Lmodmenu/CrashActivity;->header(Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v2

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/4 v6, -0x1

    invoke-direct {v4, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 114
    new-instance v2, Landroid/widget/TextView;

    invoke-direct {v2, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 115
    iget-object v4, p0, Lmodmenu/CrashActivity;->report:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    const/high16 v4, 0x41300000    # 11.0f

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 117
    const v4, -0x362e27

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 118
    sget-object v4, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 119
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextIsSelectable(Z)V

    .line 120
    const/16 v3, 0x10

    invoke-direct {p0, v3}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v4

    const/4 v5, 0x4

    invoke-direct {p0, v5}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v5

    invoke-direct {p0, v3}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v3

    const/16 v7, 0x18

    invoke-direct {p0, v7}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v7

    invoke-virtual {v2, v4, v5, v3, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 121
    new-instance v3, Landroid/widget/ScrollView;

    invoke-direct {v3, p0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 122
    invoke-virtual {v3, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 123
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v2, v6, v1, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 126
    invoke-virtual {p0, v0}, Lmodmenu/CrashActivity;->setContentView(Landroid/view/View;)V

    .line 127
    return-void
.end method

.method private copyReport()V
    .locals 3

    .line 161
    :try_start_0
    const-string v0, "clipboard"

    .line 162
    invoke-virtual {p0, v0}, Lmodmenu/CrashActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 163
    if-eqz v0, :cond_0

    .line 166
    const-string v1, "Mini World mod crash report"

    iget-object v2, p0, Lmodmenu/CrashActivity;->report:Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 168
    const-string v0, "mod_crash_copied"

    invoke-static {p0, v0}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lmodmenu/CrashActivity;->toast(Ljava/lang/String;)V

    .line 172
    goto :goto_0

    .line 164
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "no clipboard service"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    :catchall_0
    move-exception v0

    .line 170
    const-string v1, "MWCrash"

    const-string v2, "copy failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 171
    const-string v0, "mod_crash_failed"

    invoke-static {p0, v0}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lmodmenu/CrashActivity;->toast(Ljava/lang/String;)V

    .line 173
    :goto_0
    return-void
.end method

.method private dp(I)I
    .locals 1

    .line 298
    int-to-float p1, p1

    invoke-virtual {p0}, Lmodmenu/CrashActivity;->getResources()Landroid/content/res/Resources;

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

.method private header(Ljava/lang/String;)Landroid/widget/LinearLayout;
    .locals 8

    .line 131
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 132
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 133
    const/16 v1, 0x10

    invoke-direct {p0, v1}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v2

    const/16 v3, 0x14

    invoke-direct {p0, v3}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v1}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v4

    const/16 v5, 0x8

    invoke-direct {p0, v5}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v6

    invoke-virtual {v0, v2, v3, v4, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 135
    const-string v2, "mod_crash_title"

    invoke-static {p0, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const v3, -0x9495

    sget-object v4, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    const/high16 v6, 0x41b00000    # 22.0f

    invoke-direct {p0, v2, v6, v3, v4}, Lmodmenu/CrashActivity;->label(Ljava/lang/String;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v2

    .line 136
    invoke-direct {p0}, Lmodmenu/CrashActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 135
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 137
    const-string v2, "mod_crash_hint"

    invoke-static {p0, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    const/high16 v4, 0x41500000    # 13.0f

    const v6, -0x655b51

    invoke-direct {p0, v2, v4, v6, v3}, Lmodmenu/CrashActivity;->label(Ljava/lang/String;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object v2

    .line 138
    const/4 v3, 0x4

    invoke-direct {p0, v3}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v3}, Lmodmenu/CrashActivity;->withTop(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    .line 137
    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 139
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 140
    const/16 v2, -0x4b57

    sget-object v3, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-direct {p0, p1, v4, v2, v3}, Lmodmenu/CrashActivity;->label(Ljava/lang/String;FILandroid/graphics/Typeface;)Landroid/widget/TextView;

    move-result-object p1

    .line 141
    const/16 v2, 0xc

    invoke-direct {p0, v2}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v2}, Lmodmenu/CrashActivity;->withTop(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    .line 140
    invoke-virtual {v0, p1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 144
    :cond_0
    new-instance p1, Landroid/widget/LinearLayout;

    invoke-direct {p1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 145
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 146
    const-string v3, "mod_crash_copy"

    invoke-static {p0, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const v4, -0xc47d0a

    const/4 v7, -0x1

    invoke-direct {p0, v3, v4, v7}, Lmodmenu/CrashActivity;->pill(Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v3

    iput-object v3, p0, Lmodmenu/CrashActivity;->copyBtn:Landroid/widget/Button;

    .line 147
    const-string v3, "mod_crash_save"

    invoke-static {p0, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3, v4, v7}, Lmodmenu/CrashActivity;->pill(Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v3

    iput-object v3, p0, Lmodmenu/CrashActivity;->saveBtn:Landroid/widget/Button;

    .line 148
    const-string v3, "mod_crash_share"

    invoke-static {p0, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3, v4, v7}, Lmodmenu/CrashActivity;->pill(Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object v3

    iput-object v3, p0, Lmodmenu/CrashActivity;->shareBtn:Landroid/widget/Button;

    .line 149
    iget-object v3, p0, Lmodmenu/CrashActivity;->copyBtn:Landroid/widget/Button;

    invoke-direct {p0, v2}, Lmodmenu/CrashActivity;->weighted(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {p1, v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 150
    iget-object v2, p0, Lmodmenu/CrashActivity;->saveBtn:Landroid/widget/Button;

    invoke-direct {p0, v5}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v3}, Lmodmenu/CrashActivity;->weighted(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 151
    iget-object v2, p0, Lmodmenu/CrashActivity;->shareBtn:Landroid/widget/Button;

    invoke-direct {p0, v5}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v3

    invoke-direct {p0, v3}, Lmodmenu/CrashActivity;->weighted(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 152
    invoke-direct {p0, v1}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v1

    invoke-direct {p0, v1}, Lmodmenu/CrashActivity;->withTop(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 154
    const-string p1, "mod_close"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const v1, -0xdcd5cd

    invoke-direct {p0, p1, v1, v6}, Lmodmenu/CrashActivity;->pill(Ljava/lang/String;II)Landroid/widget/Button;

    move-result-object p1

    iput-object p1, p0, Lmodmenu/CrashActivity;->closeBtn:Landroid/widget/Button;

    .line 155
    iget-object p1, p0, Lmodmenu/CrashActivity;->closeBtn:Landroid/widget/Button;

    invoke-direct {p0, v5}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v1

    invoke-direct {p0, v1}, Lmodmenu/CrashActivity;->withTop(I)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 156
    return-object v0
.end method

.method private label(Ljava/lang/String;FILandroid/graphics/Typeface;)Landroid/widget/TextView;
    .locals 1

    .line 236
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 237
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 238
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 239
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 240
    invoke-virtual {v0, p4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 241
    return-object v0
.end method

.method private matchWrap()Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .line 280
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method private pill(Ljava/lang/String;II)Landroid/widget/Button;
    .locals 3

    .line 246
    new-instance v0, Landroid/widget/Button;

    invoke-direct {v0, p0}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 247
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 248
    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setAllCaps(Z)V

    .line 249
    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 250
    invoke-virtual {v0, p3}, Landroid/widget/Button;->setTextColor(I)V

    .line 251
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setGravity(I)V

    .line 252
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinHeight(I)V

    .line 253
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setMinWidth(I)V

    .line 254
    const/16 v1, 0x8

    invoke-direct {p0, v1}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v2

    invoke-direct {p0, v1}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v1

    invoke-virtual {v0, v2, p1, v1, p1}, Landroid/widget/Button;->setPadding(IIII)V

    .line 255
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 256
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 257
    const/16 p2, 0x14

    invoke-direct {p0, p2}, Lmodmenu/CrashActivity;->dp(I)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 258
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt p2, v1, :cond_0

    .line 261
    new-instance p2, Landroid/graphics/drawable/RippleDrawable;

    const v1, 0xffffff

    and-int/2addr p3, v1

    const/high16 v1, 0x22000000

    or-int/2addr p3, v1

    .line 262
    invoke-static {p3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-direct {p2, p3, p1, v1}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 261
    invoke-virtual {v0, p2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 265
    :cond_0
    invoke-virtual {v0, p1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 267
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 268
    return-object v0
.end method

.method private static safe(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 276
    if-nez p0, :cond_0

    const-string p0, ""

    :cond_0
    return-object p0
.end method

.method private saveReport()V
    .locals 5

    .line 182
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lmodmenu/CrashActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 183
    if-eqz v0, :cond_0

    new-instance v1, Ljava/io/File;

    const-string v2, "crashes"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0

    .line 184
    :cond_0
    invoke-static {p0}, Lmodmenu/CrashReport;->dir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 185
    :goto_0
    if-eqz v1, :cond_3

    .line 188
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 189
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot create "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 191
    :cond_2
    :goto_1
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "crash-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".txt"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 192
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 194
    :try_start_1
    iget-object v2, p0, Lmodmenu/CrashActivity;->report:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 196
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 197
    nop

    .line 198
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mod_crash_saved"

    invoke-static {p0, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lmodmenu/CrashActivity;->toast(Ljava/lang/String;)V

    .line 202
    goto :goto_2

    .line 196
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 197
    throw v0

    .line 186
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "no storage available"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 199
    :catchall_1
    move-exception v0

    .line 200
    const-string v1, "MWCrash"

    const-string v2, "save failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 201
    const-string v0, "mod_crash_failed"

    invoke-static {p0, v0}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lmodmenu/CrashActivity;->toast(Ljava/lang/String;)V

    .line 203
    :goto_2
    return-void
.end method

.method private shareReport()V
    .locals 4

    .line 207
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "text/plain"

    .line 208
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.extra.SUBJECT"

    const-string v2, "Mini World mod crash report"

    .line 209
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "android.intent.extra.TEXT"

    iget-object v2, p0, Lmodmenu/CrashActivity;->report:Ljava/lang/String;

    iget-object v3, p0, Lmodmenu/CrashActivity;->path:Ljava/lang/String;

    .line 213
    invoke-static {v2, v3}, Lmodmenu/CrashReport;->forIntent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 212
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 214
    const-string v1, "mod_crash_share"

    .line 215
    invoke-static {p0, v1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 214
    invoke-static {v0, v1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lmodmenu/CrashActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 219
    goto :goto_0

    .line 216
    :catchall_0
    move-exception v0

    .line 217
    const-string v1, "MWCrash"

    const-string v2, "share failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 218
    const-string v0, "mod_crash_failed"

    invoke-static {p0, v0}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lmodmenu/CrashActivity;->toast(Ljava/lang/String;)V

    .line 220
    :goto_0
    return-void
.end method

.method private toast(Ljava/lang/String;)V
    .locals 1

    .line 272
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 273
    return-void
.end method

.method private weighted(I)Landroid/widget/LinearLayout$LayoutParams;
    .locals 4

    .line 291
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 292
    const/16 v1, 0x28

    invoke-direct {p0, v1}, Lmodmenu/CrashActivity;->dp(I)I

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 293
    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 294
    return-object v0
.end method

.method private withTop(I)Landroid/widget/LinearLayout$LayoutParams;
    .locals 1

    .line 285
    invoke-direct {p0}, Lmodmenu/CrashActivity;->matchWrap()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v0

    .line 286
    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 287
    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 224
    iget-object v0, p0, Lmodmenu/CrashActivity;->copyBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_0

    .line 225
    invoke-direct {p0}, Lmodmenu/CrashActivity;->copyReport()V

    goto :goto_0

    .line 226
    :cond_0
    iget-object v0, p0, Lmodmenu/CrashActivity;->saveBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_1

    .line 227
    invoke-direct {p0}, Lmodmenu/CrashActivity;->saveReport()V

    goto :goto_0

    .line 228
    :cond_1
    iget-object v0, p0, Lmodmenu/CrashActivity;->shareBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_2

    .line 229
    invoke-direct {p0}, Lmodmenu/CrashActivity;->shareReport()V

    goto :goto_0

    .line 230
    :cond_2
    iget-object v0, p0, Lmodmenu/CrashActivity;->closeBtn:Landroid/widget/Button;

    if-ne p1, v0, :cond_3

    .line 231
    invoke-virtual {p0}, Lmodmenu/CrashActivity;->finish()V

    .line 233
    :cond_3
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 69
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 71
    :try_start_0
    invoke-direct {p0}, Lmodmenu/CrashActivity;->build()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    goto :goto_0

    .line 72
    :catchall_0
    move-exception p1

    .line 75
    const-string v0, "MWCrash"

    const-string v1, "crash screen failed, closing"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 76
    invoke-virtual {p0}, Lmodmenu/CrashActivity;->finish()V

    .line 78
    :goto_0
    return-void
.end method
