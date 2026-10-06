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

    .line 127
    iput-object p1, p0, Lmodmenu/IdScan$1$1;->this$0:Lmodmenu/IdScan$1;

    iput-object p2, p0, Lmodmenu/IdScan$1$1;->val$r:Lmodmenu/IdScan$Result;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 130
    iget-object v0, p0, Lmodmenu/IdScan$1$1;->this$0:Lmodmenu/IdScan$1;

    iget-object v0, v0, Lmodmenu/IdScan$1;->val$listener:Lmodmenu/IdScan$Listener;

    iget-object v1, p0, Lmodmenu/IdScan$1$1;->val$r:Lmodmenu/IdScan$Result;

    invoke-interface {v0, v1}, Lmodmenu/IdScan$Listener;->onDone(Lmodmenu/IdScan$Result;)V

    .line 131
    return-void
.end method
