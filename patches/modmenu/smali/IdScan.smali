.class public final Lmodmenu/IdScan;
.super Ljava/lang/Object;
.source "IdScan.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmodmenu/IdScan$Result;,
        Lmodmenu/IdScan$Listener;,
        Lmodmenu/IdScan$Entry;
    }
.end annotation


# static fields
.field private static final FILE:Ljava/lang/String; = "mw_ids.json"

.field private static final MAIN:Landroid/os/Handler;

.field private static final POLL_MS:J = 0xfaL

.field private static final TAG:Ljava/lang/String; = "MWIds"

.field private static final TIMEOUT_MS:J = 0x3a98L

.field private static volatile running:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 45
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/IdScan;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000([Ljava/lang/String;)Lmodmenu/IdScan$Result;
    .locals 0

    .line 39
    invoke-static {p0}, Lmodmenu/IdScan;->await([Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$102(Z)Z
    .locals 0

    .line 39
    sput-boolean p0, Lmodmenu/IdScan;->running:Z

    return p0
.end method

.method static synthetic access$200()Landroid/os/Handler;
    .locals 1

    .line 39
    sget-object v0, Lmodmenu/IdScan;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method private static await([Ljava/lang/String;)Lmodmenu/IdScan$Result;
    .locals 6

    .line 157
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3a98

    add-long/2addr v0, v2

    .line 158
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    cmp-long v4, v2, v0

    if-gez v4, :cond_2

    .line 159
    const/4 v2, 0x0

    :goto_1
    array-length v3, p0

    if-ge v2, v3, :cond_1

    .line 160
    aget-object v3, p0, v2

    invoke-static {v3}, Lmodmenu/IdScan;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 161
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x2

    if-le v4, v5, :cond_0

    .line 162
    invoke-static {v3}, Lmodmenu/IdScan;->parse(Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object v3

    .line 163
    if-eqz v3, :cond_0

    .line 164
    return-object v3

    .line 159
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 170
    :cond_1
    const-wide/16 v2, 0xfa

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    goto :goto_0

    .line 171
    :catch_0
    move-exception p0

    .line 172
    nop

    .line 175
    :cond_2
    const-string p0, "timeout"

    invoke-static {p0}, Lmodmenu/IdScan$Result;->fail(Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object p0

    return-object p0
.end method

.method private static luaStr(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 257
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

.method private static parse(Ljava/lang/String;)Lmodmenu/IdScan$Result;
    .locals 17

    .line 204
    const-string v0, "n"

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    move-object/from16 v3, p0

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 205
    invoke-static {v2, v0}, Lmodmenu/IdScan;->strings(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    .line 206
    nop

    .line 207
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_0

    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v5, "err:"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 208
    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object v9, v3

    goto :goto_0

    .line 210
    :cond_0
    const/4 v9, 0x0

    :goto_0
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 211
    const-string v3, "g"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 212
    const/4 v6, 0x0

    :goto_1
    if-eqz v3, :cond_2

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v6, v8, :cond_2

    .line 213
    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 214
    if-eqz v8, :cond_1

    .line 215
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " ("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "t"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, ")"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 218
    :cond_2
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 219
    const-string v3, "m"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 220
    const/4 v8, 0x0

    :goto_2
    if-eqz v3, :cond_4

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v8, v10, :cond_4

    .line 221
    invoke-virtual {v3, v8}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 222
    if-eqz v10, :cond_3

    .line 223
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "o"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v6, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    :cond_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 226
    :cond_4
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 227
    const-string v8, "e"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    .line 228
    const/4 v10, 0x0

    :goto_3
    if-eqz v8, :cond_7

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v10, v11, :cond_7

    .line 229
    invoke-virtual {v8, v10}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    .line 230
    if-nez v11, :cond_5

    .line 231
    const/16 v16, 0x0

    goto :goto_4

    .line 233
    :cond_5
    const-string v12, "i"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 234
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v13

    if-nez v13, :cond_6

    .line 235
    const/16 v16, 0x0

    goto :goto_4

    .line 237
    :cond_6
    new-instance v13, Lmodmenu/IdScan$Entry;

    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v15, "c"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/16 v16, 0x0

    :try_start_1
    const-string v1, "other"

    invoke-virtual {v11, v15, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v15, "s"

    .line 238
    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v13, v12, v14, v1, v11}, Lmodmenu/IdScan$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    invoke-interface {v3, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 228
    :goto_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    :cond_7
    const/16 v16, 0x0

    .line 240
    move-object v0, v3

    new-instance v3, Lmodmenu/IdScan$Result;

    const-string v1, "inmap"

    .line 241
    invoke-virtual {v2, v1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_8

    const/4 v4, 0x1

    const/4 v8, 0x1

    goto :goto_5

    :cond_8
    const/4 v8, 0x0

    :goto_5
    move-object v4, v0

    invoke-direct/range {v3 .. v9}, Lmodmenu/IdScan$Result;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 240
    return-object v3

    .line 242
    :catch_0
    move-exception v0

    goto :goto_6

    :catch_1
    move-exception v0

    const/16 v16, 0x0

    .line 243
    :goto_6
    return-object v16
.end method

.method private static paths(Landroid/content/Context;)[Ljava/lang/String;
    .locals 4

    .line 140
    const-string v0, "mw_ids.json"

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    .line 141
    if-nez v2, :cond_0

    .line 142
    return-object v1

    .line 144
    :cond_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 145
    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 146
    if-nez p0, :cond_1

    .line 147
    filled-new-array {v2, v2}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 149
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

    .line 150
    :catch_0
    move-exception p0

    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "paths failed: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "MWIds"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    return-object v1
.end method

.method private static read(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 179
    nop

    .line 181
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 182
    :try_start_1
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 183
    const/16 v2, 0x2000

    new-array v2, v2, [B

    .line 185
    :goto_0
    invoke-virtual {v1, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_0

    .line 186
    const/4 v4, 0x0

    invoke-virtual {p0, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 188
    :cond_0
    const-string v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 192
    nop

    .line 194
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 196
    goto :goto_1

    .line 195
    :catch_0
    move-exception v0

    .line 188
    :goto_1
    return-object p0

    .line 192
    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_2

    .line 189
    :catch_1
    move-exception p0

    goto :goto_4

    .line 192
    :catchall_1
    move-exception p0

    :goto_2
    if-eqz v0, :cond_1

    .line 194
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 196
    goto :goto_3

    .line 195
    :catch_2
    move-exception v0

    .line 198
    :cond_1
    :goto_3
    throw p0

    .line 189
    :catch_3
    move-exception p0

    move-object v1, v0

    .line 190
    :goto_4
    nop

    .line 192
    if-eqz v1, :cond_2

    .line 194
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 196
    goto :goto_5

    .line 195
    :catch_4
    move-exception p0

    .line 190
    :cond_2
    :goto_5
    return-object v0
.end method

.method public static scan(Landroid/content/Context;Lmodmenu/IdScan$Listener;)V
    .locals 4

    .line 99
    sget-boolean v0, Lmodmenu/IdScan;->running:Z

    if-eqz v0, :cond_0

    .line 100
    const-string p0, "busy"

    invoke-static {p0}, Lmodmenu/IdScan$Result;->fail(Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object p0

    invoke-interface {p1, p0}, Lmodmenu/IdScan$Listener;->onDone(Lmodmenu/IdScan$Result;)V

    .line 101
    return-void

    .line 103
    :cond_0
    invoke-static {p0}, Lmodmenu/IdScan;->paths(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object p0

    .line 104
    if-nez p0, :cond_1

    .line 105
    const-string p0, "nopath"

    invoke-static {p0}, Lmodmenu/IdScan$Result;->fail(Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object p0

    invoke-interface {p1, p0}, Lmodmenu/IdScan$Listener;->onDone(Lmodmenu/IdScan$Result;)V

    .line 106
    return-void

    .line 112
    :cond_1
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    :try_start_0
    array-length v2, p0

    if-ge v1, v2, :cond_2

    .line 113
    new-instance v2, Ljava/io/File;

    aget-object v3, p0, v1

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 112
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 115
    :cond_2
    const/4 v1, 0x1

    sput-boolean v1, Lmodmenu/IdScan;->running:Z

    .line 116
    aget-object v2, p0, v0

    aget-object v1, p0, v1

    invoke-static {v2, v1}, Lmodmenu/IdScan;->script(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-array v2, v0, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    nop

    .line 122
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lmodmenu/IdScan$1;

    invoke-direct {v1, p0, p1}, Lmodmenu/IdScan$1;-><init>([Ljava/lang/String;Lmodmenu/IdScan$Listener;)V

    const-string p0, "mw-idscan"

    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 134
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 135
    return-void

    .line 117
    :catch_0
    move-exception p0

    .line 118
    sput-boolean v0, Lmodmenu/IdScan;->running:Z

    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "send: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lmodmenu/IdScan$Result;->fail(Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object p0

    invoke-interface {p1, p0}, Lmodmenu/IdScan$Listener;->onDone(Lmodmenu/IdScan$Result;)V

    .line 120
    return-void
.end method

.method static script(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 271
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function() local p1=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 272
    invoke-static {p0}, Lmodmenu/IdScan;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\' local p2=\'"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 273
    invoke-static {p1}, Lmodmenu/IdScan;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\' local function enc(v) if v==nil then return \'null\' end local t=type(v) if t==\'boolean\' then return v and \'true\' or \'false\' end if t==\'number\' then if v~=v or v==math.huge or v==-math.huge then return \'0\' end if v==math.floor(v) then return string.format(\'%d\',v) end return string.format(\'%.14g\',v) end if t==\'string\' then local s=v s=string.gsub(s,\'\\\\\',\'\\\\\\\\\') s=string.gsub(s,\'\"\',\'\\\\\"\') s=string.gsub(s,\'[%z\\1-\\31]\',function(c) return string.format(\'\\\\u%04x\',string.byte(c)) end) return \'\"\'..s..\'\"\' end if t==\'table\' then local arr=true local n=0 for k,_ in pairs(v) do n=n+1 if type(k)~=\'number\' then arr=false end end if n>0 then for i=1,n do if v[i]==nil then arr=false break end end else arr=false end local b={} if arr then for i=1,n do b[#b+1]=enc(v[i]) end return \'[\'..table.concat(b,\',\')..\']\' end local first=true for k,val in pairs(v) do local ks=type(k)==\'string\' and k or tostring(k) if first then first=false else b[#b+1]=\',\' end b[#b+1]=enc(ks)..\':\'..enc(val) end return \'{\'..table.concat(b,\'\')..\'}\' end return \'null\' end local function w(j) local function one(p) local ok,fh=pcall(function() return io.open(p,\'w\') end) if not ok or fh==nil then return end pcall(function() fh:write(j) fh:close() end) end one(p1) if p2~=p1 then one(p2) end end local ok,err=pcall(function() local E={} local G={} local M={} local N={} local cap=3000 local gcap=400 local mcap=500 local INV={\'item\',\'plugin\',\'buff\',\'effect\',\'sound\',\'skin\',\'role\',\'avatar\',\'block\',\'recipe\',\'craft\',\'projectile\',\'summon\',\'pet\',\'mob\',\'monster\',\'tool\',\'food\',\'npc\',\'define\',\'def\',\'mgr\',\'manager\',\'script\'} local HARV={\'item\',\'plugin\',\'buff\',\'effect\',\'sound\',\'skin\',\'role\',\'avatar\',\'block\',\'recipe\',\'craft\',\'projectile\',\'summon\',\'pet\',\'mob\',\'monster\',\'tool\',\'food\',\'npc\'} local BAD={\'remove\',\'set\',\'add\',\'create\',\'delete\',\'clear\',\'kill\',\'spawn\',\'drop\',\'buy\',\'equip\',\'apply\',\'send\',\'write\',\'reset\',\'refresh\',\'load\',\'init\',\'destroy\',\'release\',\'save\',\'open\',\'close\',\'start\',\'stop\',\'play\',\'update\',\'change\',\'switch\',\'toggle\',\'damage\',\'heal\',\'random\'} local function has(s,list) local t=string.lower(tostring(s)) for i=1,#list do if string.find(t,list[i],1,true) then return true end end return false end local function catOf(x) local t=string.lower(tostring(x)) for i=1,#HARV do if string.find(t,HARV[i],1,true) then return HARV[i] end end return \'other\' end local function add(v,cat,src,idx) if #E>=cap or type(v)~=\'table\' then return end local id=nil local name=nil local okp=pcall(function() for kk,vv in pairs(v) do if type(kk)==\'string\' then local t=string.lower(kk) local isid=(t==\'id\' or t==\'fid\' or t==\'key\' or t==\'code\' or t==\'uid\' or string.sub(t,-2)==\'id\') if id==nil and isid and (type(vv)==\'number\' or type(vv)==\'string\') then id=vv end if name==nil and type(vv)==\'string\' and vv~=\'\' and (t==\'name\' or t==\'cn\' or t==\'zh\' or t==\'en\' or t==\'title\' or t==\'showname\' or t==\'desc\' or t==\'text\') then name=vv end if name==nil and type(vv)==\'table\' and (t==\'name\' or t==\'string\' or t==\'str\' or t==\'text\') then for sk,sv in pairs(vv) do if type(sv)==\'string\' and sv~=\'\' then name=sv break end end end end end end) if not okp then return end if id==nil then id=idx end if id==nil then return end E[#E+1]={i=tostring(id),n=name or \'\',c=cat,s=src} end local gcount=0 for k,v in pairs(_G) do gcount=gcount+1 if type(k)==\'string\' and #G<gcap and has(k,INV) then G[#G+1]={n=k,t=type(v)} end end N[#N+1]=\'globals=\'..tostring(gcount) local owners={\'DefMgr\',\'ClientCurGame\',\'GameSettingsMgr\',\'GameSettings\'} for i=1,#G do owners[#owners+1]=G[i].n end local seen={} for i=1,#owners do local o=owners[i] if o~=nil and not seen[o] and #M<mcap then seen[o]=1 local g=_G[o] if g~=nil then local idx=nil local okm,mt=pcall(function() return getmetatable(g) end) if okm and type(mt)==\'table\' and type(mt.__index)==\'table\' then idx=mt.__index end if idx==nil then local okd,mt2=pcall(function() return debug.getmetatable(g) end) if okd and type(mt2)==\'table\' and type(mt2.__index)==\'table\' then idx=mt2.__index end end if idx~=nil then pcall(function() for mn,_ in pairs(idx) do if type(mn)==\'string\' and #M<mcap then M[#M+1]={o=o,n=mn} end end end) elseif type(g)==\'table\' then pcall(function() for mn,mv in pairs(g) do if type(mn)==\'string\' and type(mv)==\'function\' and #M<mcap then M[#M+1]={o=o,n=mn} end end end) end end end end local jobs={} for i=1,#M do local n=M[i].n local base=string.match(n,\'^get(%a+)Num$\') or string.match(n,\'^get(%a+)Count$\') if base~=nil and not has(n,BAD) then jobs[#jobs+1]={o=M[i].o,base=base,num=n} end end table.sort(jobs,function(a,b) local pa=has(a.base,HARV) and 0 or 1 local pb=has(b.base,HARV) and 0 or 1 if pa~=pb then return pa<pb end return a.base<b.base end) N[#N+1]=\'jobs=\'..tostring(#jobs) local tried=0 for i=1,#jobs do if #E>=cap or tried>=15 then break end local j=jobs[i] local obj=_G[j.o] if obj~=nil then tried=tried+1 pcall(function() local cnt=obj[j.num](obj) if type(cnt)~=\'number\' or cnt<1 or cnt>30000 then return end local fnames={\'get\'..j.base..\'Def\',\'get\'..j.base,\'get\'..j.base..\'Info\',\'get\'..j.base..\'ByIndex\',\'get\'..j.base..\'At\',\'Get\'..j.base..\'Def\',\'Get\'..j.base..\'ByIndex\'} local fn=nil local fname=\'\' for a=1,#fnames do local r=obj[fnames[a]] if type(r)==\'function\' then fn=r fname=fnames[a] break end end if fn==nil then N[#N+1]=j.o..\'.\'..j.base..\'>nofn\' return end local cat=catOf(j.base) local src=j.o..\'.\'..fname local lim=cnt if lim>1000 then lim=1000 end local got=0 for k=1,lim do local d=fn(obj,k) local before=#E add(d,cat,src,k) if #E>before then got=got+1 end if #E>=cap then break end end N[#N+1]=j.o..\'.\'..j.base..\'=\'..tostring(cnt)..\'>\'..tostring(got) end) end end local hvt=0 for i=1,#G do if #E>=cap or hvt>=12 then break end local nm=G[i].n if G[i].t==\'table\' and has(nm,HARV) then hvt=hvt+1 local t=_G[nm] local cat=catOf(nm) pcall(function() local c=0 for k,v in pairs(t) do c=c+1 if c>500 then break end if type(v)==\'table\' then add(v,cat,nm,k) elseif type(v)==\'string\' and v~=\'\' and (type(k)==\'number\' or (type(k)==\'string\' and #k<48)) then if #E<cap then E[#E+1]={i=tostring(k),n=v,c=cat,s=nm} end end if #E>=cap then break end end end) end end local FNS={\'GetSoundStrDefCsvIdMap\',\'GetParticlesStrDefCsvIdMap\'} for i=1,#FNS do local f=_G[FNS[i]] if type(f)==\'function\' and #E<cap then pcall(function() local r=f() if type(r)~=\'table\' then return end local cat=catOf(FNS[i]) local c=0 for k,v in pairs(r) do c=c+1 if c>500 then break end if type(v)==\'string\' and v~=\'\' and #E<cap then E[#E+1]={i=tostring(k),n=v,c=cat,s=FNS[i]} elseif type(v)==\'table\' then add(v,cat,FNS[i],k) end if #E>=cap then break end end N[#N+1]=FNS[i]..\'=map:\'..tostring(c) end) end end local inmap=false pcall(function() local ci=_G.ClientCurGame if ci~=nil then local r=ci:isInGame() inmap=(r==true or r==1) end end) N[#N+1]=\'entries=\'..tostring(#E) N[#N+1]=\'methods=\'..tostring(#M) w(\'{\"inmap\":\'..(inmap and \'1\' or \'0\')..\',\"n\":\'..enc(N)..\',\"g\":\'..enc(G)..\',\"m\":\'..enc(M)..\',\"e\":\'..enc(E)..\'}\') end) if not ok then w(\'{\"inmap\":0,\"n\":\'..enc({\'err:\'..tostring(err)})..\',\"g\":[],\"m\":[],\"e\":[]}\') end end)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 271
    return-object p0
.end method

.method private static strings(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 248
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 249
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 250
    const/4 p1, 0x0

    :goto_0
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge p1, v1, :cond_0

    .line 251
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 250
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 253
    :cond_0
    return-object v0
.end method
