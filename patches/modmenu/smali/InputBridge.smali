.class public final Lmodmenu/InputBridge;
.super Ljava/lang/Object;
.source "InputBridge.java"

# interfaces
.implements Landroid/view/Window$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmodmenu/InputBridge$Lifecycle;
    }
.end annotation


# static fields
.field private static final CAPTURE_RETRY_MS:J = 0x5dcL

.field private static final ENABLE_INTERVAL_MS:J = 0x7d0L

.field private static final ENABLE_WARMUP_MS:J = 0x1388L

.field private static final KEYBIND_ON:Ljava/lang/String; = "(function() pcall(enableAllKeyBind or function() end) end)"

.field private static final LOOK_IDLE_MS:J = 0x78L

.field private static final MAIN:Landroid/os/Handler;

.field private static final OPEN_HOTKEY:Ljava/lang/String; = "(function() local f=rawget(_G,\"GameSetFrameHotkey_OnShow\") if type(f)~=\"function\" then error(\"HKUI|missing\") end local ok,e=pcall(f) error(\"HKUI|ok=\"..tostring(ok)..\" e=\"..tostring(e)) end)"

.field private static final PROBE:Ljava/lang/String; = "(function() local out,nh={},0 local names={\"setOneKeyBindCode\",\"getContrlMode\",\"getHotkeyName\",\"appalyGameSetData\",\"checkCmd\",\"enableAllKeyBind\",\"pushCommand\",\"getCurrentGameMapId\",\"getCurWorldId\"} for k,v in pairs(_G) do local t=type(v) if t==\"table\" or t==\"userdata\" then for i=1,#names do local nm=names[i] local ok,f=pcall(function() return v[nm] end) if ok and type(f)==\"function\" then nh=nh+1 if nh<=30 then out[#out+1]=k..\".\"..nm end end end end end local s=\"MWP3|n=\"..nh..\"|\"..table.concat(out,\",\") if type(debug)==\"table\" and type(debug.getinfo)==\"function\" then local cs={\"GameSetFrameHotkey_OnShow\",\"RecoveryDefaultHotKey\",\"LoadHotkeyType\",\"GameSetFrameHotkey_OnHide\"} for i=1,#cs do local f=rawget(_G,cs[i]) if type(f)==\"function\" then local ok,inf=pcall(debug.getinfo,f,\"S\") if ok and type(inf)==\"table\" and type(inf.source)==\"string\" and inf.source:sub(1,1)==\"@\" then local p=inf.source:sub(2) s=s..\"|src=\"..cs[i]..\":\"..p local fh=(type(io)==\"table\" and io.open) and io.open(p,\"r\") if fh then local d=fh:read(2300) fh:close() if d then s=s..\"|lua=\"..d end end break end end end else s=s..\"|debug=nil\" end if type(io)~=\"table\" or not io.open then s=s..\"|io=nil\" end error(s:sub(1,3000)) end)"

.field private static final TAG:Ljava/lang/String; = "MWInput"

.field private static volatile probed:Z


# instance fields
.field private final activity:Landroid/app/Activity;

.field private captured:Z

.field private final installedAt:J

.field private lastArrLog:J

.field private lastCaptureReq:J

.field private lastDeltaLog:J

.field private lastEnable:J

.field private lastInLog:J

.field private lastX:F

.field private lastY:F

.field private lookDownTime:J

.field private final lookEnd:Ljava/lang/Runnable;

.field private lookX:F

.field private lookY:F

.field private looking:Z

.field private mouseTouching:Z

.field private final orig:Landroid/view/Window$Callback;

.field private primed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 126
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>(Landroid/view/Window$Callback;Landroid/app/Activity;)V
    .locals 2

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lmodmenu/InputBridge;->installedAt:J

    .line 147
    new-instance v0, Lmodmenu/InputBridge$1;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$1;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    .line 155
    iput-object p1, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    .line 156
    iput-object p2, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    .line 157
    return-void
.end method

.method static synthetic access$000(Lmodmenu/InputBridge;J)V
    .locals 0

    .line 64
    invoke-direct {p0, p1, p2}, Lmodmenu/InputBridge;->endLook(J)V

    return-void
.end method

.method private asFinger(Landroid/view/MotionEvent;Z)Landroid/view/MotionEvent;
    .locals 18

    .line 411
    move-object/from16 v0, p1

    :try_start_0
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v7

    .line 412
    new-array v8, v7, [Landroid/view/MotionEvent$PointerProperties;

    .line 414
    new-array v9, v7, [Landroid/view/MotionEvent$PointerCoords;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 415
    move-object/from16 v1, p0

    :try_start_1
    iget-object v2, v1, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 416
    const/4 v3, 0x0

    :goto_0
    if-ge v3, v7, :cond_3

    .line 417
    new-instance v4, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 418
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, v4, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 419
    const/4 v5, 0x1

    iput v5, v4, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 420
    aput-object v4, v8, v3

    .line 421
    new-instance v4, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 422
    const/high16 v5, 0x40000000    # 2.0f

    if-eqz p2, :cond_0

    iget v6, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v6, v6

    div-float/2addr v6, v5

    goto :goto_1

    :cond_0
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    :goto_1
    iput v6, v4, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 423
    if-eqz p2, :cond_1

    iget v6, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v6, v6

    div-float/2addr v6, v5

    goto :goto_2

    :cond_1
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    :goto_2
    iput v6, v4, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 424
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getPressure(I)F

    move-result v5

    const/4 v6, 0x0

    cmpl-float v5, v5, v6

    if-lez v5, :cond_2

    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getPressure(I)F

    move-result v5

    goto :goto_3

    :cond_2
    const/high16 v5, 0x3f800000    # 1.0f

    :goto_3
    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->pressure:F

    .line 425
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getSize(I)F

    move-result v5

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 426
    aput-object v4, v9, v3

    .line 416
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 428
    :cond_3
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    .line 429
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v10

    .line 430
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getXPrecision()F

    move-result v12

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getYPrecision()F

    move-result v13

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v14

    .line 431
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v15

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getFlags()I

    move-result v17

    .line 428
    const/4 v11, 0x0

    const/16 v16, 0x1002

    invoke-static/range {v2 .. v17}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    .line 432
    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    move-object/from16 v1, p0

    .line 433
    :goto_4
    const/4 v0, 0x0

    return-object v0
.end method

.method private dispatchSynth(IFFJ)V
    .locals 22

    .line 549
    move-object/from16 v0, p0

    new-instance v1, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v1}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 550
    const/4 v2, 0x0

    iput v2, v1, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 551
    const/4 v3, 0x1

    iput v3, v1, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 552
    new-instance v4, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 553
    move/from16 v5, p2

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 554
    move/from16 v5, p3

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 555
    const/high16 v5, 0x3f800000    # 1.0f

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->pressure:F

    .line 556
    const v5, 0x3d4ccccd    # 0.05f

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 557
    iget-wide v6, v0, Lmodmenu/InputBridge;->lookDownTime:J

    new-array v12, v3, [Landroid/view/MotionEvent$PointerProperties;

    aput-object v1, v12, v2

    new-array v13, v3, [Landroid/view/MotionEvent$PointerCoords;

    aput-object v4, v13, v2

    const/16 v20, 0x1002

    const/16 v21, 0x0

    const/4 v11, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/high16 v16, 0x3f800000    # 1.0f

    const/high16 v17, 0x3f800000    # 1.0f

    const/16 v18, 0x0

    const/16 v19, 0x0

    move/from16 v10, p1

    move-wide/from16 v8, p4

    invoke-static/range {v6 .. v21}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v1

    .line 561
    iget-object v2, v0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v2, v1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 562
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 563
    return-void
.end method

.method private enableKeyBinds()V
    .locals 8

    .line 244
    const-string v0, "MWInput"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 245
    iget-wide v3, p0, Lmodmenu/InputBridge;->installedAt:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x1388

    cmp-long v7, v3, v5

    if-ltz v7, :cond_2

    iget-wide v3, p0, Lmodmenu/InputBridge;->lastEnable:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x7d0

    cmp-long v7, v3, v5

    if-gez v7, :cond_0

    goto :goto_1

    .line 248
    :cond_0
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastEnable:J

    .line 250
    :try_start_0
    const-string v1, "(function() pcall(enableAllKeyBind or function() end) end)"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 251
    const-string v1, "keybind-on fired"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    sget-boolean v1, Lmodmenu/InputBridge;->probed:Z

    if-nez v1, :cond_1

    .line 253
    const/4 v1, 0x1

    sput-boolean v1, Lmodmenu/InputBridge;->probed:Z

    .line 256
    const-string v1, "(function() local f=rawget(_G,\"GameSetFrameHotkey_OnShow\") if type(f)~=\"function\" then error(\"HKUI|missing\") end local ok,e=pcall(f) error(\"HKUI|ok=\"..tostring(ok)..\" e=\"..tostring(e)) end)"

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 257
    const-string v1, "(function() local out,nh={},0 local names={\"setOneKeyBindCode\",\"getContrlMode\",\"getHotkeyName\",\"appalyGameSetData\",\"checkCmd\",\"enableAllKeyBind\",\"pushCommand\",\"getCurrentGameMapId\",\"getCurWorldId\"} for k,v in pairs(_G) do local t=type(v) if t==\"table\" or t==\"userdata\" then for i=1,#names do local nm=names[i] local ok,f=pcall(function() return v[nm] end) if ok and type(f)==\"function\" then nh=nh+1 if nh<=30 then out[#out+1]=k..\".\"..nm end end end end end local s=\"MWP3|n=\"..nh..\"|\"..table.concat(out,\",\") if type(debug)==\"table\" and type(debug.getinfo)==\"function\" then local cs={\"GameSetFrameHotkey_OnShow\",\"RecoveryDefaultHotKey\",\"LoadHotkeyType\",\"GameSetFrameHotkey_OnHide\"} for i=1,#cs do local f=rawget(_G,cs[i]) if type(f)==\"function\" then local ok,inf=pcall(debug.getinfo,f,\"S\") if ok and type(inf)==\"table\" and type(inf.source)==\"string\" and inf.source:sub(1,1)==\"@\" then local p=inf.source:sub(2) s=s..\"|src=\"..cs[i]..\":\"..p local fh=(type(io)==\"table\" and io.open) and io.open(p,\"r\") if fh then local d=fh:read(2300) fh:close() if d then s=s..\"|lua=\"..d end end break end end end else s=s..\"|debug=nil\" end if type(io)~=\"table\" or not io.open then s=s..\"|io=nil\" end error(s:sub(1,3000)) end)"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 258
    const-string v1, "probe fired"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 262
    :cond_1
    goto :goto_0

    .line 260
    :catch_0
    move-exception v1

    .line 261
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "keybind-on failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    :goto_0
    return-void

    .line 246
    :cond_2
    :goto_1
    return-void
.end method

.method private endLook(J)V
    .locals 7

    .line 540
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 541
    iget-boolean v0, p0, Lmodmenu/InputBridge;->looking:Z

    if-nez v0, :cond_0

    .line 542
    return-void

    .line 544
    :cond_0
    iget v3, p0, Lmodmenu/InputBridge;->lookX:F

    iget v4, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v2, 0x1

    move-object v1, p0

    move-wide v5, p1

    invoke-direct/range {v1 .. v6}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 545
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmodmenu/InputBridge;->looking:Z

    .line 546
    return-void
.end method

.method public static install(Landroid/app/Activity;)V
    .locals 3

    .line 161
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 162
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v1

    .line 163
    if-eqz v1, :cond_1

    instance-of v2, v1, Lmodmenu/InputBridge;

    if-eqz v2, :cond_0

    goto :goto_0

    .line 166
    :cond_0
    new-instance v2, Lmodmenu/InputBridge;

    invoke-direct {v2, v1, p0}, Lmodmenu/InputBridge;-><init>(Landroid/view/Window$Callback;Landroid/app/Activity;)V

    invoke-virtual {v0, v2}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "installed on "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "MWInput"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    return-void

    .line 164
    :cond_1
    :goto_0
    return-void
.end method

.method private static keepAndroid(I)Z
    .locals 0

    .line 209
    sparse-switch p0, :sswitch_data_0

    .line 233
    const/4 p0, 0x0

    return p0

    .line 231
    :sswitch_0
    const/4 p0, 0x1

    return p0

    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_0
        0x4 -> :sswitch_0
        0x5 -> :sswitch_0
        0x6 -> :sswitch_0
        0x18 -> :sswitch_0
        0x19 -> :sswitch_0
        0x1a -> :sswitch_0
        0x1b -> :sswitch_0
        0x52 -> :sswitch_0
        0x54 -> :sswitch_0
        0x55 -> :sswitch_0
        0x56 -> :sswitch_0
        0x57 -> :sswitch_0
        0x58 -> :sswitch_0
        0x59 -> :sswitch_0
        0x5a -> :sswitch_0
        0x5b -> :sswitch_0
        0x7e -> :sswitch_0
        0x7f -> :sswitch_0
        0x82 -> :sswitch_0
        0xbb -> :sswitch_0
    .end sparse-switch
.end method

.method private logCrosshairIn(Ljava/lang/String;ILandroid/view/MotionEvent;)V
    .locals 7

    .line 310
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 311
    return-void

    .line 313
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 314
    iget-wide v2, p0, Lmodmenu/InputBridge;->lastInLog:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x190

    cmp-long v6, v2, v4

    if-gtz v6, :cond_1

    .line 315
    return-void

    .line 317
    :cond_1
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastInLog:J

    .line 318
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "xh-in "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " act="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " src="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getSource()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " btn="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .line 319
    invoke-virtual {p3}, Landroid/view/MotionEvent;->getButtonState()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " x="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " y="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 318
    const-string p2, "MWInput"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 320
    return-void
.end method

.method private lookBy(Landroid/view/MotionEvent;)V
    .locals 14

    .line 482
    iget-boolean v1, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    if-eqz v1, :cond_0

    .line 483
    return-void

    .line 485
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 486
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 487
    iget-boolean v3, p0, Lmodmenu/InputBridge;->primed:Z

    const-string v4, " y="

    const/4 v6, 0x1

    const-string v5, "MWInput"

    const-wide/16 v7, 0x1f4

    if-nez v3, :cond_2

    .line 488
    iput-boolean v6, p0, Lmodmenu/InputBridge;->primed:Z

    .line 489
    iput v1, p0, Lmodmenu/InputBridge;->lastX:F

    .line 490
    iput v2, p0, Lmodmenu/InputBridge;->lastY:F

    .line 491
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    .line 492
    iget-wide v11, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v11, v9, v11

    cmp-long v3, v11, v7

    if-lez v3, :cond_1

    .line 493
    iput-wide v9, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 494
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "xh-prime x="

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 496
    :cond_1
    return-void

    .line 498
    :cond_2
    iget v3, p0, Lmodmenu/InputBridge;->lastX:F

    sub-float v9, v1, v3

    .line 499
    iget v3, p0, Lmodmenu/InputBridge;->lastY:F

    sub-float v10, v2, v3

    .line 500
    iput v1, p0, Lmodmenu/InputBridge;->lastX:F

    .line 501
    iput v2, p0, Lmodmenu/InputBridge;->lastY:F

    .line 502
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v11

    .line 503
    const/4 v3, 0x0

    cmpl-float v13, v9, v3

    if-nez v13, :cond_4

    cmpl-float v3, v10, v3

    if-nez v3, :cond_4

    .line 504
    iget-wide v9, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    sub-long v9, v11, v9

    cmp-long v3, v9, v7

    if-lez v3, :cond_3

    .line 505
    iput-wide v11, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    .line 506
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "xh-d0 x="

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 508
    :cond_3
    return-void

    .line 510
    :cond_4
    iget-wide v1, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    sub-long v1, v11, v1

    cmp-long v3, v1, v7

    if-lez v3, :cond_5

    .line 511
    iput-wide v11, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    .line 512
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "xh-d dx="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " dy="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 514
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    .line 515
    iget-object v1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    .line 516
    iget-boolean v1, p0, Lmodmenu/InputBridge;->looking:Z

    const/high16 v8, 0x40000000    # 2.0f

    if-nez v1, :cond_6

    .line 517
    iget v1, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 518
    iget v1, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    iput v1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 519
    iput-wide v4, p0, Lmodmenu/InputBridge;->lookDownTime:J

    .line 520
    iget v2, p0, Lmodmenu/InputBridge;->lookX:F

    iget v3, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v1, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 521
    iput-boolean v6, p0, Lmodmenu/InputBridge;->looking:Z

    .line 523
    :cond_6
    iget v1, p0, Lmodmenu/InputBridge;->lookX:F

    add-float/2addr v1, v9

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 524
    iget v1, p0, Lmodmenu/InputBridge;->lookY:F

    add-float/2addr v1, v10

    iput v1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 525
    iget v1, p0, Lmodmenu/InputBridge;->lookX:F

    cmpg-float v1, v1, v8

    if-ltz v1, :cond_7

    iget v1, p0, Lmodmenu/InputBridge;->lookX:F

    iget v2, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v2

    const/high16 v3, 0x40400000    # 3.0f

    sub-float/2addr v2, v3

    cmpl-float v1, v1, v2

    if-gtz v1, :cond_7

    iget v1, p0, Lmodmenu/InputBridge;->lookY:F

    cmpg-float v1, v1, v8

    if-ltz v1, :cond_7

    iget v1, p0, Lmodmenu/InputBridge;->lookY:F

    iget v2, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v2, v2

    sub-float/2addr v2, v3

    cmpl-float v1, v1, v2

    if-lez v1, :cond_8

    .line 527
    :cond_7
    iget v2, p0, Lmodmenu/InputBridge;->lookX:F

    iget v3, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v1, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 528
    iget v1, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 529
    iget v1, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    iput v1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 530
    iput-wide v4, p0, Lmodmenu/InputBridge;->lookDownTime:J

    .line 531
    iget v2, p0, Lmodmenu/InputBridge;->lookX:F

    iget v3, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v1, 0x0

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 533
    :cond_8
    iget v2, p0, Lmodmenu/InputBridge;->lookX:F

    iget v3, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v1, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 534
    sget-object v1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 535
    sget-object v1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    const-wide/16 v3, 0x78

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 536
    return-void
.end method

.method private player()Lcom/minitech/player/AppPlayer;
    .locals 1

    .line 197
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    instance-of v0, v0, Lorg/appplay/lib/GameBaseActivity;

    if-nez v0, :cond_0

    .line 198
    const/4 v0, 0x0

    return-object v0

    .line 200
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    check-cast v0, Lorg/appplay/lib/GameBaseActivity;

    iget-object v0, v0, Lorg/appplay/lib/GameBaseActivity;->m_AppPlayer:Lcom/minitech/player/AppPlayer;

    return-object v0
.end method

.method private releaseCapture(Landroid/view/View;)V
    .locals 2

    .line 467
    invoke-virtual {p1}, Landroid/view/View;->releasePointerCapture()V

    .line 468
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmodmenu/InputBridge;->captured:Z

    .line 469
    iput-boolean p1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 470
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 471
    const-string p1, "MWInput"

    const-string v0, "xh capture released"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    return-void
.end method

.method private syncCrosshair()V
    .locals 8

    .line 444
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    .line 445
    return-void

    .line 447
    :cond_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 448
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/minitech/player/AppPlayer;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 449
    :goto_0
    if-nez v0, :cond_2

    .line 450
    return-void

    .line 452
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 453
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v3

    .line 461
    iget-boolean v4, p0, Lmodmenu/InputBridge;->captured:Z

    .line 453
    if-eqz v3, :cond_3

    .line 454
    if-nez v4, :cond_4

    iget-wide v3, p0, Lmodmenu/InputBridge;->lastCaptureReq:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x5dc

    cmp-long v7, v3, v5

    if-lez v7, :cond_4

    .line 455
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastCaptureReq:J

    .line 456
    const/4 v1, 0x1

    iput-boolean v1, p0, Lmodmenu/InputBridge;->captured:Z

    .line 457
    const/4 v1, 0x0

    iput-boolean v1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 458
    invoke-virtual {v0}, Landroid/view/View;->requestPointerCapture()V

    .line 459
    const-string v0, "MWInput"

    const-string v1, "xh capture requested"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 461
    :cond_3
    if-eqz v4, :cond_4

    .line 462
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->releaseCapture(Landroid/view/View;)V

    .line 464
    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 324
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 325
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const/4 v1, 0x2

    and-int/2addr v0, v1

    if-eqz v0, :cond_5

    .line 326
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 327
    const-string v2, "generic"

    invoke-direct {p0, v2, v0, p1}, Lmodmenu/InputBridge;->logCrosshairIn(Ljava/lang/String;ILandroid/view/MotionEvent;)V

    .line 328
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v2

    .line 329
    if-eqz v2, :cond_5

    .line 330
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v3

    const/16 v4, 0x2002

    and-int/2addr v3, v4

    const/4 v5, 0x1

    if-ne v3, v4, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 332
    :goto_0
    const-string v4, "MWInput"

    const/4 v6, 0x7

    if-eqz v3, :cond_3

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v3

    if-eqz v3, :cond_3

    if-eq v0, v6, :cond_1

    if-ne v0, v1, :cond_3

    .line 335
    :cond_1
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 336
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 337
    iget-wide v6, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v6, v1, v6

    const-wide/16 v8, 0x1f4

    cmp-long v3, v6, v8

    if-lez v3, :cond_2

    .line 338
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 339
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "xh-m act="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " x="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " y="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 340
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 339
    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    :cond_2
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookBy(Landroid/view/MotionEvent;)V

    .line 343
    return v5

    .line 345
    :cond_3
    invoke-virtual {v2, p1}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result v1

    .line 346
    if-eq v0, v6, :cond_4

    .line 347
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "motion act="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " src="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 348
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " eng="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 347
    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    :cond_4
    return v5

    .line 353
    :cond_5
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 5

    .line 267
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 268
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 269
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 273
    :goto_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    const/16 v3, 0x83

    const-string v4, "MWInput"

    if-ne v2, v3, :cond_2

    .line 274
    if-eqz v0, :cond_1

    .line 275
    iget-object p1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    xor-int/2addr v0, v1

    invoke-static {p1, v0}, Lmodmenu/ModMenu;->setCrosshair(Landroid/content/Context;Z)V

    .line 276
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 277
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "xh="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " (F1)"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    :cond_1
    return v1

    .line 281
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    invoke-static {v2}, Lmodmenu/InputBridge;->keepAndroid(I)Z

    move-result v2

    if-nez v2, :cond_7

    .line 282
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v2

    .line 283
    if-nez v2, :cond_3

    .line 284
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 286
    :cond_3
    if-eqz v0, :cond_4

    .line 287
    invoke-direct {p0}, Lmodmenu/InputBridge;->enableKeyBinds()V

    .line 292
    :cond_4
    invoke-virtual {v2, p1}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result v2

    .line 293
    if-nez v0, :cond_5

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_6

    .line 294
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "key "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " eng="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    :cond_6
    return v1

    .line 300
    :cond_7
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 567
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    .line 577
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 358
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 359
    const-string v1, "touch"

    invoke-direct {p0, v1, v0, p1}, Lmodmenu/InputBridge;->logCrosshairIn(Ljava/lang/String;ILandroid/view/MotionEvent;)V

    .line 360
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v1

    const/16 v2, 0x2002

    and-int/2addr v1, v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 362
    :goto_0
    if-nez v1, :cond_1

    if-nez v0, :cond_1

    .line 363
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lmodmenu/InputBridge;->endLook(J)V

    .line 365
    :cond_1
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v2

    if-eqz v2, :cond_a

    if-eqz v1, :cond_a

    .line 366
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v1

    .line 367
    const-string v2, "MWInput"

    if-eqz v1, :cond_3

    const/4 v5, 0x2

    if-ne v0, v5, :cond_3

    .line 368
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v5

    if-nez v5, :cond_3

    .line 371
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 372
    iget-wide v5, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v5, v0, v5

    const-wide/16 v7, 0x1f4

    cmp-long v3, v5, v7

    if-lez v3, :cond_2

    .line 373
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 374
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "xh-t x="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " y="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 376
    :cond_2
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookBy(Landroid/view/MotionEvent;)V

    .line 377
    return v4

    .line 379
    :cond_3
    if-eqz v1, :cond_4

    if-nez v0, :cond_4

    .line 380
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lmodmenu/InputBridge;->endLook(J)V

    .line 382
    :cond_4
    invoke-direct {p0, p1, v1}, Lmodmenu/InputBridge;->asFinger(Landroid/view/MotionEvent;Z)Landroid/view/MotionEvent;

    move-result-object v1

    .line 383
    if-eqz v1, :cond_a

    .line 384
    iget-object p1, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {p1, v1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    .line 385
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 386
    if-nez v0, :cond_5

    .line 387
    iput-boolean v4, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    goto :goto_1

    .line 388
    :cond_5
    if-eq v0, v4, :cond_6

    const/4 v1, 0x3

    if-ne v0, v1, :cond_7

    .line 390
    :cond_6
    iput-boolean v3, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    .line 392
    :cond_7
    :goto_1
    if-eqz v0, :cond_8

    if-ne v0, v4, :cond_9

    .line 393
    :cond_8
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mouse-touch "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " handled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 395
    :cond_9
    return p1

    .line 398
    :cond_a
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 572
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .locals 1

    .line 673
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeFinished(Landroid/view/ActionMode;)V

    .line 674
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 1

    .line 668
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeStarted(Landroid/view/ActionMode;)V

    .line 669
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 653
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onAttachedToWindow()V

    .line 654
    return-void
.end method

.method public onContentChanged()V
    .locals 1

    .line 592
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onContentChanged()V

    .line 593
    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 1

    .line 587
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .locals 1

    .line 582
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onCreatePanelView(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 658
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onDetachedFromWindow()V

    .line 659
    return-void
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 1

    .line 627
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .locals 1

    .line 622
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .locals 1

    .line 663
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 664
    return-void
.end method

.method public onPointerCaptureChanged(Z)V
    .locals 2

    .line 684
    if-nez p1, :cond_0

    iget-boolean v0, p0, Lmodmenu/InputBridge;->captured:Z

    if-eqz v0, :cond_0

    .line 685
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmodmenu/InputBridge;->captured:Z

    .line 686
    iput-boolean v0, p0, Lmodmenu/InputBridge;->primed:Z

    .line 687
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 688
    const-string v0, "MWInput"

    const-string v1, "xh capture lost"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 690
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onPointerCaptureChanged(Z)V

    .line 691
    return-void
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 1

    .line 617
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onProvideKeyboardShortcuts(Ljava/util/List;Landroid/view/Menu;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/KeyboardShortcutGroup;",
            ">;",
            "Landroid/view/Menu;",
            "I)V"
        }
    .end annotation

    .line 679
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/Window$Callback;->onProvideKeyboardShortcuts(Ljava/util/List;Landroid/view/Menu;I)V

    .line 680
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .line 597
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onSearchRequested()Z

    move-result v0

    return v0
.end method

.method public onSearchRequested(Landroid/view/SearchEvent;)Z
    .locals 1

    .line 602
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onSearchRequested(Landroid/view/SearchEvent;)Z

    move-result p1

    return p1
.end method

.method public onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
    .locals 1

    .line 632
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    .line 633
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2

    .line 637
    if-eqz p1, :cond_0

    .line 638
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    goto :goto_1

    .line 640
    :cond_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 641
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/minitech/player/AppPlayer;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 642
    :goto_0
    iget-boolean v1, p0, Lmodmenu/InputBridge;->captured:Z

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    .line 643
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->releaseCapture(Landroid/view/View;)V

    goto :goto_1

    .line 645
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 648
    :goto_1
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowFocusChanged(Z)V

    .line 649
    return-void
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .locals 1

    .line 607
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;
    .locals 1

    .line 612
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method
