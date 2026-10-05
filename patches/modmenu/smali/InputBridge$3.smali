.class Lmodmenu/InputBridge$3;
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

    .line 344
    iput-object p1, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 347
    iget-object v0, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$200(Lmodmenu/InputBridge;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 348
    return-void

    .line 350
    :cond_0
    invoke-static {}, Lmodmenu/InputBridge;->access$300()Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x5dc

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 351
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-nez v0, :cond_4

    .line 354
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 355
    iget-object v0, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$400(Lmodmenu/InputBridge;)Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmodmenu/ModMenu;->setCrosshair(Landroid/content/Context;Z)V

    .line 356
    iget-object v0, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$500(Lmodmenu/InputBridge;)V

    .line 358
    :cond_1
    iget-object v0, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$600(Lmodmenu/InputBridge;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$700(Lmodmenu/InputBridge;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$800(Lmodmenu/InputBridge;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$900(Lmodmenu/InputBridge;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$1000(Lmodmenu/InputBridge;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$1100(Lmodmenu/InputBridge;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 359
    :cond_2
    iget-object v0, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$1200(Lmodmenu/InputBridge;)V

    .line 361
    :cond_3
    return-void

    .line 363
    :cond_4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-static {v2}, Lmodmenu/InputBridge;->access$1300(Lmodmenu/InputBridge;)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    cmp-long v4, v0, v2

    if-ltz v4, :cond_6

    iget-object v0, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    .line 364
    invoke-static {v0}, Lmodmenu/InputBridge;->access$1400(Lmodmenu/InputBridge;)Lcom/minitech/player/AppPlayer;

    move-result-object v0

    if-nez v0, :cond_5

    goto :goto_0

    .line 367
    :cond_5
    iget-object v0, p0, Lmodmenu/InputBridge$3;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$1500(Lmodmenu/InputBridge;)V

    .line 368
    return-void

    .line 365
    :cond_6
    :goto_0
    return-void
.end method
