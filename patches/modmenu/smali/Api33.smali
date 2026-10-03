.class final Lmodmenu/Api33;
.super Ljava/lang/Object;
.source "Api33.java"


# static fields
.field private static final PERMISSION:Ljava/lang/String; = "android.permission.POST_NOTIFICATIONS"

.field private static final REQUEST_CODE:I = 0x6d77


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static canPost(Landroid/content/Context;)Z
    .locals 1

    .line 19
    const-string v0, "android.permission.POST_NOTIFICATIONS"

    invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static request(Landroid/app/Activity;)V
    .locals 2

    .line 23
    const-string v0, "android.permission.POST_NOTIFICATIONS"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x6d77

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 24
    return-void
.end method
