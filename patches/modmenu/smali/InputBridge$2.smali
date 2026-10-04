.class Lmodmenu/InputBridge$2;
.super Ljava/lang/Object;
.source "InputBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmodmenu/InputBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmodmenu/InputBridge;


# direct methods
.method constructor <init>(Lmodmenu/InputBridge;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 255
    iput-object p1, p0, Lmodmenu/InputBridge$2;->this$0:Lmodmenu/InputBridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 258
    iget-object v0, p0, Lmodmenu/InputBridge$2;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$100(Lmodmenu/InputBridge;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 259
    iget-object v1, p0, Lmodmenu/InputBridge$2;->this$0:Lmodmenu/InputBridge;

    iget-object v0, p0, Lmodmenu/InputBridge$2;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$200(Lmodmenu/InputBridge;)J

    move-result-wide v3

    .line 260
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    .line 259
    const/4 v2, 0x1

    invoke-static/range {v1 .. v6}, Lmodmenu/InputBridge;->access$300(Lmodmenu/InputBridge;IJJ)V

    .line 261
    iget-object v0, p0, Lmodmenu/InputBridge$2;->this$0:Lmodmenu/InputBridge;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmodmenu/InputBridge;->access$102(Lmodmenu/InputBridge;Z)Z

    .line 262
    const-string v0, "MWInput"

    const-string v1, "center-touch auto-up"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    :cond_0
    return-void
.end method
