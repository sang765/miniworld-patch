.class final Lmodmenu/IdBrowser$Adapter;
.super Landroid/widget/BaseAdapter;
.source "IdBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmodmenu/IdBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Adapter"
.end annotation


# instance fields
.field final synthetic this$0:Lmodmenu/IdBrowser;


# direct methods
.method private constructor <init>(Lmodmenu/IdBrowser;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            null
        }
    .end annotation

    .line 902
    iput-object p1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lmodmenu/IdBrowser;Lmodmenu/IdBrowser$1;)V
    .locals 0

    .line 902
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser$Adapter;-><init>(Lmodmenu/IdBrowser;)V

    return-void
.end method

.method private buildList(Landroid/widget/LinearLayout;Lmodmenu/IdBrowser$Holder;)V
    .locals 8

    .line 976
    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/16 v1, 0xc

    invoke-static {v0, v1}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v0

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/16 v2, 0x8

    invoke-static {v1, v2}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v1

    iget-object v3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/4 v4, 0x4

    invoke-static {v3, v4}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v3

    iget-object v4, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v4, v2}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v2

    invoke-virtual {p1, v0, v1, v3, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 977
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 978
    const/16 v2, 0x1a

    invoke-static {v1, v2}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v1

    iget-object v3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v3, v2}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 979
    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/16 v2, 0xa

    invoke-static {v1, v2}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 980
    const/16 v1, 0x10

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 981
    const/16 v1, 0xe

    invoke-direct {p0, p2, v1}, Lmodmenu/IdBrowser$Adapter;->icon(Lmodmenu/IdBrowser$Holder;I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 982
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$2000(Lmodmenu/IdBrowser;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p2, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    .line 983
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 984
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 985
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$2100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v1

    iget v1, v1, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 986
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$2000(Lmodmenu/IdBrowser;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p2, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    .line 987
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    const/high16 v1, 0x41500000    # 13.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 988
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    iget-object v2, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v2}, Lmodmenu/IdBrowser;->access$2100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v2

    iget v2, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 989
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 990
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 991
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v3}, Lmodmenu/IdBrowser;->access$2000(Lmodmenu/IdBrowser;)Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v0, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 992
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 993
    iget-object v3, p2, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 994
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 997
    iget-object v4, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v4, v2}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v2

    iput v2, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 998
    iget-object v2, p2, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    invoke-virtual {v0, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 999
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    invoke-direct {v2, v4, v5, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1001
    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    iget-object v2, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v2}, Lmodmenu/IdBrowser;->access$2000(Lmodmenu/IdBrowser;)Landroid/app/Activity;

    move-result-object v2

    const-string v3, "id_copy"

    invoke-static {v2, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v3}, Lmodmenu/IdBrowser;->access$2100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v3

    iget v3, v3, Lmodmenu/Palette;->primary:I

    iget-object v6, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 1002
    invoke-static {v6}, Lmodmenu/IdBrowser;->access$2100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v6

    iget v6, v6, Lmodmenu/Palette;->primary:I

    const v7, 0xffffff

    and-int/2addr v6, v7

    const/high16 v7, 0x14000000

    or-int/2addr v6, v7

    .line 1001
    invoke-static {v0, v2, v4, v3, v6}, Lmodmenu/IdBrowser;->access$2500(Lmodmenu/IdBrowser;Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p2, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    .line 1003
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 1004
    iget-object p2, p2, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 1005
    const/16 v2, 0x20

    invoke-static {v1, v2}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v1

    invoke-direct {v0, v5, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1004
    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1006
    return-void
.end method

.method private buildTable(Landroid/widget/LinearLayout;Lmodmenu/IdBrowser$Holder;)V
    .locals 6

    .line 1014
    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/16 v1, 0xc

    invoke-static {v0, v1}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v0

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/4 v2, 0x6

    invoke-static {v1, v2}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v1

    iget-object v3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/4 v4, 0x4

    invoke-static {v3, v4}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v3

    iget-object v4, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v4, v2}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v2

    invoke-virtual {p1, v0, v1, v3, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 1015
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 1016
    const/16 v2, 0x14

    invoke-static {v1, v2}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v1

    iget-object v3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v3, v2}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1017
    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/16 v2, 0xa

    invoke-static {v1, v2}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 1018
    const/16 v1, 0x10

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 1019
    const/16 v1, 0xb

    invoke-direct {p0, p2, v1}, Lmodmenu/IdBrowser$Adapter;->icon(Lmodmenu/IdBrowser$Holder;I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1020
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$2000(Lmodmenu/IdBrowser;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p2, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    .line 1021
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1022
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 1023
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$2100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v1

    iget v1, v1, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1024
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 1025
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 1026
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 1027
    const/16 v4, 0x3a

    invoke-static {v3, v4}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v3

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1026
    invoke-virtual {p1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1028
    new-instance v0, Landroid/widget/TextView;

    iget-object v2, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v2}, Lmodmenu/IdBrowser;->access$2000(Lmodmenu/IdBrowser;)Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p2, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    .line 1029
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    const/high16 v2, 0x41500000    # 13.0f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1030
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    iget-object v2, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v2}, Lmodmenu/IdBrowser;->access$2100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v2

    iget v2, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1031
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 1032
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 1033
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, 0x0

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v2, v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p1, v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1035
    new-instance v0, Landroid/widget/TextView;

    iget-object v2, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v2}, Lmodmenu/IdBrowser;->access$2000(Lmodmenu/IdBrowser;)Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p2, Lmodmenu/IdBrowser$Holder;->cat:Landroid/widget/TextView;

    .line 1036
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->cat:Landroid/widget/TextView;

    const/high16 v2, 0x41300000    # 11.0f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1037
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->cat:Landroid/widget/TextView;

    iget-object v2, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v2}, Lmodmenu/IdBrowser;->access$2100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v2

    iget v2, v2, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1038
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->cat:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 1039
    iget-object v0, p2, Lmodmenu/IdBrowser$Holder;->cat:Landroid/widget/TextView;

    const v1, 0x800005

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 1040
    iget-object p2, p2, Lmodmenu/IdBrowser$Holder;->cat:Landroid/widget/TextView;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1043
    return-void
.end method

.method private icon(Lmodmenu/IdBrowser$Holder;I)Landroid/view/View;
    .locals 3

    .line 1047
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$2000(Lmodmenu/IdBrowser;)Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p1, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    .line 1048
    iget-object v0, p1, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    const-string v1, "\u2717"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1049
    iget-object v0, p1, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    int-to-float p2, p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1050
    iget-object p2, p1, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$2100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v0

    iget v0, v0, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1051
    iget-object p2, p1, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    const/16 v0, 0x11

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 1052
    iget-object p2, p1, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1053
    new-instance p2, Landroid/widget/ImageView;

    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$2000(Lmodmenu/IdBrowser;)Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p2, p1, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    .line 1054
    iget-object p2, p1, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1055
    iget-object p2, p1, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1056
    new-instance p2, Landroid/widget/FrameLayout;

    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$2000(Lmodmenu/IdBrowser;)Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 1057
    iget-object v0, p1, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1060
    iget-object p1, p1, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1063
    return-object p2
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 905
    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$800(Lmodmenu/IdBrowser;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 902
    invoke-virtual {p0, p1}, Lmodmenu/IdBrowser$Adapter;->getItem(I)Lmodmenu/IdBrowser$Row;

    move-result-object p1

    return-object p1
.end method

.method public getItem(I)Lmodmenu/IdBrowser$Row;
    .locals 1

    .line 910
    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$800(Lmodmenu/IdBrowser;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmodmenu/IdBrowser$Row;

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    .line 915
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    .line 920
    iget-object p3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p3}, Lmodmenu/IdBrowser;->access$800(Lmodmenu/IdBrowser;)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmodmenu/IdBrowser$Row;

    .line 921
    nop

    .line 922
    nop

    .line 923
    instance-of p3, p2, Landroid/widget/LinearLayout;

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    .line 924
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    instance-of p3, p3, Lmodmenu/IdBrowser$Holder;

    if-eqz p3, :cond_0

    .line 925
    check-cast p2, Landroid/widget/LinearLayout;

    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lmodmenu/IdBrowser$Holder;

    .line 928
    iget-boolean v1, p3, Lmodmenu/IdBrowser$Holder;->table:Z

    iget-object v2, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v2}, Lmodmenu/IdBrowser;->access$1500(Lmodmenu/IdBrowser;)Z

    move-result v2

    if-ne v1, v2, :cond_0

    .line 929
    nop

    .line 930
    goto :goto_0

    .line 933
    :cond_0
    move-object p2, v0

    move-object p3, p2

    :goto_0
    if-nez p3, :cond_2

    .line 934
    new-instance p2, Landroid/widget/LinearLayout;

    iget-object p3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p3}, Lmodmenu/IdBrowser;->access$2000(Lmodmenu/IdBrowser;)Landroid/app/Activity;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 935
    const/16 p3, 0x10

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 936
    new-instance p3, Landroid/graphics/drawable/RippleDrawable;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 937
    invoke-static {v1}, Lmodmenu/IdBrowser;->access$2100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v1

    iget v1, v1, Lmodmenu/Palette;->onSurface:I

    const v2, 0xffffff

    and-int/2addr v1, v2

    const/high16 v2, 0x14000000

    or-int/2addr v1, v2

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iget-object v2, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    iget-object v3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 938
    const/16 v4, 0xc

    invoke-static {v3, v4}, Lmodmenu/IdBrowser;->access$2200(Lmodmenu/IdBrowser;I)I

    move-result v3

    const/4 v4, -0x1

    invoke-static {v2, v3, v4}, Lmodmenu/IdBrowser;->access$2300(Lmodmenu/IdBrowser;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v2

    invoke-direct {p3, v1, v0, v2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 936
    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 939
    new-instance p3, Lmodmenu/IdBrowser$Holder;

    invoke-direct {p3, v0}, Lmodmenu/IdBrowser$Holder;-><init>(Lmodmenu/IdBrowser$1;)V

    .line 940
    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$1500(Lmodmenu/IdBrowser;)Z

    move-result v1

    iput-boolean v1, p3, Lmodmenu/IdBrowser$Holder;->table:Z

    .line 941
    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$1500(Lmodmenu/IdBrowser;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 942
    invoke-direct {p0, p2, p3}, Lmodmenu/IdBrowser$Adapter;->buildTable(Landroid/widget/LinearLayout;Lmodmenu/IdBrowser$Holder;)V

    goto :goto_1

    .line 944
    :cond_1
    invoke-direct {p0, p2, p3}, Lmodmenu/IdBrowser$Adapter;->buildList(Landroid/widget/LinearLayout;Lmodmenu/IdBrowser$Holder;)V

    .line 946
    :goto_1
    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 948
    :cond_2
    iget-object v1, p3, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    iget-object v2, p1, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v2, v2, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 949
    iget-object v1, p3, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    iget-object v2, p1, Lmodmenu/IdBrowser$Row;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 950
    iget-object v1, p3, Lmodmenu/IdBrowser$Holder;->cat:Landroid/widget/TextView;

    if-eqz v1, :cond_3

    .line 951
    iget-object v1, p3, Lmodmenu/IdBrowser$Holder;->cat:Landroid/widget/TextView;

    iget-object v2, p1, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v2, v2, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 953
    :cond_3
    iget-object v1, p1, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v1, v1, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    iget-object v2, p1, Lmodmenu/IdBrowser$Row;->e:Lmodmenu/IdScan$Entry;

    iget-object v2, v2, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-static {v1, v2}, Lmodmenu/IdIcons;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 954
    const/4 v2, 0x0

    const/16 v3, 0x8

    if-eqz v1, :cond_4

    .line 955
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 956
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 957
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    .line 959
    :cond_4
    iget-object v1, p3, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 960
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 961
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 963
    :goto_2
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    if-eqz v0, :cond_5

    .line 964
    iget-object p3, p3, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    new-instance v0, Lmodmenu/IdBrowser$Adapter$1;

    invoke-direct {v0, p0, p1}, Lmodmenu/IdBrowser$Adapter$1;-><init>(Lmodmenu/IdBrowser$Adapter;Lmodmenu/IdBrowser$Row;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 971
    :cond_5
    return-object p2
.end method
