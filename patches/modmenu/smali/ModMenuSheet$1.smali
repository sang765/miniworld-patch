.class Lmodmenu/ModMenuSheet$1;
.super Landroid/app/Dialog;
.source "ModMenuSheet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/ModMenuSheet;-><init>(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmodmenu/ModMenuSheet;


# direct methods
.method constructor <init>(Lmodmenu/ModMenuSheet;Landroid/content/Context;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .line 122
    iput-object p1, p0, Lmodmenu/ModMenuSheet$1;->this$0:Lmodmenu/ModMenuSheet;

    invoke-direct {p0, p2, p3}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 2

    .line 129
    iget-object v0, p0, Lmodmenu/ModMenuSheet$1;->this$0:Lmodmenu/ModMenuSheet;

    invoke-static {v0}, Lmodmenu/ModMenuSheet;->access$000(Lmodmenu/ModMenuSheet;)Landroid/view/View;

    move-result-object v0

    .line 133
    iget-object v1, p0, Lmodmenu/ModMenuSheet$1;->this$0:Lmodmenu/ModMenuSheet;

    .line 129
    if-eqz v0, :cond_0

    .line 130
    invoke-static {v1}, Lmodmenu/ModMenuSheet;->access$100(Lmodmenu/ModMenuSheet;)V

    .line 131
    return-void

    .line 133
    :cond_0
    invoke-static {v1}, Lmodmenu/ModMenuSheet;->access$200(Lmodmenu/ModMenuSheet;)Landroid/view/View;

    move-result-object v0

    .line 137
    iget-object v1, p0, Lmodmenu/ModMenuSheet$1;->this$0:Lmodmenu/ModMenuSheet;

    .line 133
    if-eqz v0, :cond_1

    .line 134
    invoke-static {v1}, Lmodmenu/ModMenuSheet;->access$300(Lmodmenu/ModMenuSheet;)V

    .line 135
    return-void

    .line 137
    :cond_1
    invoke-static {v1}, Lmodmenu/ModMenuSheet;->access$400(Lmodmenu/ModMenuSheet;)Lmodmenu/IdBrowser;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lmodmenu/ModMenuSheet$1;->this$0:Lmodmenu/ModMenuSheet;

    invoke-static {v0}, Lmodmenu/ModMenuSheet;->access$400(Lmodmenu/ModMenuSheet;)Lmodmenu/IdBrowser;

    move-result-object v0

    invoke-virtual {v0}, Lmodmenu/IdBrowser;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 138
    iget-object v0, p0, Lmodmenu/ModMenuSheet$1;->this$0:Lmodmenu/ModMenuSheet;

    invoke-static {v0}, Lmodmenu/ModMenuSheet;->access$400(Lmodmenu/ModMenuSheet;)Lmodmenu/IdBrowser;

    move-result-object v0

    invoke-virtual {v0}, Lmodmenu/IdBrowser;->close()V

    .line 139
    return-void

    .line 141
    :cond_2
    invoke-virtual {p0}, Lmodmenu/ModMenuSheet$1;->cancel()V

    .line 142
    return-void
.end method
