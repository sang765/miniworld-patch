.class Lmodmenu/ModMenuActivity$1;
.super Ljava/lang/Object;
.source "ModMenuActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/ModMenuActivity;->buildMenu()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmodmenu/ModMenuActivity;


# direct methods
.method constructor <init>(Lmodmenu/ModMenuActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 148
    iput-object p1, p0, Lmodmenu/ModMenuActivity$1;->this$0:Lmodmenu/ModMenuActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 151
    iget-object p1, p0, Lmodmenu/ModMenuActivity$1;->this$0:Lmodmenu/ModMenuActivity;

    invoke-static {p1}, Lmodmenu/ModMenuActivity;->access$000(Lmodmenu/ModMenuActivity;)V

    .line 152
    return-void
.end method
