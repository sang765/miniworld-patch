.class public final Lmodmenu/IdScan$Result;
.super Ljava/lang/Object;
.source "IdScan.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmodmenu/IdScan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field public final entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lmodmenu/IdScan$Entry;",
            ">;"
        }
    .end annotation
.end field

.field public final error:Ljava/lang/String;

.field public final globals:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final inMap:Z

.field public final methods:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final notes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZLjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lmodmenu/IdScan$Entry;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput-object p1, p0, Lmodmenu/IdScan$Result;->entries:Ljava/util/List;

    .line 102
    iput-object p2, p0, Lmodmenu/IdScan$Result;->globals:Ljava/util/List;

    .line 103
    iput-object p3, p0, Lmodmenu/IdScan$Result;->methods:Ljava/util/List;

    .line 104
    iput-object p4, p0, Lmodmenu/IdScan$Result;->notes:Ljava/util/List;

    .line 105
    iput-boolean p5, p0, Lmodmenu/IdScan$Result;->inMap:Z

    .line 106
    iput-object p6, p0, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    .line 107
    return-void
.end method

.method static fail(Ljava/lang/String;)Lmodmenu/IdScan$Result;
    .locals 7

    .line 110
    new-instance v0, Lmodmenu/IdScan$Result;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    move-object v6, p0

    invoke-direct/range {v0 .. v6}, Lmodmenu/IdScan$Result;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZLjava/lang/String;)V

    return-object v0
.end method
