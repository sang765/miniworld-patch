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

.field private static final CLICK_ID:I = 0x1

.field private static final CTRL_TOGGLE:Ljava/lang/String; = "(function() local cl,cl2,rk,rk2,cm,cm2 local okc,cfg=pcall(function() return GetIWorldConfig() end) if not okc or cfg==nil then error(\'MWP6|cfg=no\',0) end pcall(function() cl=cfg:getGameData(\'classical\') end) pcall(function() rk=cfg:getGameData(\'rocker\') end) pcall(function() cm=GetClientInfo():getContrlMode() end) local num=tonumber(cl) local newc=(num and num>0) and 0 or 1 local ok1=pcall(function() cfg:setGameData(\'classical\',newc) cfg:setGameData(\'rocker\',newc==1 and 0 or 1) end) local ok2=pcall(SetControlMoveSwithState) local ok3=pcall(function() GetClientInfo():appalyGameSetData() end) pcall(function() cl2=cfg:getGameData(\'classical\') end) pcall(function() rk2=cfg:getGameData(\'rocker\') end) pcall(function() cm2=GetClientInfo():getContrlMode() end) error(\'MWP6|cl=\'..tostring(cl)..\'->\'..tostring(cl2) ..\' rk=\'..tostring(rk)..\'->\'..tostring(rk2) ..\' cm=\'..tostring(cm)..\'->\'..tostring(cm2) ..\'|set=\'..tostring(ok1)..\' ui=\'..tostring(ok2) ..\' ap=\'..tostring(ok3),0) end)"

.field private static final ENABLE_INTERVAL_MS:J = 0x7d0L

.field private static final ENABLE_WARMUP_MS:J = 0x1388L

.field private static final HOTBAR:Ljava/lang/String; = "(function(d,rep) local p=nil pcall(function() p=CurMainPlayer end) if p==nil then pcall(function() p=ClientCurGame:getMainPlayer() end) end if p==nil then if rep==1 then error(\'MWP9|pl=no\',0) end return end local ok1,s=pcall(function() return p:getCurShortcut() end) if not ok1 or type(s)~=\'number\' then if rep==1 then error(\'MWP9|get=no\',0) end return end local ok2,st=pcall(function() return p:getShortcutStartIndex() end) local ok3,cn=pcall(function() return p:getCurShortcutItemNum() end) st=(ok2 and type(st)==\'number\') and st or 1 cn=(ok3 and type(cn)==\'number\' and cn>0) and cn or 9 local n=s+d if n<st then n=st+cn-1 elseif n>=st+cn then n=st end local ok4,e4=pcall(function() p:setCurShortcut(n) end) if rep==1 then error(\'MWP9|s=\'..s..\',st=\'..st..\',cn=\'..cn..\'->\'..n ..\' set=\'..tostring(ok4)..\',\'..tostring(e4):sub(1,50),0) end end)"

.field private static final KEYBIND_ON:Ljava/lang/String; = "(function() pcall(function() local names={\"GameSettingsMgr\",\"GameSettings\"} for i=1,#names do local t=_G[names[i]] if t~=nil then local ok,fn=pcall(function() return t.enableAllKeyBind end) if ok and type(fn)==\"function\" and pcall(function() t:enableAllKeyBind() end) then return end end end local ok,ci=pcall(GetClientInfo) if ok and ci~=nil then pcall(function() ci:enableAllKeyBind() end) end end) end)"

.field private static final LOOK_ID:I = 0x0

.field private static final LOOK_IDLE_MS:J = 0x78L

.field private static final MAIN:Landroid/os/Handler;

.field private static final MOVEMENT:Ljava/lang/String; = "(function(fw,st,jp,sk,rep) local p=nil pcall(function() p=CurMainPlayer end) if p==nil then pcall(function() p=ClientCurGame:getMainPlayer() end) end if p==nil then if rep==1 then error(\'MWP8|pl=no\',0) end return end local ok1,e1=pcall(function() p:setMoveForward(fw) end) local ok2=pcall(function() p:setMoveStrafing(st) end) local ok3=pcall(function() p:setJumping(jp) end) local ok4=pcall(function() p:setSneaking(sk) end) if rep==1 then error(\'MWP8|mf=\'..tostring(ok1)..\',\'..tostring(e1):sub(1,60) ..\' ms=\'..tostring(ok2)..\' mj=\'..tostring(ok3) ..\' mk=\'..tostring(ok4),0) end end)"

.field private static final OPEN_FRAME:Ljava/lang/String; = "(function() local r={} local ok,e=pcall(function() local fr=getglobal(\'GameSetFrame\') if fr==nil then error(\'noframe\') end fr:Show() end) r[#r+1]=\'show=\'..tostring(ok)..\',\'..tostring(e) local ok2,e2=pcall(function() local f=rawget(_G,\'GameSetFrameHotkey_OnShow\') if type(f)~=\'function\' then error(\'missing\') end f() end) r[#r+1]=\'onshow=\'..tostring(ok2)..\',\'..tostring(e2) local ok3=pcall(function() press_btn(\'GameSetFrameHotkeyBtn\') end) r[#r+1]=\'tab=\'..tostring(ok3) local vis=\'?\' pcall(function() local fr=getglobal(\'GameSetFrame\') vis=tostring(fr~=nil and fr.IsShown and fr:IsShown()) end) r[#r+1]=\'vis=\'..vis error(\'HKUI2|\'..table.concat(r,\'|\'):sub(1,2900),0) end)"

.field private static final PROBE_A:Ljava/lang/String; = "(function() local eb=\'none\' local names={\"GameSettingsMgr\",\"GameSettings\"} for i=1,#names do local t=_G[names[i]] if t~=nil then local ok,fn=pcall(function() return t.enableAllKeyBind end) if ok and type(fn)==\"function\" then local ran,er=pcall(function() t:enableAllKeyBind() end) eb=names[i]..(ran and \':ok\' or \':err:\'..tostring(er)) break end end end if eb==\'none\' then local okb,ci2=pcall(GetClientInfo) if okb and ci2~=nil then local ranb=pcall(function() ci2:enableAllKeyBind() end) eb=\'ClientInfo\'..(ranb and \':ok\' or \':err\') end end local cm,cl,rk,ing,mid pcall(function() cm=GetClientInfo():getContrlMode() end) pcall(function() local c=GetIWorldConfig() cl=c:getGameData(\'classical\') rk=c:getGameData(\'rocker\') end) pcall(function() ing=ClientCurGame and ClientCurGame.isInGame and ClientCurGame:isInGame() end) pcall(function() mid=GetClientInfo():getCurrentGameMapId() end) local hits,seen={},{} local ok,ci=pcall(GetClientInfo) if ok and type(ci)==\'table\' then local pok=pcall(function() for k in pairs(ci) do if type(k)==\'string\' and (k:find(\'ontrl\') or k:find(\'ontrol\') or k:find(\'witch\') or k:find(\'KeyBind\')) then if not seen[k] then seen[k]=true hits[#hits+1]=k end end end end) if not pok then hits[#hits+1]=\'pairs-fail\' end end local cand={\'setContrlMode\',\'setControlMode\',\'setContrlType\',\'setMoveMode\',\'setUIMode\',\'disableAllKeyBind\'} for i=1,#cand do if ci~=nil then local okf,f=pcall(function() return ci[cand[i]] end) if okf and type(f)==\'function\' and not seen[cand[i]] then seen[cand[i]]=true hits[#hits+1]=cand[i] end end end local s=\'MWP4|eb=\'..eb..\'|cm=\'..tostring(cm) ..\'|cl=\'..tostring(cl)..\',rk=\'..tostring(rk) ..\'|in=\'..tostring(ing)..\',mid=\'..tostring(mid) ..\'|set=\'..table.concat(hits,\',\') error(s:sub(1,2900),0) end)"

.field private static final STATE_POLL_MS:J = 0x5dcL

.field private static final TAG:Ljava/lang/String; = "MWInput"

.field private static volatile probed:Z


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final captureListener:Landroid/view/View$OnCapturedPointerListener;

.field private captured:Z

.field private final clickEnd:Ljava/lang/Runnable;

.field private clickX:F

.field private clickY:F

.field private gestureDown:J

.field private hotbarReported:Z

.field private final installedAt:J

.field private lastArrLog:J

.field private lastCaptureReq:J

.field private lastDeltaLog:J

.field private lastEnable:J

.field private lastInLog:J

.field private lastInMap:Z

.field private lastX:F

.field private lastY:F

.field private final lookEnd:Ljava/lang/Runnable;

.field private lookX:F

.field private lookY:F

.field private looking:Z

.field private mouseTouching:Z

.field private moveReported:Z

.field private mvB:Z

.field private mvF:Z

.field private mvJ:Z

.field private mvL:Z

.field private mvR:Z

.field private mvS:Z

.field private final orig:Landroid/view/Window$Callback;

.field private pCount:I

.field private final pIds:[I

.field private final poll:Ljava/lang/Runnable;

.field private polling:Z

.field private primed:Z

.field private probePath:Ljava/lang/String;

.field private probePath2:Ljava/lang/String;

.field private stateErrLogged:Z

.field private stateInGame:Z

.field private statePath:Ljava/lang/String;

.field private statePath2:Ljava/lang/String;

.field private wheelAcc:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 290
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>(Landroid/view/Window$Callback;Landroid/app/Activity;)V
    .locals 2

    .line 371
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 295
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lmodmenu/InputBridge;->installedAt:J

    .line 310
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lmodmenu/InputBridge;->pIds:[I

    .line 332
    new-instance v0, Lmodmenu/InputBridge$1;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$1;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    .line 338
    new-instance v0, Lmodmenu/InputBridge$2;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$2;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->clickEnd:Ljava/lang/Runnable;

    .line 344
    new-instance v0, Lmodmenu/InputBridge$3;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$3;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->poll:Ljava/lang/Runnable;

    .line 857
    new-instance v0, Lmodmenu/InputBridge$4;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$4;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->captureListener:Landroid/view/View$OnCapturedPointerListener;

    .line 372
    iput-object p1, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    .line 373
    iput-object p2, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    .line 374
    return-void
.end method

.method static synthetic access$000(Lmodmenu/InputBridge;J)V
    .locals 0

    .line 91
    invoke-direct {p0, p1, p2}, Lmodmenu/InputBridge;->endLook(J)V

    return-void
.end method

.method static synthetic access$100(Lmodmenu/InputBridge;J)V
    .locals 0

    .line 91
    invoke-direct {p0, p1, p2}, Lmodmenu/InputBridge;->releaseClick(J)V

    return-void
.end method

.method static synthetic access$1000(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 91
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mvJ:Z

    return p0
.end method

.method static synthetic access$1100(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 91
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mvS:Z

    return p0
.end method

.method static synthetic access$1200(Lmodmenu/InputBridge;)V
    .locals 0

    .line 91
    invoke-direct {p0}, Lmodmenu/InputBridge;->clearMovement()V

    return-void
.end method

.method static synthetic access$1300(Lmodmenu/InputBridge;)J
    .locals 2

    .line 91
    iget-wide v0, p0, Lmodmenu/InputBridge;->installedAt:J

    return-wide v0
.end method

.method static synthetic access$1400(Lmodmenu/InputBridge;)Lcom/minitech/player/AppPlayer;
    .locals 0

    .line 91
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1500(Lmodmenu/InputBridge;)V
    .locals 0

    .line 91
    invoke-direct {p0}, Lmodmenu/InputBridge;->pollState()V

    return-void
.end method

.method static synthetic access$1600(Lmodmenu/InputBridge;Ljava/lang/String;ILandroid/view/MotionEvent;)V
    .locals 0

    .line 91
    invoke-direct {p0, p1, p2, p3}, Lmodmenu/InputBridge;->logCrosshairIn(Ljava/lang/String;ILandroid/view/MotionEvent;)V

    return-void
.end method

.method static synthetic access$1700(Lmodmenu/InputBridge;Landroid/view/MotionEvent;)V
    .locals 0

    .line 91
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookByRel(Landroid/view/MotionEvent;)V

    return-void
.end method

.method static synthetic access$1800(Lmodmenu/InputBridge;JZ)V
    .locals 0

    .line 91
    invoke-direct {p0, p1, p2, p3}, Lmodmenu/InputBridge;->centerTouch(JZ)V

    return-void
.end method

.method static synthetic access$1900(Lmodmenu/InputBridge;Landroid/view/MotionEvent;)V
    .locals 0

    .line 91
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->handleWheel(Landroid/view/MotionEvent;)V

    return-void
.end method

.method static synthetic access$200(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 91
    iget-boolean p0, p0, Lmodmenu/InputBridge;->polling:Z

    return p0
.end method

.method static synthetic access$300()Landroid/os/Handler;
    .locals 1

    .line 91
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$400(Lmodmenu/InputBridge;)Landroid/app/Activity;
    .locals 0

    .line 91
    iget-object p0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$500(Lmodmenu/InputBridge;)V
    .locals 0

    .line 91
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    return-void
.end method

.method static synthetic access$600(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 91
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mvF:Z

    return p0
.end method

.method static synthetic access$700(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 91
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mvB:Z

    return p0
.end method

.method static synthetic access$800(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 91
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mvL:Z

    return p0
.end method

.method static synthetic access$900(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 91
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mvR:Z

    return p0
.end method

.method private asFinger(Landroid/view/MotionEvent;Z)Landroid/view/MotionEvent;
    .locals 18

    .line 824
    move-object/from16 v0, p1

    :try_start_0
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v7

    .line 825
    new-array v8, v7, [Landroid/view/MotionEvent$PointerProperties;

    .line 827
    new-array v9, v7, [Landroid/view/MotionEvent$PointerCoords;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 828
    move-object/from16 v1, p0

    :try_start_1
    iget-object v2, v1, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 829
    const/4 v3, 0x0

    :goto_0
    if-ge v3, v7, :cond_3

    .line 830
    new-instance v4, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 831
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, v4, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 832
    const/4 v5, 0x1

    iput v5, v4, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 833
    aput-object v4, v8, v3

    .line 834
    new-instance v4, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 835
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

    .line 836
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

    .line 837
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

    .line 838
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getSize(I)F

    move-result v5

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 839
    aput-object v4, v9, v3

    .line 829
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 841
    :cond_3
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    .line 842
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v10

    .line 843
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getXPrecision()F

    move-result v12

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getYPrecision()F

    move-result v13

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v14

    .line 844
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v15

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getFlags()I

    move-result v17

    .line 841
    const/4 v11, 0x0

    const/16 v16, 0x1002

    invoke-static/range {v2 .. v17}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    .line 845
    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    move-object/from16 v1, p0

    .line 846
    :goto_4
    const/4 v0, 0x0

    return-object v0
.end method

.method private centerTouch(JZ)V
    .locals 2

    .line 1174
    if-eqz p3, :cond_1

    .line 1175
    iget-boolean p3, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    if-eqz p3, :cond_0

    .line 1176
    return-void

    .line 1178
    :cond_0
    iget-object p3, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {p3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p3

    .line 1179
    iget v0, p3, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iput v0, p0, Lmodmenu/InputBridge;->clickX:F

    .line 1180
    iget p3, p3, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float p3, p3

    div-float/2addr p3, v1

    iput p3, p0, Lmodmenu/InputBridge;->clickY:F

    .line 1181
    const/4 p3, 0x1

    iput-boolean p3, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    .line 1182
    invoke-direct {p0, p3, p1, p2}, Lmodmenu/InputBridge;->ptrDown(IJ)V

    .line 1183
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object p2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1184
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object p2, p0, Lmodmenu/InputBridge;->clickEnd:Ljava/lang/Runnable;

    const-wide/16 v0, 0x2bc

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1185
    const-string p1, "MWInput"

    const-string p2, "center-touch down"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1186
    goto :goto_0

    .line 1187
    :cond_1
    invoke-direct {p0, p1, p2}, Lmodmenu/InputBridge;->releaseClick(J)V

    .line 1189
    :goto_0
    return-void
.end method

.method private clearMovement()V
    .locals 1

    .line 545
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmodmenu/InputBridge;->mvS:Z

    iput-boolean v0, p0, Lmodmenu/InputBridge;->mvJ:Z

    iput-boolean v0, p0, Lmodmenu/InputBridge;->mvR:Z

    iput-boolean v0, p0, Lmodmenu/InputBridge;->mvL:Z

    iput-boolean v0, p0, Lmodmenu/InputBridge;->mvB:Z

    iput-boolean v0, p0, Lmodmenu/InputBridge;->mvF:Z

    .line 546
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->fireMovement(Z)V

    .line 547
    return-void
.end method

.method private enableKeyBinds()V
    .locals 8

    .line 463
    const-string v0, "MWInput"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 464
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

    .line 467
    :cond_0
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastEnable:J

    .line 469
    :try_start_0
    const-string v1, "(function() pcall(function() local names={\"GameSettingsMgr\",\"GameSettings\"} for i=1,#names do local t=_G[names[i]] if t~=nil then local ok,fn=pcall(function() return t.enableAllKeyBind end) if ok and type(fn)==\"function\" and pcall(function() t:enableAllKeyBind() end) then return end end end local ok,ci=pcall(GetClientInfo) if ok and ci~=nil then pcall(function() ci:enableAllKeyBind() end) end end) end)"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 470
    const-string v1, "keybind-on fired"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 471
    sget-boolean v1, Lmodmenu/InputBridge;->probed:Z

    if-nez v1, :cond_1

    .line 472
    const/4 v1, 0x1

    sput-boolean v1, Lmodmenu/InputBridge;->probed:Z

    .line 475
    const-string v1, "(function() local r={} local ok,e=pcall(function() local fr=getglobal(\'GameSetFrame\') if fr==nil then error(\'noframe\') end fr:Show() end) r[#r+1]=\'show=\'..tostring(ok)..\',\'..tostring(e) local ok2,e2=pcall(function() local f=rawget(_G,\'GameSetFrameHotkey_OnShow\') if type(f)~=\'function\' then error(\'missing\') end f() end) r[#r+1]=\'onshow=\'..tostring(ok2)..\',\'..tostring(e2) local ok3=pcall(function() press_btn(\'GameSetFrameHotkeyBtn\') end) r[#r+1]=\'tab=\'..tostring(ok3) local vis=\'?\' pcall(function() local fr=getglobal(\'GameSetFrame\') vis=tostring(fr~=nil and fr.IsShown and fr:IsShown()) end) r[#r+1]=\'vis=\'..vis error(\'HKUI2|\'..table.concat(r,\'|\'):sub(1,2900),0) end)"

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 476
    const-string v1, "(function() local eb=\'none\' local names={\"GameSettingsMgr\",\"GameSettings\"} for i=1,#names do local t=_G[names[i]] if t~=nil then local ok,fn=pcall(function() return t.enableAllKeyBind end) if ok and type(fn)==\"function\" then local ran,er=pcall(function() t:enableAllKeyBind() end) eb=names[i]..(ran and \':ok\' or \':err:\'..tostring(er)) break end end end if eb==\'none\' then local okb,ci2=pcall(GetClientInfo) if okb and ci2~=nil then local ranb=pcall(function() ci2:enableAllKeyBind() end) eb=\'ClientInfo\'..(ranb and \':ok\' or \':err\') end end local cm,cl,rk,ing,mid pcall(function() cm=GetClientInfo():getContrlMode() end) pcall(function() local c=GetIWorldConfig() cl=c:getGameData(\'classical\') rk=c:getGameData(\'rocker\') end) pcall(function() ing=ClientCurGame and ClientCurGame.isInGame and ClientCurGame:isInGame() end) pcall(function() mid=GetClientInfo():getCurrentGameMapId() end) local hits,seen={},{} local ok,ci=pcall(GetClientInfo) if ok and type(ci)==\'table\' then local pok=pcall(function() for k in pairs(ci) do if type(k)==\'string\' and (k:find(\'ontrl\') or k:find(\'ontrol\') or k:find(\'witch\') or k:find(\'KeyBind\')) then if not seen[k] then seen[k]=true hits[#hits+1]=k end end end end) if not pok then hits[#hits+1]=\'pairs-fail\' end end local cand={\'setContrlMode\',\'setControlMode\',\'setContrlType\',\'setMoveMode\',\'setUIMode\',\'disableAllKeyBind\'} for i=1,#cand do if ci~=nil then local okf,f=pcall(function() return ci[cand[i]] end) if okf and type(f)==\'function\' and not seen[cand[i]] then seen[cand[i]]=true hits[#hits+1]=cand[i] end end end local s=\'MWP4|eb=\'..eb..\'|cm=\'..tostring(cm) ..\'|cl=\'..tostring(cl)..\',rk=\'..tostring(rk) ..\'|in=\'..tostring(ing)..\',mid=\'..tostring(mid) ..\'|set=\'..table.concat(hits,\',\') error(s:sub(1,2900),0) end)"

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 477
    invoke-direct {p0}, Lmodmenu/InputBridge;->probeB()Ljava/lang/String;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 478
    const-string v1, "probes fired"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 482
    :cond_1
    goto :goto_0

    .line 480
    :catch_0
    move-exception v1

    .line 481
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

    .line 483
    :goto_0
    return-void

    .line 465
    :cond_2
    :goto_1
    return-void
.end method

.method private endLook(J)V
    .locals 2

    .line 1292
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1293
    iget-boolean v0, p0, Lmodmenu/InputBridge;->looking:Z

    if-nez v0, :cond_0

    .line 1294
    return-void

    .line 1296
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lmodmenu/InputBridge;->ptrUp(IJ)V

    .line 1297
    iput-boolean v0, p0, Lmodmenu/InputBridge;->looking:Z

    .line 1298
    return-void
.end method

.method private fireHotbar(I)V
    .locals 7

    .line 570
    const-string v0, "MWInput"

    iget-boolean v1, p0, Lmodmenu/InputBridge;->hotbarReported:Z

    .line 572
    :try_start_0
    const-string v2, "(function(d,rep) local p=nil pcall(function() p=CurMainPlayer end) if p==nil then pcall(function() p=ClientCurGame:getMainPlayer() end) end if p==nil then if rep==1 then error(\'MWP9|pl=no\',0) end return end local ok1,s=pcall(function() return p:getCurShortcut() end) if not ok1 or type(s)~=\'number\' then if rep==1 then error(\'MWP9|get=no\',0) end return end local ok2,st=pcall(function() return p:getShortcutStartIndex() end) local ok3,cn=pcall(function() return p:getCurShortcutItemNum() end) st=(ok2 and type(st)==\'number\') and st or 1 cn=(ok3 and type(cn)==\'number\' and cn>0) and cn or 9 local n=s+d if n<st then n=st+cn-1 elseif n>=st+cn then n=st end local ok4,e4=pcall(function() p:setCurShortcut(n) end) if rep==1 then error(\'MWP9|s=\'..s..\',st=\'..st..\',cn=\'..cn..\'->\'..n ..\' set=\'..tostring(ok4)..\',\'..tostring(e4):sub(1,50),0) end end)"

    .line 573
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v3, v6, v4

    aput-object v1, v6, v5

    .line 572
    invoke-static {v2, v6}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 574
    iput-boolean v5, p0, Lmodmenu/InputBridge;->hotbarReported:Z

    .line 575
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "wheel "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 578
    goto :goto_1

    .line 576
    :catch_0
    move-exception p1

    .line 577
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "wheel failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    :goto_1
    return-void
.end method

.method private fireMovement(Z)V
    .locals 9

    .line 530
    const-string v0, "MWInput"

    iget-boolean v1, p0, Lmodmenu/InputBridge;->mvF:Z

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    if-eqz v1, :cond_0

    move-object v1, v4

    goto :goto_0

    :cond_0
    iget-boolean v1, p0, Lmodmenu/InputBridge;->mvB:Z

    if-eqz v1, :cond_1

    move-object v1, v2

    goto :goto_0

    :cond_1
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 531
    :goto_0
    iget-boolean v5, p0, Lmodmenu/InputBridge;->mvR:Z

    if-eqz v5, :cond_2

    move-object v2, v4

    goto :goto_1

    :cond_2
    iget-boolean v4, p0, Lmodmenu/InputBridge;->mvL:Z

    if-eqz v4, :cond_3

    goto :goto_1

    :cond_3
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 532
    :goto_1
    iget-boolean v4, p0, Lmodmenu/InputBridge;->mvJ:Z

    if-eqz v4, :cond_4

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_2

    :cond_4
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 533
    :goto_2
    iget-boolean v5, p0, Lmodmenu/InputBridge;->mvS:Z

    if-eqz v5, :cond_5

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_3

    :cond_5
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 535
    :goto_3
    :try_start_0
    const-string v6, "(function(fw,st,jp,sk,rep) local p=nil pcall(function() p=CurMainPlayer end) if p==nil then pcall(function() p=ClientCurGame:getMainPlayer() end) end if p==nil then if rep==1 then error(\'MWP8|pl=no\',0) end return end local ok1,e1=pcall(function() p:setMoveForward(fw) end) local ok2=pcall(function() p:setMoveStrafing(st) end) local ok3=pcall(function() p:setJumping(jp) end) local ok4=pcall(function() p:setSneaking(sk) end) if rep==1 then error(\'MWP8|mf=\'..tostring(ok1)..\',\'..tostring(e1):sub(1,60) ..\' ms=\'..tostring(ok2)..\' mj=\'..tostring(ok3) ..\' mk=\'..tostring(ok4),0) end end)"

    .line 536
    const/4 v7, 0x0

    if-eqz p1, :cond_6

    const/4 p1, 0x1

    goto :goto_4

    :cond_6
    const/4 p1, 0x0

    :goto_4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v8, 0x5

    new-array v8, v8, [Ljava/lang/Object;

    aput-object v1, v8, v7

    aput-object v2, v8, v3

    const/4 v1, 0x2

    aput-object v4, v8, v1

    const/4 v1, 0x3

    aput-object v5, v8, v1

    const/4 v1, 0x4

    aput-object p1, v8, v1

    .line 535
    invoke-static {v6, v8}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 537
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "move f="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-boolean v1, p0, Lmodmenu/InputBridge;->mvF:Z

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " b="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-boolean v1, p0, Lmodmenu/InputBridge;->mvB:Z

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " l="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-boolean v1, p0, Lmodmenu/InputBridge;->mvL:Z

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " r="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-boolean v1, p0, Lmodmenu/InputBridge;->mvR:Z

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " j="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-boolean v1, p0, Lmodmenu/InputBridge;->mvJ:Z

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " s="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-boolean v1, p0, Lmodmenu/InputBridge;->mvS:Z

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 541
    goto :goto_5

    .line 539
    :catch_0
    move-exception p1

    .line 540
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "move failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    :goto_5
    return-void
.end method

.method private handleWheel(Landroid/view/MotionEvent;)V
    .locals 2

    .line 551
    iget-boolean v0, p0, Lmodmenu/InputBridge;->stateInGame:Z

    if-nez v0, :cond_0

    .line 552
    return-void

    .line 554
    :cond_0
    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result p1

    .line 555
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_1

    .line 556
    return-void

    .line 558
    :cond_1
    iget v0, p0, Lmodmenu/InputBridge;->wheelAcc:F

    add-float/2addr v0, p1

    iput v0, p0, Lmodmenu/InputBridge;->wheelAcc:F

    .line 559
    :goto_0
    iget p1, p0, Lmodmenu/InputBridge;->wheelAcc:F

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_2

    .line 560
    iget p1, p0, Lmodmenu/InputBridge;->wheelAcc:F

    sub-float/2addr p1, v0

    iput p1, p0, Lmodmenu/InputBridge;->wheelAcc:F

    .line 561
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->fireHotbar(I)V

    goto :goto_0

    .line 563
    :cond_2
    :goto_1
    iget p1, p0, Lmodmenu/InputBridge;->wheelAcc:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpg-float p1, p1, v1

    if-gtz p1, :cond_3

    .line 564
    iget p1, p0, Lmodmenu/InputBridge;->wheelAcc:F

    add-float/2addr p1, v0

    iput p1, p0, Lmodmenu/InputBridge;->wheelAcc:F

    .line 565
    const/4 p1, -0x1

    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->fireHotbar(I)V

    goto :goto_1

    .line 567
    :cond_3
    return-void
.end method

.method public static install(Landroid/app/Activity;)V
    .locals 3

    .line 378
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 379
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v1

    .line 380
    if-eqz v1, :cond_1

    instance-of v2, v1, Lmodmenu/InputBridge;

    if-eqz v2, :cond_0

    goto :goto_0

    .line 383
    :cond_0
    new-instance v2, Lmodmenu/InputBridge;

    invoke-direct {v2, v1, p0}, Lmodmenu/InputBridge;-><init>(Landroid/view/Window$Callback;Landroid/app/Activity;)V

    .line 384
    invoke-virtual {v0, v2}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 385
    invoke-direct {v2}, Lmodmenu/InputBridge;->startPoll()V

    .line 386
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

    .line 387
    return-void

    .line 381
    :cond_1
    :goto_0
    return-void
.end method

.method private static keepAndroid(I)Z
    .locals 0

    .line 428
    sparse-switch p0, :sswitch_data_0

    .line 452
    const/4 p0, 0x0

    return p0

    .line 450
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

    .line 718
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 719
    return-void

    .line 721
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 722
    iget-wide v2, p0, Lmodmenu/InputBridge;->lastInLog:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x190

    cmp-long v6, v2, v4

    if-gtz v6, :cond_1

    .line 723
    return-void

    .line 725
    :cond_1
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastInLog:J

    .line 726
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

    .line 727
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

    .line 726
    const-string p2, "MWInput"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 728
    return-void
.end method

.method private lookBy(Landroid/view/MotionEvent;)V
    .locals 8

    .line 1216
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 1217
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 1218
    iget-boolean v2, p0, Lmodmenu/InputBridge;->primed:Z

    if-nez v2, :cond_1

    .line 1219
    const/4 p1, 0x1

    iput-boolean p1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 1220
    iput v0, p0, Lmodmenu/InputBridge;->lastX:F

    .line 1221
    iput v1, p0, Lmodmenu/InputBridge;->lastY:F

    .line 1222
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 1223
    iget-wide v4, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0x1f4

    cmp-long p1, v4, v6

    if-lez p1, :cond_0

    .line 1224
    iput-wide v2, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 1225
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "xh-prime x="

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " y="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "MWInput"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1227
    :cond_0
    return-void

    .line 1229
    :cond_1
    iget v2, p0, Lmodmenu/InputBridge;->lastX:F

    sub-float v2, v0, v2

    .line 1230
    iget v3, p0, Lmodmenu/InputBridge;->lastY:F

    sub-float v3, v1, v3

    .line 1231
    iput v0, p0, Lmodmenu/InputBridge;->lastX:F

    .line 1232
    iput v1, p0, Lmodmenu/InputBridge;->lastY:F

    .line 1233
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-direct {p0, v2, v3, v0, v1}, Lmodmenu/InputBridge;->lookMove(FFJ)V

    .line 1234
    return-void
.end method

.method private lookByRel(Landroid/view/MotionEvent;)V
    .locals 6

    .line 1238
    iget-boolean v0, p0, Lmodmenu/InputBridge;->primed:Z

    if-nez v0, :cond_0

    .line 1239
    const/4 p1, 0x1

    iput-boolean p1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 1240
    return-void

    .line 1242
    :cond_0
    nop

    .line 1243
    nop

    .line 1244
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getHistorySize()I

    move-result v0

    .line 1245
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v0, :cond_1

    .line 1246
    invoke-virtual {p1, v2, v4}, Landroid/view/MotionEvent;->getHistoricalX(II)F

    move-result v5

    add-float/2addr v1, v5

    .line 1247
    invoke-virtual {p1, v2, v4}, Landroid/view/MotionEvent;->getHistoricalY(II)F

    move-result v5

    add-float/2addr v3, v5

    .line 1245
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1249
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    add-float/2addr v1, v0

    .line 1250
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    add-float/2addr v3, v0

    .line 1251
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    invoke-direct {p0, v1, v3, v4, v5}, Lmodmenu/InputBridge;->lookMove(FFJ)V

    .line 1252
    return-void
.end method

.method private lookMove(FFJ)V
    .locals 9

    .line 1255
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1256
    const-string v2, " dy="

    const-string v3, "MWInput"

    const-wide/16 v4, 0x1f4

    const/4 v6, 0x0

    cmpl-float v7, p1, v6

    if-nez v7, :cond_1

    cmpl-float v6, p2, v6

    if-nez v6, :cond_1

    .line 1257
    iget-wide p3, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    sub-long p3, v0, p3

    cmp-long v6, p3, v4

    if-lez v6, :cond_0

    .line 1258
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    .line 1259
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "xh-d0 dx="

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1261
    :cond_0
    return-void

    .line 1263
    :cond_1
    iget-wide v6, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    sub-long v6, v0, v6

    cmp-long v8, v6, v4

    if-lez v8, :cond_2

    .line 1264
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    .line 1265
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "xh-d dx="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1267
    :cond_2
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 1268
    iget-boolean v1, p0, Lmodmenu/InputBridge;->looking:Z

    const/4 v2, 0x0

    const/high16 v3, 0x40000000    # 2.0f

    if-nez v1, :cond_3

    .line 1269
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v3

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 1270
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v3

    iput v1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 1271
    const/4 v1, 0x1

    iput-boolean v1, p0, Lmodmenu/InputBridge;->looking:Z

    .line 1272
    invoke-direct {p0, v2, p3, p4}, Lmodmenu/InputBridge;->ptrDown(IJ)V

    .line 1274
    :cond_3
    iget v1, p0, Lmodmenu/InputBridge;->lookX:F

    add-float/2addr v1, p1

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 1275
    iget p1, p0, Lmodmenu/InputBridge;->lookY:F

    add-float/2addr p1, p2

    iput p1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 1276
    iget p1, p0, Lmodmenu/InputBridge;->lookX:F

    cmpg-float p1, p1, v3

    if-ltz p1, :cond_4

    iget p1, p0, Lmodmenu/InputBridge;->lookX:F

    iget p2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p2, p2

    const/high16 v1, 0x40400000    # 3.0f

    sub-float/2addr p2, v1

    cmpl-float p1, p1, p2

    if-gtz p1, :cond_4

    iget p1, p0, Lmodmenu/InputBridge;->lookY:F

    cmpg-float p1, p1, v3

    if-ltz p1, :cond_4

    iget p1, p0, Lmodmenu/InputBridge;->lookY:F

    iget p2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float p2, p2

    sub-float/2addr p2, v1

    cmpl-float p1, p1, p2

    if-lez p1, :cond_5

    .line 1278
    :cond_4
    invoke-direct {p0, v2, p3, p4}, Lmodmenu/InputBridge;->ptrUp(IJ)V

    .line 1279
    iget p1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p1, p1

    div-float/2addr p1, v3

    iput p1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 1280
    iget p1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float p1, p1

    div-float/2addr p1, v3

    iput p1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 1281
    invoke-direct {p0, v2, p3, p4}, Lmodmenu/InputBridge;->ptrDown(IJ)V

    .line 1283
    :cond_5
    invoke-direct {p0, p3, p4}, Lmodmenu/InputBridge;->ptrMove(J)V

    .line 1284
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    if-nez p1, :cond_6

    .line 1285
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object p2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1286
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object p2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    const-wide/16 p3, 0x78

    invoke-virtual {p1, p2, p3, p4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1288
    :cond_6
    return-void
.end method

.method private static luaStr(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1145
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

.method private movementKey(IZ)Z
    .locals 2

    .line 493
    const/4 v0, 0x1

    const/4 v1, 0x0

    sparse-switch p1, :sswitch_data_0

    .line 520
    return v1

    .line 511
    :sswitch_0
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mvJ:Z

    if-ne p1, p2, :cond_0

    return v1

    .line 512
    :cond_0
    iput-boolean p2, p0, Lmodmenu/InputBridge;->mvJ:Z

    .line 513
    return v0

    .line 516
    :sswitch_1
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mvS:Z

    if-ne p1, p2, :cond_1

    return v1

    .line 517
    :cond_1
    iput-boolean p2, p0, Lmodmenu/InputBridge;->mvS:Z

    .line 518
    return v0

    .line 495
    :sswitch_2
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mvF:Z

    if-ne p1, p2, :cond_2

    return v1

    .line 496
    :cond_2
    iput-boolean p2, p0, Lmodmenu/InputBridge;->mvF:Z

    .line 497
    return v0

    .line 499
    :sswitch_3
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mvB:Z

    if-ne p1, p2, :cond_3

    return v1

    .line 500
    :cond_3
    iput-boolean p2, p0, Lmodmenu/InputBridge;->mvB:Z

    .line 501
    return v0

    .line 507
    :sswitch_4
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mvR:Z

    if-ne p1, p2, :cond_4

    return v1

    .line 508
    :cond_4
    iput-boolean p2, p0, Lmodmenu/InputBridge;->mvR:Z

    .line 509
    return v0

    .line 503
    :sswitch_5
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mvL:Z

    if-ne p1, p2, :cond_5

    return v1

    .line 504
    :cond_5
    iput-boolean p2, p0, Lmodmenu/InputBridge;->mvL:Z

    .line 505
    return v0

    :sswitch_data_0
    .sparse-switch
        0x1d -> :sswitch_5
        0x20 -> :sswitch_4
        0x2f -> :sswitch_3
        0x33 -> :sswitch_2
        0x3b -> :sswitch_1
        0x3c -> :sswitch_1
        0x3e -> :sswitch_0
    .end sparse-switch
.end method

.method private player()Lcom/minitech/player/AppPlayer;
    .locals 1

    .line 416
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    instance-of v0, v0, Lorg/appplay/lib/GameBaseActivity;

    if-nez v0, :cond_0

    .line 417
    const/4 v0, 0x0

    return-object v0

    .line 419
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    check-cast v0, Lorg/appplay/lib/GameBaseActivity;

    iget-object v0, v0, Lorg/appplay/lib/GameBaseActivity;->m_AppPlayer:Lcom/minitech/player/AppPlayer;

    return-object v0
.end method

.method private pollState()V
    .locals 7

    .line 939
    const-string v0, "MWInput"

    iget-object v1, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    if-nez v1, :cond_0

    invoke-direct {p0}, Lmodmenu/InputBridge;->resolvePaths()Z

    move-result v1

    if-nez v1, :cond_0

    .line 940
    return-void

    .line 943
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

    .line 950
    nop

    .line 951
    iget-object v2, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    invoke-static {v2}, Lmodmenu/InputBridge;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 952
    if-nez v2, :cond_1

    iget-object v4, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 953
    iget-object v2, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    invoke-static {v2}, Lmodmenu/InputBridge;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 955
    :cond_1
    if-eqz v2, :cond_7

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x2

    if-ge v4, v5, :cond_2

    goto :goto_2

    .line 958
    :cond_2
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x31

    if-ne v4, v5, :cond_3

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v4, v5, :cond_3

    const/4 v4, 0x1

    goto :goto_0

    :cond_3
    const/4 v4, 0x0

    .line 959
    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v5, :cond_4

    goto :goto_1

    :cond_4
    const/4 v1, 0x0

    .line 960
    :goto_1
    iget-boolean v3, p0, Lmodmenu/InputBridge;->stateInGame:Z

    if-eq v1, v3, :cond_5

    .line 961
    iput-boolean v1, p0, Lmodmenu/InputBridge;->stateInGame:Z

    .line 962
    if-nez v1, :cond_5

    .line 963
    invoke-direct {p0}, Lmodmenu/InputBridge;->clearMovement()V

    .line 966
    :cond_5
    iget-boolean v1, p0, Lmodmenu/InputBridge;->lastInMap:Z

    if-ne v4, v1, :cond_6

    .line 967
    return-void

    .line 969
    :cond_6
    iput-boolean v4, p0, Lmodmenu/InputBridge;->lastInMap:Z

    .line 970
    iget-object v1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-static {v1, v4}, Lmodmenu/ModMenu;->setCrosshair(Landroid/content/Context;Z)V

    .line 971
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 972
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "xh auto="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " state="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 973
    return-void

    .line 956
    :cond_7
    :goto_2
    return-void

    .line 944
    :catch_0
    move-exception v2

    .line 945
    iget-boolean v3, p0, Lmodmenu/InputBridge;->stateErrLogged:Z

    if-nez v3, :cond_8

    .line 946
    iput-boolean v1, p0, Lmodmenu/InputBridge;->stateErrLogged:Z

    .line 947
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

    .line 949
    :cond_8
    return-void
.end method

.method private probeB()Ljava/lang/String;
    .locals 4

    .line 1044
    iget-object v0, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1045
    invoke-direct {p0}, Lmodmenu/InputBridge;->resolvePaths()Z

    .line 1047
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->probePath:Ljava/lang/String;

    invoke-static {v0}, Lmodmenu/InputBridge;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1048
    iget-object v1, p0, Lmodmenu/InputBridge;->probePath2:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lmodmenu/InputBridge;->probePath2:Ljava/lang/String;

    invoke-static {v1}, Lmodmenu/InputBridge;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    const-string v1, ""

    .line 1049
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "(function() local parts={\'MWP5\'} local function ioTest(p) if p==\'\' then return \'nopath\' end local okw,fh=pcall(function() return io.open(p,\'w\') end) if not okw then return \'open-fail:\'..tostring(fh) end if fh==nil then return \'nilfh\' end local okw2,werr=pcall(function() fh:write(\'mw-ok\') end) pcall(function() fh:close() end) return okw2 and \'ok\' or (\'wr-fail:\'..tostring(werr)) end local kn={} local codes={27,111,32,65,68,83,87,37,38,39,40,16,13,21,22,19,20,29,47,51,62,59,66} for i=1,#codes do local c=codes[i] local ok,n=pcall(function() return DefMgr:getKeyName(c) end) if ok and type(n)==\'string\' and n~=\'\' then kn[#kn+1]=c..\'=\'..n end end parts[#parts+1]=\'kn=\'..table.concat(kn,\',\') local binds,n,nerr={},nil,nil local okd,dn=pcall(function() return DefMgr:getHotkeyNum() end) if okd and type(dn)==\'number\' then n=dn else nerr=\'nonum\' end local okgi,gi=pcall(GetGameInfo) if n~=nil and okgi and gi~=nil then for i=1,n do local ok1,d=pcall(function() return DefMgr:getHotkeyDef(i) end) if ok1 and type(d)==\'table\' and type(d.FuncName)==\'string\' then local ok2,cur=pcall(function() return gi:GetGameHotkey(d.FuncName) end) if ok2 and type(cur)==\'number\' then local code=cur<0 and (\'d\'..tostring(d.DefaultCode)) or tostring(cur) binds[#binds+1]=d.FuncName..\'=\'..code end end if #binds>60 then nerr=\'cap\'; break end end elseif not okgi and nerr==nil then nerr=\'nogi\' end parts[#parts+1]=\'n=\'..tostring(n)..(nerr and (\',\'..nerr) or \'\') parts[#parts+1]=\'b=\'..table.concat(binds,\';\') local d3={} for i=1,3 do local ok1,d=pcall(function() return DefMgr:getHotkeyDef(i) end) if not ok1 then d3[#d3+1]=i..\':F\' else local fn=type(d)==\'table\' and tostring(d.FuncName) or type(d) local ok2,cur=pcall(function() return gi:GetGameHotkey(d.FuncName) end) local tail=ok2 and (type(cur)..\':\'..tostring(cur):sub(1,8)) or \'F\' d3[#d3+1]=i..\':\'..fn..\':\'..tail end end parts[#parts+1]=\'d3=\'..table.concat(d3,\',\') local mks={} pcall(function() local t=_G[\'GameSettingsMgr\'] if type(t)==\'table\' then for k in pairs(t) do if #mks<40 then mks[#mks+1]=tostring(k) end end end end) parts[#parts+1]=\'mgr=\'..(#mks>0 and table.concat(mks,\',\') or \'none\') local pl=\'nil\' pcall(function() local c=CurMainPlayer if c~=nil then local okmf=type(c.setMoveForward)==\'function\' local oksc=type(c.setCurShortcut)==\'function\' pl=type(c)..(okmf and \'/mf\' or \'/nomf\') ..(oksc and \'/sc\' or \'/nosc\') end end) if pl==\'nil\' then pcall(function() local c=ClientCurGame:getMainPlayer() if c~=nil then pl=\'ccg:\'..type(c) end end) end parts[#parts+1]=\'pl=\'..pl local sc=\'-\' pcall(function() local c=CurMainPlayer if c~=nil then local ok1,s=pcall(function() return c:getCurShortcut() end) local ok2,st=pcall(function() return c:getShortcutStartIndex() end) local ok3,cn=pcall(function() return c:getCurShortcutItemNum() end) sc=(ok1 and tostring(s) or \'?\')..\',\'..(ok2 and tostring(st) or \'?\')..\',\'..(ok3 and tostring(cn) or \'?\') end end) parts[#parts+1]=\'sc=\'..sc local io1,io2=\'skip\',\'skip\' if type(io)==\'table\' and io.open then io1=ioTest(\'"

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

.method private ptrDown(IJ)V
    .locals 4

    .line 1342
    iget v0, p0, Lmodmenu/InputBridge;->pCount:I

    iget-object v1, p0, Lmodmenu/InputBridge;->pIds:[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 1343
    return-void

    .line 1345
    :cond_0
    iget v0, p0, Lmodmenu/InputBridge;->pCount:I

    .line 1346
    if-nez v0, :cond_1

    .line 1347
    iput-wide p2, p0, Lmodmenu/InputBridge;->gestureDown:J

    .line 1349
    :cond_1
    iget-object v1, p0, Lmodmenu/InputBridge;->pIds:[I

    iget v2, p0, Lmodmenu/InputBridge;->pCount:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lmodmenu/InputBridge;->pCount:I

    aput p1, v1, v2

    .line 1350
    if-nez v0, :cond_2

    const/4 p1, 0x0

    goto :goto_0

    .line 1352
    :cond_2
    shl-int/lit8 p1, v0, 0x8

    or-int/lit8 p1, p1, 0x5

    .line 1353
    :goto_0
    invoke-direct {p0, p1, p2, p3}, Lmodmenu/InputBridge;->ptrEvent(IJ)V

    .line 1354
    return-void
.end method

.method private ptrEvent(IJ)V
    .locals 17

    .line 1315
    move-object/from16 v0, p0

    iget v6, v0, Lmodmenu/InputBridge;->pCount:I

    .line 1316
    if-nez v6, :cond_0

    .line 1317
    return-void

    .line 1319
    :cond_0
    new-array v7, v6, [Landroid/view/MotionEvent$PointerProperties;

    .line 1321
    new-array v8, v6, [Landroid/view/MotionEvent$PointerCoords;

    .line 1322
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v6, :cond_1

    .line 1323
    new-instance v2, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v2}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 1324
    iget-object v3, v0, Lmodmenu/InputBridge;->pIds:[I

    aget v3, v3, v1

    iput v3, v2, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 1325
    const/4 v3, 0x1

    iput v3, v2, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 1326
    aput-object v2, v7, v1

    .line 1327
    new-instance v2, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v2}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 1328
    iget-object v3, v0, Lmodmenu/InputBridge;->pIds:[I

    aget v3, v3, v1

    invoke-direct {v0, v3}, Lmodmenu/InputBridge;->ptrX(I)F

    move-result v3

    iput v3, v2, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 1329
    iget-object v3, v0, Lmodmenu/InputBridge;->pIds:[I

    aget v3, v3, v1

    invoke-direct {v0, v3}, Lmodmenu/InputBridge;->ptrY(I)F

    move-result v3

    iput v3, v2, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 1330
    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, v2, Landroid/view/MotionEvent$PointerCoords;->pressure:F

    .line 1331
    const v3, 0x3d4ccccd    # 0.05f

    iput v3, v2, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 1332
    aput-object v2, v8, v1

    .line 1322
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1334
    :cond_1
    iget-wide v1, v0, Lmodmenu/InputBridge;->gestureDown:J

    const/16 v15, 0x1002

    const/16 v16, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/high16 v11, 0x3f800000    # 1.0f

    const/high16 v12, 0x3f800000    # 1.0f

    const/4 v13, 0x0

    const/4 v14, 0x0

    move/from16 v5, p1

    move-wide/from16 v3, p2

    invoke-static/range {v1 .. v16}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v1

    .line 1337
    iget-object v2, v0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v2, v1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 1338
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 1339
    return-void
.end method

.method private ptrMove(J)V
    .locals 1

    .line 1378
    const/4 v0, 0x2

    invoke-direct {p0, v0, p1, p2}, Lmodmenu/InputBridge;->ptrEvent(IJ)V

    .line 1379
    return-void
.end method

.method private ptrUp(IJ)V
    .locals 2

    .line 1357
    nop

    .line 1358
    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lmodmenu/InputBridge;->pCount:I

    if-ge v0, v1, :cond_1

    .line 1359
    iget-object v1, p0, Lmodmenu/InputBridge;->pIds:[I

    aget v1, v1, v0

    if-ne v1, p1, :cond_0

    .line 1360
    nop

    .line 1361
    goto :goto_1

    .line 1358
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    .line 1364
    :goto_1
    if-gez v0, :cond_2

    .line 1365
    return-void

    .line 1367
    :cond_2
    iget p1, p0, Lmodmenu/InputBridge;->pCount:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_3

    const/4 p1, 0x1

    goto :goto_2

    .line 1369
    :cond_3
    shl-int/lit8 p1, v0, 0x8

    or-int/lit8 p1, p1, 0x6

    .line 1370
    :goto_2
    invoke-direct {p0, p1, p2, p3}, Lmodmenu/InputBridge;->ptrEvent(IJ)V

    .line 1371
    nop

    :goto_3
    iget p1, p0, Lmodmenu/InputBridge;->pCount:I

    sub-int/2addr p1, v1

    if-ge v0, p1, :cond_4

    .line 1372
    iget-object p1, p0, Lmodmenu/InputBridge;->pIds:[I

    iget-object p2, p0, Lmodmenu/InputBridge;->pIds:[I

    add-int/lit8 p3, v0, 0x1

    aget p2, p2, p3

    aput p2, p1, v0

    .line 1371
    move v0, p3

    goto :goto_3

    .line 1374
    :cond_4
    iget p1, p0, Lmodmenu/InputBridge;->pCount:I

    sub-int/2addr p1, v1

    iput p1, p0, Lmodmenu/InputBridge;->pCount:I

    .line 1375
    return-void
.end method

.method private ptrX(I)F
    .locals 0

    .line 1306
    if-nez p1, :cond_0

    iget p1, p0, Lmodmenu/InputBridge;->lookX:F

    goto :goto_0

    :cond_0
    iget p1, p0, Lmodmenu/InputBridge;->clickX:F

    :goto_0
    return p1
.end method

.method private ptrY(I)F
    .locals 0

    .line 1310
    if-nez p1, :cond_0

    iget p1, p0, Lmodmenu/InputBridge;->lookY:F

    goto :goto_0

    :cond_0
    iget p1, p0, Lmodmenu/InputBridge;->clickY:F

    :goto_0
    return p1
.end method

.method private static readFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1149
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 1150
    return-object v0

    .line 1153
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1155
    const/16 p0, 0x20

    :try_start_1
    new-array p0, p0, [B

    .line 1156
    invoke-virtual {v1, p0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 1157
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

    .line 1159
    :goto_0
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 1157
    return-object v3

    .line 1159
    :catchall_0
    move-exception p0

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 1160
    throw p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 1161
    :catch_0
    move-exception p0

    .line 1162
    return-object v0
.end method

.method private releaseCapture(Landroid/view/View;)V
    .locals 2

    .line 921
    invoke-virtual {p1}, Landroid/view/View;->releasePointerCapture()V

    .line 922
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmodmenu/InputBridge;->captured:Z

    .line 923
    iput-boolean p1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 924
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 925
    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 926
    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->releaseClick(J)V

    .line 927
    const-string p1, "MWInput"

    const-string v0, "xh capture released"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 928
    return-void
.end method

.method private releaseClick(J)V
    .locals 2

    .line 1192
    iget-boolean v0, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    if-nez v0, :cond_0

    .line 1193
    return-void

    .line 1195
    :cond_0
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->clickEnd:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1196
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2}, Lmodmenu/InputBridge;->ptrUp(IJ)V

    .line 1197
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    .line 1198
    iget-boolean p1, p0, Lmodmenu/InputBridge;->looking:Z

    if-eqz p1, :cond_1

    .line 1199
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object p2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1200
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object p2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    const-wide/16 v0, 0x78

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1202
    :cond_1
    const-string p1, "MWInput"

    const-string p2, "center-touch up"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1203
    return-void
.end method

.method private resolvePaths()Z
    .locals 6

    .line 985
    const-string v0, "mw_probe.txt"

    const-string v1, "mw_state.txt"

    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 986
    iget-object v4, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v4

    .line 987
    if-nez v4, :cond_0

    .line 988
    return v2

    .line 990
    :cond_0
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    .line 991
    if-eqz v3, :cond_1

    .line 992
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 993
    :cond_1
    iget-object v1, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    :goto_0
    iput-object v1, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    .line 996
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v4, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lmodmenu/InputBridge;->probePath2:Ljava/lang/String;

    .line 997
    if-eqz v3, :cond_2

    .line 998
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 999
    :cond_2
    iget-object v0, p0, Lmodmenu/InputBridge;->probePath2:Ljava/lang/String;

    :goto_1
    iput-object v0, p0, Lmodmenu/InputBridge;->probePath:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1000
    const/4 v0, 0x1

    return v0

    .line 1001
    :catch_0
    move-exception v0

    .line 1002
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "state paths failed: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "MWInput"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1003
    return v2
.end method

.method private startPoll()V
    .locals 4

    .line 976
    iget-boolean v0, p0, Lmodmenu/InputBridge;->polling:Z

    if-eqz v0, :cond_0

    .line 977
    return-void

    .line 979
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmodmenu/InputBridge;->polling:Z

    .line 980
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->poll:Ljava/lang/Runnable;

    const-wide/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 981
    return-void
.end method

.method private stateScript()Ljava/lang/String;
    .locals 4

    .line 1009
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function() local ing,shown=false,false pcall(function() ing=(ClientCurGame and ClientCurGame.isInGame and ClientCurGame:isInGame()) and true or false end) pcall(function() local fr=getglobal(\'GameSetFrame\') shown=(fr and fr.IsShown and fr:IsShown()) and true or false end) local data=(ing and \'1\' or \'0\')..(shown and \'1\' or \'0\') local function w(p) local ok,fh=pcall(function() return io.open(p,\'w\') end) if ok and fh then pcall(function() fh:write(data) end) pcall(function() fh:close() end) end end w(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    .line 1026
    invoke-static {v1}, Lmodmenu/InputBridge;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\')"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1027
    iget-object v2, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    iget-object v3, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1028
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

    .line 1009
    return-object v0
.end method

.method private syncCrosshair()V
    .locals 8

    .line 897
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    .line 898
    return-void

    .line 900
    :cond_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 901
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/minitech/player/AppPlayer;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 902
    :goto_0
    if-nez v0, :cond_2

    .line 903
    return-void

    .line 905
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 906
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v3

    .line 915
    iget-boolean v4, p0, Lmodmenu/InputBridge;->captured:Z

    .line 906
    if-eqz v3, :cond_3

    .line 907
    if-nez v4, :cond_4

    iget-wide v3, p0, Lmodmenu/InputBridge;->lastCaptureReq:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x5dc

    cmp-long v7, v3, v5

    if-lez v7, :cond_4

    .line 908
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastCaptureReq:J

    .line 909
    const/4 v1, 0x1

    iput-boolean v1, p0, Lmodmenu/InputBridge;->captured:Z

    .line 910
    const/4 v1, 0x0

    iput-boolean v1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 911
    iget-object v1, p0, Lmodmenu/InputBridge;->captureListener:Landroid/view/View$OnCapturedPointerListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnCapturedPointerListener(Landroid/view/View$OnCapturedPointerListener;)V

    .line 912
    invoke-virtual {v0}, Landroid/view/View;->requestPointerCapture()V

    .line 913
    const-string v0, "MWInput"

    const-string v1, "xh capture requested"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 915
    :cond_3
    if-eqz v4, :cond_4

    .line 916
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->releaseCapture(Landroid/view/View;)V

    .line 918
    :cond_4
    :goto_1
    return-void
.end method

.method private static toAscii(I)I
    .locals 4

    .line 589
    const/16 v0, 0x1d

    if-lt p0, v0, :cond_0

    const/16 v1, 0x36

    if-gt p0, v1, :cond_0

    .line 590
    sub-int/2addr p0, v0

    add-int/lit8 p0, p0, 0x41

    return p0

    .line 592
    :cond_0
    const/16 v0, 0x10

    const/4 v1, 0x7

    if-lt p0, v1, :cond_1

    if-gt p0, v0, :cond_1

    .line 593
    sub-int/2addr p0, v1

    add-int/lit8 p0, p0, 0x30

    return p0

    .line 595
    :cond_1
    const/16 v1, 0x83

    if-lt p0, v1, :cond_2

    const/16 v2, 0x8e

    if-gt p0, v2, :cond_2

    .line 596
    sub-int/2addr p0, v1

    add-int/lit8 p0, p0, 0x70

    return p0

    .line 598
    :cond_2
    const/16 v1, 0x2d

    const/16 v2, 0x2e

    const/16 v3, 0x27

    sparse-switch p0, :sswitch_data_0

    .line 633
    const/4 p0, -0x1

    return p0

    .line 620
    :sswitch_0
    return v1

    .line 617
    :sswitch_1
    const/16 p0, 0x23

    return p0

    .line 616
    :sswitch_2
    const/16 p0, 0x24

    return p0

    .line 615
    :sswitch_3
    const/16 p0, 0x14

    return p0

    .line 612
    :sswitch_4
    const/16 p0, 0x11

    return p0

    .line 603
    :sswitch_5
    return v2

    .line 604
    :sswitch_6
    const/16 p0, 0x1b

    return p0

    .line 619
    :sswitch_7
    const/16 p0, 0x22

    return p0

    .line 618
    :sswitch_8
    const/16 p0, 0x21

    return p0

    .line 623
    :sswitch_9
    const/16 p0, 0x2f

    return p0

    .line 625
    :sswitch_a
    return v3

    .line 624
    :sswitch_b
    const/16 p0, 0x3b

    return p0

    .line 630
    :sswitch_c
    const/16 p0, 0x5c

    return p0

    .line 629
    :sswitch_d
    const/16 p0, 0x5d

    return p0

    .line 628
    :sswitch_e
    const/16 p0, 0x5b

    return p0

    .line 627
    :sswitch_f
    const/16 p0, 0x3d

    return p0

    .line 626
    :sswitch_10
    return v1

    .line 631
    :sswitch_11
    const/16 p0, 0x60

    return p0

    .line 602
    :sswitch_12
    const/16 p0, 0x8

    return p0

    .line 600
    :sswitch_13
    const/16 p0, 0xd

    return p0

    .line 599
    :sswitch_14
    const/16 p0, 0x20

    return p0

    .line 601
    :sswitch_15
    const/16 p0, 0x9

    return p0

    .line 610
    :sswitch_16
    return v0

    .line 614
    :sswitch_17
    const/16 p0, 0x12

    return p0

    .line 622
    :sswitch_18
    return v2

    .line 621
    :sswitch_19
    const/16 p0, 0x2c

    return p0

    .line 608
    :sswitch_1a
    return v3

    .line 607
    :sswitch_1b
    const/16 p0, 0x25

    return p0

    .line 606
    :sswitch_1c
    const/16 p0, 0x28

    return p0

    .line 605
    :sswitch_1d
    const/16 p0, 0x26

    return p0

    :sswitch_data_0
    .sparse-switch
        0x13 -> :sswitch_1d
        0x14 -> :sswitch_1c
        0x15 -> :sswitch_1b
        0x16 -> :sswitch_1a
        0x37 -> :sswitch_19
        0x38 -> :sswitch_18
        0x39 -> :sswitch_17
        0x3a -> :sswitch_17
        0x3b -> :sswitch_16
        0x3c -> :sswitch_16
        0x3d -> :sswitch_15
        0x3e -> :sswitch_14
        0x42 -> :sswitch_13
        0x43 -> :sswitch_12
        0x44 -> :sswitch_11
        0x45 -> :sswitch_10
        0x46 -> :sswitch_f
        0x47 -> :sswitch_e
        0x48 -> :sswitch_d
        0x49 -> :sswitch_c
        0x4a -> :sswitch_b
        0x4b -> :sswitch_a
        0x4c -> :sswitch_9
        0x5c -> :sswitch_8
        0x5d -> :sswitch_7
        0x6f -> :sswitch_6
        0x70 -> :sswitch_5
        0x71 -> :sswitch_4
        0x72 -> :sswitch_4
        0x73 -> :sswitch_3
        0x7a -> :sswitch_2
        0x7b -> :sswitch_1
        0x7c -> :sswitch_0
    .end sparse-switch
.end method

.method private static translate(Landroid/view/KeyEvent;I)Landroid/view/KeyEvent;
    .locals 11

    .line 638
    new-instance v0, Landroid/view/KeyEvent;

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getDownTime()J

    move-result-wide v1

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v3

    .line 639
    invoke-virtual {p0}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v7

    .line 640
    invoke-virtual {p0}, Landroid/view/KeyEvent;->getMetaState()I

    move-result v8

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v9

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getScanCode()I

    move-result v10

    move v6, p1

    invoke-direct/range {v0 .. v10}, Landroid/view/KeyEvent;-><init>(JJIIIIII)V

    .line 638
    return-object v0
.end method


# virtual methods
.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 732
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 733
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const/4 v1, 0x2

    and-int/2addr v0, v1

    if-eqz v0, :cond_6

    .line 734
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 735
    const-string v2, "generic"

    invoke-direct {p0, v2, v0, p1}, Lmodmenu/InputBridge;->logCrosshairIn(Ljava/lang/String;ILandroid/view/MotionEvent;)V

    .line 736
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v2

    .line 737
    if-eqz v2, :cond_6

    .line 738
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

    .line 740
    :goto_0
    const-string v4, "MWInput"

    const/4 v6, 0x7

    if-eqz v3, :cond_3

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v3

    if-eqz v3, :cond_3

    if-eq v0, v6, :cond_1

    if-ne v0, v1, :cond_3

    .line 743
    :cond_1
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 744
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 745
    iget-wide v6, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v6, v1, v6

    const-wide/16 v8, 0x1f4

    cmp-long v3, v6, v8

    if-lez v3, :cond_2

    .line 746
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 747
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

    .line 748
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 747
    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 750
    :cond_2
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookBy(Landroid/view/MotionEvent;)V

    .line 751
    return v5

    .line 753
    :cond_3
    invoke-virtual {v2, p1}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result v1

    .line 754
    const/16 v2, 0x8

    if-ne v0, v2, :cond_4

    .line 755
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->handleWheel(Landroid/view/MotionEvent;)V

    .line 757
    :cond_4
    if-eq v0, v6, :cond_5

    .line 758
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

    .line 759
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

    .line 758
    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 761
    :cond_5
    return v5

    .line 764
    :cond_6
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 7

    .line 645
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 646
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    .line 647
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 651
    :goto_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    const/16 v4, 0x83

    const-string v5, "MWInput"

    if-ne v3, v4, :cond_2

    .line 652
    if-eqz v0, :cond_1

    .line 653
    iget-object p1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    xor-int/2addr v0, v2

    invoke-static {p1, v0}, Lmodmenu/ModMenu;->setCrosshair(Landroid/content/Context;Z)V

    .line 654
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 655
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

    .line 657
    :cond_1
    return v2

    .line 662
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    const/16 v4, 0x84

    if-ne v3, v4, :cond_4

    .line 663
    if-eqz v0, :cond_3

    .line 665
    :try_start_0
    const-string p1, "(function() local cl,cl2,rk,rk2,cm,cm2 local okc,cfg=pcall(function() return GetIWorldConfig() end) if not okc or cfg==nil then error(\'MWP6|cfg=no\',0) end pcall(function() cl=cfg:getGameData(\'classical\') end) pcall(function() rk=cfg:getGameData(\'rocker\') end) pcall(function() cm=GetClientInfo():getContrlMode() end) local num=tonumber(cl) local newc=(num and num>0) and 0 or 1 local ok1=pcall(function() cfg:setGameData(\'classical\',newc) cfg:setGameData(\'rocker\',newc==1 and 0 or 1) end) local ok2=pcall(SetControlMoveSwithState) local ok3=pcall(function() GetClientInfo():appalyGameSetData() end) pcall(function() cl2=cfg:getGameData(\'classical\') end) pcall(function() rk2=cfg:getGameData(\'rocker\') end) pcall(function() cm2=GetClientInfo():getContrlMode() end) error(\'MWP6|cl=\'..tostring(cl)..\'->\'..tostring(cl2) ..\' rk=\'..tostring(rk)..\'->\'..tostring(rk2) ..\' cm=\'..tostring(cm)..\'->\'..tostring(cm2) ..\'|set=\'..tostring(ok1)..\' ui=\'..tostring(ok2) ..\' ap=\'..tostring(ok3),0) end)"

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p1, v0}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 666
    const-string p1, "ctrl-toggle fired"

    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 669
    goto :goto_1

    .line 667
    :catch_0
    move-exception p1

    .line 668
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

    .line 671
    :cond_3
    :goto_1
    return v2

    .line 673
    :cond_4
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    invoke-static {v3}, Lmodmenu/InputBridge;->keepAndroid(I)Z

    move-result v3

    if-nez v3, :cond_f

    .line 674
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v3

    .line 675
    if-nez v3, :cond_5

    .line 676
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 678
    :cond_5
    if-eqz v0, :cond_6

    .line 679
    invoke-direct {p0}, Lmodmenu/InputBridge;->enableKeyBinds()V

    .line 681
    :cond_6
    if-nez v0, :cond_8

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_7

    goto :goto_2

    :cond_7
    const/4 v0, 0x0

    goto :goto_3

    :cond_8
    :goto_2
    const/4 v0, 0x1

    .line 682
    :goto_3
    if-eqz v0, :cond_a

    iget-boolean v4, p0, Lmodmenu/InputBridge;->stateInGame:Z

    if-eqz v4, :cond_a

    .line 683
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    .line 684
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v6

    if-nez v6, :cond_9

    const/4 v6, 0x1

    goto :goto_4

    :cond_9
    const/4 v6, 0x0

    .line 683
    :goto_4
    invoke-direct {p0, v4, v6}, Lmodmenu/InputBridge;->movementKey(IZ)Z

    move-result v4

    if-eqz v4, :cond_a

    const/4 v1, 0x1

    goto :goto_5

    :cond_a
    nop

    .line 685
    :goto_5
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    invoke-static {v4}, Lmodmenu/InputBridge;->toAscii(I)I

    move-result v4

    .line 686
    if-ltz v4, :cond_b

    invoke-static {p1, v4}, Lmodmenu/InputBridge;->translate(Landroid/view/KeyEvent;I)Landroid/view/KeyEvent;

    move-result-object v6

    goto :goto_6

    :cond_b
    move-object v6, p1

    .line 690
    :goto_6
    invoke-virtual {v3, v6}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result v3

    .line 691
    if-eqz v1, :cond_c

    .line 692
    iget-boolean v1, p0, Lmodmenu/InputBridge;->moveReported:Z

    xor-int/2addr v1, v2

    invoke-direct {p0, v1}, Lmodmenu/InputBridge;->fireMovement(Z)V

    .line 693
    iput-boolean v2, p0, Lmodmenu/InputBridge;->moveReported:Z

    .line 695
    :cond_c
    if-eqz v0, :cond_e

    .line 698
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "key "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 699
    if-ltz v4, :cond_d

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "->"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_7

    :cond_d
    const-string v1, ""

    :goto_7
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 700
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " eng="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " dev="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 701
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " src="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 702
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getSource()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " rep="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 703
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 698
    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 705
    :cond_e
    return v2

    .line 708
    :cond_f
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 1383
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    .line 1393
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 769
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 770
    const-string v1, "touch"

    invoke-direct {p0, v1, v0, p1}, Lmodmenu/InputBridge;->logCrosshairIn(Ljava/lang/String;ILandroid/view/MotionEvent;)V

    .line 771
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

    .line 773
    :goto_0
    if-nez v1, :cond_1

    if-nez v0, :cond_1

    .line 774
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lmodmenu/InputBridge;->endLook(J)V

    .line 776
    :cond_1
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v2

    if-eqz v2, :cond_9

    if-eqz v1, :cond_9

    .line 777
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v1

    .line 778
    const-string v2, "MWInput"

    if-eqz v1, :cond_6

    .line 782
    const/4 v5, 0x2

    if-ne v0, v5, :cond_3

    .line 783
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 784
    iget-wide v5, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v5, v0, v5

    const-wide/16 v7, 0x1f4

    cmp-long v3, v5, v7

    if-lez v3, :cond_2

    .line 785
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 786
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

    .line 788
    :cond_2
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookBy(Landroid/view/MotionEvent;)V

    .line 789
    return v4

    .line 791
    :cond_3
    if-nez v0, :cond_4

    .line 792
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-direct {p0, v0, v1, v4}, Lmodmenu/InputBridge;->centerTouch(JZ)V

    .line 793
    return v4

    .line 795
    :cond_4
    if-eq v0, v4, :cond_5

    const/4 v5, 0x3

    if-ne v0, v5, :cond_6

    .line 797
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-direct {p0, v0, v1, v3}, Lmodmenu/InputBridge;->centerTouch(JZ)V

    .line 798
    return v4

    .line 801
    :cond_6
    invoke-direct {p0, p1, v1}, Lmodmenu/InputBridge;->asFinger(Landroid/view/MotionEvent;Z)Landroid/view/MotionEvent;

    move-result-object v1

    .line 802
    if-eqz v1, :cond_9

    .line 803
    iget-object p1, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {p1, v1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    .line 804
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 805
    if-eqz v0, :cond_7

    if-ne v0, v4, :cond_8

    .line 806
    :cond_7
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

    .line 808
    :cond_8
    return p1

    .line 811
    :cond_9
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1388
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .locals 1

    .line 1494
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeFinished(Landroid/view/ActionMode;)V

    .line 1495
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 1

    .line 1489
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeStarted(Landroid/view/ActionMode;)V

    .line 1490
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1471
    invoke-direct {p0}, Lmodmenu/InputBridge;->startPoll()V

    .line 1472
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onAttachedToWindow()V

    .line 1473
    return-void
.end method

.method public onContentChanged()V
    .locals 1

    .line 1408
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onContentChanged()V

    .line 1409
    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 1

    .line 1403
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .locals 1

    .line 1398
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onCreatePanelView(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1477
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmodmenu/InputBridge;->polling:Z

    .line 1478
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->poll:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1479
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onDetachedFromWindow()V

    .line 1480
    return-void
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 1

    .line 1443
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .locals 1

    .line 1438
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .locals 1

    .line 1484
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 1485
    return-void
.end method

.method public onPointerCaptureChanged(Z)V
    .locals 2

    .line 1505
    if-nez p1, :cond_0

    iget-boolean v0, p0, Lmodmenu/InputBridge;->captured:Z

    if-eqz v0, :cond_0

    .line 1506
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmodmenu/InputBridge;->captured:Z

    .line 1507
    iput-boolean v0, p0, Lmodmenu/InputBridge;->primed:Z

    .line 1508
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1509
    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 1510
    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->releaseClick(J)V

    .line 1511
    const-string v0, "MWInput"

    const-string v1, "xh capture lost"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1513
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onPointerCaptureChanged(Z)V

    .line 1514
    return-void
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 1

    .line 1433
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

    .line 1500
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/Window$Callback;->onProvideKeyboardShortcuts(Ljava/util/List;Landroid/view/Menu;I)V

    .line 1501
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .line 1413
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onSearchRequested()Z

    move-result v0

    return v0
.end method

.method public onSearchRequested(Landroid/view/SearchEvent;)Z
    .locals 1

    .line 1418
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onSearchRequested(Landroid/view/SearchEvent;)Z

    move-result p1

    return p1
.end method

.method public onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
    .locals 1

    .line 1448
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    .line 1449
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2

    .line 1453
    if-eqz p1, :cond_0

    .line 1454
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    goto :goto_1

    .line 1456
    :cond_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 1457
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/minitech/player/AppPlayer;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1458
    :goto_0
    iget-boolean v1, p0, Lmodmenu/InputBridge;->captured:Z

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    .line 1459
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->releaseCapture(Landroid/view/View;)V

    goto :goto_1

    .line 1461
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1462
    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 1463
    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->releaseClick(J)V

    .line 1466
    :goto_1
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowFocusChanged(Z)V

    .line 1467
    return-void
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .locals 1

    .line 1423
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;
    .locals 1

    .line 1428
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method
