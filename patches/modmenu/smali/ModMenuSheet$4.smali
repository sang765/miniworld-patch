.class Lmodmenu/ModMenuSheet$4;
.super Ljava/lang/Object;
.source "ModMenuSheet.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/ModMenuSheet;->build()V
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

    .line 263
    iput-object p1, p0, Lmodmenu/ModMenuSheet$4;->this$0:Lmodmenu/ModMenuSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 266
    iget-object p1, p0, Lmodmenu/ModMenuSheet$4;->this$0:Lmodmenu/ModMenuSheet;

    invoke-static {p1}, Lmodmenu/ModMenuSheet;->access$700(Lmodmenu/ModMenuSheet;)V

    .line 267
    return-void
.end method
