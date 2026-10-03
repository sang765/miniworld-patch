.class public final Lmodmenu/ModMenu;
.super Ljava/lang/Object;
.source "ModMenu.java"


# static fields
.field private static final KEY_GEN:Ljava/lang/String; = "hwid_gen"

.field private static final KEY_HWID:Ljava/lang/String; = "hwid"

.field private static final KEY_REWARD:Ljava/lang/String; = "reward"

.field private static final KEY_WEB:Ljava/lang/String; = "webview"

.field private static final MAIN:Landroid/os/Handler;

.field private static final NOTIF_ID:I = 0x42f

.field private static final PREF_NAME:Ljava/lang/String; = "mw_mod_menu"

.field private static final RETRY_MS:[J

.field private static final TEXT:Ljava/lang/String; = "Th\u00f4ng b\u00e1o c\u1ee7a mod menu, click \u0111\u1ec3 m\u1edf menu"

.field private static final TITLE:Ljava/lang/String; = "Mini World"

.field private static volatile appCtx:Landroid/content/Context;

.field private static volatile hwidSpoof:Z

.field private static loaded:Z

.field private static notifyStarted:Z

.field private static posted:Z

.field private static retryIdx:I

.field private static volatile rewardBypass:Z

.field private static volatile webBlocked:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 38
    const/4 v0, 0x7

    new-array v0, v0, [J

    fill-array-data v0, :array_0

    sput-object v0, Lmodmenu/ModMenu;->RETRY_MS:[J

    .line 40
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/ModMenu;->MAIN:Landroid/os/Handler;

    .line 42
    const/4 v0, 0x1

    sput-boolean v0, Lmodmenu/ModMenu;->webBlocked:Z

    .line 43
    sput-boolean v0, Lmodmenu/ModMenu;->hwidSpoof:Z

    .line 44
    sput-boolean v0, Lmodmenu/ModMenu;->rewardBypass:Z

    return-void

    nop

    :array_0
    .array-data 8
        0x7d0
        0x1388
        0x2710
        0x4e20
        0x9c40
        0x13880
        0x27100
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;)V
    .locals 0

    .line 28
    invoke-static {p0}, Lmodmenu/ModMenu;->beginNotify(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$100()V
    .locals 0

    .line 28
    invoke-static {}, Lmodmenu/ModMenu;->tryPost()V

    return-void
.end method

.method static synthetic access$200()V
    .locals 0

    .line 28
    invoke-static {}, Lmodmenu/ModMenu;->scheduleRetry()V

    return-void
.end method

.method private static beginNotify(Landroid/app/Activity;)V
    .locals 2

    .line 138
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    invoke-static {p0}, Lmodmenu/Api33;->canPost(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 139
    invoke-static {p0}, Lmodmenu/Api33;->request(Landroid/app/Activity;)V

    .line 141
    :cond_0
    invoke-static {}, Lmodmenu/ModMenu;->tryPost()V

    .line 142
    invoke-static {}, Lmodmenu/ModMenu;->scheduleRetry()V

    .line 143
    return-void
.end method

.method public static isRewardBypass()Z
    .locals 1

    .line 84
    sget-boolean v0, Lmodmenu/ModMenu;->rewardBypass:Z

    return v0
.end method

.method public static isSpoofOn()Z
    .locals 1

    .line 80
    sget-boolean v0, Lmodmenu/ModMenu;->hwidSpoof:Z

    return v0
.end method

.method public static isWebBlocked()Z
    .locals 1

    .line 76
    sget-boolean v0, Lmodmenu/ModMenu;->webBlocked:Z

    return v0
.end method

.method private static legacyBuild(Landroid/app/PendingIntent;)Landroid/app/Notification;
    .locals 2

    .line 168
    new-instance v0, Landroid/app/Notification$Builder;

    sget-object v1, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 169
    const-string v1, "Mini World"

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 170
    const-string v1, "Th\u00f4ng b\u00e1o c\u1ee7a mod menu, click \u0111\u1ec3 m\u1edf menu"

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    sget-object v1, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    .line 171
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget v1, v1, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 172
    invoke-virtual {v0, p0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 173
    invoke-virtual {p0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    .line 168
    return-object p0
.end method

.method public static loadPrefs(Landroid/content/Context;)V
    .locals 2

    .line 122
    sget-boolean v0, Lmodmenu/ModMenu;->loaded:Z

    if-eqz v0, :cond_0

    .line 123
    return-void

    .line 125
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    .line 126
    sget-object p0, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 127
    const-string v0, "webview"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lmodmenu/ModMenu;->webBlocked:Z

    .line 128
    const-string v0, "hwid"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lmodmenu/ModMenu;->hwidSpoof:Z

    .line 129
    const-string v0, "reward"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    sput-boolean p0, Lmodmenu/ModMenu;->rewardBypass:Z

    .line 130
    sput-boolean v1, Lmodmenu/ModMenu;->loaded:Z

    .line 131
    return-void
.end method

.method public static onAppCreate(Landroid/content/Context;)V
    .locals 0

    .line 56
    invoke-static {p0}, Lmodmenu/ModMenu;->loadPrefs(Landroid/content/Context;)V

    .line 57
    return-void
.end method

.method public static onGameStart(Landroid/app/Activity;)V
    .locals 2

    .line 61
    invoke-static {p0}, Lmodmenu/ModMenu;->loadPrefs(Landroid/content/Context;)V

    .line 62
    sget-boolean v0, Lmodmenu/ModMenu;->notifyStarted:Z

    if-eqz v0, :cond_0

    .line 63
    return-void

    .line 65
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lmodmenu/ModMenu;->notifyStarted:Z

    .line 66
    sget-object v0, Lmodmenu/ModMenu;->MAIN:Landroid/os/Handler;

    new-instance v1, Lmodmenu/ModMenu$1;

    invoke-direct {v1, p0}, Lmodmenu/ModMenu$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 72
    return-void
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    .line 134
    const-string v0, "mw_mod_menu"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static rotateHwid(Landroid/content/Context;)V
    .locals 3

    .line 117
    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 118
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "hwid_gen"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 119
    return-void
.end method

.method private static scheduleRetry()V
    .locals 5

    .line 177
    sget-boolean v0, Lmodmenu/ModMenu;->posted:Z

    if-nez v0, :cond_1

    sget v0, Lmodmenu/ModMenu;->retryIdx:I

    sget-object v1, Lmodmenu/ModMenu;->RETRY_MS:[J

    array-length v1, v1

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 180
    :cond_0
    sget-object v0, Lmodmenu/ModMenu;->MAIN:Landroid/os/Handler;

    new-instance v1, Lmodmenu/ModMenu$2;

    invoke-direct {v1}, Lmodmenu/ModMenu$2;-><init>()V

    sget-object v2, Lmodmenu/ModMenu;->RETRY_MS:[J

    sget v3, Lmodmenu/ModMenu;->retryIdx:I

    add-int/lit8 v4, v3, 0x1

    sput v4, Lmodmenu/ModMenu;->retryIdx:I

    aget-wide v3, v2, v3

    invoke-virtual {v0, v1, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 187
    return-void

    .line 178
    :cond_1
    :goto_0
    return-void
.end method

.method public static setHwidSpoof(Landroid/content/Context;Z)V
    .locals 1

    .line 93
    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "hwid"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 94
    sput-boolean p1, Lmodmenu/ModMenu;->hwidSpoof:Z

    .line 95
    return-void
.end method

.method public static setRewardBypass(Landroid/content/Context;Z)V
    .locals 1

    .line 98
    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "reward"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 99
    sput-boolean p1, Lmodmenu/ModMenu;->rewardBypass:Z

    .line 100
    return-void
.end method

.method public static setWebBlocked(Landroid/content/Context;Z)V
    .locals 1

    .line 88
    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "webview"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 89
    sput-boolean p1, Lmodmenu/ModMenu;->webBlocked:Z

    .line 90
    return-void
.end method

.method public static spoofValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 108
    sget-object v0, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    .line 109
    if-nez v0, :cond_0

    .line 110
    return-object p0

    .line 112
    :cond_0
    invoke-static {v0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "hwid_gen"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {p0, v0}, Lmodmenu/Hwid;->rotate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static tryPost()V
    .locals 5

    .line 146
    sget-boolean v0, Lmodmenu/ModMenu;->posted:Z

    if-eqz v0, :cond_0

    .line 147
    return-void

    .line 149
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_1

    sget-object v0, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    invoke-static {v0}, Lmodmenu/Api33;->canPost(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 150
    return-void

    .line 152
    :cond_1
    sget-object v0, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    sget-object v2, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    const-class v3, Lmodmenu/ModMenuActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 154
    const/high16 v2, 0x30000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v1

    .line 152
    const/4 v2, 0x0

    const/high16 v3, 0xc000000

    invoke-static {v0, v2, v1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 157
    sget-object v1, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    .line 158
    const-string v2, "notification"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 159
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-lt v2, v3, :cond_2

    .line 160
    sget-object v2, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    const-string v3, "Mini World"

    const-string v4, "Th\u00f4ng b\u00e1o c\u1ee7a mod menu, click \u0111\u1ec3 m\u1edf menu"

    invoke-static {v2, v1, v3, v4, v0}, Lmodmenu/Api26;->build(Landroid/content/Context;Landroid/app/NotificationManager;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification;

    move-result-object v0

    goto :goto_0

    .line 161
    :cond_2
    invoke-static {v0}, Lmodmenu/ModMenu;->legacyBuild(Landroid/app/PendingIntent;)Landroid/app/Notification;

    move-result-object v0

    .line 162
    :goto_0
    const/16 v2, 0x42f

    invoke-virtual {v1, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 163
    const/4 v0, 0x1

    sput-boolean v0, Lmodmenu/ModMenu;->posted:Z

    .line 164
    return-void
.end method
