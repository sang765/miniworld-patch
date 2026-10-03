.class public final Lmodmenu/AdReward;
.super Ljava/lang/Object;
.source "AdReward.java"


# static fields
.field private static final MAIN:Landroid/os/Handler;

.field private static volatile pending:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 22
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/AdReward;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    .line 21
    sput-boolean p0, Lmodmenu/AdReward;->pending:Z

    return p0
.end method

.method public static fire(II)V
    .locals 2

    .line 29
    sget-boolean v0, Lmodmenu/AdReward;->pending:Z

    if-eqz v0, :cond_0

    .line 30
    return-void

    .line 32
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lmodmenu/AdReward;->pending:Z

    .line 33
    sget-object v0, Lmodmenu/AdReward;->MAIN:Landroid/os/Handler;

    new-instance v1, Lmodmenu/AdReward$1;

    invoke-direct {v1, p0, p1}, Lmodmenu/AdReward$1;-><init>(II)V

    const-wide/16 p0, 0x320

    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 42
    return-void
.end method
