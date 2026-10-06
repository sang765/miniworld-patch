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

    .line 445
    iput-object p1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lmodmenu/IdBrowser;Lmodmenu/IdBrowser$1;)V
    .locals 0

    .line 445
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser$Adapter;-><init>(Lmodmenu/IdBrowser;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 448
    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$400(Lmodmenu/IdBrowser;)Ljava/util/List;

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

    .line 445
    invoke-virtual {p0, p1}, Lmodmenu/IdBrowser$Adapter;->getItem(I)Lmodmenu/IdScan$Entry;

    move-result-object p1

    return-object p1
.end method

.method public getItem(I)Lmodmenu/IdScan$Entry;
    .locals 1

    .line 453
    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$400(Lmodmenu/IdBrowser;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmodmenu/IdScan$Entry;

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    .line 458
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9

    .line 463
    iget-object p3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p3}, Lmodmenu/IdBrowser;->access$400(Lmodmenu/IdBrowser;)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmodmenu/IdScan$Entry;

    .line 466
    instance-of p3, p2, Landroid/widget/LinearLayout;

    if-eqz p3, :cond_0

    .line 467
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    instance-of p3, p3, Lmodmenu/IdBrowser$Holder;

    if-eqz p3, :cond_0

    .line 468
    check-cast p2, Landroid/widget/LinearLayout;

    .line 469
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lmodmenu/IdBrowser$Holder;

    goto/16 :goto_0

    .line 471
    :cond_0
    new-instance p2, Landroid/widget/LinearLayout;

    iget-object p3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {p3}, Lmodmenu/IdBrowser;->access$900(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object p3

    invoke-direct {p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 472
    const/16 p3, 0x10

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 473
    iget-object p3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/16 v0, 0xc

    invoke-static {p3, v0}, Lmodmenu/IdBrowser;->access$1000(Lmodmenu/IdBrowser;I)I

    move-result p3

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/16 v2, 0x8

    invoke-static {v1, v2}, Lmodmenu/IdBrowser;->access$1000(Lmodmenu/IdBrowser;I)I

    move-result v1

    iget-object v3, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/4 v4, 0x4

    invoke-static {v3, v4}, Lmodmenu/IdBrowser;->access$1000(Lmodmenu/IdBrowser;I)I

    move-result v3

    iget-object v4, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v4, v2}, Lmodmenu/IdBrowser;->access$1000(Lmodmenu/IdBrowser;I)I

    move-result v2

    invoke-virtual {p2, p3, v1, v3, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 474
    new-instance p3, Landroid/graphics/drawable/RippleDrawable;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 475
    invoke-static {v1}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v1

    iget v1, v1, Lmodmenu/Palette;->onSurface:I

    const v2, 0xffffff

    and-int/2addr v1, v2

    const/high16 v3, 0x14000000

    or-int/2addr v1, v3

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iget-object v4, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    iget-object v5, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 476
    invoke-static {v5, v0}, Lmodmenu/IdBrowser;->access$1000(Lmodmenu/IdBrowser;I)I

    move-result v0

    const/4 v5, -0x1

    invoke-static {v4, v0, v5}, Lmodmenu/IdBrowser;->access$1200(Lmodmenu/IdBrowser;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    const/4 v4, 0x0

    invoke-direct {p3, v1, v4, v0}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 474
    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 477
    new-instance p3, Lmodmenu/IdBrowser$Holder;

    invoke-direct {p3, v4}, Lmodmenu/IdBrowser$Holder;-><init>(Lmodmenu/IdBrowser$1;)V

    .line 478
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$900(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p3, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    .line 479
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    const/high16 v1, 0x41600000    # 14.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 480
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    sget-object v1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 481
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v1

    iget v1, v1, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 482
    new-instance v0, Landroid/widget/TextView;

    iget-object v1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v1}, Lmodmenu/IdBrowser;->access$900(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p3, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    .line 483
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    const/high16 v1, 0x41500000    # 13.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 484
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    iget-object v4, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v4}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v4

    iget v4, v4, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 485
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 486
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 487
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v6, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v6}, Lmodmenu/IdBrowser;->access$900(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object v6

    invoke-direct {v0, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 488
    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 489
    iget-object v6, p3, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 490
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    invoke-direct {v6, v5, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 493
    iget-object v5, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v5, v4}, Lmodmenu/IdBrowser;->access$1000(Lmodmenu/IdBrowser;I)I

    move-result v4

    iput v4, v6, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 494
    iget-object v4, p3, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    invoke-virtual {v0, v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 495
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    invoke-direct {v4, v6, v7, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p2, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 497
    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    iget-object v4, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v4}, Lmodmenu/IdBrowser;->access$900(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object v4

    const-string v5, "id_copy"

    invoke-static {v4, v5}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v5}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v5

    iget v5, v5, Lmodmenu/Palette;->primary:I

    iget-object v8, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 498
    invoke-static {v8}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v8

    iget v8, v8, Lmodmenu/Palette;->primary:I

    and-int/2addr v2, v8

    or-int/2addr v2, v3

    .line 497
    invoke-static {v0, v4, v6, v5, v2}, Lmodmenu/IdBrowser;->access$1400(Lmodmenu/IdBrowser;Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v0

    iput-object v0, p3, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    .line 499
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextSize(F)V

    .line 500
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v2, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 501
    const/16 v3, 0x20

    invoke-static {v2, v3}, Lmodmenu/IdBrowser;->access$1000(Lmodmenu/IdBrowser;I)I

    move-result v2

    invoke-direct {v1, v7, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 500
    invoke-virtual {p2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 502
    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 504
    :goto_0
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    iget-object v1, p1, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 505
    iget-object v0, p3, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    iget-object v1, p1, Lmodmenu/IdScan$Entry;->name:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v1, p1, Lmodmenu/IdScan$Entry;->name:Ljava/lang/String;

    goto :goto_1

    :cond_1
    iget-object v1, p1, Lmodmenu/IdScan$Entry;->src:Ljava/lang/String;

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 506
    iget-object p3, p3, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    new-instance v0, Lmodmenu/IdBrowser$Adapter$1;

    invoke-direct {v0, p0, p1}, Lmodmenu/IdBrowser$Adapter$1;-><init>(Lmodmenu/IdBrowser$Adapter;Lmodmenu/IdScan$Entry;)V

    invoke-virtual {p3, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 512
    return-object p2
.end method
