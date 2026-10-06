.class public final Lmodmenu/IdScan;
.super Ljava/lang/Object;
.source "IdScan.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmodmenu/IdScan$Listener;,
        Lmodmenu/IdScan$Result;,
        Lmodmenu/IdScan$Entry;
    }
.end annotation


# static fields
.field private static final FILE:Ljava/lang/String; = "mw_ids.json"

.field private static final MAIN:Landroid/os/Handler;

.field private static final POLL_MS:J = 0xfaL

.field private static final TAG:Ljava/lang/String; = "MWIds"

.field private static final TIMEOUT_MS:J = 0x3a98L

.field private static volatile cached:Lmodmenu/IdScan$Result;

.field private static listener:Lmodmenu/IdScan$Listener;

.field private static volatile polling:Z

.field private static volatile sent:Z

.field private static volatile wantScan:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 55
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/IdScan;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000([Ljava/lang/String;)Lmodmenu/IdScan$Result;
    .locals 0

    .line 49
    invoke-static {p0}, Lmodmenu/IdScan;->awaitGuarded([Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$102(Lmodmenu/IdScan$Result;)Lmodmenu/IdScan$Result;
    .locals 0

    .line 49
    sput-object p0, Lmodmenu/IdScan;->cached:Lmodmenu/IdScan$Result;

    return-object p0
.end method

.method static synthetic access$202(Z)Z
    .locals 0

    .line 49
    sput-boolean p0, Lmodmenu/IdScan;->polling:Z

    return p0
.end method

.method static synthetic access$302(Z)Z
    .locals 0

    .line 49
    sput-boolean p0, Lmodmenu/IdScan;->wantScan:Z

    return p0
.end method

.method static synthetic access$400()Lmodmenu/IdScan$Listener;
    .locals 1

    .line 49
    sget-object v0, Lmodmenu/IdScan;->listener:Lmodmenu/IdScan$Listener;

    return-object v0
.end method

.method static synthetic access$500()Landroid/os/Handler;
    .locals 1

    .line 49
    sget-object v0, Lmodmenu/IdScan;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method private static await([Ljava/lang/String;)Lmodmenu/IdScan$Result;
    .locals 8

    .line 242
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3a98

    add-long/2addr v0, v2

    .line 243
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 244
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    cmp-long v6, v4, v0

    if-gez v6, :cond_3

    .line 245
    const/4 v4, 0x0

    :goto_1
    array-length v5, p0

    if-ge v4, v5, :cond_2

    .line 246
    aget-object v5, p0, v4

    invoke-static {v5}, Lmodmenu/IdScan;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 247
    if-eqz v5, :cond_1

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x2

    if-le v6, v7, :cond_1

    .line 248
    nop

    .line 249
    invoke-static {v5}, Lmodmenu/IdScan;->parse(Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object v3

    .line 250
    if-eqz v3, :cond_0

    .line 251
    return-object v3

    .line 250
    :cond_0
    const/4 v3, 0x1

    .line 245
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 257
    :cond_2
    const-wide/16 v4, 0xfa

    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 260
    goto :goto_0

    .line 258
    :catch_0
    move-exception p0

    .line 259
    nop

    .line 264
    :cond_3
    if-eqz v3, :cond_4

    const-string p0, "timeout(ran)"

    goto :goto_2

    :cond_4
    const-string p0, "timeout"

    :goto_2
    invoke-static {p0}, Lmodmenu/IdScan$Result;->fail(Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object p0

    return-object p0
.end method

.method private static awaitGuarded([Ljava/lang/String;)Lmodmenu/IdScan$Result;
    .locals 2

    .line 233
    :try_start_0
    invoke-static {p0}, Lmodmenu/IdScan;->await([Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 234
    :catch_0
    move-exception p0

    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "poll: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lmodmenu/IdScan$Result;->fail(Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object p0

    return-object p0
.end method

.method public static current(Landroid/content/Context;)Lmodmenu/IdScan$Result;
    .locals 6

    .line 134
    sget-object v0, Lmodmenu/IdScan;->cached:Lmodmenu/IdScan$Result;

    .line 135
    sget-boolean v1, Lmodmenu/IdScan;->sent:Z

    if-eqz v1, :cond_2

    if-eqz v0, :cond_0

    iget-object v1, v0, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 136
    :cond_0
    invoke-static {p0}, Lmodmenu/IdScan;->paths(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object p0

    .line 137
    if-eqz p0, :cond_2

    .line 138
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_2

    .line 139
    aget-object v3, p0, v2

    invoke-static {v3}, Lmodmenu/IdScan;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 140
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x2

    if-le v4, v5, :cond_1

    .line 141
    invoke-static {v3}, Lmodmenu/IdScan;->parse(Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object v3

    .line 142
    if-eqz v3, :cond_1

    iget-object v4, v3, Lmodmenu/IdScan$Result;->error:Ljava/lang/String;

    if-nez v4, :cond_1

    .line 143
    sput-object v3, Lmodmenu/IdScan;->cached:Lmodmenu/IdScan$Result;

    .line 144
    sput-boolean v1, Lmodmenu/IdScan;->wantScan:Z

    .line 145
    return-object v3

    .line 138
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 151
    :cond_2
    return-object v0
.end method

.method private static luaStr(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 351
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

.method public static menuClosed(Landroid/content/Context;)V
    .locals 5

    .line 162
    sget-boolean v0, Lmodmenu/IdScan;->wantScan:Z

    if-eqz v0, :cond_3

    sget-boolean v0, Lmodmenu/IdScan;->polling:Z

    if-eqz v0, :cond_0

    goto/16 :goto_1

    .line 165
    :cond_0
    invoke-static {p0}, Lmodmenu/IdScan;->paths(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object p0

    .line 166
    const-string v0, "MWIds"

    if-nez p0, :cond_1

    .line 167
    const-string p0, "no writable files dir"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    const-string p0, "nopath"

    invoke-static {p0}, Lmodmenu/IdScan$Result;->fail(Ljava/lang/String;)Lmodmenu/IdScan$Result;

    move-result-object p0

    sput-object p0, Lmodmenu/IdScan;->cached:Lmodmenu/IdScan$Result;

    .line 169
    return-void

    .line 175
    :cond_1
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    :try_start_0
    array-length v3, p0

    if-ge v2, v3, :cond_2

    .line 176
    new-instance v3, Ljava/io/File;

    aget-object v4, p0, v2

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 175
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 178
    :cond_2
    const/4 v2, 0x1

    sput-boolean v2, Lmodmenu/IdScan;->polling:Z

    .line 179
    aget-object v3, p0, v1

    aget-object v4, p0, v2

    invoke-static {v3, v4}, Lmodmenu/IdScan;->script(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-array v4, v1, [Ljava/lang/Object;

    invoke-static {v3, v4}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 180
    sput-boolean v2, Lmodmenu/IdScan;->sent:Z

    .line 181
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lmodmenu/IdScan$1;

    invoke-direct {v3, p0}, Lmodmenu/IdScan$1;-><init>([Ljava/lang/String;)V

    const-string p0, "mw-idscan"

    invoke-direct {v2, v3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 202
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 203
    const-string p0, "scan shipped at menu close"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 209
    nop

    .line 210
    return-void

    .line 204
    :catch_0
    move-exception p0

    .line 205
    sput-boolean v1, Lmodmenu/IdScan;->polling:Z

    .line 206
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "dispatch failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 207
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

    sput-object p0, Lmodmenu/IdScan;->cached:Lmodmenu/IdScan$Result;

    .line 208
    return-void

    .line 163
    :cond_3
    :goto_1
    return-void
.end method

.method private static parse(Ljava/lang/String;)Lmodmenu/IdScan$Result;
    .locals 17

    .line 293
    const-string v0, "n"

    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    move-object/from16 v3, p0

    invoke-direct {v2, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 296
    const-string v3, "started"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    if-eqz v3, :cond_0

    .line 297
    return-object v1

    .line 299
    :cond_0
    invoke-static {v2, v0}, Lmodmenu/IdScan;->strings(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    .line 300
    nop

    .line 301
    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v5, "err:"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 302
    invoke-interface {v9, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object v11, v3

    goto :goto_0

    .line 304
    :cond_1
    move-object v11, v1

    :goto_0
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 305
    const-string v3, "g"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 306
    const/4 v5, 0x0

    :goto_1
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_3

    .line 307
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 308
    if-eqz v6, :cond_2

    .line 309
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, " ("

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, "t"

    invoke-virtual {v6, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ")"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 306
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 312
    :cond_3
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 313
    const-string v3, "m"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 314
    const/4 v5, 0x0

    :goto_2
    if-eqz v3, :cond_5

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v5, v6, :cond_5

    .line 315
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    .line 316
    if-eqz v6, :cond_4

    .line 317
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "o"

    invoke-virtual {v6, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v12, "."

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v8, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 314
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 320
    :cond_5
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 321
    const-string v3, "e"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 322
    const/4 v5, 0x0

    :goto_3
    if-eqz v3, :cond_8

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v5, v10, :cond_8

    .line 323
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 324
    if-nez v10, :cond_6

    .line 325
    move-object/from16 v16, v1

    goto :goto_4

    .line 327
    :cond_6
    const-string v12, "i"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 328
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v13

    if-nez v13, :cond_7

    .line 329
    move-object/from16 v16, v1

    goto :goto_4

    .line 331
    :cond_7
    new-instance v13, Lmodmenu/IdScan$Entry;

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v15, "c"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v16, v1

    :try_start_1
    const-string v1, "other"

    invoke-virtual {v10, v15, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v15, "s"

    .line 332
    invoke-virtual {v10, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v13, v12, v14, v1, v10}, Lmodmenu/IdScan$Entry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 331
    invoke-interface {v6, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 322
    :goto_4
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v1, v16

    goto :goto_3

    :cond_8
    move-object/from16 v16, v1

    .line 334
    new-instance v5, Lmodmenu/IdScan$Result;

    const-string v0, "inmap"

    .line 335
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_9

    const/4 v4, 0x1

    const/4 v10, 0x1

    goto :goto_5

    :cond_9
    const/4 v10, 0x0

    :goto_5
    invoke-direct/range {v5 .. v11}, Lmodmenu/IdScan$Result;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 334
    return-object v5

    .line 336
    :catch_0
    move-exception v0

    goto :goto_6

    :catch_1
    move-exception v0

    move-object/from16 v16, v1

    .line 337
    :goto_6
    return-object v16
.end method

.method private static paths(Landroid/content/Context;)[Ljava/lang/String;
    .locals 4

    .line 215
    const-string v0, "mw_ids.json"

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    .line 216
    if-nez v2, :cond_0

    .line 217
    return-object v1

    .line 219
    :cond_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 220
    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 221
    if-nez p0, :cond_1

    .line 222
    filled-new-array {v2, v2}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 224
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

    .line 225
    :catch_0
    move-exception p0

    .line 226
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

    .line 227
    return-object v1
.end method

.method private static read(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 268
    nop

    .line 270
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 271
    :try_start_1
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 272
    const/16 v2, 0x2000

    new-array v2, v2, [B

    .line 274
    :goto_0
    invoke-virtual {v1, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_0

    .line 275
    const/4 v4, 0x0

    invoke-virtual {p0, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 277
    :cond_0
    const-string v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 281
    nop

    .line 283
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 285
    goto :goto_1

    .line 284
    :catch_0
    move-exception v0

    .line 277
    :goto_1
    return-object p0

    .line 281
    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_2

    .line 278
    :catch_1
    move-exception p0

    goto :goto_4

    .line 281
    :catchall_1
    move-exception p0

    :goto_2
    if-eqz v0, :cond_1

    .line 283
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 285
    goto :goto_3

    .line 284
    :catch_2
    move-exception v0

    .line 287
    :cond_1
    :goto_3
    throw p0

    .line 278
    :catch_3
    move-exception p0

    move-object v1, v0

    .line 279
    :goto_4
    nop

    .line 281
    if-eqz v1, :cond_2

    .line 283
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 285
    goto :goto_5

    .line 284
    :catch_4
    move-exception p0

    .line 279
    :cond_2
    :goto_5
    return-object v0
.end method

.method public static request()V
    .locals 1

    .line 117
    const/4 v0, 0x1

    sput-boolean v0, Lmodmenu/IdScan;->wantScan:Z

    .line 118
    return-void
.end method

.method public static scanning()Z
    .locals 1

    .line 125
    sget-boolean v0, Lmodmenu/IdScan;->polling:Z

    return v0
.end method

.method static script(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 366
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function() local p1=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 367
    invoke-static {p0}, Lmodmenu/IdScan;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\' local p2=\'"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 368
    invoke-static {p1}, Lmodmenu/IdScan;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\' local function enc(v) if v==nil then return \'null\' end local t=type(v) if t==\'boolean\' then return v and \'true\' or \'false\' end if t==\'number\' then if v~=v or v==math.huge or v==-math.huge then return \'0\' end if v==math.floor(v) then return string.format(\'%d\',v) end return string.format(\'%.14g\',v) end if t==\'string\' then local s=v s=string.gsub(s,\'\\\\\',\'\\\\\\\\\') s=string.gsub(s,\'\"\',\'\\\\\"\') s=string.gsub(s,\'[%z\\1-\\31]\',function(c) return string.format(\'\\\\u%04x\',string.byte(c)) end) return \'\"\'..s..\'\"\' end if t==\'table\' then local arr=true local n=0 for k,_ in pairs(v) do n=n+1 if type(k)~=\'number\' then arr=false end end if n>0 then for i=1,n do if v[i]==nil then arr=false break end end else arr=false end local b={} if arr then for i=1,n do b[#b+1]=enc(v[i]) end return \'[\'..table.concat(b,\',\')..\']\' end local first=true for k,val in pairs(v) do local ks=type(k)==\'string\' and k or tostring(k) if first then first=false else b[#b+1]=\',\' end b[#b+1]=enc(ks)..\':\'..enc(val) end return \'{\'..table.concat(b,\'\')..\'}\' end return \'null\' end local function w(j) local function one(p) local ok,fh=pcall(function() return io.open(p,\'w\') end) if not ok or fh==nil then return end pcall(function() fh:write(j) fh:close() end) end one(p1) if p2~=p1 then one(p2) end end w(\'{\"started\":1}\') local ok,err=pcall(function() local E={} local G={} local M={} local N={} local seen={} local cap=10000 local gcap=600 local mcap=500 local INV={\'item\',\'plugin\',\'buff\',\'effect\',\'sound\',\'skin\',\'role\',\'avatar\',\'block\',\'recipe\',\'craft\',\'projectile\',\'summon\',\'pet\',\'mob\',\'monster\',\'tool\',\'food\',\'npc\',\'define\',\'def\',\'mgr\',\'manager\',\'script\'} local HARV={\'item\',\'plugin\',\'buff\',\'effect\',\'sound\',\'skin\',\'role\',\'avatar\',\'block\',\'recipe\',\'craft\',\'projectile\',\'summon\',\'pet\',\'mob\',\'monster\',\'tool\',\'food\',\'npc\'} local BAD={\'remove\',\'set\',\'add\',\'create\',\'delete\',\'clear\',\'kill\',\'spawn\',\'drop\',\'buy\',\'equip\',\'apply\',\'send\',\'write\',\'reset\',\'refresh\',\'load\',\'init\',\'destroy\',\'release\',\'save\',\'open\',\'close\',\'start\',\'stop\',\'play\',\'update\',\'change\',\'switch\',\'toggle\',\'damage\',\'heal\',\'random\'} local function words(s) local t=tostring(s) t=string.gsub(t,\'(%l)(%u)\',\'%1 %2\') t=string.gsub(t,\'_\',\' \') local o={} for w in string.gmatch(t,\'%a+\') do o[#o+1]=string.lower(w) end return o end local function hit(w,c) if w==c then return true end if string.sub(w,1,#c)==c then return true end return #w>#c and string.sub(w,-#c)==c end local function hasWord(s,list) local ws=words(s) for i=1,#list do for j=1,#ws do if hit(ws[j],list[i]) then return true end end end return false end local function has(s,list) local t=string.lower(tostring(s)) for i=1,#list do if string.find(t,list[i],1,true) then return true end end return false end local function catOf(x) local ws=words(x) for i=1,#HARV do for j=1,#ws do if hit(ws[j],HARV[i]) then return HARV[i] end end end return \'other\' end local function push(id,name,cat,src) if #E>=cap then return false end local sid=tostring(id) if string.sub(sid,1,1)==\'.\' or string.sub(sid,1,2)==\'__\' or string.sub(sid,1,6)==\'tolua_\' then return false end local key=cat..\'#\'..sid if seen[key] then return false end seen[key]=1 E[#E+1]={i=sid,n=name or \'\',c=cat,s=src} return true end local function add(v,cat,src,idx) if #E>=cap or type(v)~=\'table\' then return end local id=nil local name=nil local okp=pcall(function() for kk,vv in pairs(v) do if type(kk)==\'string\' then local t=string.lower(kk) local isid=(t==\'id\' or t==\'fid\' or t==\'key\' or t==\'code\' or t==\'uid\' or string.sub(t,-2)==\'id\') if id==nil and isid and (type(vv)==\'number\' or type(vv)==\'string\') then id=vv end if name==nil and type(vv)==\'string\' and vv~=\'\' and (t==\'name\' or t==\'cn\' or t==\'zh\' or t==\'en\' or t==\'title\' or t==\'showname\' or t==\'desc\' or t==\'text\') then name=vv end if name==nil and type(vv)==\'table\' and (t==\'name\' or t==\'string\' or t==\'str\' or t==\'text\') then for sk,sv in pairs(vv) do if type(sv)==\'string\' and sv~=\'\' then name=sv break end end end end end end) if not okp then return end if id==nil then id=idx end if id==nil then return end push(id,name,cat,src) end local gcount=0 local OWN={} local CP={} for k,v in pairs(_G) do gcount=gcount+1 if type(k)==\'string\' then if #G<gcap and hasWord(k,INV) then G[#G+1]={n=k,t=type(v)} end if #OWN<40 and (string.match(k,\'Mgr$\') or string.match(k,\'Manager$\') or string.match(k,\'Csv$\') or string.match(k,\'Def$\') or string.match(k,\'Define$\')) then OWN[#OWN+1]=k end if #CP<40 and type(v)==\'function\' then local cb=string.match(k,\'^Get([A-Z][%a]+)Count$\') if cb then CP[#CP+1]={f=k,b=cb} end end end end N[#N+1]=\'globals=\'..tostring(gcount) local owners={\'DefMgr\',\'ClientCurGame\',\'GameSettingsMgr\',\'GameSettings\'} for i=1,#G do owners[#owners+1]=G[i].n end local oseen={} for i=1,#owners do local o=owners[i] if o~=nil and not oseen[o] and #M<mcap then oseen[o]=1 local g=_G[o] if g~=nil then local idx=nil local okm,mt=pcall(function() return getmetatable(g) end) if okm and type(mt)==\'table\' and type(mt.__index)==\'table\' then idx=mt.__index end if idx==nil then local okd,mt2=pcall(function() return debug.getmetatable(g) end) if okd and type(mt2)==\'table\' and type(mt2.__index)==\'table\' then idx=mt2.__index end end if idx~=nil then pcall(function() for mn,_ in pairs(idx) do if type(mn)==\'string\' and #M<mcap then M[#M+1]={o=o,n=mn} end end end) elseif type(g)==\'table\' then pcall(function() for mn,mv in pairs(g) do if type(mn)==\'string\' and type(mv)==\'function\' and #M<mcap then M[#M+1]={o=o,n=mn} end end end) end end end end local jobs={} for i=1,#M do local n=M[i].n local base=string.match(n,\'^get(%a+)Num$\') or string.match(n,\'^get(%a+)Count$\') if base~=nil and not has(n,BAD) then jobs[#jobs+1]={o=M[i].o,base=base,num=n} end end table.sort(jobs,function(a,b) local pa=hasWord(a.base,HARV) and 0 or 1 local pb=hasWord(b.base,HARV) and 0 or 1 if pa~=pb then return pa<pb end return a.base<b.base end) N[#N+1]=\'jobs=\'..tostring(#jobs) local tried=0 for i=1,#jobs do if #E>=cap or tried>=15 then break end local j=jobs[i] local obj=_G[j.o] if obj~=nil then tried=tried+1 pcall(function() local cnt=obj[j.num](obj) if type(cnt)~=\'number\' or cnt<1 or cnt>30000 then return end local fnames={\'get\'..j.base..\'Def\',\'get\'..j.base,\'get\'..j.base..\'Info\',\'get\'..j.base..\'ByIndex\',\'get\'..j.base..\'At\',\'Get\'..j.base..\'Def\',\'Get\'..j.base..\'ByIndex\'} local fn=nil local fname=\'\' for a=1,#fnames do local r=obj[fnames[a]] if type(r)==\'function\' then fn=r fname=fnames[a] break end end if fn==nil then N[#N+1]=j.o..\'.\'..j.base..\'>nofn\' return end local cat=catOf(j.base) local src=j.o..\'.\'..fname local lim=cnt if lim>1000 then lim=1000 end local got=0 for k=1,lim do local d=fn(obj,k) local before=#E add(d,cat,src,k) if #E>before then got=got+1 end if #E>=cap then break end end N[#N+1]=j.o..\'.\'..j.base..\'=\'..tostring(cnt)..\'>\'..tostring(got) end) end end local BASES={\'Item\',\'Block\',\'Buff\',\'Effect\',\'Sound\',\'Particle\',\'Skin\',\'RoleSkin\',\'Role\',\'Avatar\',\'Monster\',\'Mob\',\'Pet\',\'PetSkill\',\'Recipe\',\'Craft\',\'Projectile\',\'Summon\',\'Food\',\'Npc\',\'Tool\',\'Key\',\'Hotkey\',\'Task\',\'Quest\',\'Achievement\',\'Award\',\'Home\',\'Horse\',\'Actor\',\'Score\',\'Shop\',\'Trade\',\'Mall\',\'Equip\',\'Weapon\',\'Armor\',\'Tower\',\'Bag\',\'Backpack\',\'Map\',\'World\',\'Language\',\'Text\',\'Tutorial\',\'Guide\',\'Emoji\',\'Title\',\'Sign\',\'Chat\',\'Festival\',\'Activity\',\'Mount\',\'Vehicle\',\'Furniture\',\'Decoration\',\'Frame\',\'Book\',\'Crop\',\'Seed\',\'Music\',\'GSound\',\'Seq\',\'StatusEffect\'} local prows={\'DefMgr\'} for i=1,#OWN do prows[#prows+1]=OWN[i] end local pseen={} local probed=0 for i=1,#prows do local o=prows[i] if probed>=15 or #E>=cap then break end if o~=nil and not pseen[o] then pseen[o]=1 local obj=_G[o] if obj~=nil then for b=1,#BASES do if probed>=15 or #E>=cap then break end local base=BASES[b] local gn=\'get\'..base..\'Num\' if not has(gn,BAD) then local oka,nfn=pcall(function() return obj[gn] or obj[\'get\'..base..\'Count\'] end) local okb,dfn=pcall(function() return obj[\'get\'..base..\'Def\'] or obj[\'get\'..base..\'ByIndex\'] or obj[\'get\'..base..\'Info\'] or obj[\'Get\'..base..\'Def\'] end) if oka and okb and type(nfn)==\'function\' and type(dfn)==\'function\' then probed=probed+1 pcall(function() local cnt=nfn(obj) if type(cnt)~=\'number\' or cnt<1 or cnt>30000 then return end local cat=catOf(base) local lim=cnt>5000 and 5000 or cnt for k=1,lim do add(dfn(obj,k),cat,o..\'.\'..base,k) if #E>=cap then break end end N[#N+1]=\'probe \'..o..\'.\'..base..\'=\'..tostring(cnt) end) end end end end end end N[#N+1]=\'probes=\'..tostring(probed) local pp=0 for i=1,#CP do if pp>=10 or #E>=cap then break end local b1=CP[i].b local cat=catOf(b1) if cat~=\'other\' then local b2=string.gsub(b1,\'s$\',\'\') local f1=_G[CP[i].f] local f2=_G[\'Get\'..b1..\'ByIndex\'] or _G[\'Get\'..b1..\'Def\'] or _G[\'Get\'..b2..\'ByIndex\'] or _G[\'Get\'..b2..\'Def\'] if type(f1)==\'function\' and type(f2)==\'function\' then pp=pp+1 pcall(function() local cnt=f1() if type(cnt)~=\'number\' or cnt<1 or cnt>30000 then return end local lim=cnt>1500 and 1500 or cnt for k=1,lim do add(f2(k),cat,CP[i].f,k) if #E>=cap then break end end N[#N+1]=\'pair \'..CP[i].f..\'=\'..tostring(cnt) end) end end end N[#N+1]=\'pairs=\'..tostring(pp) local hvt=0 for i=1,#G do if #E>=cap or hvt>=12 then break end local nm=G[i].n if G[i].t==\'table\' and hasWord(nm,HARV) then hvt=hvt+1 local t=_G[nm] local cat=catOf(nm) pcall(function() local c=0 for k,v in pairs(t) do c=c+1 if c>1000 then break end if type(v)==\'table\' then add(v,cat,nm,k) elseif type(v)==\'string\' and v~=\'\' and (type(k)==\'number\' or (type(k)==\'string\' and #k<48)) then push(k,v,cat,nm) end if #E>=cap then break end end end) end end local FNS={\'GetSoundStrDefCsvIdMap\',\'GetParticlesStrDefCsvIdMap\'} for i=1,#FNS do local f=_G[FNS[i]] if type(f)==\'function\' and #E<cap then pcall(function() local r=f() if type(r)~=\'table\' then return end local cat=catOf(FNS[i]) local c=0 for k,v in pairs(r) do c=c+1 if c>500 then break end if type(v)==\'string\' and v~=\'\' then push(k,v,cat,FNS[i]) elseif type(v)==\'table\' then add(v,cat,FNS[i],k) end if #E>=cap then break end end N[#N+1]=FNS[i]..\'=map:\'..tostring(c) end) end end local FAM={item=\'item\',block=\'block\',mob=\'mob\',monster=\'monster\',buff=\'buff\',buffattrt=\'buff\',effect=\'effect\',status_effect=\'effect\',seq=\'sound\',sound=\'sound\',gsound=\'sound\',sfx=\'sound\',bgm=\'sound\',skin=\'skin\',role=\'role\',avatar=\'avatar\',craft=\'craft\',recipe=\'recipe\',projectile=\'projectile\',summon=\'summon\',pet=\'pet\',food=\'food\',npc=\'npc\',tool=\'tool\',ugctooltype=\'tool\',task=\'task\',achievement=\'achievement\',achv=\'achievement\',equip=\'equip\',armor=\'armor\',weapon=\'weapon\',bag=\'bag\',backpack=\'bag\',tower=\'tower\',horse=\'horse\',mount=\'mount\',emoji=\'emoji\',title=\'title\',festival=\'festival\',activity=\'activity\',award=\'award\',shop=\'shop\',trade=\'trade\',mall=\'mall\',home=\'home\',furniture=\'furniture\',crop=\'crop\',seed=\'seed\'} local cn=0 for k,v in pairs(_G) do if #E>=cap then break end if type(k)==\'string\' and type(v)==\'number\' and v>=0 and v<2147483648 and v==math.floor(v) and string.match(k,\'^[A-Z][A-Z0-9_]*$\') then local a,b=string.match(k,\'^([A-Z]+)_([A-Z0-9]+)\') if a then local cat=FAM[string.lower(a)] if cat==nil and b then cat=FAM[string.lower(a..\'_\'..b)] end if cat~=nil then if push(v,k,cat,\'const\') then cn=cn+1 end end end end end N[#N+1]=\'constants=\'..tostring(cn) local inmap=false pcall(function() local ci=_G.ClientCurGame if ci~=nil then local r=ci:isInGame() inmap=(r==true or r==1) end end) N[#N+1]=\'entries=\'..tostring(#E) N[#N+1]=\'methods=\'..tostring(#M) w(\'{\"inmap\":\'..(inmap and \'1\' or \'0\')..\',\"n\":\'..enc(N)..\',\"g\":\'..enc(G)..\',\"m\":\'..enc(M)..\',\"e\":\'..enc(E)..\'}\') end) if not ok then w(\'{\"inmap\":0,\"n\":\'..enc({\'err:\'..tostring(err)})..\',\"g\":[],\"m\":[],\"e\":[]}\') error(\'MWID|\'..tostring(err),0) end end)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 366
    return-object p0
.end method

.method public static setListener(Lmodmenu/IdScan$Listener;)V
    .locals 0

    .line 121
    sput-object p0, Lmodmenu/IdScan;->listener:Lmodmenu/IdScan$Listener;

    .line 122
    return-void
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

    .line 342
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 343
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 344
    const/4 p1, 0x0

    :goto_0
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge p1, v1, :cond_0

    .line 345
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 344
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 347
    :cond_0
    return-object v0
.end method
