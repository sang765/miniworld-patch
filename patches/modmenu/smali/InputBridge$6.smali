.class Lmodmenu/InputBridge$6;
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

    .line 1130
    iput-object p1, p0, Lmodmenu/InputBridge$6;->this$0:Lmodmenu/InputBridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCapturedPointer(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1133
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    .line 1134
    iget-object v0, p0, Lmodmenu/InputBridge$6;->this$0:Lmodmenu/InputBridge;

    const-string v1, "captured"

    invoke-static {v0, v1, p1, p2}, Lmodmenu/InputBridge;->access$2000(Lmodmenu/InputBridge;Ljava/lang/String;ILandroid/view/MotionEvent;)V

    .line 1135
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    .line 1138
    :cond_0
    const-string v0, "MWInput"

    const/4 v2, 0x2

    const/4 v3, 0x1

    packed-switch p1, :pswitch_data_0

    .line 1179
    :pswitch_0
    return v1

    .line 1158
    :pswitch_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionButton()I

    move-result p1

    .line 1164
    iget-object v4, p0, Lmodmenu/InputBridge$6;->this$0:Lmodmenu/InputBridge;

    .line 1158
    if-ne p1, v2, :cond_2

    .line 1159
    invoke-static {v4}, Lmodmenu/InputBridge;->access$1800(Lmodmenu/InputBridge;)Lcom/minitech/player/AppPlayer;

    move-result-object p1

    .line 1160
    if-eqz p1, :cond_1

    invoke-virtual {p1, p2}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    .line 1161
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "xh btn2 up eng="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1162
    return v3

    .line 1164
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide p1

    invoke-static {v4, p1, p2, v1}, Lmodmenu/InputBridge;->access$2200(Lmodmenu/InputBridge;JZ)V

    .line 1165
    return v3

    .line 1148
    :pswitch_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionButton()I

    move-result p1

    .line 1154
    iget-object v4, p0, Lmodmenu/InputBridge$6;->this$0:Lmodmenu/InputBridge;

    .line 1148
    if-ne p1, v2, :cond_4

    .line 1149
    invoke-static {v4}, Lmodmenu/InputBridge;->access$1800(Lmodmenu/InputBridge;)Lcom/minitech/player/AppPlayer;

    move-result-object p1

    .line 1150
    if-eqz p1, :cond_3

    invoke-virtual {p1, p2}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result p1

    if-eqz p1, :cond_3

    const/4 v1, 0x1

    .line 1151
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "xh btn2 down eng="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1152
    return v3

    .line 1154
    :cond_4
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide p1

    invoke-static {v4, p1, p2, v3}, Lmodmenu/InputBridge;->access$2200(Lmodmenu/InputBridge;JZ)V

    .line 1155
    return v3

    .line 1174
    :pswitch_3
    iget-object p1, p0, Lmodmenu/InputBridge$6;->this$0:Lmodmenu/InputBridge;

    invoke-static {p1, p2}, Lmodmenu/InputBridge;->access$2300(Lmodmenu/InputBridge;Landroid/view/MotionEvent;)V

    .line 1175
    iget-object p1, p0, Lmodmenu/InputBridge$6;->this$0:Lmodmenu/InputBridge;

    invoke-static {p1}, Lmodmenu/InputBridge;->access$1800(Lmodmenu/InputBridge;)Lcom/minitech/player/AppPlayer;

    move-result-object p1

    .line 1176
    if-eqz p1, :cond_5

    invoke-virtual {p1, p2}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result p1

    if-eqz p1, :cond_5

    const/4 v1, 0x1

    :cond_5
    return v1

    .line 1141
    :pswitch_4
    iget-object p1, p0, Lmodmenu/InputBridge$6;->this$0:Lmodmenu/InputBridge;

    invoke-static {p1, p2}, Lmodmenu/InputBridge;->access$2100(Lmodmenu/InputBridge;Landroid/view/MotionEvent;)V

    .line 1142
    return v3

    .line 1171
    :pswitch_5
    iget-object p1, p0, Lmodmenu/InputBridge$6;->this$0:Lmodmenu/InputBridge;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    invoke-static {p1, v4, v5, v1}, Lmodmenu/InputBridge;->access$2200(Lmodmenu/InputBridge;JZ)V

    .line 1172
    return v3

    .line 1168
    :pswitch_6
    iget-object p1, p0, Lmodmenu/InputBridge$6;->this$0:Lmodmenu/InputBridge;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-static {p1, v0, v1, v3}, Lmodmenu/InputBridge;->access$2200(Lmodmenu/InputBridge;JZ)V

    .line 1169
    return v3

    .line 1136
    :cond_6
    :goto_0
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
