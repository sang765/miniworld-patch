.class Lmodmenu/IdScan$1;
.super Ljava/lang/Object;
.source "IdScan.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/IdScan;->scan(Landroid/content/Context;Lmodmenu/IdScan$Listener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$listener:Lmodmenu/IdScan$Listener;

.field final synthetic val$paths:[Ljava/lang/String;


# direct methods
.method constructor <init>([Ljava/lang/String;Lmodmenu/IdScan$Listener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 122
    iput-object p1, p0, Lmodmenu/IdScan$1;->val$paths:[Ljava/lang/String;

    iput-object p2, p0, Lmodmenu/IdScan$1;->val$listener:Lmodmenu/IdScan$Listener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 125
    iget-object v0, p0, Lmodmenu/IdScan$1;->val$paths:[Ljava/lang/String;

    invoke-static {v0}, Lmodmenu/IdScan;->access$000([Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object v0

    .line 126
    const/4 v1, 0x0

    invoke-static {v1}, Lmodmenu/IdScan;->access$102(Z)Z

    .line 127
    invoke-static {}, Lmodmenu/IdScan;->access$200()Landroid/os/Handler;

    move-result-object v1

    new-instance v2, Lmodmenu/IdScan$1$1;

    invoke-direct {v2, p0, v0}, Lmodmenu/IdScan$1$1;-><init>(Lmodmenu/IdScan$1;Lmodmenu/IdScan$Result;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 133
    return-void
.end method
