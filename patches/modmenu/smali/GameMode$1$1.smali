.class Lmodmenu/GameMode$1$1;
.super Ljava/lang/Object;
.source "GameMode.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/GameMode$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmodmenu/GameMode$1;

.field final synthetic val$state:Ljava/lang/String;


# direct methods
.method constructor <init>(Lmodmenu/GameMode$1;Ljava/lang/String;)V
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

    .line 86
    iput-object p1, p0, Lmodmenu/GameMode$1$1;->this$0:Lmodmenu/GameMode$1;

    iput-object p2, p0, Lmodmenu/GameMode$1$1;->val$state:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 89
    iget-object v0, p0, Lmodmenu/GameMode$1$1;->this$0:Lmodmenu/GameMode$1;

    iget-object v0, v0, Lmodmenu/GameMode$1;->val$app:Landroid/content/Context;

    iget-object v1, p0, Lmodmenu/GameMode$1$1;->val$state:Ljava/lang/String;

    invoke-static {v0, v1}, Lmodmenu/GameMode;->access$200(Landroid/content/Context;Ljava/lang/String;)V

    .line 90
    iget-object v0, p0, Lmodmenu/GameMode$1$1;->this$0:Lmodmenu/GameMode$1;

    iget-object v0, v0, Lmodmenu/GameMode$1;->val$done:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 91
    return-void
.end method
