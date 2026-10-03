.class Lmodmenu/AdReward$1;
.super Ljava/lang/Object;
.source "AdReward.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/AdReward;->fire(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$platformId:I

.field final synthetic val$positionId:I


# direct methods
.method constructor <init>(II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 33
    iput p1, p0, Lmodmenu/AdReward$1;->val$platformId:I

    iput p2, p0, Lmodmenu/AdReward$1;->val$positionId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 36
    const/4 v0, 0x0

    invoke-static {v0}, Lmodmenu/AdReward;->access$002(Z)Z

    .line 37
    iget v1, p0, Lmodmenu/AdReward$1;->val$platformId:I

    .line 38
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lmodmenu/AdReward$1;->val$positionId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/16 v3, 0x3e9

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v1, v5, v0

    const/4 v0, 0x1

    aput-object v2, v5, v0

    const/4 v0, 0x2

    aput-object v4, v5, v0

    .line 37
    const-string v0, "DeliverAdEvent"

    invoke-static {v0, v5}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 39
    invoke-static {v3}, Lorg/appplay/lib/CommonNatives;->onWatchAD(I)V

    .line 40
    return-void
.end method
