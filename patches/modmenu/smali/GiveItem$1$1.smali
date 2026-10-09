.class Lmodmenu/GiveItem$1$1;
.super Ljava/lang/Object;
.source "GiveItem.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/GiveItem$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmodmenu/GiveItem$1;

.field final synthetic val$code:Ljava/lang/String;

.field final synthetic val$out:Ljava/lang/String;


# direct methods
.method constructor <init>(Lmodmenu/GiveItem$1;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 123
    iput-object p1, p0, Lmodmenu/GiveItem$1$1;->this$0:Lmodmenu/GiveItem$1;

    iput-object p2, p0, Lmodmenu/GiveItem$1$1;->val$out:Ljava/lang/String;

    iput-object p3, p0, Lmodmenu/GiveItem$1$1;->val$code:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 126
    iget-object v0, p0, Lmodmenu/GiveItem$1$1;->this$0:Lmodmenu/GiveItem$1;

    iget-object v0, v0, Lmodmenu/GiveItem$1;->val$app:Landroid/content/Context;

    iget-object v1, p0, Lmodmenu/GiveItem$1$1;->val$out:Ljava/lang/String;

    iget-object v2, p0, Lmodmenu/GiveItem$1$1;->val$code:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lmodmenu/GiveItem;->access$400(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lmodmenu/GiveItem$1$1;->this$0:Lmodmenu/GiveItem$1;

    iget-object v0, v0, Lmodmenu/GiveItem$1;->val$done:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 128
    return-void
.end method
