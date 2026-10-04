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

.field private static final CLICK_HOLD_MS:J = 0x2bcL

.field private static final CTRL_TOGGLE:Ljava/lang/String; = "(function() local cl,cl2,cm,cm2 local okc,cfg=pcall(function() return GetIWorldConfig() end) if not okc or cfg==nil then error(\'MWP6|cfg=no\',0) end pcall(function() cl=cfg:getGameData(\'classical\') end) pcall(function() cm=GetClientInfo():getContrlMode() end) local num=tonumber(cl) local newc=(num and num>0) and 0 or 1 local ok1=pcall(function() cfg:setGameData(\'classical\',newc) cfg:setGameData(\'rocker\',newc==1 and 0 or 1) end) local ok2=pcall(SetControlMoveSwithState) local ok3=pcall(function() GetClientInfo():appalyGameSetData() end) pcall(function() cl2=cfg:getGameData(\'classical\') end) pcall(function() cm2=GetClientInfo():getContrlMode() end) error(\'MWP6|cl=\'..tostring(cl)..\'->\'..tostring(cl2) ..\' cm=\'..tostring(cm)..\'->\'..tostring(cm2) ..\'|set=\'..tostring(ok1)..\' ui=\'..tostring(ok2) ..\' ap=\'..tostring(ok3),0) end)"

.field private static final ENABLE_INTERVAL_MS:J = 0x7d0L

.field private static final ENABLE_WARMUP_MS:J = 0x1388L

.field private static final KEYBIND_ON:Ljava/lang/String; = "(function() pcall(function() local names={\"GameSettingsMgr\",\"GameSettings\"} for i=1,#names do local t=_G[names[i]] if t~=nil then local ok,fn=pcall(function() return t.enableAllKeyBind end) if ok and type(fn)==\"function\" and pcall(function() t:enableAllKeyBind() end) then return end end end local ok,ci=pcall(GetClientInfo) if ok and ci~=nil then pcall(function() ci:enableAllKeyBind() end) end end) end)"

.field private static final LOOK_IDLE_MS:J = 0x78L

.field private static final MAIN:Landroid/os/Handler;

.field private static final OPEN_FRAME:Ljava/lang/String; = "(function() local r={} local ok,e=pcall(function() local fr=getglobal(\'GameSetFrame\') if fr==nil then error(\'noframe\') end fr:Show() end) r[#r+1]=\'show=\'..tostring(ok)..\',\'..tostring(e) local ok2,e2=pcall(function() local f=rawget(_G,\'GameSetFrameHotkey_OnShow\') if type(f)~=\'function\' then error(\'missing\') end f() end) r[#r+1]=\'onshow=\'..tostring(ok2)..\',\'..tostring(e2) local ok3=pcall(function() press_btn(\'GameSetFrameHotkeyBtn\') end) r[#r+1]=\'tab=\'..tostring(ok3) local vis=\'?\' pcall(function() local fr=getglobal(\'GameSetFrame\') vis=tostring(fr~=nil and fr.IsShown and fr:IsShown()) end) r[#r+1]=\'vis=\'..vis error(\'HKUI2|\'..table.concat(r,\'|\'):sub(1,2900),0) end)"

.field private static final PROBE_A:Ljava/lang/String; = "(function() local eb=\'none\' local names={\"GameSettingsMgr\",\"GameSettings\"} for i=1,#names do local t=_G[names[i]] if t~=nil then local ok,fn=pcall(function() return t.enableAllKeyBind end) if ok and type(fn)==\"function\" then local ran,er=pcall(function() t:enableAllKeyBind() end) eb=names[i]..(ran and \':ok\' or \':err:\'..tostring(er)) break end end end if eb==\'none\' then local okb,ci2=pcall(GetClientInfo) if okb and ci2~=nil then local ranb=pcall(function() ci2:enableAllKeyBind() end) eb=\'ClientInfo\'..(ranb and \':ok\' or \':err\') end end local cm,cl,rk,ing,mid pcall(function() cm=GetClientInfo():getContrlMode() end) pcall(function() local c=GetIWorldConfig() cl=c:getGameData(\'classical\') rk=c:getGameData(\'rocker\') end) pcall(function() ing=ClientCurGame and ClientCurGame.isInGame and ClientCurGame:isInGame() end) pcall(function() mid=GetClientInfo():getCurrentGameMapId() end) local hits,seen={},{} local ok,ci=pcall(GetClientInfo) if ok and type(ci)==\'table\' then local pok=pcall(function() for k in pairs(ci) do if type(k)==\'string\' and (k:find(\'ontrl\') or k:find(\'ontrol\') or k:find(\'witch\') or k:find(\'KeyBind\')) then if not seen[k] then seen[k]=true hits[#hits+1]=k end end end end) if not pok then hits[#hits+1]=\'pairs-fail\' end end local cand={\'setContrlMode\',\'setControlMode\',\'setContrlType\',\'setMoveMode\',\'setUIMode\',\'disableAllKeyBind\'} for i=1,#cand do if ci~=nil then local okf,f=pcall(function() return ci[cand[i]] end) if okf and type(f)==\'function\' and not seen[cand[i]] then seen[cand[i]]=true hits[#hits+1]=cand[i] end end end local s=\'MWP4|eb=\'..eb..\'|cm=\'..tostring(cm) ..\'|cl=\'..tostring(cl)..\',rk=\'..tostring(rk) ..\'|in=\'..tostring(ing)..\',mid=\'..tostring(mid) ..\'|set=\'..table.concat(hits,\',\') error(s:sub(1,2900),0) end)"

.field private static final STATE_POLL_MS:J = 0x5dcL

.field private static final TAG:Ljava/lang/String; = "MWInput"

.field private static volatile probed:Z


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final captureListener:Landroid/view/View$OnCapturedPointerListener;

.field private captured:Z

.field private clickDown:J

.field private final clickEnd:Ljava/lang/Runnable;

.field private final installedAt:J

.field private lastArrLog:J

.field private lastCaptureReq:J

.field private lastDeltaLog:J

.field private lastEnable:J

.field private lastInLog:J

.field private lastInMap:Z

.field private lastX:F

.field private lastY:F

.field private lookDownTime:J

.field private final lookEnd:Ljava/lang/Runnable;

.field private lookX:F

.field private lookY:F

.field private looking:Z

.field private mouseTouching:Z

.field private final orig:Landroid/view/Window$Callback;

.field private final poll:Ljava/lang/Runnable;

.field private polling:Z

.field private primed:Z

.field private stateErrLogged:Z

.field private statePath:Ljava/lang/String;

.field private statePath2:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 222
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>(Landroid/view/Window$Callback;Landroid/app/Activity;)V
    .locals 2

    .line 290
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 227
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lmodmenu/InputBridge;->installedAt:J

    .line 249
    new-instance v0, Lmodmenu/InputBridge$1;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$1;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    .line 255
    new-instance v0, Lmodmenu/InputBridge$2;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$2;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->clickEnd:Ljava/lang/Runnable;

    .line 266
    new-instance v0, Lmodmenu/InputBridge$3;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$3;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->poll:Ljava/lang/Runnable;

    .line 601
    new-instance v0, Lmodmenu/InputBridge$4;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$4;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->captureListener:Landroid/view/View$OnCapturedPointerListener;

    .line 291
    iput-object p1, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    .line 292
    iput-object p2, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    .line 293
    return-void
.end method

.method static synthetic access$000(Lmodmenu/InputBridge;J)V
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2}, Lmodmenu/InputBridge;->endLook(J)V

    return-void
.end method

.method static synthetic access$100(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 77
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    return p0
.end method

.method static synthetic access$1000(Lmodmenu/InputBridge;)V
    .locals 0

    .line 77
    invoke-direct {p0}, Lmodmenu/InputBridge;->pollState()V

    return-void
.end method

.method static synthetic access$102(Lmodmenu/InputBridge;Z)Z
    .locals 0

    .line 77
    iput-boolean p1, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    return p1
.end method

.method static synthetic access$1100(Lmodmenu/InputBridge;Ljava/lang/String;ILandroid/view/MotionEvent;)V
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2, p3}, Lmodmenu/InputBridge;->logCrosshairIn(Ljava/lang/String;ILandroid/view/MotionEvent;)V

    return-void
.end method

.method static synthetic access$1200(Lmodmenu/InputBridge;Landroid/view/MotionEvent;)V
    .locals 0

    .line 77
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookBy(Landroid/view/MotionEvent;)V

    return-void
.end method

.method static synthetic access$1300(Lmodmenu/InputBridge;JZ)V
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2, p3}, Lmodmenu/InputBridge;->centerTouch(JZ)V

    return-void
.end method

.method static synthetic access$200(Lmodmenu/InputBridge;)J
    .locals 2

    .line 77
    iget-wide v0, p0, Lmodmenu/InputBridge;->clickDown:J

    return-wide v0
.end method

.method static synthetic access$300(Lmodmenu/InputBridge;IJJ)V
    .locals 0

    .line 77
    invoke-direct/range {p0 .. p5}, Lmodmenu/InputBridge;->dispatchCenter(IJJ)V

    return-void
.end method

.method static synthetic access$400(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 77
    iget-boolean p0, p0, Lmodmenu/InputBridge;->polling:Z

    return p0
.end method

.method static synthetic access$500()Landroid/os/Handler;
    .locals 1

    .line 77
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$600(Lmodmenu/InputBridge;)Landroid/app/Activity;
    .locals 0

    .line 77
    iget-object p0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$700(Lmodmenu/InputBridge;)V
    .locals 0

    .line 77
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    return-void
.end method

.method static synthetic access$800(Lmodmenu/InputBridge;)J
    .locals 2

    .line 77
    iget-wide v0, p0, Lmodmenu/InputBridge;->installedAt:J

    return-wide v0
.end method

.method static synthetic access$900(Lmodmenu/InputBridge;)Lcom/minitech/player/AppPlayer;
    .locals 0

    .line 77
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object p0

    return-object p0
.end method

.method private asFinger(Landroid/view/MotionEvent;Z)Landroid/view/MotionEvent;
    .locals 18

    .line 568
    move-object/from16 v0, p1

    :try_start_0
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v7

    .line 569
    new-array v8, v7, [Landroid/view/MotionEvent$PointerProperties;

    .line 571
    new-array v9, v7, [Landroid/view/MotionEvent$PointerCoords;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 572
    move-object/from16 v1, p0

    :try_start_1
    iget-object v2, v1, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 573
    const/4 v3, 0x0

    :goto_0
    if-ge v3, v7, :cond_3

    .line 574
    new-instance v4, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 575
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, v4, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 576
    const/4 v5, 0x1

    iput v5, v4, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 577
    aput-object v4, v8, v3

    .line 578
    new-instance v4, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 579
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

    .line 580
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

    .line 581
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

    .line 582
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getSize(I)F

    move-result v5

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 583
    aput-object v4, v9, v3

    .line 573
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 585
    :cond_3
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    .line 586
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v10

    .line 587
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getXPrecision()F

    move-result v12

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getYPrecision()F

    move-result v13

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v14

    .line 588
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v15

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getFlags()I

    move-result v17

    .line 585
    const/4 v11, 0x0

    const/16 v16, 0x1002

    invoke-static/range {v2 .. v17}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    .line 589
    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    move-object/from16 v1, p0

    .line 590
    :goto_4
    const/4 v0, 0x0

    return-object v0
.end method

.method private centerTouch(JZ)V
    .locals 7

    .line 852
    nop

    .line 864
    iget-boolean v1, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    .line 852
    const-string v6, "MWInput"

    if-eqz p3, :cond_1

    .line 853
    if-eqz v1, :cond_0

    .line 854
    return-void

    .line 856
    :cond_0
    invoke-direct/range {p0 .. p2}, Lmodmenu/InputBridge;->endLook(J)V

    .line 857
    const/4 v1, 0x1

    iput-boolean v1, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    .line 858
    iput-wide p1, p0, Lmodmenu/InputBridge;->clickDown:J

    .line 859
    const/4 v1, 0x0

    move-wide v4, p1

    move-object v0, p0

    move-wide v2, p1

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchCenter(IJJ)V

    .line 860
    sget-object v1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v2, p0, Lmodmenu/InputBridge;->clickEnd:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 861
    sget-object v1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v2, p0, Lmodmenu/InputBridge;->clickEnd:Ljava/lang/Runnable;

    const-wide/16 v3, 0x2bc

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 862
    const-string v1, "center-touch down"

    invoke-static {v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 864
    :cond_1
    if-nez v1, :cond_2

    .line 865
    return-void

    .line 867
    :cond_2
    sget-object v1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v2, p0, Lmodmenu/InputBridge;->clickEnd:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 868
    const/4 v1, 0x1

    iget-wide v2, p0, Lmodmenu/InputBridge;->clickDown:J

    move-object v0, p0

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchCenter(IJJ)V

    .line 869
    const/4 v1, 0x0

    iput-boolean v1, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    .line 870
    const-string v1, "center-touch up"

    invoke-static {v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 872
    :goto_0
    return-void
.end method

.method private dispatchCenter(IJJ)V
    .locals 8

    .line 875
    iget-object v1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 876
    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float v6, v2, v3

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    div-float v7, v1, v3

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-wide v4, p4

    invoke-direct/range {v0 .. v7}, Lmodmenu/InputBridge;->dispatchFinger(IJJFF)V

    .line 878
    return-void
.end method

.method private dispatchFinger(IJJFF)V
    .locals 21

    .line 960
    new-instance v0, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v0}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 961
    const/4 v1, 0x0

    iput v1, v0, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 962
    const/4 v2, 0x1

    iput v2, v0, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 963
    new-instance v3, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v3}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 964
    move/from16 v4, p6

    iput v4, v3, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 965
    move/from16 v4, p7

    iput v4, v3, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 966
    const/high16 v4, 0x3f800000    # 1.0f

    iput v4, v3, Landroid/view/MotionEvent$PointerCoords;->pressure:F

    .line 967
    const v4, 0x3d4ccccd    # 0.05f

    iput v4, v3, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 968
    new-array v11, v2, [Landroid/view/MotionEvent$PointerProperties;

    aput-object v0, v11, v1

    new-array v12, v2, [Landroid/view/MotionEvent$PointerCoords;

    aput-object v3, v12, v1

    const/16 v19, 0x1002

    const/16 v20, 0x0

    const/4 v10, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/high16 v15, 0x3f800000    # 1.0f

    const/high16 v16, 0x3f800000    # 1.0f

    const/16 v17, 0x0

    const/16 v18, 0x0

    move/from16 v9, p1

    move-wide/from16 v5, p2

    move-wide/from16 v7, p4

    invoke-static/range {v5 .. v20}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v0

    .line 972
    move-object/from16 v1, p0

    iget-object v2, v1, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v2, v0}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 973
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    .line 974
    return-void
.end method

.method private dispatchSynth(IFFJ)V
    .locals 8

    .line 955
    iget-wide v2, p0, Lmodmenu/InputBridge;->lookDownTime:J

    move-object v0, p0

    move v1, p1

    move v6, p2

    move v7, p3

    move-wide v4, p4

    invoke-direct/range {v0 .. v7}, Lmodmenu/InputBridge;->dispatchFinger(IJJFF)V

    .line 956
    return-void
.end method

.method private enableKeyBinds()V
    .locals 8

    .line 382
    const-string v0, "MWInput"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 383
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

    .line 386
    :cond_0
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastEnable:J

    .line 388
    :try_start_0
    const-string v1, "(function() pcall(function() local names={\"GameSettingsMgr\",\"GameSettings\"} for i=1,#names do local t=_G[names[i]] if t~=nil then local ok,fn=pcall(function() return t.enableAllKeyBind end) if ok and type(fn)==\"function\" and pcall(function() t:enableAllKeyBind() end) then return end end end local ok,ci=pcall(GetClientInfo) if ok and ci~=nil then pcall(function() ci:enableAllKeyBind() end) end end) end)"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 389
    const-string v1, "keybind-on fired"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    sget-boolean v1, Lmodmenu/InputBridge;->probed:Z

    if-nez v1, :cond_1

    .line 391
    const/4 v1, 0x1

    sput-boolean v1, Lmodmenu/InputBridge;->probed:Z

    .line 394
    const-string v1, "(function() local r={} local ok,e=pcall(function() local fr=getglobal(\'GameSetFrame\') if fr==nil then error(\'noframe\') end fr:Show() end) r[#r+1]=\'show=\'..tostring(ok)..\',\'..tostring(e) local ok2,e2=pcall(function() local f=rawget(_G,\'GameSetFrameHotkey_OnShow\') if type(f)~=\'function\' then error(\'missing\') end f() end) r[#r+1]=\'onshow=\'..tostring(ok2)..\',\'..tostring(e2) local ok3=pcall(function() press_btn(\'GameSetFrameHotkeyBtn\') end) r[#r+1]=\'tab=\'..tostring(ok3) local vis=\'?\' pcall(function() local fr=getglobal(\'GameSetFrame\') vis=tostring(fr~=nil and fr.IsShown and fr:IsShown()) end) r[#r+1]=\'vis=\'..vis error(\'HKUI2|\'..table.concat(r,\'|\'):sub(1,2900),0) end)"

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 395
    const-string v1, "(function() local eb=\'none\' local names={\"GameSettingsMgr\",\"GameSettings\"} for i=1,#names do local t=_G[names[i]] if t~=nil then local ok,fn=pcall(function() return t.enableAllKeyBind end) if ok and type(fn)==\"function\" then local ran,er=pcall(function() t:enableAllKeyBind() end) eb=names[i]..(ran and \':ok\' or \':err:\'..tostring(er)) break end end end if eb==\'none\' then local okb,ci2=pcall(GetClientInfo) if okb and ci2~=nil then local ranb=pcall(function() ci2:enableAllKeyBind() end) eb=\'ClientInfo\'..(ranb and \':ok\' or \':err\') end end local cm,cl,rk,ing,mid pcall(function() cm=GetClientInfo():getContrlMode() end) pcall(function() local c=GetIWorldConfig() cl=c:getGameData(\'classical\') rk=c:getGameData(\'rocker\') end) pcall(function() ing=ClientCurGame and ClientCurGame.isInGame and ClientCurGame:isInGame() end) pcall(function() mid=GetClientInfo():getCurrentGameMapId() end) local hits,seen={},{} local ok,ci=pcall(GetClientInfo) if ok and type(ci)==\'table\' then local pok=pcall(function() for k in pairs(ci) do if type(k)==\'string\' and (k:find(\'ontrl\') or k:find(\'ontrol\') or k:find(\'witch\') or k:find(\'KeyBind\')) then if not seen[k] then seen[k]=true hits[#hits+1]=k end end end end) if not pok then hits[#hits+1]=\'pairs-fail\' end end local cand={\'setContrlMode\',\'setControlMode\',\'setContrlType\',\'setMoveMode\',\'setUIMode\',\'disableAllKeyBind\'} for i=1,#cand do if ci~=nil then local okf,f=pcall(function() return ci[cand[i]] end) if okf and type(f)==\'function\' and not seen[cand[i]] then seen[cand[i]]=true hits[#hits+1]=cand[i] end end end local s=\'MWP4|eb=\'..eb..\'|cm=\'..tostring(cm) ..\'|cl=\'..tostring(cl)..\',rk=\'..tostring(rk) ..\'|in=\'..tostring(ing)..\',mid=\'..tostring(mid) ..\'|set=\'..table.concat(hits,\',\') error(s:sub(1,2900),0) end)"

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 396
    invoke-direct {p0}, Lmodmenu/InputBridge;->probeB()Ljava/lang/String;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 397
    const-string v1, "probes fired"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 401
    :cond_1
    goto :goto_0

    .line 399
    :catch_0
    move-exception v1

    .line 400
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

    .line 402
    :goto_0
    return-void

    .line 384
    :cond_2
    :goto_1
    return-void
.end method

.method private endLook(J)V
    .locals 7

    .line 946
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 947
    iget-boolean v0, p0, Lmodmenu/InputBridge;->looking:Z

    if-nez v0, :cond_0

    .line 948
    return-void

    .line 950
    :cond_0
    iget v3, p0, Lmodmenu/InputBridge;->lookX:F

    iget v4, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v2, 0x1

    move-object v1, p0

    move-wide v5, p1

    invoke-direct/range {v1 .. v6}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 951
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmodmenu/InputBridge;->looking:Z

    .line 952
    return-void
.end method

.method public static install(Landroid/app/Activity;)V
    .locals 3

    .line 297
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 298
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v1

    .line 299
    if-eqz v1, :cond_1

    instance-of v2, v1, Lmodmenu/InputBridge;

    if-eqz v2, :cond_0

    goto :goto_0

    .line 302
    :cond_0
    new-instance v2, Lmodmenu/InputBridge;

    invoke-direct {v2, v1, p0}, Lmodmenu/InputBridge;-><init>(Landroid/view/Window$Callback;Landroid/app/Activity;)V

    .line 303
    invoke-virtual {v0, v2}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 304
    invoke-direct {v2}, Lmodmenu/InputBridge;->startPoll()V

    .line 305
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

    .line 306
    return-void

    .line 300
    :cond_1
    :goto_0
    return-void
.end method

.method private static keepAndroid(I)Z
    .locals 0

    .line 347
    sparse-switch p0, :sswitch_data_0

    .line 371
    const/4 p0, 0x0

    return p0

    .line 369
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

    .line 467
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 468
    return-void

    .line 470
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 471
    iget-wide v2, p0, Lmodmenu/InputBridge;->lastInLog:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x190

    cmp-long v6, v2, v4

    if-gtz v6, :cond_1

    .line 472
    return-void

    .line 474
    :cond_1
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastInLog:J

    .line 475
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

    .line 476
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

    .line 475
    const-string p2, "MWInput"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 477
    return-void
.end method

.method private lookBy(Landroid/view/MotionEvent;)V
    .locals 14

    .line 888
    iget-boolean v1, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    if-eqz v1, :cond_0

    .line 889
    return-void

    .line 891
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 892
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 893
    iget-boolean v3, p0, Lmodmenu/InputBridge;->primed:Z

    const-string v4, " y="

    const/4 v6, 0x1

    const-string v5, "MWInput"

    const-wide/16 v7, 0x1f4

    if-nez v3, :cond_2

    .line 894
    iput-boolean v6, p0, Lmodmenu/InputBridge;->primed:Z

    .line 895
    iput v1, p0, Lmodmenu/InputBridge;->lastX:F

    .line 896
    iput v2, p0, Lmodmenu/InputBridge;->lastY:F

    .line 897
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    .line 898
    iget-wide v11, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v11, v9, v11

    cmp-long v3, v11, v7

    if-lez v3, :cond_1

    .line 899
    iput-wide v9, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 900
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

    .line 902
    :cond_1
    return-void

    .line 904
    :cond_2
    iget v3, p0, Lmodmenu/InputBridge;->lastX:F

    sub-float v9, v1, v3

    .line 905
    iget v3, p0, Lmodmenu/InputBridge;->lastY:F

    sub-float v10, v2, v3

    .line 906
    iput v1, p0, Lmodmenu/InputBridge;->lastX:F

    .line 907
    iput v2, p0, Lmodmenu/InputBridge;->lastY:F

    .line 908
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v11

    .line 909
    const/4 v3, 0x0

    cmpl-float v13, v9, v3

    if-nez v13, :cond_4

    cmpl-float v3, v10, v3

    if-nez v3, :cond_4

    .line 910
    iget-wide v9, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    sub-long v9, v11, v9

    cmp-long v3, v9, v7

    if-lez v3, :cond_3

    .line 911
    iput-wide v11, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    .line 912
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

    .line 914
    :cond_3
    return-void

    .line 916
    :cond_4
    iget-wide v1, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    sub-long v1, v11, v1

    cmp-long v3, v1, v7

    if-lez v3, :cond_5

    .line 917
    iput-wide v11, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    .line 918
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

    .line 920
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    .line 921
    iget-object v1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    .line 922
    iget-boolean v1, p0, Lmodmenu/InputBridge;->looking:Z

    const/high16 v8, 0x40000000    # 2.0f

    if-nez v1, :cond_6

    .line 923
    iget v1, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 924
    iget v1, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    iput v1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 925
    iput-wide v4, p0, Lmodmenu/InputBridge;->lookDownTime:J

    .line 926
    iget v2, p0, Lmodmenu/InputBridge;->lookX:F

    iget v3, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v1, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 927
    iput-boolean v6, p0, Lmodmenu/InputBridge;->looking:Z

    .line 929
    :cond_6
    iget v1, p0, Lmodmenu/InputBridge;->lookX:F

    add-float/2addr v1, v9

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 930
    iget v1, p0, Lmodmenu/InputBridge;->lookY:F

    add-float/2addr v1, v10

    iput v1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 931
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

    .line 933
    :cond_7
    iget v2, p0, Lmodmenu/InputBridge;->lookX:F

    iget v3, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v1, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 934
    iget v1, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 935
    iget v1, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v8

    iput v1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 936
    iput-wide v4, p0, Lmodmenu/InputBridge;->lookDownTime:J

    .line 937
    iget v2, p0, Lmodmenu/InputBridge;->lookX:F

    iget v3, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v1, 0x0

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 939
    :cond_8
    iget v2, p0, Lmodmenu/InputBridge;->lookX:F

    iget v3, p0, Lmodmenu/InputBridge;->lookY:F

    const/4 v1, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lmodmenu/InputBridge;->dispatchSynth(IFFJ)V

    .line 940
    sget-object v1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 941
    sget-object v1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    const-wide/16 v3, 0x78

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 942
    return-void
.end method

.method private static luaStr(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 824
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

.method private player()Lcom/minitech/player/AppPlayer;
    .locals 1

    .line 335
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    instance-of v0, v0, Lorg/appplay/lib/GameBaseActivity;

    if-nez v0, :cond_0

    .line 336
    const/4 v0, 0x0

    return-object v0

    .line 338
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    check-cast v0, Lorg/appplay/lib/GameBaseActivity;

    iget-object v0, v0, Lorg/appplay/lib/GameBaseActivity;->m_AppPlayer:Lcom/minitech/player/AppPlayer;

    return-object v0
.end method

.method private pollState()V
    .locals 6

    .line 680
    const-string v0, "MWInput"

    iget-object v1, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    if-nez v1, :cond_0

    invoke-direct {p0}, Lmodmenu/InputBridge;->resolvePaths()Z

    move-result v1

    if-nez v1, :cond_0

    .line 681
    return-void

    .line 684
    :cond_0
    const/4 v1, 0x1

    :try_start_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->stateScript()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v2, v4}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 691
    nop

    .line 692
    iget-object v2, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    invoke-static {v2}, Lmodmenu/InputBridge;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 693
    if-nez v2, :cond_1

    iget-object v4, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 694
    iget-object v2, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    invoke-static {v2}, Lmodmenu/InputBridge;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 696
    :cond_1
    if-eqz v2, :cond_5

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x2

    if-ge v4, v5, :cond_2

    goto :goto_1

    .line 699
    :cond_2
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x31

    if-ne v4, v5, :cond_3

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v5, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    .line 700
    :goto_0
    iget-boolean v3, p0, Lmodmenu/InputBridge;->lastInMap:Z

    if-ne v1, v3, :cond_4

    .line 701
    return-void

    .line 703
    :cond_4
    iput-boolean v1, p0, Lmodmenu/InputBridge;->lastInMap:Z

    .line 704
    iget-object v3, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-static {v3, v1}, Lmodmenu/ModMenu;->setCrosshair(Landroid/content/Context;Z)V

    .line 705
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 706
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "xh auto="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " state="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 707
    return-void

    .line 697
    :cond_5
    :goto_1
    return-void

    .line 685
    :catch_0
    move-exception v2

    .line 686
    iget-boolean v3, p0, Lmodmenu/InputBridge;->stateErrLogged:Z

    if-nez v3, :cond_6

    .line 687
    iput-boolean v1, p0, Lmodmenu/InputBridge;->stateErrLogged:Z

    .line 688
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "state poll failed: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 690
    :cond_6
    return-void
.end method

.method private probeB()Ljava/lang/String;
    .locals 4

    .line 768
    iget-object v0, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 769
    invoke-direct {p0}, Lmodmenu/InputBridge;->resolvePaths()Z

    .line 771
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    invoke-static {v0}, Lmodmenu/InputBridge;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 772
    iget-object v1, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    invoke-static {v1}, Lmodmenu/InputBridge;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    const-string v1, ""

    .line 773
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "(function() local parts={\'MWP5\'} local function ioTest(p) if p==\'\' then return \'nopath\' end local okw,fh=pcall(function() return io.open(p,\'w\') end) if not okw then return \'open-fail:\'..tostring(fh) end if fh==nil then return \'nilfh\' end local okw2,werr=pcall(function() fh:write(\'mw-ok\') end) pcall(function() fh:close() end) return okw2 and \'ok\' or (\'wr-fail:\'..tostring(werr)) end local kn={} local codes={27,111,32,65,68,83,87,37,38,39,40,16,13,21,22,19,20,29,47,51,62,59,66} for i=1,#codes do local c=codes[i] local ok,n=pcall(function() return DefMgr:getKeyName(c) end) if ok and type(n)==\'string\' and n~=\'\' then kn[#kn+1]=c..\'=\'..n end end parts[#parts+1]=\'kn=\'..table.concat(kn,\',\') local binds,n,nerr={},nil,nil local okd,dn=pcall(function() return DefMgr:getHotkeyNum() end) if okd and type(dn)==\'number\' then n=dn else nerr=\'nonum\' end local okgi,gi=pcall(GetGameInfo) if n~=nil and okgi and gi~=nil then for i=1,n do local ok1,d=pcall(function() return DefMgr:getHotkeyDef(i) end) if ok1 and type(d)==\'table\' and type(d.FuncName)==\'string\' then local ok2,cur=pcall(function() return gi:GetGameHotkey(d.FuncName) end) if ok2 and type(cur)==\'number\' then local code=cur<0 and (\'d\'..tostring(d.DefaultCode)) or tostring(cur) binds[#binds+1]=d.FuncName..\'=\'..code end end if #binds>60 then nerr=\'cap\'; break end end elseif not okgi and nerr==nil then nerr=\'nogi\' end parts[#parts+1]=\'n=\'..tostring(n)..(nerr and (\',\'..nerr) or \'\') parts[#parts+1]=\'b=\'..table.concat(binds,\';\') local io1,io2=\'skip\',\'skip\' if type(io)==\'table\' and io.open then io1=ioTest(\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "\'); io2=ioTest(\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\') else io1=\'noio\'; io2=\'noio\' end parts[#parts+1]=\'io=\'..io1..\',\'..io2 error(table.concat(parts,\'|\'):sub(1,2900),0) end)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static readFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 828
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 829
    return-object v0

    .line 832
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 834
    const/16 p0, 0x20

    :try_start_1
    new-array p0, p0, [B

    .line 835
    invoke-virtual {v1, p0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 836
    if-lez v2, :cond_1

    new-instance v3, Ljava/lang/String;

    const-string v4, "UTF-8"

    const/4 v5, 0x0

    invoke-direct {v3, p0, v5, v2, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_1
    move-object v3, v0

    .line 838
    :goto_0
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 836
    return-object v3

    .line 838
    :catchall_0
    move-exception p0

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 839
    throw p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 840
    :catch_0
    move-exception p0

    .line 841
    return-object v0
.end method

.method private releaseCapture(Landroid/view/View;)V
    .locals 2

    .line 664
    invoke-virtual {p1}, Landroid/view/View;->releasePointerCapture()V

    .line 665
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmodmenu/InputBridge;->captured:Z

    .line 666
    iput-boolean p1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 667
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 668
    const-string p1, "MWInput"

    const-string v0, "xh capture released"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 669
    return-void
.end method

.method private resolvePaths()Z
    .locals 5

    .line 719
    const-string v0, "mw_state.txt"

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/app/Activity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 720
    iget-object v3, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v3

    .line 721
    if-nez v3, :cond_0

    .line 722
    return v1

    .line 724
    :cond_0
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    .line 725
    if-eqz v2, :cond_1

    .line 726
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 727
    :cond_1
    iget-object v0, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    :goto_0
    iput-object v0, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 728
    const/4 v0, 0x1

    return v0

    .line 729
    :catch_0
    move-exception v0

    .line 730
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "state paths failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "MWInput"

    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 731
    return v1
.end method

.method private startPoll()V
    .locals 4

    .line 710
    iget-boolean v0, p0, Lmodmenu/InputBridge;->polling:Z

    if-eqz v0, :cond_0

    .line 711
    return-void

    .line 713
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmodmenu/InputBridge;->polling:Z

    .line 714
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->poll:Ljava/lang/Runnable;

    const-wide/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 715
    return-void
.end method

.method private stateScript()Ljava/lang/String;
    .locals 4

    .line 737
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function() local ing,shown=false,false pcall(function() ing=(ClientCurGame and ClientCurGame.isInGame and ClientCurGame:isInGame()) and true or false end) pcall(function() local fr=getglobal(\'GameSetFrame\') shown=(fr and fr.IsShown and fr:IsShown()) and true or false end) local data=(ing and \'1\' or \'0\')..(shown and \'1\' or \'0\') local function w(p) local ok,fh=pcall(function() return io.open(p,\'w\') end) if ok and fh then pcall(function() fh:write(data) end) pcall(function() fh:close() end) end end w(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    .line 754
    invoke-static {v1}, Lmodmenu/InputBridge;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\')"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 755
    iget-object v2, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    iget-object v3, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 756
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " w(\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    invoke-static {v3}, Lmodmenu/InputBridge;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " end)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 737
    return-object v0
.end method

.method private syncCrosshair()V
    .locals 8

    .line 640
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    .line 641
    return-void

    .line 643
    :cond_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 644
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/minitech/player/AppPlayer;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 645
    :goto_0
    if-nez v0, :cond_2

    .line 646
    return-void

    .line 648
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 649
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v3

    .line 658
    iget-boolean v4, p0, Lmodmenu/InputBridge;->captured:Z

    .line 649
    if-eqz v3, :cond_3

    .line 650
    if-nez v4, :cond_4

    iget-wide v3, p0, Lmodmenu/InputBridge;->lastCaptureReq:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x5dc

    cmp-long v7, v3, v5

    if-lez v7, :cond_4

    .line 651
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastCaptureReq:J

    .line 652
    const/4 v1, 0x1

    iput-boolean v1, p0, Lmodmenu/InputBridge;->captured:Z

    .line 653
    const/4 v1, 0x0

    iput-boolean v1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 654
    iget-object v1, p0, Lmodmenu/InputBridge;->captureListener:Landroid/view/View$OnCapturedPointerListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnCapturedPointerListener(Landroid/view/View$OnCapturedPointerListener;)V

    .line 655
    invoke-virtual {v0}, Landroid/view/View;->requestPointerCapture()V

    .line 656
    const-string v0, "MWInput"

    const-string v1, "xh capture requested"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 658
    :cond_3
    if-eqz v4, :cond_4

    .line 659
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->releaseCapture(Landroid/view/View;)V

    .line 661
    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 481
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 482
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const/4 v1, 0x2

    and-int/2addr v0, v1

    if-eqz v0, :cond_5

    .line 483
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 484
    const-string v2, "generic"

    invoke-direct {p0, v2, v0, p1}, Lmodmenu/InputBridge;->logCrosshairIn(Ljava/lang/String;ILandroid/view/MotionEvent;)V

    .line 485
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v2

    .line 486
    if-eqz v2, :cond_5

    .line 487
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

    .line 489
    :goto_0
    const-string v4, "MWInput"

    const/4 v6, 0x7

    if-eqz v3, :cond_3

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v3

    if-eqz v3, :cond_3

    if-eq v0, v6, :cond_1

    if-ne v0, v1, :cond_3

    .line 492
    :cond_1
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 493
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 494
    iget-wide v6, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v6, v1, v6

    const-wide/16 v8, 0x1f4

    cmp-long v3, v6, v8

    if-lez v3, :cond_2

    .line 495
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 496
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

    .line 497
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 496
    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    :cond_2
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookBy(Landroid/view/MotionEvent;)V

    .line 500
    return v5

    .line 502
    :cond_3
    invoke-virtual {v2, p1}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result v1

    .line 503
    if-eq v0, v6, :cond_4

    .line 504
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

    .line 505
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

    .line 504
    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 507
    :cond_4
    return v5

    .line 510
    :cond_5
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 6

    .line 406
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 407
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    .line 408
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 412
    :goto_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    const/16 v4, 0x83

    const-string v5, "MWInput"

    if-ne v3, v4, :cond_2

    .line 413
    if-eqz v0, :cond_1

    .line 414
    iget-object p1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    xor-int/2addr v0, v2

    invoke-static {p1, v0}, Lmodmenu/ModMenu;->setCrosshair(Landroid/content/Context;Z)V

    .line 415
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 416
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

    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 418
    :cond_1
    return v2

    .line 423
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    const/16 v4, 0x84

    if-ne v3, v4, :cond_4

    .line 424
    if-eqz v0, :cond_3

    .line 426
    :try_start_0
    const-string p1, "(function() local cl,cl2,cm,cm2 local okc,cfg=pcall(function() return GetIWorldConfig() end) if not okc or cfg==nil then error(\'MWP6|cfg=no\',0) end pcall(function() cl=cfg:getGameData(\'classical\') end) pcall(function() cm=GetClientInfo():getContrlMode() end) local num=tonumber(cl) local newc=(num and num>0) and 0 or 1 local ok1=pcall(function() cfg:setGameData(\'classical\',newc) cfg:setGameData(\'rocker\',newc==1 and 0 or 1) end) local ok2=pcall(SetControlMoveSwithState) local ok3=pcall(function() GetClientInfo():appalyGameSetData() end) pcall(function() cl2=cfg:getGameData(\'classical\') end) pcall(function() cm2=GetClientInfo():getContrlMode() end) error(\'MWP6|cl=\'..tostring(cl)..\'->\'..tostring(cl2) ..\' cm=\'..tostring(cm)..\'->\'..tostring(cm2) ..\'|set=\'..tostring(ok1)..\' ui=\'..tostring(ok2) ..\' ap=\'..tostring(ok3),0) end)"

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p1, v0}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 427
    const-string p1, "ctrl-toggle fired"

    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 430
    goto :goto_1

    .line 428
    :catch_0
    move-exception p1

    .line 429
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ctrl-toggle failed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    :cond_3
    :goto_1
    return v2

    .line 434
    :cond_4
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    invoke-static {v1}, Lmodmenu/InputBridge;->keepAndroid(I)Z

    move-result v1

    if-nez v1, :cond_9

    .line 435
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v1

    .line 436
    if-nez v1, :cond_5

    .line 437
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 439
    :cond_5
    if-eqz v0, :cond_6

    .line 440
    invoke-direct {p0}, Lmodmenu/InputBridge;->enableKeyBinds()V

    .line 445
    :cond_6
    invoke-virtual {v1, p1}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result v1

    .line 446
    if-nez v0, :cond_7

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_8

    .line 449
    :cond_7
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

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " eng="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " dev="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 450
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " src="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 451
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getSource()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " rep="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 452
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 449
    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 454
    :cond_8
    return v2

    .line 457
    :cond_9
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 978
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    .line 988
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 515
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 516
    const-string v1, "touch"

    invoke-direct {p0, v1, v0, p1}, Lmodmenu/InputBridge;->logCrosshairIn(Ljava/lang/String;ILandroid/view/MotionEvent;)V

    .line 517
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

    .line 519
    :goto_0
    if-nez v1, :cond_1

    if-nez v0, :cond_1

    .line 520
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lmodmenu/InputBridge;->endLook(J)V

    .line 522
    :cond_1
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v2

    if-eqz v2, :cond_a

    if-eqz v1, :cond_a

    .line 523
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v1

    .line 524
    const-string v2, "MWInput"

    if-eqz v1, :cond_3

    const/4 v5, 0x2

    if-ne v0, v5, :cond_3

    .line 525
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v5

    if-nez v5, :cond_3

    .line 528
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 529
    iget-wide v5, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v5, v0, v5

    const-wide/16 v7, 0x1f4

    cmp-long v3, v5, v7

    if-lez v3, :cond_2

    .line 530
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 531
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

    .line 533
    :cond_2
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookBy(Landroid/view/MotionEvent;)V

    .line 534
    return v4

    .line 536
    :cond_3
    if-eqz v1, :cond_4

    if-nez v0, :cond_4

    .line 537
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lmodmenu/InputBridge;->endLook(J)V

    .line 539
    :cond_4
    invoke-direct {p0, p1, v1}, Lmodmenu/InputBridge;->asFinger(Landroid/view/MotionEvent;Z)Landroid/view/MotionEvent;

    move-result-object v1

    .line 540
    if-eqz v1, :cond_a

    .line 541
    iget-object p1, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {p1, v1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    .line 542
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 543
    if-nez v0, :cond_5

    .line 544
    iput-boolean v4, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    goto :goto_1

    .line 545
    :cond_5
    if-eq v0, v4, :cond_6

    const/4 v1, 0x3

    if-ne v0, v1, :cond_7

    .line 547
    :cond_6
    iput-boolean v3, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    .line 549
    :cond_7
    :goto_1
    if-eqz v0, :cond_8

    if-ne v0, v4, :cond_9

    .line 550
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

    .line 552
    :cond_9
    return p1

    .line 555
    :cond_a
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 983
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .locals 1

    .line 1087
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeFinished(Landroid/view/ActionMode;)V

    .line 1088
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 1

    .line 1082
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeStarted(Landroid/view/ActionMode;)V

    .line 1083
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1064
    invoke-direct {p0}, Lmodmenu/InputBridge;->startPoll()V

    .line 1065
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onAttachedToWindow()V

    .line 1066
    return-void
.end method

.method public onContentChanged()V
    .locals 1

    .line 1003
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onContentChanged()V

    .line 1004
    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 1

    .line 998
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .locals 1

    .line 993
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onCreatePanelView(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1070
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmodmenu/InputBridge;->polling:Z

    .line 1071
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->poll:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1072
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onDetachedFromWindow()V

    .line 1073
    return-void
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 1

    .line 1038
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .locals 1

    .line 1033
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .locals 1

    .line 1077
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 1078
    return-void
.end method

.method public onPointerCaptureChanged(Z)V
    .locals 2

    .line 1098
    if-nez p1, :cond_0

    iget-boolean v0, p0, Lmodmenu/InputBridge;->captured:Z

    if-eqz v0, :cond_0

    .line 1099
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmodmenu/InputBridge;->captured:Z

    .line 1100
    iput-boolean v0, p0, Lmodmenu/InputBridge;->primed:Z

    .line 1101
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 1102
    const-string v0, "MWInput"

    const-string v1, "xh capture lost"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1104
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onPointerCaptureChanged(Z)V

    .line 1105
    return-void
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 1

    .line 1028
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

    .line 1093
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/Window$Callback;->onProvideKeyboardShortcuts(Ljava/util/List;Landroid/view/Menu;I)V

    .line 1094
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .line 1008
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onSearchRequested()Z

    move-result v0

    return v0
.end method

.method public onSearchRequested(Landroid/view/SearchEvent;)Z
    .locals 1

    .line 1013
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onSearchRequested(Landroid/view/SearchEvent;)Z

    move-result p1

    return p1
.end method

.method public onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
    .locals 1

    .line 1043
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    .line 1044
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2

    .line 1048
    if-eqz p1, :cond_0

    .line 1049
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    goto :goto_1

    .line 1051
    :cond_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 1052
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/minitech/player/AppPlayer;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1053
    :goto_0
    iget-boolean v1, p0, Lmodmenu/InputBridge;->captured:Z

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    .line 1054
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->releaseCapture(Landroid/view/View;)V

    goto :goto_1

    .line 1056
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 1059
    :goto_1
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowFocusChanged(Z)V

    .line 1060
    return-void
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .locals 1

    .line 1018
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;
    .locals 1

    .line 1023
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method
