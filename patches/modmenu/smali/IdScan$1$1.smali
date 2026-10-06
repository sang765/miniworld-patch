.class Lmodmenu/IdScan$1$1;
.super Ljava/lang/Object;
.source "IdScan.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/IdScan$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmodmenu/IdScan$1;

.field final synthetic val$r:Lmodmenu/IdScan$Result;


# direct methods
.method constructor <init>(Lmodmenu/IdScan$1;Lmodmenu/IdScan$Result;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 213
    iput-object p1, p0, Lmodmenu/IdScan$1$1;->this$0:Lmodmenu/IdScan$1;

    iput-object p2, p0, Lmodmenu/IdScan$1$1;->val$r:Lmodmenu/IdScan$Result;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 216
    invoke-static {}, Lmodmenu/IdScan;->access$400()Lmodmenu/IdScan$Listener;

    move-result-object v0

    .line 217
    nop

    .line 219
    iget-object v1, p0, Lmodmenu/IdScan$1$1;->val$r:Lmodmenu/IdScan$Result;

    .line 217
    if-eqz v0, :cond_0

    .line 218
    invoke-interface {v0, v1}, Lmodmenu/IdScan$Listener;->onDone(Lmodmenu/IdScan$Result;)V

    goto :goto_0

    .line 219
    :cond_0
    iget-object v0, v1, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 222
    iget-object v0, p0, Lmodmenu/IdScan$1$1;->this$0:Lmodmenu/IdScan$1;

    iget-object v0, v0, Lmodmenu/IdScan$1;->val$app:Landroid/content/Context;

    invoke-static {v0}, Lmodmenu/IdScan;->access$500(Landroid/content/Context;)V

    .line 224
    :cond_1
    :goto_0
    return-void
.end method
