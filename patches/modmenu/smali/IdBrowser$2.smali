.class Lmodmenu/IdBrowser$2;
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

    .line 118
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

    .line 118
    check-cast p1, Lmodmenu/IdBrowser$Row;

    check-cast p2, Lmodmenu/IdBrowser$Row;

    invoke-virtual {p0, p1, p2}, Lmodmenu/IdBrowser$2;->compare(Lmodmenu/IdBrowser$Row;Lmodmenu/IdBrowser$Row;)I

    move-result p1

    return p1
.end method

.method public compare(Lmodmenu/IdBrowser$Row;Lmodmenu/IdBrowser$Row;)I
    .locals 2

    .line 121
    iget-object v0, p1, Lmodmenu/IdBrowser$Row;->nf:Ljava/lang/String;

    iget-object v1, p2, Lmodmenu/IdBrowser$Row;->nf:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 122
    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lmodmenu/IdBrowser;->access$100()Ljava/util/Comparator;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    :goto_0
    return v0
.end method
