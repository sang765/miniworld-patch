.class public final Lmodmenu/I18n;
.super Ljava/lang/Object;
.source "I18n.java"


# static fields
.field private static final EN:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final STRINGS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 17
    invoke-static {}, Lmodmenu/I18n;->en()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lmodmenu/I18n;->EN:Ljava/util/Map;

    .line 18
    invoke-static {}, Lmodmenu/I18n;->select()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lmodmenu/I18n;->STRINGS:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static en()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 45
    const-string v1, "notif.title"

    const-string v2, "Mini World"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    const-string v1, "notif.text"

    const-string v2, "Mod menu notification - tap to open the menu"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    const-string v1, "menu.title"

    const-string v2, "Mod Menu"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    const-string v1, "web.label"

    const-string v2, "Block WebView / browser"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    const-string v1, "web.desc"

    const-string v2, "Prevent opening the browser or any web page in game"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    const-string v1, "hwid.label"

    const-string v2, "Spoof HWID"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    const-string v1, "hwid.desc"

    const-string v2, "Emulate the device identity - or rotate to a new ID"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    const-string v1, "reward.label"

    const-string v2, "Skip rewarded ads"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    const-string v1, "reward.desc"

    const-string v2, "Bypass ads - reward credited right after you tap"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    const-string v1, "kb.label"

    const-string v2, "Keyboard & mouse (OTG)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    const-string v1, "kb.desc"

    const-string v2, "Use a USB OTG keyboard and mouse like the PC version"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    const-string v1, "rotate"

    const-string v2, "Change spoofed HWID"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    const-string v1, "close"

    const-string v2, "Close"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    const-string v1, "rotate.toast"

    const-string v2, "HWID changed - applies on next game launch"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    return-object v0
.end method

.method private static select()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 28
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    .line 30
    const-string v2, "vi"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 31
    invoke-static {}, Lmodmenu/I18n;->vi()Ljava/util/Map;

    move-result-object v0

    return-object v0

    .line 33
    :cond_0
    const-string v2, "zh"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 34
    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    .line 35
    const-string v1, "TW"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "HK"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "MO"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 38
    :cond_1
    invoke-static {}, Lmodmenu/I18n;->zh()Ljava/util/Map;

    move-result-object v0

    return-object v0

    .line 36
    :cond_2
    :goto_0
    invoke-static {}, Lmodmenu/I18n;->zhHant()Ljava/util/Map;

    move-result-object v0

    return-object v0

    .line 40
    :cond_3
    sget-object v0, Lmodmenu/I18n;->EN:Ljava/util/Map;

    return-object v0
.end method

.method public static t(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 23
    sget-object v0, Lmodmenu/I18n;->STRINGS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 24
    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lmodmenu/I18n;->EN:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method private static vi()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 63
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 64
    const-string v1, "notif.title"

    const-string v2, "Mini World"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    const-string v1, "notif.text"

    const-string v2, "Th\u00f4ng b\u00e1o c\u1ee7a mod menu, click \u0111\u1ec3 m\u1edf menu"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    const-string v1, "menu.title"

    const-string v2, "Mod Menu"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    const-string v1, "web.label"

    const-string v2, "Ch\u1eb7n WebView / tr\u00ecnh duy\u1ec7t"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    const-string v1, "web.desc"

    const-string v2, "Kh\u00f4ng m\u1edf tr\u00ecnh duy\u1ec7t ho\u1eb7c trang web trong game"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    const-string v1, "hwid.label"

    const-string v2, "Gi\u1ea3 m\u1ea1o HWID"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    const-string v1, "hwid.desc"

    const-string v2, "Gi\u1ea3 l\u1eadp \u0111\u1ecbnh danh thi\u1ebft b\u1ecb \u2014 ho\u1eb7c xoay sang ID m\u1edbi"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    const-string v1, "reward.label"

    const-string v2, "Nh\u1eadn th\u01b0\u1edfng kh\u00f4ng xem qu\u1ea3ng c\u00e1o"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    const-string v1, "reward.desc"

    const-string v2, "B\u1ecf qua qu\u1ea3ng c\u00e1o \u2014 c\u1ed9ng th\u01b0\u1edfng ngay khi b\u1ea5m"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    const-string v1, "kb.label"

    const-string v2, "B\u00e0n ph\u00edm & chu\u1ed9t (OTG)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    const-string v1, "kb.desc"

    const-string v2, "D\u00f9ng b\u00e0n ph\u00edm, chu\u1ed9t qua USB OTG nh\u01b0 b\u1ea3n PC"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    const-string v1, "rotate"

    const-string v2, "\u0110\u1ed5i HWID gi\u1ea3 m\u1ea1o"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    const-string v1, "close"

    const-string v2, "\u0110\u00f3ng"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    const-string v1, "rotate.toast"

    const-string v2, "\u0110\u00e3 \u0111\u1ed5i HWID \u2014 \u00e1p d\u1ee5ng \u1edf l\u1ea7n m\u1edf game sau"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    return-object v0
.end method

.method private static zh()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 83
    const-string v1, "notif.title"

    const-string v2, "Mini World"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    const-string v1, "notif.text"

    const-string v2, "\u6a21\u7ec4\u83dc\u5355\u901a\u77e5\u2014\u2014\u70b9\u51fb\u6253\u5f00\u83dc\u5355"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    const-string v1, "menu.title"

    const-string v2, "\u6a21\u7ec4\u83dc\u5355"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    const-string v1, "web.label"

    const-string v2, "\u5c4f\u853d WebView / \u6d4f\u89c8\u5668"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    const-string v1, "web.desc"

    const-string v2, "\u963b\u6b62\u5728\u6e38\u620f\u5185\u6253\u5f00\u6d4f\u89c8\u5668\u6216\u4efb\u4f55\u7f51\u9875"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    const-string v1, "hwid.label"

    const-string v2, "\u4f2a\u9020 HWID"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    const-string v1, "hwid.desc"

    const-string v2, "\u6a21\u62df\u8bbe\u5907\u6807\u8bc6\u2014\u2014\u6216\u8f6e\u6362\u4e3a\u65b0 ID"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    const-string v1, "reward.label"

    const-string v2, "\u8df3\u8fc7\u6fc0\u52b1\u5e7f\u544a"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    const-string v1, "reward.desc"

    const-string v2, "\u8df3\u8fc7\u5e7f\u544a\u2014\u2014\u70b9\u51fb\u5373\u53ef\u7acb\u5373\u83b7\u5f97\u5956\u52b1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    const-string v1, "kb.label"

    const-string v2, "\u952e\u76d8\u548c\u9f20\u6807\uff08OTG\uff09"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string v1, "kb.desc"

    const-string v2, "\u50cf PC \u7248\u4e00\u6837\u4f7f\u7528 USB OTG \u952e\u76d8\u548c\u9f20\u6807"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    const-string v1, "rotate"

    const-string v2, "\u66f4\u6362\u4f2a\u9020\u7684 HWID"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    const-string v1, "close"

    const-string v2, "\u5173\u95ed"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    const-string v1, "rotate.toast"

    const-string v2, "HWID \u5df2\u66f4\u6362\u2014\u2014\u4e0b\u6b21\u542f\u52a8\u6e38\u620f\u65f6\u751f\u6548"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    return-object v0
.end method

.method private static zhHant()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 101
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 102
    const-string v1, "notif.title"

    const-string v2, "Mini World"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    const-string v1, "notif.text"

    const-string v2, "\u6a21\u7d44\u9078\u55ae\u901a\u77e5\u2014\u2014\u9ede\u64ca\u958b\u555f\u9078\u55ae"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    const-string v1, "menu.title"

    const-string v2, "\u6a21\u7d44\u9078\u55ae"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    const-string v1, "web.label"

    const-string v2, "\u5c01\u9396 WebView / \u700f\u89bd\u5668"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    const-string v1, "web.desc"

    const-string v2, "\u963b\u6b62\u5728\u904a\u6232\u5167\u958b\u555f\u700f\u89bd\u5668\u6216\u4efb\u4f55\u7db2\u9801"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    const-string v1, "hwid.label"

    const-string v2, "\u507d\u9020 HWID"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    const-string v1, "hwid.desc"

    const-string v2, "\u6a21\u64ec\u88dd\u7f6e\u8b58\u5225\u78bc\u2014\u2014\u6216\u8f2a\u63db\u70ba\u65b0 ID"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    const-string v1, "reward.label"

    const-string v2, "\u8df3\u904e\u6fc0\u52f5\u5ee3\u544a"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    const-string v1, "reward.desc"

    const-string v2, "\u8df3\u904e\u5ee3\u544a\u2014\u2014\u9ede\u64ca\u5373\u53ef\u7acb\u5373\u7372\u5f97\u734e\u52f5"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    const-string v1, "kb.label"

    const-string v2, "\u9375\u76e4\u548c\u6ed1\u9f20\uff08OTG\uff09"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    const-string v1, "kb.desc"

    const-string v2, "\u50cf PC \u7248\u4e00\u6a23\u4f7f\u7528 USB OTG \u9375\u76e4\u548c\u6ed1\u9f20"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    const-string v1, "rotate"

    const-string v2, "\u66f4\u63db\u507d\u9020\u7684 HWID"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    const-string v1, "close"

    const-string v2, "\u95dc\u9589"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    const-string v1, "rotate.toast"

    const-string v2, "HWID \u5df2\u66f4\u63db\u2014\u2014\u4e0b\u6b21\u555f\u52d5\u904a\u6232\u6642\u751f\u6548"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    return-object v0
.end method
