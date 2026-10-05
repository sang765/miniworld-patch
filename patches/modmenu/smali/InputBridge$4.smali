.class Lmodmenu/InputBridge$4;
.super Ljava/lang/Object;
.source "InputBridge.java"

# interfaces
.implements Landroid/view/View$OnCapturedPointerListener;


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

    .line 858
    iput-object p1, p0, Lmodmenu/InputBridge$4;->this$0:Lmodmenu/InputBridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCapturedPointer(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4

    .line 861
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    .line 862
    iget-object v0, p0, Lmodmenu/InputBridge$4;->this$0:Lmodmenu/InputBridge;

    const-string v1, "captured"

    invoke-static {v0, v1, p1, p2}, Lmodmenu/InputBridge;->access$1600(Lmodmenu/InputBridge;Ljava/lang/String;ILandroid/view/MotionEvent;)V

    .line 863
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 866
    :cond_0
    const/4 v0, 0x1

    packed-switch p1, :pswitch_data_0

    .line 885
    :pswitch_0
    return v1

    .line 880
    :pswitch_1
    iget-object p1, p0, Lmodmenu/InputBridge$4;->this$0:Lmodmenu/InputBridge;

    invoke-static {p1, p2}, Lmodmenu/InputBridge;->access$1900(Lmodmenu/InputBridge;Landroid/view/MotionEvent;)V

    .line 881
    iget-object p1, p0, Lmodmenu/InputBridge$4;->this$0:Lmodmenu/InputBridge;

    invoke-static {p1}, Lmodmenu/InputBridge;->access$1400(Lmodmenu/InputBridge;)Lcom/minitech/player/AppPlayer;

    move-result-object p1

    .line 882
    if-eqz p1, :cond_1

    invoke-virtual {p1, p2}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    .line 869
    :pswitch_2
    iget-object p1, p0, Lmodmenu/InputBridge$4;->this$0:Lmodmenu/InputBridge;

    invoke-static {p1, p2}, Lmodmenu/InputBridge;->access$1700(Lmodmenu/InputBridge;Landroid/view/MotionEvent;)V

    .line 870
    return v0

    .line 877
    :pswitch_3
    iget-object p1, p0, Lmodmenu/InputBridge$4;->this$0:Lmodmenu/InputBridge;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    invoke-static {p1, v2, v3, v1}, Lmodmenu/InputBridge;->access$1800(Lmodmenu/InputBridge;JZ)V

    .line 878
    return v0

    .line 873
    :pswitch_4
    iget-object p1, p0, Lmodmenu/InputBridge$4;->this$0:Lmodmenu/InputBridge;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v1

    invoke-static {p1, v1, v2, v0}, Lmodmenu/InputBridge;->access$1800(Lmodmenu/InputBridge;JZ)V

    .line 874
    return v0

    .line 864
    :cond_2
    :goto_0
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method
