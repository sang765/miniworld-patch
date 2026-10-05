.class Lmodmenu/ModMenu$2;
.super Ljava/lang/Object;
.source "ModMenu.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/ModMenu;->scheduleRetry()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 215
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 218
    invoke-static {}, Lmodmenu/ModMenu;->access$100()V

    .line 219
    invoke-static {}, Lmodmenu/ModMenu;->access$200()V

    .line 220
    return-void
.end method
