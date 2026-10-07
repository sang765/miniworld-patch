.class Lmodmenu/IdBrowser$Adapter$1;
.super Ljava/lang/Object;
.source "IdBrowser.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/IdBrowser$Adapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lmodmenu/IdBrowser$Adapter;

.field final synthetic val$r:Lmodmenu/IdBrowser$Row;


# direct methods
.method constructor <init>(Lmodmenu/IdBrowser$Adapter;Lmodmenu/IdBrowser$Row;)V
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

    .line 902
    iput-object p1, p0, Lmodmenu/IdBrowser$Adapter$1;->this$1:Lmodmenu/IdBrowser$Adapter;

    iput-object p2, p0, Lmodmenu/IdBrowser$Adapter$1;->val$r:Lmodmenu/IdBrowser$Row;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 905
    iget-object p1, p0, Lmodmenu/IdBrowser$Adapter$1;->this$1:Lmodmenu/IdBrowser$Adapter;

    iget-object p1, p1, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter$1;->val$r:Lmodmenu/IdBrowser$Row;

    iget-object v0, v0, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v0, v0, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-static {p1, v0}, Lmodmenu/IdBrowser;->access$900(Lmodmenu/IdBrowser;Ljava/lang/String;)V

    .line 906
    return-void
.end method
