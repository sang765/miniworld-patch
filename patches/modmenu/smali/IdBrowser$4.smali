.class Lmodmenu/IdBrowser$4;
.super Ljava/lang/Object;
.source "IdBrowser.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


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

    .line 167
    iput-object p1, p0, Lmodmenu/IdBrowser$4;->this$0:Lmodmenu/IdBrowser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 171
    iget-object p1, p0, Lmodmenu/IdBrowser$4;->this$0:Lmodmenu/IdBrowser;

    iget-object p2, p0, Lmodmenu/IdBrowser$4;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p2}, Lmodmenu/IdBrowser;->access$400(Lmodmenu/IdBrowser;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lmodmenu/IdScan$Entry;

    iget-object p2, p2, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-static {p1, p2}, Lmodmenu/IdBrowser;->access$500(Lmodmenu/IdBrowser;Ljava/lang/String;)V

    .line 172
    return-void
.end method
