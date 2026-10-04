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

.field private static final PROBE:Ljava/lang/String; = "(function() local g=_G local ty=function(n) return type(g[n]) end local r={} r[#r+1]=\"T:\"..ty(\"enableAllKeyBind\")..\",\"..ty(\"setOneKeyBindState\")..\",\"..ty(\"getKeyBindKeyName\")..\",\"..ty(\"setAllKeyBindState\")..\",\"..ty(\"loadSettings\")..\",\"..ty(\"setOneKeyBindCode\")..\",\"..ty(\"getHotkeyName\")..\",\"..ty(\"UserInputService\")..\",\"..ty(\"FireEvent\")..\",\"..ty(\"ListenEvent\")..\",\"..ty(\"addEventListener\") if ty(\"getKeyBindKeyName\")==\"function\" then local ok,v=pcall(getKeyBindKeyName,\"keyBindForward\") r[#r+1]=\"FWD=\"..tostring(ok and v or \"err\") end local out,n={},0 for k,v in pairs(g) do if type(k)==\"string\" and n<70 then local l=k:lower() if l:find(\"keybind\",1,true) or l:find(\"hotkey\",1,true) or l:find(\"cursor\",1,true) or l:find(\"mouse\",1,true) or l:find(\"shortcut\",1,true) or l:find(\"userinput\",1,true) or l:find(\"inputmode\",1,true) or l:find(\"scene\",1,true) or l:find(\"enterworld\",1,true) or l:find(\"currentmap\",1,true) or l:find(\"gamemode\",1,true) or l:find(\"fireevent\",1,true) then n=n+1 out[#out+1]=k..\":\"..type(v) end end end r[#r+1]=\"G(\"..n..\")=\"..table.concat(out,\",\") local s=\"MWP|\"..table.concat(r,\"|\") local i,c=1,0 while i<=#s do c=c+1 print(\"MWP\"..c..\"|\"..s:sub(i,i+2799)) i=i+2800 end error(s:sub(1,3000)) end)"

.field private static final TAG:Ljava/lang/String; = "MWInput"

.field private static volatile probed:Z


# instance fields
.field private final activity:Landroid/app/Activity;

.field private captured:Z

.field private final installedAt:J

.field private lastCaptureReq:J

.field private lastEnable:J

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

    .line 117
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>(Landroid/view/Window$Callback;Landroid/app/Activity;)V
    .locals 2

    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lmodmenu/InputBridge;->installedAt:J

    .line 135
    new-instance v0, Lmodmenu/InputBridge$1;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$1;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    .line 143
    iput-object p1, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    .line 144
    iput-object p2, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    .line 145
    return-void
.end method

.method static synthetic access$000(Lmodmenu/InputBridge;J)V
    .locals 0

    .line 62
    invoke-direct {p0, p1, p2}, Lmodmenu/InputBridge;->endLook(J)V

    return-void
.end method

.method private asFinger(Landroid/view/MotionEvent;Z)Landroid/view/MotionEvent;
    .locals 18

    .line 356
    move-object/from16 v0, p1

    :try_start_0
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v7

    .line 357
    new-array v8, v7, [Landroid/view/MotionEvent$PointerProperties;

    .line 359
    new-array v9, v7, [Landroid/view/MotionEvent$PointerCoords;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 360
    move-object/from16 v1, p0

    :try_start_1
    iget-object v2, v1, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 361
    const/4 v3, 0x0

    :goto_0
    if-ge v3, v7, :cond_3

    .line 362
    new-instance v4, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 363
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, v4, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 364
    const/4 v5, 0x1

    iput v5, v4, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 365
    aput-object v4, v8, v3

    .line 366
    new-instance v4, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 367
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

    .line 368
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

    .line 369
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

    .line 370
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getSize(I)F

    move-result v5

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 371
    aput-object v4, v9, v3

    .line 361
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 373
    :cond_3
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    .line 374
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v10

    .line 375
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getXPrecision()F

    move-result v12

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getYPrecision()F

    move-result v13

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v14

    .line 376
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v15

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getFlags()I

    move-result v17

    .line 373
    const/4 v11, 0x0

    const/16 v16, 0x1002

    invoke-static/range {v2 .. v17}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    .line 377
    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    move-object/from16 v1, p0

    .line 378
    :goto_4
    const/4 v0, 0x0

    return-object v0
.end method

.method private dispatchSynth(IFFJ)V
    .locals 22

    .line 480
    move-object/from16 v0, p0

    new-instance v1, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v1}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 481
    const/4 v2, 0x0

    iput v2, v1, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 482
    const/4 v3, 0x1

    iput v3, v1, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 483
    new-instance v4, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 484
    move/from16 v5, p2

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 485
    move/from16 v5, p3

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 486
    const/high16 v5, 0x3f800000    # 1.0f

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->pressure:F

    .line 487
    const v5, 0x3d4ccccd    # 0.05f

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 488
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

    .line 492
    iget-object v2, v0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v2, v1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 493
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 494
    return-void
.end method

.method private enableKeyBinds()V
    .locals 8

    .line 232
    const-string v0, "MWInput"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 233
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

    .line 236
    :cond_0
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastEnable:J

    .line 238
    :try_start_0
    const-string v1, "(function() pcall(enableAllKeyBind or function() end) end)"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 239
    const-string v1, "keybind-on fired"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    sget-boolean v1, Lmodmenu/InputBridge;->probed:Z

    if-nez v1, :cond_1

    .line 241
    const/4 v1, 0x1

    sput-boolean v1, Lmodmenu/InputBridge;->probed:Z

    .line 242
    const-string v1, "(function() local g=_G local ty=function(n) return type(g[n]) end local r={} r[#r+1]=\"T:\"..ty(\"enableAllKeyBind\")..\",\"..ty(\"setOneKeyBindState\")..\",\"..ty(\"getKeyBindKeyName\")..\",\"..ty(\"setAllKeyBindState\")..\",\"..ty(\"loadSettings\")..\",\"..ty(\"setOneKeyBindCode\")..\",\"..ty(\"getHotkeyName\")..\",\"..ty(\"UserInputService\")..\",\"..ty(\"FireEvent\")..\",\"..ty(\"ListenEvent\")..\",\"..ty(\"addEventListener\") if ty(\"getKeyBindKeyName\")==\"function\" then local ok,v=pcall(getKeyBindKeyName,\"keyBindForward\") r[#r+1]=\"FWD=\"..tostring(ok and v or \"err\") end local out,n={},0 for k,v in pairs(g) do if type(k)==\"string\" and n<70 then local l=k:lower() if l:find(\"keybind\",1,true) or l:find(\"hotkey\",1,true) or l:find(\"cursor\",1,true) or l:find(\"mouse\",1,true) or l:find(\"shortcut\",1,true) or l:find(\"userinput\",1,true) or l:find(\"inputmode\",1,true) or l:find(\"scene\",1,true) or l:find(\"enterworld\",1,true) or l:find(\"currentmap\",1,true) or l:find(\"gamemode\",1,true) or l:find(\"fireevent\",1,true) then n=n+1 out[#out+1]=k..\":\"..type(v) end end end r[#r+1]=\"G(\"..n..\")=\"..table.concat(out,\",\") local s=\"MWP|\"..table.concat(r,\"|\") local i,c=1,0 while i<=#s do c=c+1 print(\"MWP\"..c..\"|\"..s:sub(i,i+2799)) i=i+2800 end error(s:sub(1,3000)) end)"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 243
    const-string v1, "probe fired"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 247
    :cond_1
    goto :goto_0

    .line 245
    :catch_0
    move-exception v1

    .line 246
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

    .line 248
    :goto_0
    return-void

    .line 234
    :cond_2
    :goto_1
    return-void
.end method

.method private endLook(J)V
    .locals 7

    .line 471
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 472
    iget-boolean v0, p0, Lmodmenu/InputBridge;->looking:Z

    if-nez v0, :cond_0

    .line 473
    return-void

    .line 475
    :cond_0
    iget v3, p0, Lmodmenu/InputBridge;->lookX:F

    iget v4, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v2, 0x1

    move-object v1, p0

    move-wide v5, p1

    invoke-direct/range {v1 .. v6}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 476
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmodmenu/InputBridge;->looking:Z

    .line 477
    return-void
.end method

.method public static install(Landroid/app/Activity;)V
    .locals 3

    .line 149
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 150
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v1

    .line 151
    if-eqz v1, :cond_1

    instance-of v2, v1, Lmodmenu/InputBridge;

    if-eqz v2, :cond_0

    goto :goto_0

    .line 154
    :cond_0
    new-instance v2, Lmodmenu/InputBridge;

    invoke-direct {v2, v1, p0}, Lmodmenu/InputBridge;-><init>(Landroid/view/Window$Callback;Landroid/app/Activity;)V

    invoke-virtual {v0, v2}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 155
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

    .line 156
    return-void

    .line 152
    :cond_1
    :goto_0
    return-void
.end method

.method private static keepAndroid(I)Z
    .locals 0

    .line 197
    sparse-switch p0, :sswitch_data_0

    .line 221
    const/4 p0, 0x0

    return p0

    .line 219
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

.method private lookBy(Landroid/view/MotionEvent;)V
    .locals 11

    .line 427
    iget-boolean v0, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    if-eqz v0, :cond_0

    .line 428
    return-void

    .line 430
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 431
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 432
    iget-boolean v2, p0, Lmodmenu/InputBridge;->primed:Z

    const/4 v3, 0x1

    if-nez v2, :cond_1

    .line 433
    iput-boolean v3, p0, Lmodmenu/InputBridge;->primed:Z

    .line 434
    iput v0, p0, Lmodmenu/InputBridge;->lastX:F

    .line 435
    iput v1, p0, Lmodmenu/InputBridge;->lastY:F

    .line 436
    return-void

    .line 438
    :cond_1
    iget v2, p0, Lmodmenu/InputBridge;->lastX:F

    sub-float v2, v0, v2

    .line 439
    iget v4, p0, Lmodmenu/InputBridge;->lastY:F

    sub-float v4, v1, v4

    .line 440
    iput v0, p0, Lmodmenu/InputBridge;->lastX:F

    .line 441
    iput v1, p0, Lmodmenu/InputBridge;->lastY:F

    .line 442
    const/4 v0, 0x0

    cmpl-float v1, v2, v0

    if-nez v1, :cond_2

    cmpl-float v0, v4, v0

    if-nez v0, :cond_2

    .line 443
    return-void

    .line 445
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v9

    .line 446
    iget-object p1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    .line 447
    iget-boolean v0, p0, Lmodmenu/InputBridge;->looking:Z

    const/high16 v1, 0x40000000    # 2.0f

    if-nez v0, :cond_3

    .line 448
    iget v0, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v0, v0

    div-float/2addr v0, v1

    iput v0, p0, Lmodmenu/InputBridge;->lookX:F

    .line 449
    iget v0, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v0, v0

    div-float/2addr v0, v1

    iput v0, p0, Lmodmenu/InputBridge;->lookY:F

    .line 450
    iput-wide v9, p0, Lmodmenu/InputBridge;->lookDownTime:J

    .line 451
    iget v7, p0, Lmodmenu/InputBridge;->lookX:F

    iget v8, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v6, 0x0

    move-object v5, p0

    invoke-direct/range {v5 .. v10}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 452
    iput-boolean v3, p0, Lmodmenu/InputBridge;->looking:Z

    .line 454
    :cond_3
    iget v0, p0, Lmodmenu/InputBridge;->lookX:F

    add-float/2addr v0, v2

    iput v0, p0, Lmodmenu/InputBridge;->lookX:F

    .line 455
    iget v0, p0, Lmodmenu/InputBridge;->lookY:F

    add-float/2addr v0, v4

    iput v0, p0, Lmodmenu/InputBridge;->lookY:F

    .line 456
    iget v0, p0, Lmodmenu/InputBridge;->lookX:F

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_4

    iget v0, p0, Lmodmenu/InputBridge;->lookX:F

    iget v2, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v2

    const/high16 v3, 0x40400000    # 3.0f

    sub-float/2addr v2, v3

    cmpl-float v0, v0, v2

    if-gtz v0, :cond_4

    iget v0, p0, Lmodmenu/InputBridge;->lookY:F

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_4

    iget v0, p0, Lmodmenu/InputBridge;->lookY:F

    iget v2, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v2, v2

    sub-float/2addr v2, v3

    cmpl-float v0, v0, v2

    if-lez v0, :cond_5

    .line 458
    :cond_4
    iget v7, p0, Lmodmenu/InputBridge;->lookX:F

    iget v8, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v6, 0x1

    move-object v5, p0

    invoke-direct/range {v5 .. v10}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 459
    iget v0, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v0, v0

    div-float/2addr v0, v1

    iput v0, p0, Lmodmenu/InputBridge;->lookX:F

    .line 460
    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float p1, p1

    div-float/2addr p1, v1

    iput p1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 461
    iput-wide v9, p0, Lmodmenu/InputBridge;->lookDownTime:J

    .line 462
    iget v7, p0, Lmodmenu/InputBridge;->lookX:F

    iget v8, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v6, 0x0

    invoke-direct/range {v5 .. v10}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 464
    :cond_5
    iget v7, p0, Lmodmenu/InputBridge;->lookX:F

    iget v8, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v6, 0x2

    move-object v5, p0

    invoke-direct/range {v5 .. v10}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 465
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v0, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 466
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v0, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    const-wide/16 v1, 0x78

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 467
    return-void
.end method

.method private player()Lcom/minitech/player/AppPlayer;
    .locals 1

    .line 185
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    instance-of v0, v0, Lorg/appplay/lib/GameBaseActivity;

    if-nez v0, :cond_0

    .line 186
    const/4 v0, 0x0

    return-object v0

    .line 188
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    check-cast v0, Lorg/appplay/lib/GameBaseActivity;

    iget-object v0, v0, Lorg/appplay/lib/GameBaseActivity;->m_AppPlayer:Lcom/minitech/player/AppPlayer;

    return-object v0
.end method

.method private releaseCapture(Landroid/view/View;)V
    .locals 2

    .line 412
    invoke-virtual {p1}, Landroid/view/View;->releasePointerCapture()V

    .line 413
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmodmenu/InputBridge;->captured:Z

    .line 414
    iput-boolean p1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 415
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 416
    const-string p1, "MWInput"

    const-string v0, "xh capture released"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    return-void
.end method

.method private syncCrosshair()V
    .locals 8

    .line 389
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    .line 390
    return-void

    .line 392
    :cond_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 393
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/minitech/player/AppPlayer;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 394
    :goto_0
    if-nez v0, :cond_2

    .line 395
    return-void

    .line 397
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 398
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v3

    .line 406
    iget-boolean v4, p0, Lmodmenu/InputBridge;->captured:Z

    .line 398
    if-eqz v3, :cond_3

    .line 399
    if-nez v4, :cond_4

    iget-wide v3, p0, Lmodmenu/InputBridge;->lastCaptureReq:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x5dc

    cmp-long v7, v3, v5

    if-lez v7, :cond_4

    .line 400
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastCaptureReq:J

    .line 401
    const/4 v1, 0x1

    iput-boolean v1, p0, Lmodmenu/InputBridge;->captured:Z

    .line 402
    const/4 v1, 0x0

    iput-boolean v1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 403
    invoke-virtual {v0}, Landroid/view/View;->requestPointerCapture()V

    .line 404
    const-string v0, "MWInput"

    const-string v1, "xh capture requested"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 406
    :cond_3
    if-eqz v4, :cond_4

    .line 407
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->releaseCapture(Landroid/view/View;)V

    .line 409
    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    .line 290
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 291
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const/4 v1, 0x2

    and-int/2addr v0, v1

    if-eqz v0, :cond_4

    .line 292
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 293
    if-eqz v0, :cond_4

    .line 294
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    .line 295
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

    .line 297
    :goto_0
    const/4 v4, 0x7

    if-eqz v3, :cond_2

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v3

    if-eqz v3, :cond_2

    if-eq v2, v4, :cond_1

    if-ne v2, v1, :cond_2

    .line 300
    :cond_1
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 301
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookBy(Landroid/view/MotionEvent;)V

    .line 302
    return v5

    .line 304
    :cond_2
    invoke-virtual {v0, p1}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result v0

    .line 305
    if-eq v2, v4, :cond_3

    .line 306
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "motion act="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " src="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 307
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " eng="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 306
    const-string v0, "MWInput"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    :cond_3
    return v5

    .line 312
    :cond_4
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 5

    .line 252
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 253
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 254
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 258
    :goto_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    const/16 v3, 0x83

    const-string v4, "MWInput"

    if-ne v2, v3, :cond_2

    .line 259
    if-eqz v0, :cond_1

    .line 260
    iget-object p1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    xor-int/2addr v0, v1

    invoke-static {p1, v0}, Lmodmenu/ModMenu;->setCrosshair(Landroid/content/Context;Z)V

    .line 261
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 262
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

    .line 264
    :cond_1
    return v1

    .line 266
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    invoke-static {v2}, Lmodmenu/InputBridge;->keepAndroid(I)Z

    move-result v2

    if-nez v2, :cond_7

    .line 267
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v2

    .line 268
    if-nez v2, :cond_3

    .line 269
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 271
    :cond_3
    if-eqz v0, :cond_4

    .line 272
    invoke-direct {p0}, Lmodmenu/InputBridge;->enableKeyBinds()V

    .line 277
    :cond_4
    invoke-virtual {v2, p1}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result v2

    .line 278
    if-nez v0, :cond_5

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_6

    .line 279
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

    .line 282
    :cond_6
    return v1

    .line 285
    :cond_7
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 498
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    .line 508
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 317
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 318
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

    .line 320
    :goto_0
    if-nez v1, :cond_1

    if-nez v0, :cond_1

    .line 321
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lmodmenu/InputBridge;->endLook(J)V

    .line 323
    :cond_1
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v2

    if-eqz v2, :cond_7

    if-eqz v1, :cond_7

    .line 324
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v1

    .line 325
    if-eqz v1, :cond_2

    if-nez v0, :cond_2

    .line 326
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lmodmenu/InputBridge;->endLook(J)V

    .line 328
    :cond_2
    invoke-direct {p0, p1, v1}, Lmodmenu/InputBridge;->asFinger(Landroid/view/MotionEvent;Z)Landroid/view/MotionEvent;

    move-result-object v1

    .line 329
    if-eqz v1, :cond_7

    .line 330
    iget-object p1, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {p1, v1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    .line 331
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 332
    if-nez v0, :cond_3

    .line 333
    iput-boolean v4, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    goto :goto_1

    .line 334
    :cond_3
    if-ne v0, v4, :cond_4

    .line 335
    iput-boolean v3, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    .line 337
    :cond_4
    :goto_1
    if-eqz v0, :cond_5

    if-ne v0, v4, :cond_6

    .line 338
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mouse-touch "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

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

    const-string v1, "MWInput"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    :cond_6
    return p1

    .line 343
    :cond_7
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 503
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .locals 1

    .line 604
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeFinished(Landroid/view/ActionMode;)V

    .line 605
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 1

    .line 599
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeStarted(Landroid/view/ActionMode;)V

    .line 600
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 584
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onAttachedToWindow()V

    .line 585
    return-void
.end method

.method public onContentChanged()V
    .locals 1

    .line 523
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onContentChanged()V

    .line 524
    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 1

    .line 518
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .locals 1

    .line 513
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onCreatePanelView(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 589
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onDetachedFromWindow()V

    .line 590
    return-void
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 1

    .line 558
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .locals 1

    .line 553
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .locals 1

    .line 594
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 595
    return-void
.end method

.method public onPointerCaptureChanged(Z)V
    .locals 2

    .line 615
    if-nez p1, :cond_0

    iget-boolean v0, p0, Lmodmenu/InputBridge;->captured:Z

    if-eqz v0, :cond_0

    .line 616
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmodmenu/InputBridge;->captured:Z

    .line 617
    iput-boolean v0, p0, Lmodmenu/InputBridge;->primed:Z

    .line 618
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 619
    const-string v0, "MWInput"

    const-string v1, "xh capture lost"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 621
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onPointerCaptureChanged(Z)V

    .line 622
    return-void
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 1

    .line 548
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

    .line 610
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/Window$Callback;->onProvideKeyboardShortcuts(Ljava/util/List;Landroid/view/Menu;I)V

    .line 611
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .line 528
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onSearchRequested()Z

    move-result v0

    return v0
.end method

.method public onSearchRequested(Landroid/view/SearchEvent;)Z
    .locals 1

    .line 533
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onSearchRequested(Landroid/view/SearchEvent;)Z

    move-result p1

    return p1
.end method

.method public onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
    .locals 1

    .line 563
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    .line 564
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2

    .line 568
    if-eqz p1, :cond_0

    .line 569
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    goto :goto_1

    .line 571
    :cond_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 572
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/minitech/player/AppPlayer;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 573
    :goto_0
    iget-boolean v1, p0, Lmodmenu/InputBridge;->captured:Z

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    .line 574
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->releaseCapture(Landroid/view/View;)V

    goto :goto_1

    .line 576
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 579
    :goto_1
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowFocusChanged(Z)V

    .line 580
    return-void
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .locals 1

    .line 538
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;
    .locals 1

    .line 543
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method
