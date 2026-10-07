.class public Lmodmenu/ModMenuActivity;
.super Landroid/app/Activity;
.source "ModMenuActivity.java"


# static fields
.field public static final EXTRA_OPEN_IDS:Ljava/lang/String; = "open_ids"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 21
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 26
    invoke-virtual {p0}, Lmodmenu/ModMenuActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v1, "open_ids"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 25
    :goto_0
    invoke-static {p0, v0}, Lmodmenu/ModMenuSheet;->show(Landroid/app/Activity;Z)Lmodmenu/ModMenuSheet;

    .line 27
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 48
    const/4 v0, 0x0

    invoke-static {v0}, Lmodmenu/IdScan;->setListener(Lmodmenu/IdScan$Listener;)V

    .line 49
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 50
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 31
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 33
    if-eqz p1, :cond_0

    const-string v0, "open_ids"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 34
    const/4 p1, 0x1

    invoke-static {p0, p1}, Lmodmenu/ModMenuSheet;->show(Landroid/app/Activity;Z)Lmodmenu/ModMenuSheet;

    .line 36
    :cond_0
    return-void
.end method

.method protected onPause()V
    .locals 0

    .line 40
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 43
    invoke-static {p0}, Lmodmenu/IdScan;->menuClosed(Landroid/content/Context;)V

    .line 44
    return-void
.end method
