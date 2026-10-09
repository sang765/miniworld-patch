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

    .line 101
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
    .locals 7

    .line 105
    const-string v0, "fail"

    const-string v1, "MWGiveItem"

    .line 107
    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p0, Lmodmenu/GiveItem$1;->val$p:[Ljava/lang/String;

    const-wide/16 v4, 0x2ee0

    invoke-static {v3, v4, v5}, Lmodmenu/GiveItem;->access$000([Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v3

    .line 109
    iget-object v4, p0, Lmodmenu/GiveItem$1;->val$p:[Ljava/lang/String;

    invoke-static {v4}, Lmodmenu/GiveItem;->access$100([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 110
    const-string v4, "wait"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 111
    iget-object v3, p0, Lmodmenu/GiveItem$1;->val$p:[Ljava/lang/String;

    iget v4, p0, Lmodmenu/GiveItem$1;->val$item:I

    iget-wide v5, p0, Lmodmenu/GiveItem$1;->val$uid:J

    invoke-static {v3, v4, v5, v6}, Lmodmenu/GiveItem;->access$200([Ljava/lang/String;IJ)Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    :cond_0
    goto :goto_0

    .line 113
    :catch_0
    move-exception v3

    .line 116
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "poll failed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    move-object v3, v0

    .line 119
    :goto_0
    const/4 v4, 0x0

    invoke-static {v4}, Lmodmenu/GiveItem;->access$302(Z)Z

    .line 120
    const-string v4, "timeout"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    :cond_1
    move-object v0, v3

    .line 121
    :goto_1
    nop

    .line 122
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "give done: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    invoke-static {}, Lmodmenu/GiveItem;->access$500()Landroid/os/Handler;

    move-result-object v1

    new-instance v3, Lmodmenu/GiveItem$1$1;

    invoke-direct {v3, p0, v0, v2}, Lmodmenu/GiveItem$1$1;-><init>(Lmodmenu/GiveItem$1;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 130
    return-void
.end method
