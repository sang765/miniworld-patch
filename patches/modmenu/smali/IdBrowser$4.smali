.class Lmodmenu/IdBrowser$4;
.super Ljava/lang/Object;
.source "IdBrowser.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lmodmenu/IdBrowser;-><init>(Lmodmenu/ModMenuActivity;Lmodmenu/Palette;Landroid/widget/FrameLayout;)V
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

    .line 145
    iput-object p1, p0, Lmodmenu/IdBrowser$4;->this$0:Lmodmenu/IdBrowser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1

    .line 154
    iget-object v0, p0, Lmodmenu/IdBrowser$4;->this$0:Lmodmenu/IdBrowser;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lmodmenu/IdBrowser;->access$302(Lmodmenu/IdBrowser;Ljava/lang/String;)Ljava/lang/String;

    .line 155
    iget-object p1, p0, Lmodmenu/IdBrowser$4;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p1}, Lmodmenu/IdBrowser;->access$400(Lmodmenu/IdBrowser;)V

    .line 156
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 147
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    .line 150
    return-void
.end method
