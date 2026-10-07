.class public Lmodmenu/ModMenuReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ModMenuReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5

    .line 22
    invoke-static {}, Lmodmenu/ModMenu;->gameActivity()Landroid/app/Activity;

    move-result-object v0

    .line 23
    const/4 v1, 0x1

    const-string v2, "open_ids"

    const/4 v3, 0x0

    if-nez v0, :cond_1

    .line 30
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-class v4, Lmodmenu/ModMenuActivity;

    invoke-direct {v0, p1, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 31
    const/high16 v4, 0x30000000

    invoke-virtual {v0, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    if-eqz p2, :cond_0

    .line 34
    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 33
    :goto_0
    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p2

    .line 30
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    goto :goto_1

    .line 36
    :catch_0
    move-exception p1

    .line 37
    const-string p2, "ModMenu"

    const-string v0, "no live game window to open the menu on"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 39
    :goto_1
    return-void

    .line 41
    :cond_1
    if-eqz p2, :cond_2

    .line 42
    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    .line 41
    :goto_2
    invoke-static {v0, v1}, Lmodmenu/ModMenuSheet;->show(Landroid/app/Activity;Z)Lmodmenu/ModMenuSheet;

    .line 43
    return-void
.end method
