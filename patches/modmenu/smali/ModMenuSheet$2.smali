.class Lmodmenu/ModMenuSheet$2;
.super Ljava/lang/Object;
.source "ModMenuSheet.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


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

.field final synthetic val$host:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lmodmenu/ModMenuSheet;Landroid/app/Activity;)V
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

    .line 120
    iput-object p1, p0, Lmodmenu/ModMenuSheet$2;->this$0:Lmodmenu/ModMenuSheet;

    iput-object p2, p0, Lmodmenu/ModMenuSheet$2;->val$host:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 126
    const/4 p1, 0x0

    invoke-static {p1}, Lmodmenu/IdScan;->setListener(Lmodmenu/IdScan$Listener;)V

    .line 127
    iget-object v0, p0, Lmodmenu/ModMenuSheet$2;->val$host:Landroid/app/Activity;

    invoke-static {v0}, Lmodmenu/IdScan;->menuClosed(Landroid/content/Context;)V

    .line 128
    invoke-static {p1}, Lmodmenu/ModMenuSheet;->access$302(Lmodmenu/ModMenuSheet;)Lmodmenu/ModMenuSheet;

    .line 129
    iget-object p1, p0, Lmodmenu/ModMenuSheet$2;->val$host:Landroid/app/Activity;

    instance-of p1, p1, Lmodmenu/ModMenuActivity;

    if-eqz p1, :cond_0

    .line 130
    iget-object p1, p0, Lmodmenu/ModMenuSheet$2;->val$host:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    .line 132
    :cond_0
    return-void
.end method
