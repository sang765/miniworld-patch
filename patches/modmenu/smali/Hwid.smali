.class final Lmodmenu/Hwid;
.super Ljava/lang/Object;
.source "Hwid.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static rotate(Ljava/lang/String;I)Ljava/lang/String;
    .locals 7

    .line 17
    if-nez p1, :cond_0

    .line 18
    return-object p0

    .line 20
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 22
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 23
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 24
    const/16 v4, 0x30

    if-lt v3, v4, :cond_1

    const/16 v5, 0x39

    if-gt v3, v5, :cond_1

    .line 25
    add-int/lit8 v3, v3, -0x30

    const/16 v5, 0xa

    invoke-static {v3, p1, v0, v2, v5}, Lmodmenu/Hwid;->shift(IIIII)I

    move-result v3

    add-int/2addr v3, v4

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 26
    :cond_1
    const/4 v4, 0x6

    const/16 v5, 0x61

    if-lt v3, v5, :cond_2

    const/16 v6, 0x66

    if-gt v3, v6, :cond_2

    .line 27
    add-int/lit8 v3, v3, -0x61

    invoke-static {v3, p1, v0, v2, v4}, Lmodmenu/Hwid;->shift(IIIII)I

    move-result v3

    add-int/2addr v3, v5

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 28
    :cond_2
    const/16 v5, 0x41

    if-lt v3, v5, :cond_3

    const/16 v6, 0x46

    if-gt v3, v6, :cond_3

    .line 29
    add-int/lit8 v3, v3, -0x41

    invoke-static {v3, p1, v0, v2, v4}, Lmodmenu/Hwid;->shift(IIIII)I

    move-result v3

    add-int/2addr v3, v5

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 31
    :cond_3
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 22
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 34
    :cond_4
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static shift(IIIII)I
    .locals 0

    .line 40
    mul-int/lit8 p1, p1, 0x1f

    add-int/2addr p1, p2

    mul-int/lit8 p3, p3, 0x7

    add-int/2addr p1, p3

    add-int/lit8 p2, p4, -0x1

    rem-int/2addr p1, p2

    .line 41
    if-gez p1, :cond_0

    .line 42
    add-int/2addr p1, p2

    .line 44
    :cond_0
    add-int/2addr p0, p1

    add-int/lit8 p0, p0, 0x1

    rem-int/2addr p0, p4

    return p0
.end method
