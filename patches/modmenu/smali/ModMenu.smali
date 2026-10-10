.class public final Lmodmenu/ModMenu;
.super Ljava/lang/Object;
.source "ModMenu.java"


# static fields
.field private static final KEY_ANTITRACK:Ljava/lang/String; = "antitrack"

.field private static final KEY_GEN:Ljava/lang/String; = "hwid_gen"

.field private static final KEY_GEN_AUTO:Ljava/lang/String; = "hwid_auto"

.field private static final KEY_HWID:Ljava/lang/String; = "hwid"

.field private static final KEY_REWARD:Ljava/lang/String; = "reward"

.field private static final KEY_UNSAFE:Ljava/lang/String; = "unsafe"

.field private static final KEY_WEB:Ljava/lang/String; = "webview"

.field private static final MAIN:Landroid/os/Handler;

.field private static final NOTIF_ID:I = 0x42f

.field private static final PREF_NAME:Ljava/lang/String; = "mw_mod_menu"

.field private static final RETRY_MS:[J

.field private static volatile antiTrack:Z

.field private static volatile appCtx:Landroid/content/Context;

.field private static bootRotated:Z

.field private static game:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile hwidAutoRotate:Z

.field private static volatile hwidSpoof:Z

.field private static loaded:Z

.field private static notifyStarted:Z

.field private static posted:Z

.field private static retryIdx:I

.field private static volatile rewardBypass:Z

.field private static volatile unsafe:Z

.field private static volatile webBlocked:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 43
    const/4 v0, 0x7

    new-array v0, v0, [J

    fill-array-data v0, :array_0

    sput-object v0, Lmodmenu/ModMenu;->RETRY_MS:[J

    .line 45
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/ModMenu;->MAIN:Landroid/os/Handler;

    .line 47
    const/4 v0, 0x1

    sput-boolean v0, Lmodmenu/ModMenu;->webBlocked:Z

    .line 48
    sput-boolean v0, Lmodmenu/ModMenu;->hwidSpoof:Z

    .line 49
    sput-boolean v0, Lmodmenu/ModMenu;->rewardBypass:Z

    .line 50
    sput-boolean v0, Lmodmenu/ModMenu;->antiTrack:Z

    .line 57
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lmodmenu/ModMenu;->game:Ljava/lang/ref/WeakReference;

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

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;)V
    .locals 0

    .line 32
    invoke-static {p0}, Lmodmenu/ModMenu;->beginNotify(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic access$100()V
    .locals 0

    .line 32
    invoke-static {}, Lmodmenu/ModMenu;->tryPost()V

    return-void
.end method

.method static synthetic access$200()V
    .locals 0

    .line 32
    invoke-static {}, Lmodmenu/ModMenu;->scheduleRetry()V

    return-void
.end method

.method private static beginNotify(Landroid/app/Activity;)V
    .locals 2

    .line 249
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    invoke-static {p0}, Lmodmenu/Api33;->canPost(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 250
    invoke-static {p0}, Lmodmenu/Api33;->request(Landroid/app/Activity;)V

    .line 252
    :cond_0
    invoke-static {}, Lmodmenu/ModMenu;->tryPost()V

    .line 253
    invoke-static {}, Lmodmenu/ModMenu;->scheduleRetry()V

    .line 254
    return-void
.end method

.method static gameActivity()Landroid/app/Activity;
    .locals 2

    .line 99
    sget-object v0, Lmodmenu/ModMenu;->game:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 100
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 103
    :cond_0
    return-object v0

    .line 101
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static isAntiTrack()Z
    .locals 1

    .line 143
    sget-boolean v0, Lmodmenu/ModMenu;->antiTrack:Z

    return v0
.end method

.method public static isHwidAutoRotate()Z
    .locals 1

    .line 147
    sget-boolean v0, Lmodmenu/ModMenu;->hwidAutoRotate:Z

    return v0
.end method

.method public static isRewardBypass()Z
    .locals 1

    .line 139
    sget-boolean v0, Lmodmenu/ModMenu;->rewardBypass:Z

    return v0
.end method

.method public static isSpoofOn()Z
    .locals 1

    .line 135
    sget-boolean v0, Lmodmenu/ModMenu;->hwidSpoof:Z

    return v0
.end method

.method public static isUnsafe()Z
    .locals 1

    .line 155
    sget-boolean v0, Lmodmenu/ModMenu;->unsafe:Z

    return v0
.end method

.method public static isWebBlocked()Z
    .locals 1

    .line 131
    sget-boolean v0, Lmodmenu/ModMenu;->webBlocked:Z

    return v0
.end method

.method private static legacyBuild(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification;
    .locals 2

    .line 279
    new-instance v0, Landroid/app/Notification$Builder;

    sget-object v1, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 280
    invoke-virtual {v0, p0}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 281
    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p0

    sget-object p1, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    .line 282
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    iget p1, p1, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {p0, p1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 283
    invoke-virtual {p0, p2}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 284
    invoke-virtual {p0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    .line 279
    return-object p0
.end method

.method public static loadPrefs(Landroid/content/Context;)V
    .locals 3

    .line 230
    sget-boolean v0, Lmodmenu/ModMenu;->loaded:Z

    if-eqz v0, :cond_0

    .line 231
    return-void

    .line 233
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    .line 234
    sget-object p0, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 235
    const-string v0, "webview"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lmodmenu/ModMenu;->webBlocked:Z

    .line 236
    const-string v0, "hwid"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lmodmenu/ModMenu;->hwidSpoof:Z

    .line 237
    const-string v0, "reward"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lmodmenu/ModMenu;->rewardBypass:Z

    .line 238
    const-string v0, "antitrack"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lmodmenu/ModMenu;->antiTrack:Z

    .line 239
    const-string v0, "hwid_auto"

    const/4 v2, 0x0

    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lmodmenu/ModMenu;->hwidAutoRotate:Z

    .line 240
    const-string v0, "unsafe"

    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    sput-boolean p0, Lmodmenu/ModMenu;->unsafe:Z

    .line 241
    sput-boolean v1, Lmodmenu/ModMenu;->loaded:Z

    .line 242
    return-void
.end method

.method static menuIntent(Landroid/content/Context;IZ)Landroid/app/PendingIntent;
    .locals 4

    .line 117
    nop

    .line 118
    invoke-static {}, Lmodmenu/ModMenu;->gameActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "open_ids"

    const/high16 v2, 0xc000000

    if-eqz v0, :cond_0

    .line 119
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lmodmenu/ModMenuReceiver;

    invoke-direct {v0, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 120
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p2

    .line 121
    invoke-static {p0, p1, p2, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0

    .line 123
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lmodmenu/ModMenuActivity;

    invoke-direct {v0, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 124
    const/high16 v3, 0x30000000

    invoke-virtual {v0, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    .line 125
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object p2

    .line 126
    invoke-static {p0, p1, p2, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method public static onAppCreate(Landroid/content/Context;)V
    .locals 1

    .line 68
    invoke-static {p0}, Lmodmenu/ModMenu;->loadPrefs(Landroid/content/Context;)V

    .line 70
    sget-boolean v0, Lmodmenu/ModMenu;->hwidAutoRotate:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lmodmenu/ModMenu;->bootRotated:Z

    if-nez v0, :cond_0

    .line 71
    const/4 v0, 0x1

    sput-boolean v0, Lmodmenu/ModMenu;->bootRotated:Z

    .line 72
    invoke-static {p0}, Lmodmenu/ModMenu;->rotateHwid(Landroid/content/Context;)V

    .line 76
    :cond_0
    invoke-static {p0}, Lmodmenu/CrashHandler;->install(Landroid/content/Context;)V

    .line 77
    return-void
.end method

.method public static onGameStart(Landroid/app/Activity;)V
    .locals 2

    .line 81
    invoke-static {p0}, Lmodmenu/ModMenu;->loadPrefs(Landroid/content/Context;)V

    .line 84
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lmodmenu/ModMenu;->game:Ljava/lang/ref/WeakReference;

    .line 85
    sget-boolean v0, Lmodmenu/ModMenu;->notifyStarted:Z

    if-eqz v0, :cond_0

    .line 86
    return-void

    .line 88
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lmodmenu/ModMenu;->notifyStarted:Z

    .line 89
    sget-object v0, Lmodmenu/ModMenu;->MAIN:Landroid/os/Handler;

    new-instance v1, Lmodmenu/ModMenu$1;

    invoke-direct {v1, p0}, Lmodmenu/ModMenu$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 95
    return-void
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    .line 245
    const-string v0, "mw_mod_menu"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static restartGame(Landroid/content/Context;)V
    .locals 6

    .line 216
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    .line 217
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 218
    const-string v1, "alarm"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/AlarmManager;

    .line 219
    if-eqz v0, :cond_1

    if-nez v1, :cond_0

    goto :goto_0

    .line 222
    :cond_0
    const v2, 0x10008000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 223
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v4, 0x7fffffff

    and-long/2addr v2, v4

    long-to-int v3, v2

    const/high16 v2, 0x44000000    # 512.0f

    invoke-static {p0, v3, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    .line 225
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x190

    add-long/2addr v2, v4

    const/4 v0, 0x1

    invoke-virtual {v1, v0, v2, v3, p0}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 226
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p0

    invoke-static {p0}, Landroid/os/Process;->killProcess(I)V

    .line 227
    return-void

    .line 220
    :cond_1
    :goto_0
    return-void
.end method

.method public static rotateHwid(Landroid/content/Context;)V
    .locals 3

    .line 205
    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 206
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "hwid_gen"

    invoke-interface {p0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    add-int/lit8 p0, p0, 0x1

    invoke-interface {v0, v2, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 207
    return-void
.end method

.method private static scheduleRetry()V
    .locals 5

    .line 288
    sget-boolean v0, Lmodmenu/ModMenu;->posted:Z

    if-nez v0, :cond_1

    sget v0, Lmodmenu/ModMenu;->retryIdx:I

    sget-object v1, Lmodmenu/ModMenu;->RETRY_MS:[J

    array-length v1, v1

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 291
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

    .line 298
    return-void

    .line 289
    :cond_1
    :goto_0
    return-void
.end method

.method public static setAntiTrack(Landroid/content/Context;Z)V
    .locals 1

    .line 176
    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "antitrack"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 177
    sput-boolean p1, Lmodmenu/ModMenu;->antiTrack:Z

    .line 178
    return-void
.end method

.method public static setHwidAutoRotate(Landroid/content/Context;Z)V
    .locals 1

    .line 181
    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "hwid_auto"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 182
    sput-boolean p1, Lmodmenu/ModMenu;->hwidAutoRotate:Z

    .line 183
    return-void
.end method

.method public static setHwidSpoof(Landroid/content/Context;Z)V
    .locals 1

    .line 166
    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "hwid"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 167
    sput-boolean p1, Lmodmenu/ModMenu;->hwidSpoof:Z

    .line 168
    return-void
.end method

.method public static setRewardBypass(Landroid/content/Context;Z)V
    .locals 1

    .line 171
    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "reward"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 172
    sput-boolean p1, Lmodmenu/ModMenu;->rewardBypass:Z

    .line 173
    return-void
.end method

.method public static setUnsafe(Landroid/content/Context;Z)V
    .locals 1

    .line 186
    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "unsafe"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 187
    sput-boolean p1, Lmodmenu/ModMenu;->unsafe:Z

    .line 188
    return-void
.end method

.method public static setWebBlocked(Landroid/content/Context;Z)V
    .locals 1

    .line 161
    invoke-static {p0}, Lmodmenu/ModMenu;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "webview"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 162
    sput-boolean p1, Lmodmenu/ModMenu;->webBlocked:Z

    .line 163
    return-void
.end method

.method public static spoofValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 196
    sget-object v0, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    .line 197
    if-nez v0, :cond_0

    .line 198
    return-object p0

    .line 200
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
    .locals 6

    .line 257
    sget-boolean v0, Lmodmenu/ModMenu;->posted:Z

    if-eqz v0, :cond_0

    .line 258
    return-void

    .line 260
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_1

    sget-object v0, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    invoke-static {v0}, Lmodmenu/Api33;->canPost(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 261
    return-void

    .line 263
    :cond_1
    sget-object v0, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, v1, v1}, Lmodmenu/ModMenu;->menuIntent(Landroid/content/Context;IZ)Landroid/app/PendingIntent;

    move-result-object v0

    .line 264
    sget-object v1, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    .line 265
    const-string v2, "notification"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 268
    sget-object v2, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    const-string v3, "mod_notif_title"

    invoke-static {v2, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 269
    sget-object v3, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    const-string v4, "mod_notif_text"

    invoke-static {v3, v4}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 270
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v4, v5, :cond_2

    .line 271
    sget-object v4, Lmodmenu/ModMenu;->appCtx:Landroid/content/Context;

    invoke-static {v4, v1, v2, v3, v0}, Lmodmenu/Api26;->build(Landroid/content/Context;Landroid/app/NotificationManager;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification;

    move-result-object v0

    goto :goto_0

    .line 272
    :cond_2
    invoke-static {v2, v3, v0}, Lmodmenu/ModMenu;->legacyBuild(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification;

    move-result-object v0

    .line 273
    :goto_0
    const/16 v2, 0x42f

    invoke-virtual {v1, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 274
    const/4 v0, 0x1

    sput-boolean v0, Lmodmenu/ModMenu;->posted:Z

    .line 275
    return-void
.end method
