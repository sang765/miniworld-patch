.class Lmodmenu/IdBrowser$1;
.super Ljava/lang/Object;
.source "IdBrowser.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmodmenu/IdBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lmodmenu/IdBrowser$Row;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 99
    check-cast p1, Lmodmenu/IdBrowser$Row;

    check-cast p2, Lmodmenu/IdBrowser$Row;

    invoke-virtual {p0, p1, p2}, Lmodmenu/IdBrowser$1;->compare(Lmodmenu/IdBrowser$Row;Lmodmenu/IdBrowser$Row;)I

    move-result p1

    return p1
.end method

.method public compare(Lmodmenu/IdBrowser$Row;Lmodmenu/IdBrowser$Row;)I
    .locals 9

    .line 102
    iget-object v0, p1, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v0, v0, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$000(Ljava/lang/String;)J

    move-result-wide v0

    iget-object v2, p2, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v2, v2, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-static {v2}, Lmodmenu/IdBrowser;->access$000(Ljava/lang/String;)J

    move-result-wide v2

    .line 103
    const/4 v4, 0x1

    const/4 v5, -0x1

    const-wide/16 v6, 0x0

    cmp-long v8, v0, v6

    if-ltz v8, :cond_2

    cmp-long v8, v2, v6

    if-ltz v8, :cond_2

    .line 104
    cmp-long p1, v0, v2

    if-gez p1, :cond_0

    const/4 v4, -0x1

    goto :goto_0

    :cond_0
    cmp-long p1, v0, v2

    if-nez p1, :cond_1

    const/4 v4, 0x0

    :cond_1
    :goto_0
    return v4

    .line 106
    :cond_2
    cmp-long v8, v0, v6

    if-ltz v8, :cond_3

    .line 107
    return v5

    .line 109
    :cond_3
    cmp-long v0, v2, v6

    if-ltz v0, :cond_4

    .line 110
    return v4

    .line 112
    :cond_4
    iget-object p1, p1, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object p1, p1, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    iget-object p2, p2, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object p2, p2, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    return p1
.end method
