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

.field private static final PROBE:Ljava/lang/String; = "(function() local g=_G local out,c={},0 local function add(s) if c<150 then c=c+1 out[#out+1]=s end end local gp={\"keybind\",\"hotkey\",\"keycode\",\"keyname\",\"inputservice\",\"userinput\",\"cursorlevel\",\"enterworld\",\"pccontrol\",\"contrl\",\"ctrlmode\",\"controlmode\",\"gameset\",\"dev2game\",\"callapi\",\"gamecall\",\"callnative\",\"nativecall\"} for k,v in pairs(g) do if type(k)==\"string\" then local l=k:lower() for i=1,#gp do if l:find(gp[i],1,true) then add(\"G.\"..k..\":\"..type(v)) break end end end end local tp={\"keybind\",\"hotkey\",\"keycode\",\"keyname\",\"setkey\",\"iskey\",\"keydown\",\"keyup\",\"shortcut\",\"mousewheel\",\"wheel\",\"contrl\",\"ctrlmode\",\"controlmode\",\"pccontrol\",\"uicontrol\",\"cursor\",\"checkcmd\",\"pushcommand\",\"execute\",\"enterworld\",\"entermap\",\"onenter\",\"scenechange\",\"getscene\",\"currentscene\",\"curworld\",\"gamestate\",\"gameset\",\"dev2game\",\"callapi\"} for k,v in pairs(g) do if type(v)==\"table\" and k~=\"_G\" then for kk,vv in pairs(v) do if type(kk)==\"string\" then local l=kk:lower() for i=1,#tp do if l:find(tp[i],1,true) then add(k..\".\"..kk..\":\"..type(vv)) break end end end end for k2,v2 in pairs(v) do if type(v2)==\"table\" and k2~=\"_G\" then for kk,vv in pairs(v2) do if type(kk)==\"string\" then local l=kk:lower() for i=1,#tp do if l:find(tp[i],1,true) then add(k..\".\"..k2..\".\"..kk..\":\"..type(vv)) break end end end end end end end end local r={} local function call(n) local f=rawget(g,n) if type(f)~=\"function\" then r[#r+1]=n..\"=?\" return end local ok,v=pcall(f) r[#r+1]=n..\"=\"..(ok and tostring(v) or \"e\") end call(\"getContrlMode\") call(\"getCtrlMode\") call(\"GetCurrentCursorLevel\") call(\"isPCControl\") call(\"getUIControlMode\") local s=\"MWP2|n=\"..c..\"|\"..table.concat(r,\";\")..\"|\"..table.concat(out,\",\") local pr=type(print)==\"function\" and print or function() end local i,cc=1,0 while i<=#s do cc=cc+1 pr(\"MWP2\"..cc..\"|\"..s:sub(i,i+2799)) i=i+2800 end error(s:sub(1,3000)) end)"

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

    .line 112
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>(Landroid/view/Window$Callback;Landroid/app/Activity;)V
    .locals 2

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lmodmenu/InputBridge;->installedAt:J

    .line 132
    new-instance v0, Lmodmenu/InputBridge$1;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$1;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    .line 140
    iput-object p1, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    .line 141
    iput-object p2, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    .line 142
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

    .line 372
    move-object/from16 v0, p1

    :try_start_0
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v7

    .line 373
    new-array v8, v7, [Landroid/view/MotionEvent$PointerProperties;

    .line 375
    new-array v9, v7, [Landroid/view/MotionEvent$PointerCoords;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 376
    move-object/from16 v1, p0

    :try_start_1
    iget-object v2, v1, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 377
    const/4 v3, 0x0

    :goto_0
    if-ge v3, v7, :cond_3

    .line 378
    new-instance v4, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 379
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, v4, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 380
    const/4 v5, 0x1

    iput v5, v4, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 381
    aput-object v4, v8, v3

    .line 382
    new-instance v4, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 383
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

    .line 384
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

    .line 385
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

    .line 386
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getSize(I)F

    move-result v5

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 387
    aput-object v4, v9, v3

    .line 377
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 389
    :cond_3
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    .line 390
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v10

    .line 391
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getXPrecision()F

    move-result v12

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getYPrecision()F

    move-result v13

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v14

    .line 392
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v15

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getFlags()I

    move-result v17

    .line 389
    const/4 v11, 0x0

    const/16 v16, 0x1002

    invoke-static/range {v2 .. v17}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    .line 393
    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    move-object/from16 v1, p0

    .line 394
    :goto_4
    const/4 v0, 0x0

    return-object v0
.end method

.method private dispatchSynth(IFFJ)V
    .locals 22

    .line 510
    move-object/from16 v0, p0

    new-instance v1, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v1}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 511
    const/4 v2, 0x0

    iput v2, v1, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 512
    const/4 v3, 0x1

    iput v3, v1, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 513
    new-instance v4, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 514
    move/from16 v5, p2

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 515
    move/from16 v5, p3

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 516
    const/high16 v5, 0x3f800000    # 1.0f

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->pressure:F

    .line 517
    const v5, 0x3d4ccccd    # 0.05f

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 518
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

    .line 522
    iget-object v2, v0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v2, v1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 523
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 524
    return-void
.end method

.method private enableKeyBinds()V
    .locals 8

    .line 229
    const-string v0, "MWInput"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 230
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

    .line 233
    :cond_0
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastEnable:J

    .line 235
    :try_start_0
    const-string v1, "(function() pcall(enableAllKeyBind or function() end) end)"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 236
    const-string v1, "keybind-on fired"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    sget-boolean v1, Lmodmenu/InputBridge;->probed:Z

    if-nez v1, :cond_1

    .line 238
    const/4 v1, 0x1

    sput-boolean v1, Lmodmenu/InputBridge;->probed:Z

    .line 239
    const-string v1, "(function() local g=_G local out,c={},0 local function add(s) if c<150 then c=c+1 out[#out+1]=s end end local gp={\"keybind\",\"hotkey\",\"keycode\",\"keyname\",\"inputservice\",\"userinput\",\"cursorlevel\",\"enterworld\",\"pccontrol\",\"contrl\",\"ctrlmode\",\"controlmode\",\"gameset\",\"dev2game\",\"callapi\",\"gamecall\",\"callnative\",\"nativecall\"} for k,v in pairs(g) do if type(k)==\"string\" then local l=k:lower() for i=1,#gp do if l:find(gp[i],1,true) then add(\"G.\"..k..\":\"..type(v)) break end end end end local tp={\"keybind\",\"hotkey\",\"keycode\",\"keyname\",\"setkey\",\"iskey\",\"keydown\",\"keyup\",\"shortcut\",\"mousewheel\",\"wheel\",\"contrl\",\"ctrlmode\",\"controlmode\",\"pccontrol\",\"uicontrol\",\"cursor\",\"checkcmd\",\"pushcommand\",\"execute\",\"enterworld\",\"entermap\",\"onenter\",\"scenechange\",\"getscene\",\"currentscene\",\"curworld\",\"gamestate\",\"gameset\",\"dev2game\",\"callapi\"} for k,v in pairs(g) do if type(v)==\"table\" and k~=\"_G\" then for kk,vv in pairs(v) do if type(kk)==\"string\" then local l=kk:lower() for i=1,#tp do if l:find(tp[i],1,true) then add(k..\".\"..kk..\":\"..type(vv)) break end end end end for k2,v2 in pairs(v) do if type(v2)==\"table\" and k2~=\"_G\" then for kk,vv in pairs(v2) do if type(kk)==\"string\" then local l=kk:lower() for i=1,#tp do if l:find(tp[i],1,true) then add(k..\".\"..k2..\".\"..kk..\":\"..type(vv)) break end end end end end end end end local r={} local function call(n) local f=rawget(g,n) if type(f)~=\"function\" then r[#r+1]=n..\"=?\" return end local ok,v=pcall(f) r[#r+1]=n..\"=\"..(ok and tostring(v) or \"e\") end call(\"getContrlMode\") call(\"getCtrlMode\") call(\"GetCurrentCursorLevel\") call(\"isPCControl\") call(\"getUIControlMode\") local s=\"MWP2|n=\"..c..\"|\"..table.concat(r,\";\")..\"|\"..table.concat(out,\",\") local pr=type(print)==\"function\" and print or function() end local i,cc=1,0 while i<=#s do cc=cc+1 pr(\"MWP2\"..cc..\"|\"..s:sub(i,i+2799)) i=i+2800 end error(s:sub(1,3000)) end)"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 240
    const-string v1, "probe fired"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    :cond_1
    goto :goto_0

    .line 242
    :catch_0
    move-exception v1

    .line 243
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

    .line 245
    :goto_0
    return-void

    .line 231
    :cond_2
    :goto_1
    return-void
.end method

.method private endLook(J)V
    .locals 7

    .line 501
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 502
    iget-boolean v0, p0, Lmodmenu/InputBridge;->looking:Z

    if-nez v0, :cond_0

    .line 503
    return-void

    .line 505
    :cond_0
    iget v3, p0, Lmodmenu/InputBridge;->lookX:F

    iget v4, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v2, 0x1

    move-object v1, p0

    move-wide v5, p1

    invoke-direct/range {v1 .. v6}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 506
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmodmenu/InputBridge;->looking:Z

    .line 507
    return-void
.end method

.method public static install(Landroid/app/Activity;)V
    .locals 3

    .line 146
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 147
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v1

    .line 148
    if-eqz v1, :cond_1

    instance-of v2, v1, Lmodmenu/InputBridge;

    if-eqz v2, :cond_0

    goto :goto_0

    .line 151
    :cond_0
    new-instance v2, Lmodmenu/InputBridge;

    invoke-direct {v2, v1, p0}, Lmodmenu/InputBridge;-><init>(Landroid/view/Window$Callback;Landroid/app/Activity;)V

    invoke-virtual {v0, v2}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 152
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

    .line 153
    return-void

    .line 149
    :cond_1
    :goto_0
    return-void
.end method

.method private static keepAndroid(I)Z
    .locals 0

    .line 194
    sparse-switch p0, :sswitch_data_0

    .line 218
    const/4 p0, 0x0

    return p0

    .line 216
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
    .locals 14

    .line 443
    iget-boolean v1, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    if-eqz v1, :cond_0

    .line 444
    return-void

    .line 446
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 447
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 448
    iget-boolean v3, p0, Lmodmenu/InputBridge;->primed:Z

    const-string v4, " y="

    const/4 v6, 0x1

    const-string v5, "MWInput"

    const-wide/16 v7, 0x1f4

    if-nez v3, :cond_2

    .line 449
    iput-boolean v6, p0, Lmodmenu/InputBridge;->primed:Z

    .line 450
    iput v1, p0, Lmodmenu/InputBridge;->lastX:F

    .line 451
    iput v2, p0, Lmodmenu/InputBridge;->lastY:F

    .line 452
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    .line 453
    iget-wide v11, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v11, v9, v11

    cmp-long v3, v11, v7

    if-lez v3, :cond_1

    .line 454
    iput-wide v9, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 455
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

    .line 457
    :cond_1
    return-void

    .line 459
    :cond_2
    iget v3, p0, Lmodmenu/InputBridge;->lastX:F

    sub-float v9, v1, v3

    .line 460
    iget v3, p0, Lmodmenu/InputBridge;->lastY:F

    sub-float v10, v2, v3

    .line 461
    iput v1, p0, Lmodmenu/InputBridge;->lastX:F

    .line 462
    iput v2, p0, Lmodmenu/InputBridge;->lastY:F

    .line 463
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v11

    .line 464
    const/4 v3, 0x0

    cmpl-float v13, v9, v3

    if-nez v13, :cond_4

    cmpl-float v3, v10, v3

    if-nez v3, :cond_4

    .line 465
    iget-wide v9, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    sub-long v9, v11, v9

    cmp-long v3, v9, v7

    if-lez v3, :cond_3

    .line 466
    iput-wide v11, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    .line 467
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

    .line 469
    :cond_3
    return-void

    .line 471
    :cond_4
    iget-wide v1, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    sub-long v1, v11, v1

    cmp-long v3, v1, v7

    if-lez v3, :cond_5

    .line 472
    iput-wide v11, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    .line 473
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

    .line 475
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    .line 476
    iget-object v1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    .line 477
    iget-boolean v1, p0, Lmodmenu/InputBridge;->looking:Z

    const/high16 v8, 0x40000000    # 2.0f

    if-nez v1, :cond_6

    .line 478
    iget v1, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 479
    iget v1, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    iput v1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 480
    iput-wide v4, p0, Lmodmenu/InputBridge;->lookDownTime:J

    .line 481
    iget v2, p0, Lmodmenu/InputBridge;->lookX:F

    iget v3, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v1, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 482
    iput-boolean v6, p0, Lmodmenu/InputBridge;->looking:Z

    .line 484
    :cond_6
    iget v1, p0, Lmodmenu/InputBridge;->lookX:F

    add-float/2addr v1, v9

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 485
    iget v1, p0, Lmodmenu/InputBridge;->lookY:F

    add-float/2addr v1, v10

    iput v1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 486
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

    .line 488
    :cond_7
    iget v2, p0, Lmodmenu/InputBridge;->lookX:F

    iget v3, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v1, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 489
    iget v1, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 490
    iget v1, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    iput v1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 491
    iput-wide v4, p0, Lmodmenu/InputBridge;->lookDownTime:J

    .line 492
    iget v2, p0, Lmodmenu/InputBridge;->lookX:F

    iget v3, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v1, 0x0

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 494
    :cond_8
    iget v2, p0, Lmodmenu/InputBridge;->lookX:F

    iget v3, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v1, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 495
    sget-object v1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 496
    sget-object v1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    const-wide/16 v3, 0x78

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 497
    return-void
.end method

.method private player()Lcom/minitech/player/AppPlayer;
    .locals 1

    .line 182
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    instance-of v0, v0, Lorg/appplay/lib/GameBaseActivity;

    if-nez v0, :cond_0

    .line 183
    const/4 v0, 0x0

    return-object v0

    .line 185
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    check-cast v0, Lorg/appplay/lib/GameBaseActivity;

    iget-object v0, v0, Lorg/appplay/lib/GameBaseActivity;->m_AppPlayer:Lcom/minitech/player/AppPlayer;

    return-object v0
.end method

.method private releaseCapture(Landroid/view/View;)V
    .locals 2

    .line 428
    invoke-virtual {p1}, Landroid/view/View;->releasePointerCapture()V

    .line 429
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmodmenu/InputBridge;->captured:Z

    .line 430
    iput-boolean p1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 431
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 432
    const-string p1, "MWInput"

    const-string v0, "xh capture released"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    return-void
.end method

.method private syncCrosshair()V
    .locals 8

    .line 405
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    .line 406
    return-void

    .line 408
    :cond_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 409
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/minitech/player/AppPlayer;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 410
    :goto_0
    if-nez v0, :cond_2

    .line 411
    return-void

    .line 413
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 414
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v3

    .line 422
    iget-boolean v4, p0, Lmodmenu/InputBridge;->captured:Z

    .line 414
    if-eqz v3, :cond_3

    .line 415
    if-nez v4, :cond_4

    iget-wide v3, p0, Lmodmenu/InputBridge;->lastCaptureReq:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x5dc

    cmp-long v7, v3, v5

    if-lez v7, :cond_4

    .line 416
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastCaptureReq:J

    .line 417
    const/4 v1, 0x1

    iput-boolean v1, p0, Lmodmenu/InputBridge;->captured:Z

    .line 418
    const/4 v1, 0x0

    iput-boolean v1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 419
    invoke-virtual {v0}, Landroid/view/View;->requestPointerCapture()V

    .line 420
    const-string v0, "MWInput"

    const-string v1, "xh capture requested"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 422
    :cond_3
    if-eqz v4, :cond_4

    .line 423
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->releaseCapture(Landroid/view/View;)V

    .line 425
    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 287
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 288
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const/4 v1, 0x2

    and-int/2addr v0, v1

    if-eqz v0, :cond_5

    .line 289
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 290
    if-eqz v0, :cond_5

    .line 291
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    .line 292
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

    .line 294
    :goto_0
    const-string v4, "MWInput"

    const/4 v6, 0x7

    if-eqz v3, :cond_3

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v3

    if-eqz v3, :cond_3

    if-eq v2, v6, :cond_1

    if-ne v2, v1, :cond_3

    .line 297
    :cond_1
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 298
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 299
    iget-wide v6, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v6, v0, v6

    const-wide/16 v8, 0x1f4

    cmp-long v3, v6, v8

    if-lez v3, :cond_2

    .line 300
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 301
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "xh-m act="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

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

    .line 302
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 301
    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    :cond_2
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookBy(Landroid/view/MotionEvent;)V

    .line 305
    return v5

    .line 307
    :cond_3
    invoke-virtual {v0, p1}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result v0

    .line 308
    if-eq v2, v6, :cond_4

    .line 309
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

    .line 310
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

    .line 309
    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    :cond_4
    return v5

    .line 315
    :cond_5
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 5

    .line 249
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 250
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 251
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 255
    :goto_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    const/16 v3, 0x83

    const-string v4, "MWInput"

    if-ne v2, v3, :cond_2

    .line 256
    if-eqz v0, :cond_1

    .line 257
    iget-object p1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    xor-int/2addr v0, v1

    invoke-static {p1, v0}, Lmodmenu/ModMenu;->setCrosshair(Landroid/content/Context;Z)V

    .line 258
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 259
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

    .line 261
    :cond_1
    return v1

    .line 263
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    invoke-static {v2}, Lmodmenu/InputBridge;->keepAndroid(I)Z

    move-result v2

    if-nez v2, :cond_7

    .line 264
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v2

    .line 265
    if-nez v2, :cond_3

    .line 266
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 268
    :cond_3
    if-eqz v0, :cond_4

    .line 269
    invoke-direct {p0}, Lmodmenu/InputBridge;->enableKeyBinds()V

    .line 274
    :cond_4
    invoke-virtual {v2, p1}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result v2

    .line 275
    if-nez v0, :cond_5

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_6

    .line 276
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

    .line 279
    :cond_6
    return v1

    .line 282
    :cond_7
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 528
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    .line 538
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 320
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 321
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

    .line 323
    :goto_0
    if-nez v1, :cond_1

    if-nez v0, :cond_1

    .line 324
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lmodmenu/InputBridge;->endLook(J)V

    .line 326
    :cond_1
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v2

    if-eqz v2, :cond_a

    if-eqz v1, :cond_a

    .line 327
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v1

    .line 328
    const-string v2, "MWInput"

    if-eqz v1, :cond_3

    const/4 v5, 0x2

    if-ne v0, v5, :cond_3

    .line 329
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v5

    if-nez v5, :cond_3

    .line 332
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 333
    iget-wide v5, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v5, v0, v5

    const-wide/16 v7, 0x1f4

    cmp-long v3, v5, v7

    if-lez v3, :cond_2

    .line 334
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 335
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

    .line 337
    :cond_2
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookBy(Landroid/view/MotionEvent;)V

    .line 338
    return v4

    .line 340
    :cond_3
    if-eqz v1, :cond_4

    if-nez v0, :cond_4

    .line 341
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lmodmenu/InputBridge;->endLook(J)V

    .line 343
    :cond_4
    invoke-direct {p0, p1, v1}, Lmodmenu/InputBridge;->asFinger(Landroid/view/MotionEvent;Z)Landroid/view/MotionEvent;

    move-result-object v1

    .line 344
    if-eqz v1, :cond_a

    .line 345
    iget-object p1, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {p1, v1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    .line 346
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 347
    if-nez v0, :cond_5

    .line 348
    iput-boolean v4, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    goto :goto_1

    .line 349
    :cond_5
    if-eq v0, v4, :cond_6

    const/4 v1, 0x3

    if-ne v0, v1, :cond_7

    .line 351
    :cond_6
    iput-boolean v3, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    .line 353
    :cond_7
    :goto_1
    if-eqz v0, :cond_8

    if-ne v0, v4, :cond_9

    .line 354
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

    .line 356
    :cond_9
    return p1

    .line 359
    :cond_a
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 533
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .locals 1

    .line 634
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeFinished(Landroid/view/ActionMode;)V

    .line 635
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 1

    .line 629
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeStarted(Landroid/view/ActionMode;)V

    .line 630
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 614
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onAttachedToWindow()V

    .line 615
    return-void
.end method

.method public onContentChanged()V
    .locals 1

    .line 553
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onContentChanged()V

    .line 554
    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 1

    .line 548
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .locals 1

    .line 543
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onCreatePanelView(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 619
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onDetachedFromWindow()V

    .line 620
    return-void
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 1

    .line 588
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .locals 1

    .line 583
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .locals 1

    .line 624
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 625
    return-void
.end method

.method public onPointerCaptureChanged(Z)V
    .locals 2

    .line 645
    if-nez p1, :cond_0

    iget-boolean v0, p0, Lmodmenu/InputBridge;->captured:Z

    if-eqz v0, :cond_0

    .line 646
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmodmenu/InputBridge;->captured:Z

    .line 647
    iput-boolean v0, p0, Lmodmenu/InputBridge;->primed:Z

    .line 648
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 649
    const-string v0, "MWInput"

    const-string v1, "xh capture lost"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 651
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onPointerCaptureChanged(Z)V

    .line 652
    return-void
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 1

    .line 578
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

    .line 640
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/Window$Callback;->onProvideKeyboardShortcuts(Ljava/util/List;Landroid/view/Menu;I)V

    .line 641
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .line 558
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onSearchRequested()Z

    move-result v0

    return v0
.end method

.method public onSearchRequested(Landroid/view/SearchEvent;)Z
    .locals 1

    .line 563
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onSearchRequested(Landroid/view/SearchEvent;)Z

    move-result p1

    return p1
.end method

.method public onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
    .locals 1

    .line 593
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    .line 594
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2

    .line 598
    if-eqz p1, :cond_0

    .line 599
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    goto :goto_1

    .line 601
    :cond_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 602
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/minitech/player/AppPlayer;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 603
    :goto_0
    iget-boolean v1, p0, Lmodmenu/InputBridge;->captured:Z

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    .line 604
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->releaseCapture(Landroid/view/View;)V

    goto :goto_1

    .line 606
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 609
    :goto_1
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowFocusChanged(Z)V

    .line 610
    return-void
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .locals 1

    .line 568
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;
    .locals 1

    .line 573
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method
