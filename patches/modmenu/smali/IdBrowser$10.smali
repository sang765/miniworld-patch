.class Lmodmenu/IdBrowser$10;
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

    .line 437
    iput-object p1, p0, Lmodmenu/IdBrowser$10;->this$0:Lmodmenu/IdBrowser;

    iput-object p2, p0, Lmodmenu/IdBrowser$10;->val$activity:Lmodmenu/ModMenuActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 440
    iget-object p1, p0, Lmodmenu/IdBrowser$10;->this$0:Lmodmenu/IdBrowser;

    iget-object v0, p0, Lmodmenu/IdBrowser$10;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$1500(Lmodmenu/IdBrowser;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {p1, v0}, Lmodmenu/IdBrowser;->access$1502(Lmodmenu/IdBrowser;Z)Z

    .line 441
    iget-object p1, p0, Lmodmenu/IdBrowser$10;->val$activity:Lmodmenu/ModMenuActivity;

    const-string v0, "idbrowser"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lmodmenu/ModMenuActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 442
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object v0, p0, Lmodmenu/IdBrowser$10;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$1500(Lmodmenu/IdBrowser;)Z

    move-result v0

    const-string v1, "table"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 443
    iget-object p1, p0, Lmodmenu/IdBrowser$10;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p1}, Lmodmenu/IdBrowser;->access$1600(Lmodmenu/IdBrowser;)V

    .line 444
    return-void
.end method
