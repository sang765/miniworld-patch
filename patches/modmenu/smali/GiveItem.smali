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

    .line 63
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/GiveItem;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000([Ljava/lang/String;J)Ljava/lang/String;
    .locals 0

    .line 53
    invoke-static {p0, p1, p2}, Lmodmenu/GiveItem;->awaitGuarded([Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100([Ljava/lang/String;IJ)Ljava/lang/String;
    .locals 0

    .line 53
    invoke-static {p0, p1, p2, p3}, Lmodmenu/GiveItem;->verify([Ljava/lang/String;IJ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$202(Z)Z
    .locals 0

    .line 53
    sput-boolean p0, Lmodmenu/GiveItem;->polling:Z

    return p0
.end method

.method static synthetic access$300(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 53
    invoke-static {p0, p1}, Lmodmenu/GiveItem;->toast(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400()Landroid/os/Handler;
    .locals 1

    .line 53
    sget-object v0, Lmodmenu/GiveItem;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static act(Ljava/lang/String;Ljava/lang/String;IIJ)Ljava/lang/String;
    .locals 2

    .line 336
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function() local p1=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 337
    invoke-static {p0}, Lmodmenu/GiveItem;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\' local p2=\'"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 338
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

    .line 341
    invoke-static {p4, p5}, Lmodmenu/GiveItem;->luaNum(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " local function w(j) local function one(p) local ok,fh=pcall(function() return io.open(p,\'w\') end) if not ok or fh==nil then return end pcall(function() fh:write(j) fh:close() end) end one(p1) if p2~=p1 then one(p2) end end w(\'{\"started\":1}\') local ok,err=pcall(function() local inmap=false pcall(function() local r=ClientCurGame:isInGame() inmap=(r==true or r==1) end) if not inmap then w(\'{\"r\":\"nomap\"}\') return end if ITEM<=0 or N<=0 then w(\'{\"r\":\"bad\"}\') return end if UID==0 then local bag=nil pcall(function() bag=ClientBackpack end) local okb,b0=pcall(function() return bag:getItemCountInNormalPack(ITEM) end) if not bag or type(b0)~=\'number\' then w(\'{\"r\":\"fail\",\"why\":\"nobag\"}\') return end b0=math.floor(b0) local idx=nil pcall(function() idx=bag:getEmptyBagIndex() end) if type(idx)~=\'number\' then w(\'{\"r\":\"fail\",\"why\":\"noindex\"}\') return end idx=math.floor(idx) if idx<0 or idx>1000 then w(\'{\"r\":\"full\",\"b\":\'..b0..\'}\') return end local sent=false pcall(function() CurMainPlayer:setItem(ITEM,idx,N) sent=true end) if not sent then w(\'{\"r\":\"fail\",\"why\":\"nosend\"}\') return end w(\'{\"r\":\"wait\",\"want\":\'..(b0+N)..\',\"u\":0}\') return end local target=nil pcall(function() target=WorldMgr:getPlayerByUin(UID) end) if target==nil then w(\'{\"r\":\"notarget\"}\') return end local bag=nil pcall(function() bag=target:getBackPack() end) local okb,b0=pcall(function() return bag:getItemCountInNormalPack(ITEM) end) if not bag or type(b0)~=\'number\' then w(\'{\"r\":\"fail\",\"why\":\"nobag\"}\') return end b0=math.floor(b0) local probed=false local r=nil pcall(function() r=target:gainItems(ITEM,b0) probed=true end) if not probed or type(r)~=\'number\' then w(\'{\"r\":\"fail\",\"why\":\"nogain\"}\') return end local auth=false pcall(function() local v=UGCCommon:IsSingleGame() auth=(v==true or v==1) end) if not auth then pcall(function() local v=UGCCommon:IsHost() auth=(v==true or v==1) end) end if not auth then pcall(function() local v=GameNetMgr:isHost() auth=(v==true or v==1) end) end if r<0 then local sent=false pcall(function() target:gainItemsUserdata(ITEM,b0+N,\'\') sent=true end) if not sent then w(\'{\"r\":\"fail\",\"why\":\"nosend\"}\') return end w(\'{\"r\":\"wait\",\"want\":\'..(b0+N)..\',\"u\":\'..UID..\'}\') return end if not auth then w(\'{\"r\":\"noclient\"}\') return end local applied=false pcall(function() target:gainItems(ITEM,b0+N) applied=true end) if not applied then w(\'{\"r\":\"fail\",\"why\":\"nogain\"}\') return end w(\'{\"r\":\"wait\",\"want\":\'..(b0+N)..\',\"u\":\'..UID..\'}\') end) if not ok then w(\'{\"r\":\"err\"}\') error(\'MWNM|\'..tostring(err),0) end end)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 336
    return-object p0
.end method

.method private static await([Ljava/lang/String;J)Ljava/lang/String;
    .locals 3

    .line 238
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    add-long/2addr v0, p1

    .line 239
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    cmp-long v2, p1, v0

    if-gez v2, :cond_2

    .line 240
    const/4 p1, 0x0

    :goto_1
    array-length p2, p0

    if-ge p1, p2, :cond_1

    .line 241
    aget-object p2, p0, p1

    invoke-static {p2}, Lmodmenu/GiveItem;->state(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 242
    if-eqz p2, :cond_0

    .line 243
    return-object p2

    .line 240
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 247
    :cond_1
    const-wide/16 p1, 0xfa

    :try_start_0
    invoke-static {p1, p2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 250
    goto :goto_0

    .line 248
    :catch_0
    move-exception p0

    .line 249
    nop

    .line 252
    :cond_2
    const-string p0, "timeout"

    return-object p0
.end method

.method private static awaitGuarded([Ljava/lang/String;J)Ljava/lang/String;
    .locals 0

    .line 231
    :try_start_0
    invoke-static {p0, p1, p2}, Lmodmenu/GiveItem;->await([Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 232
    :catch_0
    move-exception p0

    .line 233
    const-string p0, "timeout"

    return-object p0
.end method

.method static check(Ljava/lang/String;Ljava/lang/String;IJJ)Ljava/lang/String;
    .locals 2

    .line 452
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function() local p1=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 453
    invoke-static {p0}, Lmodmenu/GiveItem;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, "\' local p2=\'"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 454
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

    .line 456
    invoke-static {p3, p4}, Lmodmenu/GiveItem;->luaNum(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " local UID="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .line 457
    invoke-static {p5, p6}, Lmodmenu/GiveItem;->luaNum(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " local function w(j) local function one(p) local ok,fh=pcall(function() return io.open(p,\'w\') end) if not ok or fh==nil then return end pcall(function() fh:write(j) fh:close() end) end one(p1) if p2~=p1 then one(p2) end end w(\'{\"started\":1}\') local ok,err=pcall(function() local bag=nil if UID==0 then pcall(function() bag=ClientBackpack end) else local t=nil pcall(function() t=WorldMgr:getPlayerByUin(UID) end) if t~=nil then pcall(function() bag=t:getBackPack() end) end end local n=nil pcall(function() n=bag:getItemCountInNormalPack(ITEM) end) if type(n)~=\'number\' then w(\'{\"r\":\"wait\"}\') return end n=math.floor(n) if n>=WANT then w(\'{\"r\":\"ok\",\"have\":\'..n..\'}\') else w(\'{\"r\":\"wait\"}\') end end) if not ok then w(\'{\"r\":\"wait\"}\') end end)"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 452
    return-object p0
.end method

.method private static luaNum(J)Ljava/lang/String;
    .locals 0

    .line 319
    invoke-static {p0, p1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static luaStr(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 314
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

    .line 187
    const-string v0, "ok"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 188
    const-string p1, "mod_give_ok"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 190
    :cond_0
    const-string v0, "nomap"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 191
    const-string p1, "mod_give_nomap"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 193
    :cond_1
    const-string v0, "notarget"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 194
    const-string p1, "mod_give_notarget"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 196
    :cond_2
    const-string v0, "noclient"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 197
    const-string p1, "mod_give_noclient"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 199
    :cond_3
    const-string v0, "full"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 200
    const-string p1, "mod_give_full"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 202
    :cond_4
    const-string v0, "bad"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 203
    const-string p1, "mod_give_bad"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 205
    :cond_5
    const-string p1, "mod_give_fail"

    invoke-static {p0, p1}, Lmodmenu/I18n;->t(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static obj(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3

    .line 279
    invoke-static {p0}, Lmodmenu/GiveItem;->read(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 280
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-gt v1, v2, :cond_0

    goto :goto_0

    .line 284
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 285
    :catch_0
    move-exception p0

    .line 286
    return-object v0

    .line 281
    :cond_1
    :goto_0
    return-object v0
.end method

.method private static paths(Landroid/content/Context;)[Ljava/lang/String;
    .locals 4

    .line 211
    const-string v0, "mw_give.json"

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    .line 212
    if-nez v2, :cond_0

    .line 213
    return-object v1

    .line 215
    :cond_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 216
    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 217
    if-nez p0, :cond_1

    .line 218
    filled-new-array {v2, v2}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 220
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

    .line 221
    :catch_0
    move-exception p0

    .line 222
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

    .line 223
    return-object v1
.end method

.method private static read(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 291
    nop

    .line 293
    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 294
    :try_start_1
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 295
    const/16 v2, 0x2000

    new-array v2, v2, [B

    .line 297
    :goto_0
    invoke-virtual {v1, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    if-lez v3, :cond_0

    .line 298
    const/4 v4, 0x0

    invoke-virtual {p0, v2, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 300
    :cond_0
    const-string v2, "UTF-8"

    invoke-virtual {p0, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 304
    nop

    .line 306
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 308
    goto :goto_1

    .line 307
    :catch_0
    move-exception v0

    .line 300
    :goto_1
    return-object p0

    .line 304
    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_2

    .line 301
    :catch_1
    move-exception p0

    goto :goto_4

    .line 304
    :catchall_1
    move-exception p0

    :goto_2
    if-eqz v0, :cond_1

    .line 306
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 308
    goto :goto_3

    .line 307
    :catch_2
    move-exception v0

    .line 310
    :cond_1
    :goto_3
    throw p0

    .line 301
    :catch_3
    move-exception p0

    move-object v1, v0

    .line 302
    :goto_4
    nop

    .line 304
    if-eqz v1, :cond_2

    .line 306
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 308
    goto :goto_5

    .line 307
    :catch_4
    move-exception p0

    .line 302
    :cond_2
    :goto_5
    return-object v0
.end method

.method public static request(Landroid/content/Context;IIJLjava/lang/Runnable;)V
    .locals 18

    .line 77
    move-object/from16 v1, p0

    invoke-static {v1}, Lmodmenu/GiveItem;->paths(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v3

    .line 78
    const-string v9, "fail"

    const-string v10, "MWGiveItem"

    if-nez v3, :cond_0

    .line 79
    const-string v0, "no writable files dir"

    invoke-static {v10, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    invoke-static {v1, v9}, Lmodmenu/GiveItem;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 81
    invoke-interface/range {p5 .. p5}, Ljava/lang/Runnable;->run()V

    .line 82
    return-void

    .line 86
    :cond_0
    sget-boolean v0, Lmodmenu/GiveItem;->polling:Z

    if-eqz v0, :cond_1

    .line 87
    return-void

    .line 89
    :cond_1
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    .line 94
    const/4 v11, 0x0

    const/4 v0, 0x0

    :goto_0
    :try_start_0
    array-length v2, v3

    if-ge v0, v2, :cond_2

    .line 95
    new-instance v2, Ljava/io/File;

    aget-object v4, v3, v0

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 94
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 97
    :cond_2
    const/4 v0, 0x1

    sput-boolean v0, Lmodmenu/GiveItem;->polling:Z

    .line 98
    aget-object v12, v3, v11

    aget-object v13, v3, v0

    .line 99
    move/from16 v14, p1

    move/from16 v15, p2

    move-wide/from16 v16, p3

    invoke-static/range {v12 .. v17}, Lmodmenu/GiveItem;->act(Ljava/lang/String;Ljava/lang/String;IIJ)Ljava/lang/String;

    move-result-object v0

    new-array v2, v11, [Ljava/lang/Object;

    .line 98
    invoke-static {v0, v2}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 100
    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lmodmenu/GiveItem$1;

    move/from16 v4, p1

    move-wide/from16 v5, p3

    move-object/from16 v8, p5

    invoke-direct/range {v2 .. v8}, Lmodmenu/GiveItem$1;-><init>([Ljava/lang/String;IJLandroid/content/Context;Ljava/lang/Runnable;)V

    const-string v3, "mw-giveitem"

    invoke-direct {v0, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 126
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 127
    const-string v0, "give shipped"

    invoke-static {v10, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    goto :goto_1

    .line 128
    :catch_0
    move-exception v0

    .line 129
    sput-boolean v11, Lmodmenu/GiveItem;->polling:Z

    .line 130
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

    .line 131
    invoke-static {v1, v9}, Lmodmenu/GiveItem;->toast(Landroid/content/Context;Ljava/lang/String;)V

    .line 132
    invoke-interface/range {p5 .. p5}, Ljava/lang/Runnable;->run()V

    .line 134
    :goto_1
    return-void
.end method

.method private static state(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 259
    invoke-static {p0}, Lmodmenu/GiveItem;->obj(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 260
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    const-string v1, "started"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 263
    :cond_0
    const-string v1, "r"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 264
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

    .line 261
    :cond_3
    :goto_1
    return-object v0
.end method

.method private static toast(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 180
    :try_start_0
    invoke-static {p0, p1}, Lmodmenu/GiveItem;->message(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 183
    goto :goto_0

    .line 181
    :catch_0
    move-exception p0

    .line 182
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "toast failed: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "MWGiveItem"

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    :goto_0
    return-void
.end method

.method private static verify([Ljava/lang/String;IJ)Ljava/lang/String;
    .locals 11

    .line 143
    invoke-static {p0}, Lmodmenu/GiveItem;->want([Ljava/lang/String;)J

    move-result-wide v3

    .line 144
    const-wide/16 v0, 0x0

    const-string v7, "fail"

    cmp-long v2, v3, v0

    if-gtz v2, :cond_0

    .line 145
    return-object v7

    .line 147
    :cond_0
    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_0
    const/16 v0, 0xc

    if-ge v9, v0, :cond_3

    .line 149
    const-wide/16 v0, 0x1c2

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    nop

    .line 153
    const/4 v0, 0x0

    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 154
    new-instance v1, Ljava/io/File;

    aget-object v2, p0, v0

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 153
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 158
    :cond_1
    sget-object v10, Lmodmenu/GiveItem;->MAIN:Landroid/os/Handler;

    new-instance v0, Lmodmenu/GiveItem$2;

    move-object v1, p0

    move v2, p1

    move-wide v5, p2

    invoke-direct/range {v0 .. v6}, Lmodmenu/GiveItem$2;-><init>([Ljava/lang/String;IJJ)V

    invoke-virtual {v10, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 170
    const-wide/16 p0, 0x708

    invoke-static {v1, p0, p1}, Lmodmenu/GiveItem;->awaitGuarded([Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p0

    .line 171
    const-string p1, "wait"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "timeout"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 172
    return-object p0

    .line 147
    :cond_2
    add-int/lit8 v9, v9, 0x1

    move-object p0, v1

    move p1, v2

    move-wide p2, v5

    goto :goto_0

    .line 150
    :catch_0
    move-exception v0

    .line 151
    return-object v7

    .line 175
    :cond_3
    return-object v7
.end method

.method private static want([Ljava/lang/String;)J
    .locals 10

    .line 269
    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    const-wide/16 v2, -0x1

    if-ge v0, v1, :cond_1

    .line 270
    aget-object v1, p0, v0

    invoke-static {v1}, Lmodmenu/GiveItem;->obj(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 271
    if-eqz v1, :cond_0

    const-string v4, "want"

    invoke-virtual {v1, v4, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-lez v9, :cond_0

    .line 272
    invoke-virtual {v1, v4, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0

    .line 269
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 275
    :cond_1
    return-wide v2
.end method
