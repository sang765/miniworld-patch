.class Lmodmenu/IdScan$1;
.super Ljava/lang/Object;
.source "IdScan.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/IdScan;->menuClosed(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$app:Landroid/content/Context;

.field final synthetic val$p:[Ljava/lang/String;


# direct methods
.method constructor <init>([Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 201
    iput-object p1, p0, Lmodmenu/IdScan$1;->val$p:[Ljava/lang/String;

    iput-object p2, p0, Lmodmenu/IdScan$1;->val$app:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 204
    iget-object v0, p0, Lmodmenu/IdScan$1;->val$p:[Ljava/lang/String;

    invoke-static {v0}, Lmodmenu/IdScan;->access$000([Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object v0

    .line 205
    invoke-static {v0}, Lmodmenu/IdScan;->access$102(Lmodmenu/IdScan$Result;)Lmodmenu/IdScan$Result;

    .line 206
    const/4 v1, 0x0

    invoke-static {v1}, Lmodmenu/IdScan;->access$202(Z)Z

    .line 207
    iget-object v2, v0, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 208
    invoke-static {v1}, Lmodmenu/IdScan;->access$302(Z)Z

    .line 210
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "scan done: entries="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lmodmenu/IdScan$Result;->entries:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " error="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v0, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "MWIds"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    invoke-static {}, Lmodmenu/IdScan;->access$600()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lmodmenu/IdScan$1$1;

    invoke-direct {v2, p0, v0}, Lmodmenu/IdScan$1$1;-><init>(Lmodmenu/IdScan$1;Lmodmenu/IdScan$Result;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 225
    return-void
.end method
