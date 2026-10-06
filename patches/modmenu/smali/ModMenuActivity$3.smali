.class Lmodmenu/ModMenuActivity$3;
.super Ljava/lang/Object;
.source "ModMenuActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/ModMenuActivity;->slideSheetUp()V
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

    .line 243
    iput-object p1, p0, Lmodmenu/ModMenuActivity$3;->this$0:Lmodmenu/ModMenuActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 248
    iget-object v0, p0, Lmodmenu/ModMenuActivity$3;->this$0:Lmodmenu/ModMenuActivity;

    invoke-static {v0}, Lmodmenu/ModMenuActivity;->access$100(Lmodmenu/ModMenuActivity;)Landroid/widget/LinearLayout;

    move-result-object v0

    iget-object v1, p0, Lmodmenu/ModMenuActivity$3;->this$0:Lmodmenu/ModMenuActivity;

    .line 249
    invoke-static {v1}, Lmodmenu/ModMenuActivity;->access$100(Lmodmenu/ModMenuActivity;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v1, v2, v3

    const/4 v1, 0x1

    const/4 v3, 0x0

    aput v3, v2, v1

    .line 248
    const-string v1, "translationY"

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 250
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 251
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 252
    new-instance v1, Landroid/view/animation/PathInterpolator;

    const v2, 0x3d4ccccd    # 0.05f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v3, v3, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 254
    :cond_0
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 255
    return-void
.end method
