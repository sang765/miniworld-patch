.class Lmodmenu/InputBridge$1;
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

    .line 537
    iput-object p1, p0, Lmodmenu/InputBridge$1;->this$0:Lmodmenu/InputBridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 540
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lmodmenu/InputBridge$1;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$000(Lmodmenu/InputBridge;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lmodmenu/InputBridge$1;->this$0:Lmodmenu/InputBridge;

    .line 541
    invoke-static {v0}, Lmodmenu/InputBridge;->access$100(Lmodmenu/InputBridge;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lmodmenu/InputBridge$1;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$200(Lmodmenu/InputBridge;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lmodmenu/InputBridge$1;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$300(Lmodmenu/InputBridge;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lmodmenu/InputBridge$1;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$400(Lmodmenu/InputBridge;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lmodmenu/InputBridge$1;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$500(Lmodmenu/InputBridge;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lmodmenu/InputBridge$1;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0}, Lmodmenu/InputBridge;->access$600(Lmodmenu/InputBridge;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 545
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge$1;->this$0:Lmodmenu/InputBridge;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lmodmenu/InputBridge;->access$800(Lmodmenu/InputBridge;ZZ)V

    .line 546
    invoke-static {}, Lmodmenu/InputBridge;->access$900()Landroid/os/Handler;

    move-result-object v0

    const-wide/16 v1, 0x3c

    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 547
    return-void

    .line 542
    :cond_1
    :goto_0
    iget-object v0, p0, Lmodmenu/InputBridge$1;->this$0:Lmodmenu/InputBridge;

    invoke-static {v0, v1}, Lmodmenu/InputBridge;->access$702(Lmodmenu/InputBridge;Z)Z

    .line 543
    return-void
.end method
