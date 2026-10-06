.class Lmodmenu/IdBrowser$6;
.super Ljava/lang/Object;
.source "IdBrowser.java"

# interfaces
.implements Lmodmenu/IdScan$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/IdBrowser;->scan()V
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

    .line 226
    iput-object p1, p0, Lmodmenu/IdBrowser$6;->this$0:Lmodmenu/IdBrowser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDone(Lmodmenu/IdScan$Result;)V
    .locals 2

    .line 229
    iget-object v0, p0, Lmodmenu/IdBrowser$6;->this$0:Lmodmenu/IdBrowser;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lmodmenu/IdBrowser;->access$602(Lmodmenu/IdBrowser;Z)Z

    .line 230
    iget-object v0, p0, Lmodmenu/IdBrowser$6;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$700(Lmodmenu/IdBrowser;)Landroid/widget/Button;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setAlpha(F)V

    .line 231
    iget-object v0, p0, Lmodmenu/IdBrowser$6;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0, p1}, Lmodmenu/IdBrowser;->access$802(Lmodmenu/IdBrowser;Lmodmenu/IdScan$Result;)Lmodmenu/IdScan$Result;

    .line 232
    iget-object v0, p0, Lmodmenu/IdBrowser$6;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$900(Lmodmenu/IdBrowser;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 233
    iget-object v0, p1, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 234
    iget-object v0, p0, Lmodmenu/IdBrowser$6;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$900(Lmodmenu/IdBrowser;)Ljava/util/List;

    move-result-object v0

    iget-object p1, p1, Lmodmenu/IdScan$Result;->entries:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 236
    :cond_0
    iget-object p1, p0, Lmodmenu/IdBrowser$6;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p1}, Lmodmenu/IdBrowser;->access$1000(Lmodmenu/IdBrowser;)V

    .line 237
    iget-object p1, p0, Lmodmenu/IdBrowser$6;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p1}, Lmodmenu/IdBrowser;->access$200(Lmodmenu/IdBrowser;)V

    .line 238
    return-void
.end method
