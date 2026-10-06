.class public final Lmodmenu/IdScan$Entry;
.super Ljava/lang/Object;
.source "IdScan.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmodmenu/IdScan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Entry"
.end annotation


# instance fields
.field public final cat:Ljava/lang/String;

.field public final id:Ljava/lang/String;

.field public final name:Ljava/lang/String;

.field public final src:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    iput-object p1, p0, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    .line 95
    iput-object p2, p0, Lmodmenu/IdScan$Entry;->name:Ljava/lang/String;

    .line 96
    iput-object p3, p0, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    .line 97
    iput-object p4, p0, Lmodmenu/IdScan$Entry;->src:Ljava/lang/String;

    .line 98
    return-void
.end method
