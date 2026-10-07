.class final Lmodmenu/IdBrowser$Row;
.super Ljava/lang/Object;
.source "IdBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmodmenu/IdBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Row"
.end annotation


# instance fields
.field final e:Lmodmenu/IdScan$Entry;

.field final key:Ljava/lang/String;

.field final name:Ljava/lang/String;

.field final nf:Ljava/lang/String;


# direct methods
.method constructor <init>(Lmodmenu/IdScan$Entry;Ljava/lang/String;)V
    .locals 2

    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    iput-object p1, p0, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    .line 151
    iput-object p2, p0, Lmodmenu/IdBrowser$Row;->name:Ljava/lang/String;

    .line 152
    invoke-static {p2}, Lmodmenu/IdBrowser;->access$200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lmodmenu/IdBrowser$Row;->nf:Ljava/lang/String;

    .line 153
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lmodmenu/IdBrowser$Row;->nf:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v0, " "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object v1, p1, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-object p1, p1, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-static {p1}, Lmodmenu/IdBrowser;->access$200(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lmodmenu/IdBrowser$Row;->key:Ljava/lang/String;

    .line 154
    return-void
.end method
