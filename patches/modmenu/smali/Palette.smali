.class final Lmodmenu/Palette;
.super Ljava/lang/Object;
.source "Palette.java"


# instance fields
.field final onPrimary:I

.field final onSurface:I

.field final onSurfaceVariant:I

.field final primary:I

.field final scrim:I

.field final surface:I

.field final thumbOff:I

.field final trackOff:I


# direct methods
.method private constructor <init>(IIIIIIII)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput p1, p0, Lmodmenu/Palette;->primary:I

    .line 31
    iput p2, p0, Lmodmenu/Palette;->onPrimary:I

    .line 32
    iput p3, p0, Lmodmenu/Palette;->surface:I

    .line 33
    iput p4, p0, Lmodmenu/Palette;->onSurface:I

    .line 34
    iput p5, p0, Lmodmenu/Palette;->onSurfaceVariant:I

    .line 35
    iput p6, p0, Lmodmenu/Palette;->trackOff:I

    .line 36
    iput p7, p0, Lmodmenu/Palette;->thumbOff:I

    .line 37
    iput p8, p0, Lmodmenu/Palette;->scrim:I

    .line 38
    return-void
.end method

.method private static clamp(I)I
    .locals 1

    .line 124
    if-gez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0xff

    if-le p0, v0, :cond_1

    const/16 p0, 0xff

    :cond_1
    :goto_0
    return p0
.end method

.method private static hue(FFF)F
    .locals 3

    .line 105
    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, p2, v0

    if-gez v0, :cond_0

    .line 106
    add-float/2addr p2, v1

    .line 108
    :cond_0
    cmpl-float v0, p2, v1

    if-lez v0, :cond_1

    .line 109
    sub-float/2addr p2, v1

    .line 111
    :cond_1
    const v0, 0x3e2aaaab

    const/high16 v1, 0x40c00000    # 6.0f

    cmpg-float v0, p2, v0

    if-gez v0, :cond_2

    .line 112
    sub-float/2addr p1, p0

    mul-float p1, p1, v1

    mul-float p1, p1, p2

    add-float/2addr p0, p1

    return p0

    .line 114
    :cond_2
    const/high16 v0, 0x3f000000    # 0.5f

    cmpg-float v0, p2, v0

    if-gez v0, :cond_3

    .line 115
    return p1

    .line 117
    :cond_3
    const v0, 0x3f2aaaab

    cmpg-float v2, p2, v0

    if-gez v2, :cond_4

    .line 118
    sub-float/2addr p1, p0

    sub-float/2addr v0, p2

    mul-float p1, p1, v0

    mul-float p1, p1, v1

    add-float/2addr p0, p1

    return p0

    .line 120
    :cond_4
    return p0
.end method

.method static of(Landroid/content/Context;)Lmodmenu/Palette;
    .locals 16

    .line 41
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v0, v0, 0x30

    const/16 v1, 0x20

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 43
    :goto_0
    nop

    .line 44
    nop

    .line 45
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1b

    const v5, 0x3f266666    # 0.65f

    const v6, 0x3dcccccd    # 0.1f

    if-lt v1, v4, :cond_1

    .line 46
    invoke-static/range {p0 .. p0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v1

    .line 47
    invoke-virtual {v1, v3}, Landroid/app/WallpaperManager;->getWallpaperColors(I)Landroid/app/WallpaperColors;

    move-result-object v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    invoke-virtual {v1}, Landroid/app/WallpaperColors;->getPrimaryColor()Landroid/graphics/Color;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Color;->toArgb()I

    move-result v1

    invoke-static {v1}, Lmodmenu/Palette;->toHsl(I)[F

    move-result-object v1

    .line 51
    aget v4, v1, v3

    cmpl-float v4, v4, v6

    if-ltz v4, :cond_1

    .line 52
    aget v2, v1, v2

    .line 53
    aget v1, v1, v3

    invoke-static {v1, v5}, Ljava/lang/Math;->min(FF)F

    move-result v1

    goto :goto_1

    .line 57
    :cond_1
    const/high16 v2, 0x3f400000    # 0.75f

    const v1, 0x3eb33333    # 0.35f

    :goto_1
    new-instance v7, Lmodmenu/Palette;

    .line 58
    if-eqz v0, :cond_2

    const v3, 0x3f4ccccd    # 0.8f

    invoke-static {v2, v1, v3}, Lmodmenu/Palette;->tone(FFF)I

    move-result v3

    goto :goto_2

    :cond_2
    const v3, 0x3f0ccccd    # 0.55f

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    const v4, 0x3ecccccd    # 0.4f

    invoke-static {v2, v3, v4}, Lmodmenu/Palette;->tone(FFF)I

    move-result v3

    :goto_2
    move v8, v3

    .line 59
    if-eqz v0, :cond_3

    const v3, 0x3e4ccccd    # 0.2f

    invoke-static {v2, v1, v3}, Lmodmenu/Palette;->tone(FFF)I

    move-result v1

    move v9, v1

    goto :goto_3

    :cond_3
    const/4 v1, -0x1

    const/4 v9, -0x1

    .line 60
    :goto_3
    if-eqz v0, :cond_4

    const v1, 0x3dcccccd    # 0.1f

    goto :goto_4

    :cond_4
    const v1, 0x3f7ae148    # 0.98f

    :goto_4
    const v3, 0x3d4ccccd    # 0.05f

    invoke-static {v2, v3, v1}, Lmodmenu/Palette;->tone(FFF)I

    move-result v10

    .line 61
    if-eqz v0, :cond_5

    const v1, 0x3f6b851f    # 0.92f

    goto :goto_5

    :cond_5
    const v1, 0x3df5c28f    # 0.12f

    :goto_5
    invoke-static {v2, v3, v1}, Lmodmenu/Palette;->tone(FFF)I

    move-result v11

    .line 62
    if-eqz v0, :cond_6

    const v1, 0x3f47ae14    # 0.78f

    goto :goto_6

    :cond_6
    const v1, 0x3ea8f5c3    # 0.33f

    :goto_6
    invoke-static {v2, v3, v1}, Lmodmenu/Palette;->tone(FFF)I

    move-result v12

    .line 63
    if-eqz v0, :cond_7

    const v1, 0x3e8f5c29    # 0.28f

    goto :goto_7

    :cond_7
    const v1, 0x3f666666    # 0.9f

    :goto_7
    invoke-static {v2, v6, v1}, Lmodmenu/Palette;->tone(FFF)I

    move-result v13

    .line 64
    if-eqz v0, :cond_8

    goto :goto_8

    :cond_8
    const v5, 0x3f333333    # 0.7f

    :goto_8
    const v0, 0x3da3d70a    # 0.08f

    invoke-static {v2, v0, v5}, Lmodmenu/Palette;->tone(FFF)I

    move-result v14

    const/high16 v15, -0x4d000000

    invoke-direct/range {v7 .. v15}, Lmodmenu/Palette;-><init>(IIIIIIII)V

    .line 57
    return-object v7
.end method

.method private static toHsl(I)[F
    .locals 14

    .line 69
    shr-int/lit8 v0, p0, 0x10

    and-int/lit16 v0, v0, 0xff

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    .line 70
    shr-int/lit8 v2, p0, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-float v2, v2

    div-float/2addr v2, v1

    .line 71
    and-int/lit16 p0, p0, 0xff

    int-to-float p0, p0

    div-float/2addr p0, v1

    .line 72
    invoke-static {v2, p0}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 73
    invoke-static {v2, p0}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    .line 74
    add-float v4, v1, v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float v6, v4, v5

    .line 75
    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v10, 0x3

    const/4 v11, 0x0

    cmpl-float v12, v1, v3

    if-nez v12, :cond_0

    .line 76
    new-array p0, v10, [F

    aput v11, p0, v9

    aput v11, p0, v8

    aput v6, p0, v7

    return-object p0

    .line 78
    :cond_0
    sub-float v12, v1, v3

    .line 79
    const/high16 v13, 0x3f000000    # 0.5f

    cmpl-float v13, v6, v13

    if-lez v13, :cond_1

    sub-float v4, v5, v1

    sub-float/2addr v4, v3

    :cond_1
    div-float v3, v12, v4

    .line 81
    const/high16 v4, 0x40c00000    # 6.0f

    cmpl-float v13, v1, v0

    if-nez v13, :cond_3

    .line 82
    sub-float v0, v2, p0

    div-float/2addr v0, v12

    cmpg-float p0, v2, p0

    if-gez p0, :cond_2

    const/high16 v11, 0x40c00000    # 6.0f

    :cond_2
    add-float/2addr v0, v11

    goto :goto_0

    .line 83
    :cond_3
    cmpl-float v1, v1, v2

    if-nez v1, :cond_4

    .line 84
    sub-float/2addr p0, v0

    div-float/2addr p0, v12

    add-float v0, p0, v5

    goto :goto_0

    .line 86
    :cond_4
    sub-float/2addr v0, v2

    div-float/2addr v0, v12

    const/high16 p0, 0x40800000    # 4.0f

    add-float/2addr v0, p0

    .line 88
    :goto_0
    div-float/2addr v0, v4

    new-array p0, v10, [F

    aput v0, p0, v9

    aput v3, p0, v8

    aput v6, p0, v7

    return-object p0
.end method

.method private static tone(FFF)I
    .locals 5

    .line 92
    const/4 v0, 0x0

    const/high16 v1, -0x1000000

    const/high16 v2, 0x437f0000    # 255.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    .line 93
    mul-float p2, p2, v2

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-static {p0}, Lmodmenu/Palette;->clamp(I)I

    move-result p0

    .line 94
    shl-int/lit8 p1, p0, 0x10

    or-int/2addr p1, v1

    shl-int/lit8 p2, p0, 0x8

    or-int/2addr p1, p2

    or-int/2addr p0, p1

    return p0

    .line 96
    :cond_0
    const/high16 v0, 0x3f000000    # 0.5f

    cmpg-float v0, p2, v0

    if-gez v0, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    add-float/2addr p1, v0

    mul-float p1, p1, p2

    goto :goto_0

    :cond_1
    add-float v0, p2, p1

    mul-float p1, p1, p2

    sub-float p1, v0, p1

    .line 97
    :goto_0
    const/high16 v0, 0x40000000    # 2.0f

    mul-float p2, p2, v0

    sub-float/2addr p2, p1

    .line 98
    const v0, 0x3eaaaaab

    add-float v3, p0, v0

    invoke-static {p2, p1, v3}, Lmodmenu/Palette;->hue(FFF)F

    move-result v3

    mul-float v3, v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {v3}, Lmodmenu/Palette;->clamp(I)I

    move-result v3

    .line 99
    invoke-static {p2, p1, p0}, Lmodmenu/Palette;->hue(FFF)F

    move-result v4

    mul-float v4, v4, v2

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-static {v4}, Lmodmenu/Palette;->clamp(I)I

    move-result v4

    .line 100
    sub-float/2addr p0, v0

    invoke-static {p2, p1, p0}, Lmodmenu/Palette;->hue(FFF)F

    move-result p0

    mul-float p0, p0, v2

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-static {p0}, Lmodmenu/Palette;->clamp(I)I

    move-result p0

    .line 101
    shl-int/lit8 p1, v3, 0x10

    or-int/2addr p1, v1

    shl-int/lit8 p2, v4, 0x8

    or-int/2addr p1, p2

    or-int/2addr p0, p1

    return p0
.end method
