.class public final Lmodmenu/GiveItem;
.super Ljava/lang/Object;
.source "GiveItem.java"


# static fields
.field private static final CHECKS:I = 0xc

.field private static final CHECK_MS:J = 0x1c2L

.field private static final FILE:Ljava/lang/String; = "mw_give.json"

.field private static final MAIN:Landroid/os/Handler;

.field private static final POLL_MS:J = 0xfaL

.field private static final TAG:Ljava/lang/String; = "MWGiveItem"

.field private static final TIMEOUT_MS:J = 0x2ee0L

.field private static volatile polling:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 64
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/GiveItem;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000([Ljava/lang/String;J)Ljava/lang/String;
    .locals 0

    .line 54
    invoke-static {p0, p1, p2}, Lmodmenu/GiveItem;->awaitGuarded([Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100([Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 54
    invoke-static {p0}, Lmodmenu/GiveItem;->reason([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200([Ljava/lang/String;IJ)Ljava/lang/String;
    .locals 0

    .line 54
    invoke-static {p0, p1, p2, p3}, Lmodmenu/GiveItem;->verify([Ljava/lang/String;IJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$302(Z)Z
    .locals 0

    .line 54
    sput-boolean p0, Lmodmenu/GiveItem;->polling:Z

    return p0
.end method

.method static synthetic access$400(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 54
    invoke-static {p0, p1, p2}, Lmodmenu/GiveItem;->toast(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500()Landroid/os/Handler;
    .locals 1

    .line 54
    sget-object v0, Lmodmenu/GiveItem;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static act(Ljava/lang/String;Ljava/lang/String;IIJ)Ljava/lang/String;
    .locals 2

    .line 376
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function() local p1=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 377
    invoke-static {p0}, Lmodmenu/GiveItem;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\' local p2=\'"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 378
    invoke-static {p1}, Lmodmenu/GiveItem;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\' local ITEM="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " local N="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " local UID="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 381
    invoke-static {p4, p5}, Lmodmenu/GiveItem;->luaNum(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " local function w(j) local function one(p) local ok,fh=pcall(function() return io.open(p,\'w\') end) if not ok or fh==nil then return end pcall(function() fh:write(j) fh:close() end) end one(p1) if p2~=p1 then one(p2) end end w(\'{\"started\":1}\') local ok,err=pcall(function() local inmap=false pcall(function() local r=ClientCurGame:isInGame() inmap=(r==true or r==1) end) if not inmap then w(\'{\"r\":\"nomap\"}\') return end if ITEM<=0 or N<=0 then w(\'{\"r\":\"bad\"}\') return end if UID==0 then local bag=nil pcall(function() bag=ClientBackpack end) local okb,b0=pcall(function() return bag:getItemCountInNormalPack(ITEM) end) if not bag or type(b0)~=\'number\' then w(\'{\"r\":\"fail\",\"why\":\"nobag\"}\') return end b0=math.floor(b0) local idx=nil pcall(function() idx=bag:getEmptyBagIndex() end) if type(idx)~=\'number\' then w(\'{\"r\":\"fail\",\"why\":\"noindex\"}\') return end idx=math.floor(idx) if idx<0 or idx>1000 then w(\'{\"r\":\"full\",\"b\":\'..b0..\'}\') return end local sent=false pcall(function() CurMainPlayer:setItem(ITEM,idx,N) sent=true end) if not sent then w(\'{\"r\":\"fail\",\"why\":\"nosend\"}\') return end pcall(function() CurMainPlayer:gainItemsUserdata(ITEM,b0+N,\'\') end) w(\'{\"r\":\"wait\",\"want\":\'..(b0+N)..\',\"u\":0}\') return end local target=nil pcall(function() target=WorldMgr:getPlayerByUin(UID) end) if target==nil then w(\'{\"r\":\"notarget\"}\') return end local bag=nil pcall(function() bag=target:getBackPack() end) local okb,b0=pcall(function() return bag:getItemCountInNormalPack(ITEM) end) if not bag or type(b0)~=\'number\' then w(\'{\"r\":\"fail\",\"why\":\"nobag\"}\') return end b0=math.floor(b0) local probed=false local r=nil pcall(function() r=target:gainItems(ITEM,b0) probed=true end) if not probed or type(r)~=\'number\' then w(\'{\"r\":\"fail\",\"why\":\"nogain\"}\') return end local auth=false pcall(function() local v=GameNetMgr:isHost() auth=(v==true or v==1) end) if r<0 then local sent=false pcall(function() target:gainItemsUserdata(ITEM,b0+N,\'\') sent=true end) if not sent then w(\'{\"r\":\"fail\",\"why\":\"nosend\"}\') return end w(\'{\"r\":\"wait\",\"want\":\'..(b0+N)..\',\"u\":\'..UID..\'}\') return end if not auth then w(\'{\"r\":\"noclient\"}\') return end local applied=false pcall(function() target:gainItems(ITEM,b0+N) applied=true end) if not applied then w(\'{\"r\":\"fail\",\"why\":\"nogain\"}\') return end w(\'{\"r\":\"wait\",\"want\":\'..(b0+N)..\',\"u\":\'..UID..\'}\') end) if not ok then w(\'{\"r\":\"err\"}\') error(\'MWNM|\'..tostring(err),0) end end)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 376
    return-object p0
.end method

.method private static await([Ljava/lang/String;J)Ljava/lang/String;
    .locals 3

    .line 278
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long/2addr v0, p1

    .line 279
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    cmp-long v2, p1, v0

    if-gez v2, :cond_2

    .line 280
    const/4 p1, 0x0

    :goto_1
    array-length p2, p0

    if-ge p1, p2, :cond_1

    .line 281
    aget-object p2, p0, p1

    invoke-static {p2}, Lmodmenu/GiveItem;->state(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 282
    if-eqz p2, :cond_0

    .line 283
    return-object p2

    .line 280
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 287
    :cond_1
    const-wide/16 p1, 0xfa

    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 290
    goto :goto_0

    .line 288
    :catch_0
    move-exception p0

    .line 289
    nop

    .line 292
    :cond_2
    const-string p0, "timeout"

    return-object p0
.end method

.method private static awaitGuarded([Ljava/lang/String;J)Ljava/lang/String;
    .locals 0

    .line 271
    :try_start_0
    invoke-static {p0, p1, p2}, Lmodmenu/GiveItem;->await([Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 272
    :catch_0
    move-exception p0

    .line 273
    const-string p0, "timeout"

    return-object p0
.end method

.method static check(Ljava/lang/String;Ljava/lang/String;IJJ)Ljava/lang/String;
    .locals 2

    .line 494
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function() local p1=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 495
    invoke-static {p0}, Lmodmenu/GiveItem;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\' local p2=\'"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 496
    invoke-static {p1}, Lmodmenu/GiveItem;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "\' local ITEM="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " local WANT="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 498
    invoke-static {p3, p4}, Lmodmenu/GiveItem;->luaNum(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " local UID="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 499
    invoke-static {p5, p6}, Lmodmenu/GiveItem;->luaNum(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " local function w(j) local function one(p) local ok,fh=pcall(function() return io.open(p,\'w\') end) if not ok or fh==nil then return end pcall(function() fh:write(j) fh:close() end) end one(p1) if p2~=p1 then one(p2) end end w(\'{\"started\":1}\') local ok,err=pcall(function() local bag=nil if UID==0 then pcall(function() bag=ClientBackpack end) else local t=nil pcall(function() t=WorldMgr:getPlayerByUin(UID) end) if t~=nil then pcall(function() bag=t:getBackPack() end) end end local n=nil pcall(function() n=bag:getItemCountInNormalPack(ITEM) end) if type(n)~=\'number\' then w(\'{\"r\":\"wait\"}\') return end n=math.floor(n) if n>=WANT then w(\'{\"r\":\"ok\",\"have\":\'..n..\'}\') else w(\'{\"r\":\"wait\"}\') end end) if not ok then w(\'{\"r\":\"wait\"}\') end end)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 494
    return-object p0
.end method

.method private static luaNum(J)Ljava/lang/String;
    .locals 0

    .line 359
    invoke-static {p0, p1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static luaStr(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 354
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

.method private static message(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 197
    const-string v0, "ok"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 198
    const-string p1, "mod_give_ok"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 200
    :cond_0
    const-string v0, "nomap"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 201
    const-string p1, "mod_give_nomap"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 203
    :cond_1
    const-string v0, "notarget"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 204
    const-string p1, "mod_give_notarget"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 206
    :cond_2
    const-string v0, "noclient"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 207
    const-string p1, "mod_give_noclient"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 209
    :cond_3
    const-string v0, "full"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 210
    const-string p1, "mod_give_full"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 212
    :cond_4
    const-string v0, "bad"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 213
    const-string p1, "mod_give_bad"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 215
    :cond_5
    const-string p1, "mod_give_fail"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 220
    if-eqz p2, :cond_7

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-nez p1, :cond_6

    goto :goto_0

    .line 221
    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " ("

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, ")"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 220
    :cond_7
    :goto_0
    return-object p0
.end method

.method private static obj(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    .line 319
    invoke-static {p0}, Lmodmenu/GiveItem;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 320
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-gt v1, v2, :cond_0

    goto :goto_0

    .line 324
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 325
    :catch_0
    move-exception p0

    .line 326
    return-object v0

    .line 321
    :cond_1
    :goto_0
    return-object v0
.end method

.method private static paths(Landroid/content/Context;)[Ljava/lang/String;
    .locals 4

    .line 251
    const-string v0, "mw_give.json"

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    .line 252
    if-nez v2, :cond_0

    .line 253
    return-object v1

    .line 255
    :cond_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 256
    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 257
    if-nez p0, :cond_1

    .line 258
    filled-new-array {v2, v2}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 260
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

    .line 261
    :catch_0
    move-exception p0

    .line 262
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "paths failed: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "MWGiveItem"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    return-object v1
.end method

.method private static read(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 331
    nop

    .line 333
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 334
    :try_start_1
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 335
    const/16 v2, 0x2000

    new-array v2, v2, [B

    .line 337
    :goto_0
    invoke-virtual {v1, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_0

    .line 338
    const/4 v4, 0x0

    invoke-virtual {p0, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 340
    :cond_0
    const-string v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 344
    nop

    .line 346
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 348
    goto :goto_1

    .line 347
    :catch_0
    move-exception v0

    .line 340
    :goto_1
    return-object p0

    .line 344
    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_2

    .line 341
    :catch_1
    move-exception p0

    goto :goto_4

    .line 344
    :catchall_1
    move-exception p0

    :goto_2
    if-eqz v0, :cond_1

    .line 346
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 348
    goto :goto_3

    .line 347
    :catch_2
    move-exception v0

    .line 350
    :cond_1
    :goto_3
    throw p0

    .line 341
    :catch_3
    move-exception p0

    move-object v1, v0

    .line 342
    :goto_4
    nop

    .line 344
    if-eqz v1, :cond_2

    .line 346
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 348
    goto :goto_5

    .line 347
    :catch_4
    move-exception p0

    .line 342
    :cond_2
    :goto_5
    return-object v0
.end method

.method private static reason([Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 228
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    const-string v3, "timeout"

    if-ge v1, v2, :cond_4

    .line 229
    aget-object v2, p0, v1

    invoke-static {v2}, Lmodmenu/GiveItem;->obj(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 230
    if-eqz v2, :cond_3

    const-string v4, "started"

    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    if-eqz v4, :cond_0

    .line 231
    goto :goto_1

    .line 233
    :cond_0
    const-string v4, "why"

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 234
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_1

    .line 235
    return-object v4

    .line 237
    :cond_1
    const-string v4, "r"

    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 238
    const-string v4, "wait"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 239
    return-object v3

    .line 241
    :cond_2
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3

    .line 242
    return-object v2

    .line 228
    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 245
    :cond_4
    return-object v3
.end method

.method public static request(Landroid/content/Context;IIJLjava/lang/Runnable;)V
    .locals 18

    .line 78
    move-object/from16 v1, p0

    invoke-static {v1}, Lmodmenu/GiveItem;->paths(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    .line 79
    const-string v9, "fail"

    const-string v10, "MWGiveItem"

    if-nez v3, :cond_0

    .line 80
    const-string v0, "no writable files dir"

    invoke-static {v10, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    invoke-static {v1, v9}, Lmodmenu/GiveItem;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 82
    invoke-interface/range {p5 .. p5}, Ljava/lang/Runnable;->run()V

    .line 83
    return-void

    .line 87
    :cond_0
    sget-boolean v0, Lmodmenu/GiveItem;->polling:Z

    if-eqz v0, :cond_1

    .line 88
    return-void

    .line 90
    :cond_1
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 95
    const/4 v11, 0x0

    const/4 v0, 0x0

    :goto_0
    :try_start_0
    array-length v2, v3

    if-ge v0, v2, :cond_2

    .line 96
    new-instance v2, Ljava/io/File;

    aget-object v4, v3, v0

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 95
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 98
    :cond_2
    const/4 v0, 0x1

    sput-boolean v0, Lmodmenu/GiveItem;->polling:Z

    .line 99
    aget-object v12, v3, v11

    aget-object v13, v3, v0

    .line 100
    move/from16 v14, p1

    move/from16 v15, p2

    move-wide/from16 v16, p3

    invoke-static/range {v12 .. v17}, Lmodmenu/GiveItem;->act(Ljava/lang/String;Ljava/lang/String;IIJ)Ljava/lang/String;

    move-result-object v0

    new-array v2, v11, [Ljava/lang/Object;

    .line 99
    invoke-static {v0, v2}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 101
    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lmodmenu/GiveItem$1;

    move/from16 v4, p1

    move-wide/from16 v5, p3

    move-object/from16 v8, p5

    invoke-direct/range {v2 .. v8}, Lmodmenu/GiveItem$1;-><init>([Ljava/lang/String;IJLandroid/content/Context;Ljava/lang/Runnable;)V

    const-string v3, "mw-giveitem"

    invoke-direct {v0, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 131
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 132
    const-string v0, "give shipped"

    invoke-static {v10, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 138
    goto :goto_1

    .line 133
    :catch_0
    move-exception v0

    .line 134
    sput-boolean v11, Lmodmenu/GiveItem;->polling:Z

    .line 135
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dispatch failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v10, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    invoke-static {v1, v9}, Lmodmenu/GiveItem;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 137
    invoke-interface/range {p5 .. p5}, Ljava/lang/Runnable;->run()V

    .line 139
    :goto_1
    return-void
.end method

.method private static state(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 299
    invoke-static {p0}, Lmodmenu/GiveItem;->obj(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 300
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    const-string v1, "started"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 303
    :cond_0
    const-string v1, "r"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 304
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    move-object v0, p0

    :cond_2
    :goto_0
    return-object v0

    .line 301
    :cond_3
    :goto_1
    return-object v0
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 184
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lmodmenu/GiveItem;->toast(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    return-void
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 189
    :try_start_0
    invoke-static {p0, p1, p2}, Lmodmenu/GiveItem;->message(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .line 190
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    goto :goto_0

    .line 191
    :catch_0
    move-exception p0

    .line 192
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "toast failed: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "MWGiveItem"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    :goto_0
    return-void
.end method

.method private static verify([Ljava/lang/String;IJ)Ljava/lang/String;
    .locals 11

    .line 148
    invoke-static {p0}, Lmodmenu/GiveItem;->want([Ljava/lang/String;)J

    move-result-wide v3

    .line 149
    const-wide/16 v0, 0x0

    const-string v7, "fail"

    cmp-long v2, v3, v0

    if-gtz v2, :cond_0

    .line 150
    return-object v7

    .line 152
    :cond_0
    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_0
    const/16 v0, 0xc

    if-ge v9, v0, :cond_3

    .line 154
    const-wide/16 v0, 0x1c2

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 157
    nop

    .line 158
    const/4 v0, 0x0

    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 159
    new-instance v1, Ljava/io/File;

    aget-object v2, p0, v0

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 158
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 163
    :cond_1
    sget-object v10, Lmodmenu/GiveItem;->MAIN:Landroid/os/Handler;

    new-instance v0, Lmodmenu/GiveItem$2;

    move-object v1, p0

    move v2, p1

    move-wide v5, p2

    invoke-direct/range {v0 .. v6}, Lmodmenu/GiveItem$2;-><init>([Ljava/lang/String;IJJ)V

    invoke-virtual {v10, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 175
    const-wide/16 p0, 0x708

    invoke-static {v1, p0, p1}, Lmodmenu/GiveItem;->awaitGuarded([Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p0

    .line 176
    const-string p1, "wait"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "timeout"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 177
    return-object p0

    .line 152
    :cond_2
    add-int/lit8 v9, v9, 0x1

    move-object p0, v1

    move p1, v2

    move-wide p2, v5

    goto :goto_0

    .line 155
    :catch_0
    move-exception v0

    .line 156
    return-object v7

    .line 180
    :cond_3
    return-object v7
.end method

.method private static want([Ljava/lang/String;)J
    .locals 10

    .line 309
    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    const-wide/16 v2, -0x1

    if-ge v0, v1, :cond_1

    .line 310
    aget-object v1, p0, v0

    invoke-static {v1}, Lmodmenu/GiveItem;->obj(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 311
    if-eqz v1, :cond_0

    const-string v4, "want"

    invoke-virtual {v1, v4, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-lez v9, :cond_0

    .line 312
    invoke-virtual {v1, v4, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0

    .line 309
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 315
    :cond_1
    return-wide v2
.end method
