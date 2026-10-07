.class Lmodmenu/IdBrowser$9;
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

.field final synthetic val$activity:Lmodmenu/ModMenuActivity;


# direct methods
.method constructor <init>(Lmodmenu/IdBrowser;Lmodmenu/ModMenuActivity;)V
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

    .line 378
    iput-object p1, p0, Lmodmenu/IdBrowser$9;->this$0:Lmodmenu/IdBrowser;

    iput-object p2, p0, Lmodmenu/IdBrowser$9;->val$activity:Lmodmenu/ModMenuActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 381
    iget-object p1, p0, Lmodmenu/IdBrowser$9;->this$0:Lmodmenu/IdBrowser;

    iget-object v0, p0, Lmodmenu/IdBrowser$9;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {}, Lmodmenu/IdBrowser;->access$1200()[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    rem-int/2addr v0, v1

    invoke-static {p1, v0}, Lmodmenu/IdBrowser;->access$1102(Lmodmenu/IdBrowser;I)I

    .line 382
    iget-object p1, p0, Lmodmenu/IdBrowser$9;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p1}, Lmodmenu/IdBrowser;->access$1300(Lmodmenu/IdBrowser;)Landroid/widget/Button;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u21c5 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lmodmenu/IdBrowser;->access$1200()[Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lmodmenu/IdBrowser$9;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v2}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 383
    iget-object p1, p0, Lmodmenu/IdBrowser$9;->val$activity:Lmodmenu/ModMenuActivity;

    const-string v0, "idbrowser"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lmodmenu/ModMenuActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 384
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object v0, p0, Lmodmenu/IdBrowser$9;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)I

    move-result v0

    const-string v1, "sort"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 385
    iget-object p1, p0, Lmodmenu/IdBrowser$9;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p1}, Lmodmenu/IdBrowser;->access$1400(Lmodmenu/IdBrowser;)V

    .line 386
    iget-object p1, p0, Lmodmenu/IdBrowser$9;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p1}, Lmodmenu/IdBrowser;->access$700(Lmodmenu/IdBrowser;)V

    .line 387
    return-void
.end method
