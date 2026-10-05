.class final Lmodmenu/CrashHandler;
.super Ljava/lang/Object;
.source "CrashHandler.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# static fields
.field private static final LOOP_WINDOW_MS:J = 0x2710L

.field private static final NOTIF_ID:I = 0x430

.field private static final TAG:Ljava/lang/String; = "MWCrash"

.field private static ctx:Landroid/content/Context;

.field private static handling:Z

.field private static installed:Z

.field private static previous:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private collect(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 9

    .line 81
    sget-object v0, Lmodmenu/CrashHandler;->ctx:Landroid/content/Context;

    .line 82
    const-string v1, "MWCrash"

    if-nez v0, :cond_0

    .line 83
    const-string p1, "no context, crash not reported"

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    return-void

    .line 86
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 87
    invoke-static {v0}, Lmodmenu/CrashReport;->lastLaunch(Landroid/content/Context;)J

    move-result-wide v4

    sub-long v4, v2, v4

    const-wide/16 v6, 0x2710

    cmp-long v8, v4, v6

    if-gez v8, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    .line 88
    :goto_0
    invoke-static {v0, v2, v3}, Lmodmenu/CrashReport;->stampLaunch(Landroid/content/Context;J)V

    .line 90
    invoke-static {v0, v2, v3}, Lmodmenu/CrashReport;->pathFor(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    .line 91
    nop

    .line 92
    invoke-static {}, Lmodmenu/CrashReport;->logcat()Ljava/lang/String;

    move-result-object v6

    .line 91
    invoke-static {v0, p1, p2, v5, v6}, Lmodmenu/CrashReport;->build(Landroid/content/Context;Ljava/lang/Thread;Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 93
    invoke-static {v0, v2, v3, p1}, Lmodmenu/CrashReport;->save(Landroid/content/Context;JLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 95
    if-eqz v4, :cond_2

    .line 96
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "crash within 10000ms of the last one, report saved, screen skipped: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    return-void

    .line 100
    :cond_2
    invoke-static {p2}, Lmodmenu/CrashReport;->summary(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, v2, p1, p2}, Lmodmenu/CrashHandler;->screenIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 101
    invoke-static {v0, p1}, Lmodmenu/CrashHandler;->startScreen(Landroid/content/Context;Landroid/content/Intent;)V

    .line 102
    invoke-static {v0, p1}, Lmodmenu/CrashHandler;->postNotification(Landroid/content/Context;Landroid/content/Intent;)V

    .line 103
    return-void
.end method

.method static install(Landroid/content/Context;)V
    .locals 2

    .line 49
    const-string v0, "MWCrash"

    sget-boolean v1, Lmodmenu/CrashHandler;->installed:Z

    if-eqz v1, :cond_0

    .line 50
    return-void

    .line 53
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sput-object p0, Lmodmenu/CrashHandler;->ctx:Landroid/content/Context;

    .line 54
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object p0

    sput-object p0, Lmodmenu/CrashHandler;->previous:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 55
    new-instance p0, Lmodmenu/CrashHandler;

    invoke-direct {p0}, Lmodmenu/CrashHandler;-><init>()V

    invoke-static {p0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 56
    const/4 p0, 0x1

    sput-boolean p0, Lmodmenu/CrashHandler;->installed:Z

    .line 57
    const-string p0, "crash handler installed"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    goto :goto_0

    .line 58
    :catchall_0
    move-exception p0

    .line 60
    const-string v1, "crash handler not installed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 62
    :goto_0
    return-void
.end method

.method private static legacy(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification;
    .locals 1

    .line 160
    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 161
    invoke-virtual {v0, p1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p1

    .line 162
    invoke-virtual {p1, p2}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object p1

    .line 163
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    iget p0, p0, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {p1, p0}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 164
    invoke-virtual {p0, p3}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object p0

    .line 165
    invoke-virtual {p0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    .line 160
    return-object p0
.end method

.method private passThrough(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 2

    .line 170
    sget-object v0, Lmodmenu/CrashHandler;->previous:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 171
    const-string v1, "MWCrash"

    if-eqz v0, :cond_0

    if-eq v0, p0, :cond_0

    .line 173
    :try_start_0
    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 174
    return-void

    .line 175
    :catchall_0
    move-exception p1

    .line 176
    const-string v0, "previous handler failed"

    invoke-static {v1, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 181
    :cond_0
    :try_start_1
    const-string p1, "FATAL"

    invoke-static {v1, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 182
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p1

    invoke-static {p1}, Landroid/os/Process;->killProcess(I)V

    .line 183
    const/16 p1, 0xa

    invoke-static {p1}, Ljava/lang/System;->exit(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 186
    goto :goto_0

    .line 184
    :catchall_1
    move-exception p1

    .line 185
    const-string p2, "cannot terminate"

    invoke-static {v1, p2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 187
    :goto_0
    return-void
.end method

.method private static postNotification(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6

    .line 137
    const-string v0, "MWCrash"

    :try_start_0
    const-string v1, "notification"

    .line 138
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    .line 139
    if-nez v1, :cond_0

    .line 140
    return-void

    .line 142
    :cond_0
    const/4 v2, 0x1

    const/high16 v3, 0xc000000

    invoke-static {p0, v2, p1, v3}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    .line 144
    const-string v2, "mod_crash_notif_title"

    invoke-static {p0, v2}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 145
    const-string v3, "mod_crash_notif_text"

    invoke-static {p0, v3}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 146
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1a

    if-lt v4, v5, :cond_1

    .line 147
    invoke-static {p0, v1, v2, v3, p1}, Lmodmenu/Api26;->build(Landroid/content/Context;Landroid/app/NotificationManager;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification;

    move-result-object p0

    goto :goto_0

    .line 148
    :cond_1
    invoke-static {p0, v2, v3, p1}, Lmodmenu/CrashHandler;->legacy(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)Landroid/app/Notification;

    move-result-object p0

    .line 150
    :goto_0
    const/16 p1, 0x430

    invoke-virtual {v1, p1, p0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 151
    const-string p0, "crash notification posted"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    goto :goto_1

    .line 152
    :catchall_0
    move-exception p0

    .line 153
    const-string p1, "crash notification failed"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 155
    :goto_1
    return-void
.end method

.method private static screenIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 106
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lmodmenu/CrashActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 107
    const/high16 p0, 0x14000000

    invoke-virtual {v0, p0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object p0

    .line 108
    if-nez p1, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    move-object v0, p1

    :goto_0
    const-string v1, "modmenu.crash.PATH"

    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    .line 109
    const-string v0, "modmenu.crash.SUMMARY"

    invoke-virtual {p0, v0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    .line 110
    invoke-static {p2, p1}, Lmodmenu/CrashReport;->forIntent(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "modmenu.crash.TEXT"

    invoke-virtual {p0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    .line 106
    return-object p0
.end method

.method private static startScreen(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 122
    const-string v0, "MWCrash"

    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 123
    const-string p0, "crash screen requested"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 126
    goto :goto_0

    .line 124
    :catchall_0
    move-exception p0

    .line 125
    const-string p1, "crash screen not started"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 127
    :goto_0
    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 3

    .line 66
    sget-boolean v0, Lmodmenu/CrashHandler;->handling:Z

    if-eqz v0, :cond_0

    .line 68
    invoke-direct {p0, p1, p2}, Lmodmenu/CrashHandler;->passThrough(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 69
    return-void

    .line 71
    :cond_0
    const/4 v0, 0x1

    sput-boolean v0, Lmodmenu/CrashHandler;->handling:Z

    .line 73
    :try_start_0
    invoke-direct {p0, p1, p2}, Lmodmenu/CrashHandler;->collect(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    goto :goto_0

    .line 74
    :catchall_0
    move-exception v0

    .line 75
    const-string v1, "MWCrash"

    const-string v2, "crash collection failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 77
    :goto_0
    invoke-direct {p0, p1, p2}, Lmodmenu/CrashHandler;->passThrough(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 78
    return-void
.end method
