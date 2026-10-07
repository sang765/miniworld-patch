.class Lmodmenu/IdBrowser$13;
.super Ljava/lang/Object;
.source "IdBrowser.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/IdBrowser;->applyFilter()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmodmenu/IdBrowser;


# direct methods
.method constructor <init>(Lmodmenu/IdBrowser;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 703
    iput-object p1, p0, Lmodmenu/IdBrowser$13;->this$0:Lmodmenu/IdBrowser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 706
    iget-object v0, p0, Lmodmenu/IdBrowser$13;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$1000(Lmodmenu/IdBrowser;)V

    .line 707
    return-void
.end method
