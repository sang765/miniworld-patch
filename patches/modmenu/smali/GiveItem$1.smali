.class Lmodmenu/GiveItem$1;
.super Ljava/lang/Object;
.source "GiveItem.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/GiveItem;->request(Landroid/content/Context;IIJLjava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$app:Landroid/content/Context;

.field final synthetic val$done:Ljava/lang/Runnable;

.field final synthetic val$item:I

.field final synthetic val$p:[Ljava/lang/String;

.field final synthetic val$uid:J


# direct methods
.method constructor <init>([Ljava/lang/String;IJLandroid/content/Context;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 100
    iput-object p1, p0, Lmodmenu/GiveItem$1;->val$p:[Ljava/lang/String;

    iput p2, p0, Lmodmenu/GiveItem$1;->val$item:I

    iput-wide p3, p0, Lmodmenu/GiveItem$1;->val$uid:J

    iput-object p5, p0, Lmodmenu/GiveItem$1;->val$app:Landroid/content/Context;

    iput-object p6, p0, Lmodmenu/GiveItem$1;->val$done:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 105
    const-string v0, "fail"

    const-string v1, "MWGiveItem"

    :try_start_0
    iget-object v2, p0, Lmodmenu/GiveItem$1;->val$p:[Ljava/lang/String;

    const-wide/16 v3, 0x2ee0

    invoke-static {v2, v3, v4}, Lmodmenu/GiveItem;->access$000([Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v2

    .line 106
    const-string v3, "wait"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 107
    iget-object v2, p0, Lmodmenu/GiveItem$1;->val$p:[Ljava/lang/String;

    iget v3, p0, Lmodmenu/GiveItem$1;->val$item:I

    iget-wide v4, p0, Lmodmenu/GiveItem$1;->val$uid:J

    invoke-static {v2, v3, v4, v5}, Lmodmenu/GiveItem;->access$100([Ljava/lang/String;IJ)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    :cond_0
    goto :goto_0

    .line 109
    :catch_0
    move-exception v2

    .line 112
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "poll failed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    move-object v2, v0

    .line 115
    :goto_0
    const/4 v3, 0x0

    invoke-static {v3}, Lmodmenu/GiveItem;->access$202(Z)Z

    .line 116
    const-string v3, "timeout"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    :cond_1
    move-object v0, v2

    .line 117
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "give done: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    invoke-static {}, Lmodmenu/GiveItem;->access$400()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lmodmenu/GiveItem$1$1;

    invoke-direct {v2, p0, v0}, Lmodmenu/GiveItem$1$1;-><init>(Lmodmenu/GiveItem$1;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 125
    return-void
.end method
