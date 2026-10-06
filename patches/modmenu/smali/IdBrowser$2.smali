.class Lmodmenu/IdBrowser$2;
.super Ljava/lang/Object;
.source "IdBrowser.java"

# interfaces
.implements Lmodmenu/IdScan$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmodmenu/IdBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmodmenu/IdBrowser;


# direct methods
.method constructor <init>(Lmodmenu/IdBrowser;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 122
    iput-object p1, p0, Lmodmenu/IdBrowser$2;->this$0:Lmodmenu/IdBrowser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDone(Lmodmenu/IdScan$Result;)V
    .locals 1

    .line 125
    iget-object v0, p0, Lmodmenu/IdBrowser$2;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0, p1}, Lmodmenu/IdBrowser;->access$200(Lmodmenu/IdBrowser;Lmodmenu/IdScan$Result;)V

    .line 126
    return-void
.end method
