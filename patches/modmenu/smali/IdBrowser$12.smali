.class Lmodmenu/IdBrowser$12;
.super Ljava/lang/Object;
.source "IdBrowser.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/IdBrowser;->chip(Ljava/lang/String;Ljava/lang/String;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmodmenu/IdBrowser;

.field final synthetic val$value:Ljava/lang/String;


# direct methods
.method constructor <init>(Lmodmenu/IdBrowser;Ljava/lang/String;)V
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

    .line 652
    iput-object p1, p0, Lmodmenu/IdBrowser$12;->this$0:Lmodmenu/IdBrowser;

    iput-object p2, p0, Lmodmenu/IdBrowser$12;->val$value:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 655
    iget-object p1, p0, Lmodmenu/IdBrowser$12;->this$0:Lmodmenu/IdBrowser;

    iget-object v0, p0, Lmodmenu/IdBrowser$12;->val$value:Ljava/lang/String;

    invoke-static {p1, v0}, Lmodmenu/IdBrowser;->access$1802(Lmodmenu/IdBrowser;Ljava/lang/String;)Ljava/lang/String;

    .line 656
    iget-object p1, p0, Lmodmenu/IdBrowser$12;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p1}, Lmodmenu/IdBrowser;->access$1900(Lmodmenu/IdBrowser;)V

    .line 657
    iget-object p1, p0, Lmodmenu/IdBrowser$12;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p1}, Lmodmenu/IdBrowser;->access$700(Lmodmenu/IdBrowser;)V

    .line 658
    return-void
.end method
