.class public final Lmodmenu/GameMode;
.super Ljava/lang/Object;
.source "GameMode.java"


# static fields
.field private static final FILE:Ljava/lang/String; = "mw_gm.json"

.field private static final MAIN:Landroid/os/Handler;

.field private static final POLL_MS:J = 0xfaL

.field private static final TAG:Ljava/lang/String; = "MWGameMode"

.field private static final TIMEOUT_MS:J = 0x2ee0L

.field private static volatile polling:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 43
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/GameMode;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000([Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 37
    invoke-static {p0}, Lmodmenu/GameMode;->awaitGuarded([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$102(Z)Z
    .locals 0

    .line 37
    sput-boolean p0, Lmodmenu/GameMode;->polling:Z

    return p0
.end method

.method static synthetic access$200(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 37
    invoke-static {p0, p1}, Lmodmenu/GameMode;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300()Landroid/os/Handler;
    .locals 1

    .line 37
    sget-object v0, Lmodmenu/GameMode;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method private static await([Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 155
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x2ee0

    add-long/2addr v0, v2

    .line 156
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-gez v4, :cond_2

    .line 157
    const/4 v2, 0x0

    :goto_1
    array-length v3, p0

    if-ge v2, v3, :cond_1

    .line 158
    aget-object v3, p0, v2

    invoke-static {v3}, Lmodmenu/GameMode;->state(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 159
    if-eqz v3, :cond_0

    .line 160
    return-object v3

    .line 157
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 164
    :cond_1
    const-wide/16 v2, 0xfa

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    goto :goto_0

    .line 165
    :catch_0
    move-exception p0

    .line 166
    nop

    .line 169
    :cond_2
    const-string p0, "timeout"

    return-object p0
.end method

.method private static awaitGuarded([Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 148
    :try_start_0
    invoke-static {p0}, Lmodmenu/GameMode;->await([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 149
    :catch_0
    move-exception p0

    .line 150
    const-string p0, "fail"

    return-object p0
.end method

.method private static luaStr(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 216
    if-nez p0, :cond_0

    const-string p0, ""

    goto :goto_0

    :cond_0
    const-string v0, "\\"

    const-string v1, "\\\\"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "\'"

    const-string v1, "\\\'"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static message(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 115
    const-string v0, "ok"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    const-string p1, "mod_gm_ok"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 118
    :cond_0
    const-string v0, "nomap"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 119
    const-string p1, "mod_gm_nomap"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 121
    :cond_1
    const-string v0, "unsupported"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 122
    const-string p1, "mod_gm_unsupported"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 124
    :cond_2
    const-string p1, "mod_gm_fail"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static paths(Landroid/content/Context;)[Ljava/lang/String;
    .locals 4

    .line 130
    const-string v0, "mw_gm.json"

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    .line 131
    if-nez v2, :cond_0

    .line 132
    return-object v1

    .line 134
    :cond_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 135
    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 136
    if-nez p0, :cond_1

    .line 137
    filled-new-array {v2, v2}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 139
    :cond_1
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0, v2}, [Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 140
    :catch_0
    move-exception p0

    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "paths failed: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "MWGameMode"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    return-object v1
.end method

.method private static read(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 193
    nop

    .line 195
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 196
    :try_start_1
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 197
    const/16 v2, 0x2000

    new-array v2, v2, [B

    .line 199
    :goto_0
    invoke-virtual {v1, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_0

    .line 200
    const/4 v4, 0x0

    invoke-virtual {p0, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 202
    :cond_0
    const-string v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 206
    nop

    .line 208
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 210
    goto :goto_1

    .line 209
    :catch_0
    move-exception v0

    .line 202
    :goto_1
    return-object p0

    .line 206
    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_2

    .line 203
    :catch_1
    move-exception p0

    goto :goto_4

    .line 206
    :catchall_1
    move-exception p0

    :goto_2
    if-eqz v0, :cond_1

    .line 208
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 210
    goto :goto_3

    .line 209
    :catch_2
    move-exception v0

    .line 212
    :cond_1
    :goto_3
    throw p0

    .line 203
    :catch_3
    move-exception p0

    move-object v1, v0

    .line 204
    :goto_4
    nop

    .line 206
    if-eqz v1, :cond_2

    .line 208
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 210
    goto :goto_5

    .line 209
    :catch_4
    move-exception p0

    .line 204
    :cond_2
    :goto_5
    return-object v0
.end method

.method public static request(Landroid/content/Context;Ljava/lang/Runnable;)V
    .locals 7

    .line 58
    invoke-static {p0}, Lmodmenu/GameMode;->paths(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    .line 59
    const-string v1, "MWGameMode"

    if-nez v0, :cond_0

    .line 60
    const-string v0, "no writable files dir"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    const-string v0, "nopath"

    invoke-static {p0, v0}, Lmodmenu/GameMode;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 62
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 63
    return-void

    .line 65
    :cond_0
    sget-boolean v2, Lmodmenu/GameMode;->polling:Z

    .line 70
    const/4 v3, 0x0

    if-nez v2, :cond_2

    .line 71
    const/4 v4, 0x0

    :goto_0
    :try_start_0
    array-length v5, v0

    if-ge v4, v5, :cond_1

    .line 72
    new-instance v5, Ljava/io/File;

    aget-object v6, v0, v4

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 71
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 74
    :cond_1
    const/4 v4, 0x1

    sput-boolean v4, Lmodmenu/GameMode;->polling:Z

    .line 75
    aget-object v5, v0, v3

    aget-object v4, v0, v4

    invoke-static {v5, v4}, Lmodmenu/GameMode;->script(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-array v5, v3, [Ljava/lang/Object;

    invoke-static {v4, v5}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 77
    :cond_2
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    .line 78
    new-instance v5, Ljava/lang/Thread;

    new-instance v6, Lmodmenu/GameMode$1;

    invoke-direct {v6, v0, v4, p1}, Lmodmenu/GameMode$1;-><init>([Ljava/lang/String;Landroid/content/Context;Ljava/lang/Runnable;)V

    const-string v0, "mw-gamemode"

    invoke-direct {v5, v6, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 94
    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    .line 95
    if-nez v2, :cond_3

    const-string v0, "switch shipped"

    goto :goto_1

    :cond_3
    const-string v0, "resuming poll"

    :goto_1
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    goto :goto_2

    .line 96
    :catch_0
    move-exception v0

    .line 97
    if-nez v2, :cond_4

    .line 98
    sput-boolean v3, Lmodmenu/GameMode;->polling:Z

    .line 100
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dispatch failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    const-string v0, "fail"

    invoke-static {p0, v0}, Lmodmenu/GameMode;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 102
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 104
    :goto_2
    return-void
.end method

.method static script(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 235
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function() local p1=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 236
    invoke-static {p0}, Lmodmenu/GameMode;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\' local p2=\'"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 237
    invoke-static {p1}, Lmodmenu/GameMode;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\' local function w(j) local function one(p) local ok,fh=pcall(function() return io.open(p,\'w\') end) if not ok or fh==nil then return end pcall(function() fh:write(j) fh:close() end) end one(p1) if p2~=p1 then one(p2) end end w(\'{\"started\":1}\') local ok,err=pcall(function() local inmap=false pcall(function() local r=ClientCurGame:isInGame() inmap=(r==true or r==1) end) if not inmap then w(\'{\"r\":\"nomap\"}\') return end local okc,cur=pcall(function() return WorldMgr:getGameMode() end) if not okc or type(cur)~=\'number\' then w(\'{\"r\":\"nomap\"}\') return end cur=math.floor(cur) local target=nil if cur==1 then target=3 elseif cur==3 then target=1 elseif cur==4 then target=5 elseif cur==5 then target=4 end if target==nil then w(\'{\"r\":\"unsupported\",\"cur\":\'..cur..\'}\') return end local fb=true pcall(function() fb=(if_open_scene_fallback()==true) end) local client=false pcall(function() client=(WorldMgr:clientToggleMpGameMode(cur,cur)==true) end) local host=false local hostKnown=false pcall(function() local v=GameNetMgr:isHost() hostKnown=true host=(v==true or v==1) end) local S={} local useClient=((hostKnown and not host) or ((not hostKnown) and client)) if useClient then S[#S+1]=function() WorldMgr:clientToggleMpGameMode(cur,target) end else if cur==1 or cur==3 then S[#S+1]=function() WorldMgr:hostToggleMpGameMode() end end S[#S+1]=function() CurMainPlayer:changeGameMode(fb) end end for i=1,#S do pcall(S[i]) local okm,now=pcall(function() return WorldMgr:getGameMode() end) if okm and type(now)==\'number\' then now=math.floor(now) if now==target then w(\'{\"r\":\"ok\",\"from\":\'..cur..\',\"to\":\'..target..\'}\') return end if now~=cur then w(\'{\"r\":\"fail\",\"cur\":\'..cur..\'}\') return end end end w(\'{\"r\":\"fail\",\"cur\":\'..cur..\'}\') end) if not ok then w(\'{\"r\":\"err\"}\') error(\'MWNM|\'..tostring(err),0) end end)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 235
    return-object p0
.end method

.method private static state(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 176
    invoke-static {p0}, Lmodmenu/GameMode;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 177
    const/4 v0, 0x0

    if-eqz p0, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-gt v1, v2, :cond_0

    goto :goto_1

    .line 181
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 182
    const-string p0, "started"

    const/4 v2, 0x0

    invoke-virtual {v1, p0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    if-eqz p0, :cond_1

    .line 183
    return-object v0

    .line 185
    :cond_1
    const-string p0, "r"

    invoke-virtual {v1, p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 186
    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v1, :cond_2

    goto :goto_0

    :cond_2
    move-object v0, p0

    :cond_3
    :goto_0
    return-object v0

    .line 187
    :catch_0
    move-exception p0

    .line 188
    return-object v0

    .line 178
    :cond_4
    :goto_1
    return-object v0
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 108
    :try_start_0
    invoke-static {p0, p1}, Lmodmenu/GameMode;->message(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    goto :goto_0

    .line 109
    :catch_0
    move-exception p0

    .line 110
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "toast failed: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "MWGameMode"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    :goto_0
    return-void
.end method
