.class Lmodmenu/ModMenuSheet$10;
.super Ljava/lang/Object;
.source "ModMenuSheet.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/ModMenuSheet;->openBrowser()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmodmenu/ModMenuSheet;


# direct methods
.method constructor <init>(Lmodmenu/ModMenuSheet;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 759
    iput-object p1, p0, Lmodmenu/ModMenuSheet$10;->this$0:Lmodmenu/ModMenuSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 764
    iget-object v0, p0, Lmodmenu/ModMenuSheet$10;->this$0:Lmodmenu/ModMenuSheet;

    invoke-static {v0}, Lmodmenu/ModMenuSheet;->access$600(Lmodmenu/ModMenuSheet;)Landroid/app/Dialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->cancel()V

    .line 765
    return-void
.end method
