.class Lmodmenu/IdBrowser$6;
.super Ljava/lang/Object;
.source "IdBrowser.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/IdBrowser;-><init>(Lmodmenu/ModMenuActivity;Lmodmenu/Palette;Landroid/widget/FrameLayout;)V
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

    .line 196
    iput-object p1, p0, Lmodmenu/IdBrowser$6;->this$0:Lmodmenu/IdBrowser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 199
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 200
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lmodmenu/IdBrowser$6;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$400(Lmodmenu/IdBrowser;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 201
    if-lez v0, :cond_0

    .line 202
    const/16 v1, 0xa

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 204
    :cond_0
    iget-object v1, p0, Lmodmenu/IdBrowser$6;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$400(Lmodmenu/IdBrowser;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmodmenu/IdScan$Entry;

    iget-object v1, v1, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 206
    :cond_1
    iget-object v0, p0, Lmodmenu/IdBrowser$6;->this$0:Lmodmenu/IdBrowser;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lmodmenu/IdBrowser;->access$500(Lmodmenu/IdBrowser;Ljava/lang/String;)V

    .line 207
    return-void
.end method
