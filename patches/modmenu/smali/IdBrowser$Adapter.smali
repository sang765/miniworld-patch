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

    .line 525
    iput-object p1, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lmodmenu/IdBrowser;Lmodmenu/IdBrowser$1;)V
    .locals 0

    .line 525
    invoke-direct {p0, p1}, Lmodmenu/IdBrowser$Adapter;-><init>(Lmodmenu/IdBrowser;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .line 528
    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$500(Lmodmenu/IdBrowser;)Ljava/util/List;

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

    .line 525
    invoke-virtual {p0, p1}, Lmodmenu/IdBrowser$Adapter;->getItem(I)Lmodmenu/IdScan$Entry;

    move-result-object p1

    return-object p1
.end method

.method public getItem(I)Lmodmenu/IdScan$Entry;
    .locals 1

    .line 533
    iget-object v0, p0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v0}, Lmodmenu/IdBrowser;->access$500(Lmodmenu/IdBrowser;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmodmenu/IdScan$Entry;

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    .line 538
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 16

    .line 543
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-object v2, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v2}, Lmodmenu/IdBrowser;->access$500(Lmodmenu/IdBrowser;)Ljava/util/List;

    move-result-object v2

    move/from16 v3, p1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmodmenu/IdScan$Entry;

    .line 546
    instance-of v3, v1, Landroid/widget/LinearLayout;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v6, 0x8

    if-eqz v3, :cond_0

    .line 547
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    instance-of v3, v3, Lmodmenu/IdBrowser$Holder;

    if-eqz v3, :cond_0

    .line 548
    check-cast v1, Landroid/widget/LinearLayout;

    .line 549
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmodmenu/IdBrowser$Holder;

    goto/16 :goto_0

    .line 551
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v3, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v3}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 552
    const/16 v3, 0x10

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 553
    iget-object v7, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/16 v8, 0xc

    invoke-static {v7, v8}, Lmodmenu/IdBrowser;->access$1200(Lmodmenu/IdBrowser;I)I

    move-result v7

    iget-object v9, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v9, v6}, Lmodmenu/IdBrowser;->access$1200(Lmodmenu/IdBrowser;I)I

    move-result v9

    iget-object v10, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/4 v11, 0x4

    invoke-static {v10, v11}, Lmodmenu/IdBrowser;->access$1200(Lmodmenu/IdBrowser;I)I

    move-result v10

    iget-object v11, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v11, v6}, Lmodmenu/IdBrowser;->access$1200(Lmodmenu/IdBrowser;I)I

    move-result v11

    invoke-virtual {v1, v7, v9, v10, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 554
    new-instance v7, Landroid/graphics/drawable/RippleDrawable;

    iget-object v9, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 555
    invoke-static {v9}, Lmodmenu/IdBrowser;->access$1300(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v9

    iget v9, v9, Lmodmenu/Palette;->onSurface:I

    const v10, 0xffffff

    and-int/2addr v9, v10

    const/high16 v11, 0x14000000

    or-int/2addr v9, v11

    invoke-static {v9}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v9

    iget-object v12, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    iget-object v13, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 556
    invoke-static {v13, v8}, Lmodmenu/IdBrowser;->access$1200(Lmodmenu/IdBrowser;I)I

    move-result v8

    const/4 v13, -0x1

    invoke-static {v12, v8, v13}, Lmodmenu/IdBrowser;->access$1400(Lmodmenu/IdBrowser;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v8

    invoke-direct {v7, v9, v4, v8}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 554
    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 557
    new-instance v7, Lmodmenu/IdBrowser$Holder;

    invoke-direct {v7, v4}, Lmodmenu/IdBrowser$Holder;-><init>(Lmodmenu/IdBrowser$1;)V

    .line 558
    new-instance v8, Landroid/widget/TextView;

    iget-object v9, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v9}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v8, v7, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    .line 559
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    const/high16 v9, 0x41600000    # 14.0f

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 560
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    sget-object v12, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 561
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    iget-object v12, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v12}, Lmodmenu/IdBrowser;->access$1300(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v12

    iget v12, v12, Lmodmenu/Palette;->onSurface:I

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 562
    new-instance v8, Landroid/widget/TextView;

    iget-object v12, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v12}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object v12

    invoke-direct {v8, v12}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v8, v7, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    .line 563
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    const/high16 v12, 0x41500000    # 13.0f

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setTextSize(F)V

    .line 564
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    iget-object v14, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v14}, Lmodmenu/IdBrowser;->access$1300(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v14

    iget v14, v14, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v8, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 565
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    const/4 v14, 0x1

    invoke-virtual {v8, v14}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 566
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    sget-object v15, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v8, v15}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 567
    new-instance v8, Landroid/widget/TextView;

    iget-object v15, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v15}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object v15

    invoke-direct {v8, v15}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v8, v7, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    .line 568
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    const-string v15, "\u2717"

    invoke-virtual {v8, v15}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 569
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextSize(F)V

    .line 570
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    iget-object v9, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v9}, Lmodmenu/IdBrowser;->access$1300(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v9

    iget v9, v9, Lmodmenu/Palette;->onSurfaceVariant:I

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 571
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    const/16 v9, 0x11

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setGravity(I)V

    .line 572
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 573
    new-instance v8, Landroid/widget/ImageView;

    iget-object v9, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v9}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v8, v7, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    .line 574
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    sget-object v9, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 575
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    invoke-virtual {v8, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 576
    new-instance v8, Landroid/widget/FrameLayout;

    iget-object v9, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v9}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 577
    iget-object v9, v7, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    new-instance v15, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v15, v13, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v9, v15}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 580
    iget-object v9, v7, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    new-instance v15, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v15, v13, v13}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v9, v15}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 583
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v15, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 584
    const p1, 0xffffff

    const/16 v10, 0x1a

    invoke-static {v15, v10}, Lmodmenu/IdBrowser;->access$1200(Lmodmenu/IdBrowser;I)I

    move-result v15

    const/high16 p2, 0x14000000

    iget-object v11, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v11, v10}, Lmodmenu/IdBrowser;->access$1200(Lmodmenu/IdBrowser;I)I

    move-result v10

    invoke-direct {v9, v15, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 585
    iget-object v10, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    const/16 v11, 0xa

    invoke-static {v10, v11}, Lmodmenu/IdBrowser;->access$1200(Lmodmenu/IdBrowser;I)I

    move-result v10

    iput v10, v9, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 586
    iput v3, v9, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 587
    invoke-virtual {v1, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 588
    new-instance v3, Landroid/widget/LinearLayout;

    iget-object v8, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v8}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object v8

    invoke-direct {v3, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 589
    invoke-virtual {v3, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 590
    iget-object v8, v7, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    invoke-virtual {v3, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 591
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x2

    invoke-direct {v8, v13, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 594
    iget-object v10, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v10, v14}, Lmodmenu/IdBrowser;->access$1200(Lmodmenu/IdBrowser;I)I

    move-result v10

    iput v10, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 595
    iget-object v10, v7, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    invoke-virtual {v3, v10, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 596
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v8, v5, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v3, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 598
    iget-object v3, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    iget-object v8, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v8}, Lmodmenu/IdBrowser;->access$1100(Lmodmenu/IdBrowser;)Lmodmenu/ModMenuActivity;

    move-result-object v8

    const-string v10, "id_copy"

    invoke-static {v8, v10}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iget-object v10, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v10}, Lmodmenu/IdBrowser;->access$1300(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v10

    iget v10, v10, Lmodmenu/Palette;->primary:I

    iget-object v11, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 599
    invoke-static {v11}, Lmodmenu/IdBrowser;->access$1300(Lmodmenu/IdBrowser;)Lmodmenu/Palette;

    move-result-object v11

    iget v11, v11, Lmodmenu/Palette;->primary:I

    and-int v11, v11, p1

    or-int v11, v11, p2

    .line 598
    invoke-static {v3, v8, v5, v10, v11}, Lmodmenu/IdBrowser;->access$1600(Lmodmenu/IdBrowser;Ljava/lang/String;III)Landroid/widget/Button;

    move-result-object v3

    iput-object v3, v7, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    .line 600
    iget-object v3, v7, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    invoke-virtual {v3, v12}, Landroid/widget/Button;->setTextSize(F)V

    .line 601
    iget-object v3, v7, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v10, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    .line 602
    const/16 v11, 0x20

    invoke-static {v10, v11}, Lmodmenu/IdBrowser;->access$1200(Lmodmenu/IdBrowser;I)I

    move-result v10

    invoke-direct {v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 601
    invoke-virtual {v1, v3, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 603
    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    move-object v3, v7

    .line 605
    :goto_0
    iget-object v7, v3, Lmodmenu/IdBrowser$Holder;->id:Landroid/widget/TextView;

    iget-object v8, v2, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 606
    iget-object v7, v3, Lmodmenu/IdBrowser$Holder;->name:Landroid/widget/TextView;

    iget-object v8, v0, Lmodmenu/IdBrowser$Adapter;->this$0:Lmodmenu/IdBrowser;

    invoke-static {v8, v2}, Lmodmenu/IdBrowser;->access$1700(Lmodmenu/IdBrowser;Lmodmenu/IdScan$Entry;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 607
    iget-object v7, v2, Lmodmenu/IdScan$Entry;->cat:Ljava/lang/String;

    iget-object v8, v2, Lmodmenu/IdScan$Entry;->id:Ljava/lang/String;

    invoke-static {v7, v8}, Lmodmenu/IdIcons;->get(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v7

    .line 608
    if-eqz v7, :cond_1

    .line 609
    iget-object v4, v3, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    invoke-virtual {v4, v7}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 610
    iget-object v4, v3, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 611
    iget-object v4, v3, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 613
    :cond_1
    iget-object v7, v3, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    invoke-virtual {v7, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 614
    iget-object v4, v3, Lmodmenu/IdBrowser$Holder;->pic:Landroid/widget/ImageView;

    invoke-virtual {v4, v6}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 615
    iget-object v4, v3, Lmodmenu/IdBrowser$Holder;->none:Landroid/widget/TextView;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 617
    :goto_1
    iget-object v3, v3, Lmodmenu/IdBrowser$Holder;->copy:Landroid/widget/Button;

    new-instance v4, Lmodmenu/IdBrowser$Adapter$1;

    invoke-direct {v4, v0, v2}, Lmodmenu/IdBrowser$Adapter$1;-><init>(Lmodmenu/IdBrowser$Adapter;Lmodmenu/IdScan$Entry;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 623
    return-object v1
.end method
