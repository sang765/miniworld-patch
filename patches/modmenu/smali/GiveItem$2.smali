.class Lmodmenu/GiveItem$2;
.super Ljava/lang/Object;
.source "GiveItem.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/GiveItem;->verify([Ljava/lang/String;IJ)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$item:I

.field final synthetic val$p:[Ljava/lang/String;

.field final synthetic val$uid:J

.field final synthetic val$want:J


# direct methods
.method constructor <init>([Ljava/lang/String;IJJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 158
    iput-object p1, p0, Lmodmenu/GiveItem$2;->val$p:[Ljava/lang/String;

    iput p2, p0, Lmodmenu/GiveItem$2;->val$item:I

    iput-wide p3, p0, Lmodmenu/GiveItem$2;->val$want:J

    iput-wide p5, p0, Lmodmenu/GiveItem$2;->val$uid:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 162
    :try_start_0
    iget-object v0, p0, Lmodmenu/GiveItem$2;->val$p:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v2, v0, v1

    iget-object v0, p0, Lmodmenu/GiveItem$2;->val$p:[Ljava/lang/String;

    const/4 v3, 0x1

    aget-object v3, v0, v3

    iget v4, p0, Lmodmenu/GiveItem$2;->val$item:I

    iget-wide v5, p0, Lmodmenu/GiveItem$2;->val$want:J

    iget-wide v7, p0, Lmodmenu/GiveItem$2;->val$uid:J

    .line 163
    invoke-static/range {v2 .. v8}, Lmodmenu/GiveItem;->check(Ljava/lang/String;Ljava/lang/String;IJJ)Ljava/lang/String;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    .line 162
    invoke-static {v0, v1}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    goto :goto_0

    .line 165
    :catch_0
    move-exception v0

    .line 166
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "check dispatch failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MWGiveItem"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    :goto_0
    return-void
.end method
