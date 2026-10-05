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
.field private static final BINDS:Ljava/lang/String; = "(function() local okn,n=pcall(function() return DefMgr:getHotkeyNum() end) if not okn or type(n)~=\'number\' then error(\'MWP7|nonum\',0) end local okgi,gi=pcall(GetGameInfo) if not okgi or gi==nil then error(\'MWP7|nogi\',0) end local set,ok=0,0 local dump={} for i=1,n do local okd,d=pcall(function() return DefMgr:getHotkeyDef(i) end) if okd and d~=nil then local okf,fn=pcall(function() return d.FuncName end) local okc,code=pcall(function() return d.DefaultCode end) if okf and type(fn)==\'string\' then local cur=nil pcall(function() cur=gi:GetGameHotkey(fn) end) dump[#dump+1]=fn..\'=\'..tostring(cur) if (cur==nil or (type(cur)==\'number\' and cur<0)) and type(code)==\'number\' then set=set+1 local order={ function() gi:SetGameHotkey(fn,code) end, function() gi:SetGameHotkey(code,fn) end, function() DefMgr:SetGameHotkey(fn,code) end, function() SetGameHotkey(fn,code) end} for k=1,#order do pcall(order[k]) local after=nil pcall(function() after=gi:GetGameHotkey(fn) end) if type(after)==\'number\' and after==code then ok=ok+1 break end end end end end end error(\'MWP7|n=\'..n..\' set=\'..set..\' ok=\'..ok ..\'|b=\'..table.concat(dump,\';\'):sub(1,2700),0) end)"

.field private static final CAPTURE_RETRY_MS:J = 0x5dcL

.field private static final CLICK_HOLD_MS:J = 0x2bcL

.field private static final CLICK_ID:I = 0x1

.field private static final CLOSE_FRAME:Ljava/lang/String; = "(function() local fr=nil pcall(function() fr=getglobal(\'GameSetFrame\') end) if fr==nil then error(\'HKCL|noframe\',0) end local ok1,e1=pcall(function() fr:Hide() end) local vis=\'?\' pcall(function() vis=tostring(fr.IsShown and fr:IsShown()) end) local alt=\'\' if vis==\'true\' then local ok2=pcall(function() fr:SetVisible(false) end) alt=\',alt=\'..tostring(ok2) pcall(function() vis=tostring(fr.IsShown and fr:IsShown()) end) end error(\'HKCL|hide=\'..tostring(ok1)..\',\'..tostring(e1) ..alt..\',vis=\'..vis,0) end)"

.field private static final CTRL_TOGGLE:Ljava/lang/String; = "(function() local cl,cl2,rk,rk2,cm,cm2 local okc,cfg=pcall(function() return GetIWorldConfig() end) if not okc or cfg==nil then error(\'MWP6|cfg=no\',0) end pcall(function() cl=cfg:getGameData(\'classical\') end) pcall(function() rk=cfg:getGameData(\'rocker\') end) pcall(function() cm=GetClientInfo():getContrlMode() end) local num=tonumber(cl) local newc=(num and num>0) and 0 or 1 local ok1=pcall(function() cfg:setGameData(\'classical\',newc) cfg:setGameData(\'rocker\',newc==1 and 0 or 1) end) local ok2=pcall(SetControlMoveSwithState) local ok3=pcall(function() GetClientInfo():appalyGameSetData() end) pcall(function() cl2=cfg:getGameData(\'classical\') end) pcall(function() rk2=cfg:getGameData(\'rocker\') end) pcall(function() cm2=GetClientInfo():getContrlMode() end) error(\'MWP6|cl=\'..tostring(cl)..\'->\'..tostring(cl2) ..\' rk=\'..tostring(rk)..\'->\'..tostring(rk2) ..\' cm=\'..tostring(cm)..\'->\'..tostring(cm2) ..\'|set=\'..tostring(ok1)..\' ui=\'..tostring(ok2) ..\' ap=\'..tostring(ok3),0) end)"

.field private static final ENABLE_INTERVAL_MS:J = 0x7d0L

.field private static final ENABLE_WARMUP_MS:J = 0x1388L

.field private static final HOTBAR:Ljava/lang/String; = "(function(d,rep) local p=nil pcall(function() p=CurMainPlayer end) if p==nil then pcall(function() p=ClientCurGame:getMainPlayer() end) end if p==nil then if rep==1 then error(\'MWP9|pl=no\',0) end return end local ok1,s=pcall(function() return p:getCurShortcut() end) if not ok1 or type(s)~=\'number\' then if rep==1 then error(\'MWP9|get=no\',0) end return end local path=\'none\' local nav=(d>0) and \'keyBindShortcutRight\' or \'keyBindShortcutLeft\' local nh={p,_G} pcall(function() local g=GetGameInfo() if g~=nil then nh[#nh+1]=g end end) for i=1,#nh do local okf,f=pcall(function() return nh[i][nav] end) if okf and type(f)==\'function\' then pcall(function() return f(nh[i]) end) local s2=nil pcall(function() s2=p:getCurShortcut() end) if type(s2)==\'number\' and s2~=s then path=\'nav->\'..s2 break end end end if path==\'none\' then local gh={p} pcall(function() local c=p:getContainer() if c~=nil then gh[#gh+1]=c end end) pcall(function() local c=GetClientInfo() if c~=nil then gh[#gh+1]=c end end) pcall(function() local c=ClientCurGame if c~=nil then gh[#gh+1]=c end end) for i=1,#gh do local okg,gc=pcall(function() return gh[i]:getShortcutGridCount() end) if okg and type(gc)==\'number\' and gc>0 then local lo=(s>=1000) and 1000 or 0 local n=((s-lo+d)%gc)+lo local ok4=pcall(function() p:setCurShortcut(n) end) local rb=nil pcall(function() rb=p:getCurShortcut() end) if rb==nil or rb==s then local okst,st=pcall(function() return p:getShortcutStartIndex() end) if okst and type(st)==\'number\' and st>0 then pcall(function() p:setCurShortcut(st+n) end) pcall(function() rb=p:getCurShortcut() end) end end path=\'grid,gc=\'..gc..\'->\'..n..\' set=\'..tostring(ok4) ..\' rb=\'..tostring(rb) break end end if path==\'none\' then local ok2,st=pcall(function() return p:getShortcutStartIndex() end) local ok3,cn=pcall(function() return p:getCurShortcutItemNum() end) st=(ok2 and type(st)==\'number\') and st or 1 cn=(ok3 and type(cn)==\'number\' and cn>0) and cn or 9 local n=s+d if n<st then n=st+cn-1 elseif n>=st+cn then n=st end local ok4,e4=pcall(function() p:setCurShortcut(n) end) path=\'legacy,st=\'..st..\',cn=\'..cn..\'->\'..n ..\' set=\'..tostring(ok4)..\',\'..tostring(e4):sub(1,40) end end if rep==1 then error(\'MWP9|s=\'..s..\' path=\'..path,0) end end)"

.field private static final KEYBIND_ON:Ljava/lang/String; = "(function() pcall(function() local names={\"GameSettingsMgr\",\"GameSettings\"} for i=1,#names do local t=_G[names[i]] if t~=nil then local ok,fn=pcall(function() return t.enableAllKeyBind end) if ok and type(fn)==\"function\" and pcall(function() t:enableAllKeyBind() end) then return end end end local ok,ci=pcall(GetClientInfo) if ok and ci~=nil then pcall(function() ci:enableAllKeyBind() end) end end) end)"

.field private static final LOOK_ID:I = 0x0

.field private static final LOOK_IDLE_MS:J = 0x78L

.field private static final MAIN:Landroid/os/Handler;

.field private static final MOVEMENT:Ljava/lang/String; = "(function(fw,st,jp,sk,rep) local p=nil pcall(function() p=CurMainPlayer end) if p==nil then pcall(function() p=ClientCurGame:getMainPlayer() end) end if p==nil then if rep==1 then error(\'MWP8|pl=no\',0) end return end local ok1,e1=pcall(function() p:setMoveForward(fw) end) local ok2=pcall(function() p:setMoveStrafing(st) end) local ok3=pcall(function() p:setJumping(jp) end) local ok4=pcall(function() p:setSneaking(sk) end) if rep==1 then error(\'MWP8|mf=\'..tostring(ok1)..\',\'..tostring(e1):sub(1,60) ..\' ms=\'..tostring(ok2)..\' mj=\'..tostring(ok3) ..\' mk=\'..tostring(ok4),0) end end)"

.field private static final MOVE_REASSERT_MS:J = 0x3cL

.field private static final OPEN_FRAME:Ljava/lang/String; = "(function() local r={} local ok,e=pcall(function() local fr=getglobal(\'GameSetFrame\') if fr==nil then error(\'noframe\') end fr:Show() end) r[#r+1]=\'show=\'..tostring(ok)..\',\'..tostring(e) local ok2,e2=pcall(function() local f=rawget(_G,\'GameSetFrameHotkey_OnShow\') if type(f)~=\'function\' then error(\'missing\') end f() end) r[#r+1]=\'onshow=\'..tostring(ok2)..\',\'..tostring(e2) local ok3=pcall(function() press_btn(\'GameSetFrameHotkeyBtn\') end) r[#r+1]=\'tab=\'..tostring(ok3) local vis=\'?\' pcall(function() local fr=getglobal(\'GameSetFrame\') vis=tostring(fr~=nil and fr.IsShown and fr:IsShown()) end) r[#r+1]=\'vis=\'..vis error(\'HKUI2|\'..table.concat(r,\'|\'):sub(1,2900),0) end)"

.field private static final PROBE_A:Ljava/lang/String; = "(function() local eb=\'none\' local names={\"GameSettingsMgr\",\"GameSettings\"} for i=1,#names do local t=_G[names[i]] if t~=nil then local ok,fn=pcall(function() return t.enableAllKeyBind end) if ok and type(fn)==\"function\" then local ran,er=pcall(function() t:enableAllKeyBind() end) eb=names[i]..(ran and \':ok\' or \':err:\'..tostring(er)) break end end end if eb==\'none\' then local okb,ci2=pcall(GetClientInfo) if okb and ci2~=nil then local ranb=pcall(function() ci2:enableAllKeyBind() end) eb=\'ClientInfo\'..(ranb and \':ok\' or \':err\') end end local cm,cl,rk,ing,mid pcall(function() cm=GetClientInfo():getContrlMode() end) pcall(function() local c=GetIWorldConfig() cl=c:getGameData(\'classical\') rk=c:getGameData(\'rocker\') end) pcall(function() ing=ClientCurGame and ClientCurGame.isInGame and ClientCurGame:isInGame() end) pcall(function() mid=GetClientInfo():getCurrentGameMapId() end) local hits,seen={},{} local ok,ci=pcall(GetClientInfo) if ok and type(ci)==\'table\' then local pok=pcall(function() for k in pairs(ci) do if type(k)==\'string\' and (k:find(\'ontrl\') or k:find(\'ontrol\') or k:find(\'witch\') or k:find(\'KeyBind\')) then if not seen[k] then seen[k]=true hits[#hits+1]=k end end end end) if not pok then hits[#hits+1]=\'pairs-fail\' end end local cand={\'setContrlMode\',\'setControlMode\',\'setContrlType\',\'setMoveMode\',\'setUIMode\',\'disableAllKeyBind\'} for i=1,#cand do if ci~=nil then local okf,f=pcall(function() return ci[cand[i]] end) if okf and type(f)==\'function\' and not seen[cand[i]] then seen[cand[i]]=true hits[#hits+1]=cand[i] end end end local s=\'MWP4|eb=\'..eb..\'|cm=\'..tostring(cm) ..\'|cl=\'..tostring(cl)..\',rk=\'..tostring(rk) ..\'|in=\'..tostring(ing)..\',mid=\'..tostring(mid) ..\'|set=\'..table.concat(hits,\',\') error(s:sub(1,2900),0) end)"

.field private static final PROBE_C:Ljava/lang/String; = "(function() local names={\'SendEvent\',\'AddEvent\',\'UIReceiveMessage\',\'SetRightClickDown\',\'IsRightClickDown\',\'excuteWithRightClickCmd\'} local hs={} hs[1]={\'_G\',_G} pcall(function() local g=GetGameInfo() if g~=nil then hs[#hs+1]={\'gi\',g} end end) pcall(function() local c=GetClientInfo() if c~=nil then hs[#hs+1]={\'ci\',c} end end) pcall(function() if DefMgr~=nil then hs[#hs+1]={\'def\',DefMgr} end end) pcall(function() if type(miniui)==\'table\' then hs[#hs+1]={\'ui\',miniui} end end) pcall(function() if CurMainPlayer~=nil then hs[#hs+1]={\'pl\',CurMainPlayer} end end) pcall(function() if ClientCurGame~=nil then hs[#hs+1]={\'game\',ClientCurGame} end end) local parts={\'MWP10\'} for i=1,#names do local nm=names[i] local hit=\'absent\' for j=1,#hs do local h=hs[j] local okv,v=pcall(function() return h[2][nm] end) if okv and v~=nil then if type(v)==\'function\' then local okc,e=pcall(function() return v() end) hit=h[1]..\':fn:\' ..(okc and \'ok\' or tostring(e):sub(1,70)) else hit=h[1]..\':\'..type(v) end break end end parts[#parts+1]=nm..\'=\'..hit end error(table.concat(parts,\'|\'):sub(1,2900),0) end)"

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

.field private lastMoveFail:J

.field private lastX:F

.field private lastY:F

.field private final lookEnd:Ljava/lang/Runnable;

.field private lookX:F

.field private lookY:F

.field private looking:Z

.field private mouseTouching:Z

.field private final moveHold:Ljava/lang/Runnable;

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

.field private final probeBatch:Ljava/lang/Runnable;

.field private probePath:Ljava/lang/String;

.field private probePath2:Ljava/lang/String;

.field private reasserting:Z

.field private stateErrLogged:Z

.field private stateInGame:Z

.field private statePath:Ljava/lang/String;

.field private statePath2:Ljava/lang/String;

.field private stateShown:Z

.field private wheelAcc:F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 484
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>(Landroid/view/Window$Callback;Landroid/app/Activity;)V
    .locals 2

    .line 614
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 489
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lmodmenu/InputBridge;->installedAt:J

    .line 504
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lmodmenu/InputBridge;->pIds:[I

    .line 537
    new-instance v0, Lmodmenu/InputBridge$1;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$1;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->moveHold:Ljava/lang/Runnable;

    .line 556
    new-instance v0, Lmodmenu/InputBridge$2;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$2;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->probeBatch:Ljava/lang/Runnable;

    .line 575
    new-instance v0, Lmodmenu/InputBridge$3;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$3;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    .line 581
    new-instance v0, Lmodmenu/InputBridge$4;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$4;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->clickEnd:Ljava/lang/Runnable;

    .line 587
    new-instance v0, Lmodmenu/InputBridge$5;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$5;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->poll:Ljava/lang/Runnable;

    .line 1129
    new-instance v0, Lmodmenu/InputBridge$6;

    invoke-direct {v0, p0}, Lmodmenu/InputBridge$6;-><init>(Lmodmenu/InputBridge;)V

    iput-object v0, p0, Lmodmenu/InputBridge;->captureListener:Landroid/view/View$OnCapturedPointerListener;

    .line 615
    iput-object p1, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    .line 616
    iput-object p2, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    .line 617
    return-void
.end method

.method static synthetic access$000(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 93
    iget-boolean p0, p0, Lmodmenu/InputBridge;->stateInGame:Z

    return p0
.end method

.method static synthetic access$100(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 93
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mvF:Z

    return p0
.end method

.method static synthetic access$1000(Lmodmenu/InputBridge;)Ljava/lang/String;
    .locals 0

    .line 93
    invoke-direct {p0}, Lmodmenu/InputBridge;->probeB()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1100(Lmodmenu/InputBridge;J)V
    .locals 0

    .line 93
    invoke-direct {p0, p1, p2}, Lmodmenu/InputBridge;->endLook(J)V

    return-void
.end method

.method static synthetic access$1200(Lmodmenu/InputBridge;J)V
    .locals 0

    .line 93
    invoke-direct {p0, p1, p2}, Lmodmenu/InputBridge;->releaseClick(J)V

    return-void
.end method

.method static synthetic access$1300(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 93
    iget-boolean p0, p0, Lmodmenu/InputBridge;->polling:Z

    return p0
.end method

.method static synthetic access$1400(Lmodmenu/InputBridge;)Landroid/app/Activity;
    .locals 0

    .line 93
    iget-object p0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$1500(Lmodmenu/InputBridge;)V
    .locals 0

    .line 93
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    return-void
.end method

.method static synthetic access$1600(Lmodmenu/InputBridge;)V
    .locals 0

    .line 93
    invoke-direct {p0}, Lmodmenu/InputBridge;->clearMovement()V

    return-void
.end method

.method static synthetic access$1700(Lmodmenu/InputBridge;)J
    .locals 2

    .line 93
    iget-wide v0, p0, Lmodmenu/InputBridge;->installedAt:J

    return-wide v0
.end method

.method static synthetic access$1800(Lmodmenu/InputBridge;)Lcom/minitech/player/AppPlayer;
    .locals 0

    .line 93
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1900(Lmodmenu/InputBridge;)V
    .locals 0

    .line 93
    invoke-direct {p0}, Lmodmenu/InputBridge;->pollState()V

    return-void
.end method

.method static synthetic access$200(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 93
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mvB:Z

    return p0
.end method

.method static synthetic access$2000(Lmodmenu/InputBridge;Ljava/lang/String;ILandroid/view/MotionEvent;)V
    .locals 0

    .line 93
    invoke-direct {p0, p1, p2, p3}, Lmodmenu/InputBridge;->logCrosshairIn(Ljava/lang/String;ILandroid/view/MotionEvent;)V

    return-void
.end method

.method static synthetic access$2100(Lmodmenu/InputBridge;Landroid/view/MotionEvent;)V
    .locals 0

    .line 93
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookByRel(Landroid/view/MotionEvent;)V

    return-void
.end method

.method static synthetic access$2200(Lmodmenu/InputBridge;JZ)V
    .locals 0

    .line 93
    invoke-direct {p0, p1, p2, p3}, Lmodmenu/InputBridge;->centerTouch(JZ)V

    return-void
.end method

.method static synthetic access$2300(Lmodmenu/InputBridge;Landroid/view/MotionEvent;)V
    .locals 0

    .line 93
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->handleWheel(Landroid/view/MotionEvent;)V

    return-void
.end method

.method static synthetic access$300(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 93
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mvL:Z

    return p0
.end method

.method static synthetic access$400(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 93
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mvR:Z

    return p0
.end method

.method static synthetic access$500(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 93
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mvJ:Z

    return p0
.end method

.method static synthetic access$600(Lmodmenu/InputBridge;)Z
    .locals 0

    .line 93
    iget-boolean p0, p0, Lmodmenu/InputBridge;->mvS:Z

    return p0
.end method

.method static synthetic access$702(Lmodmenu/InputBridge;Z)Z
    .locals 0

    .line 93
    iput-boolean p1, p0, Lmodmenu/InputBridge;->reasserting:Z

    return p1
.end method

.method static synthetic access$800(Lmodmenu/InputBridge;ZZ)V
    .locals 0

    .line 93
    invoke-direct {p0, p1, p2}, Lmodmenu/InputBridge;->fireMovement(ZZ)V

    return-void
.end method

.method static synthetic access$900()Landroid/os/Handler;
    .locals 1

    .line 93
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method private armMoveReassert()V
    .locals 4

    .line 804
    iget-boolean v0, p0, Lmodmenu/InputBridge;->reasserting:Z

    if-nez v0, :cond_1

    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lmodmenu/InputBridge;->stateInGame:Z

    if-nez v0, :cond_0

    goto :goto_0

    .line 807
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmodmenu/InputBridge;->reasserting:Z

    .line 808
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->moveHold:Ljava/lang/Runnable;

    const-wide/16 v2, 0x3c

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 809
    return-void

    .line 805
    :cond_1
    :goto_0
    return-void
.end method

.method private asFinger(Landroid/view/MotionEvent;Z)Landroid/view/MotionEvent;
    .locals 18

    .line 1096
    move-object/from16 v0, p1

    :try_start_0
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v7

    .line 1097
    new-array v8, v7, [Landroid/view/MotionEvent$PointerProperties;

    .line 1099
    new-array v9, v7, [Landroid/view/MotionEvent$PointerCoords;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    .line 1100
    move-object/from16 v1, p0

    :try_start_1
    iget-object v2, v1, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 1101
    const/4 v3, 0x0

    :goto_0
    if-ge v3, v7, :cond_3

    .line 1102
    new-instance v4, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 1103
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, v4, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 1104
    const/4 v5, 0x1

    iput v5, v4, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 1105
    aput-object v4, v8, v3

    .line 1106
    new-instance v4, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 1107
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

    .line 1108
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

    .line 1109
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

    .line 1110
    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->getSize(I)F

    move-result v5

    iput v5, v4, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 1111
    aput-object v4, v9, v3

    .line 1101
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1113
    :cond_3
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v2

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    .line 1114
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v10

    .line 1115
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getXPrecision()F

    move-result v12

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getYPrecision()F

    move-result v13

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v14

    .line 1116
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v15

    invoke-virtual {v0}, Landroid/view/MotionEvent;->getFlags()I

    move-result v17

    .line 1113
    const/4 v11, 0x0

    const/16 v16, 0x1002

    invoke-static/range {v2 .. v17}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    .line 1117
    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    move-object/from16 v1, p0

    .line 1118
    :goto_4
    const/4 v0, 0x0

    return-object v0
.end method

.method private centerTouch(JZ)V
    .locals 2

    .line 1486
    if-eqz p3, :cond_1

    .line 1487
    iget-boolean p3, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    if-eqz p3, :cond_0

    .line 1488
    return-void

    .line 1490
    :cond_0
    iget-object p3, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {p3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p3

    .line 1491
    iget v0, p3, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iput v0, p0, Lmodmenu/InputBridge;->clickX:F

    .line 1492
    iget p3, p3, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float p3, p3

    div-float/2addr p3, v1

    iput p3, p0, Lmodmenu/InputBridge;->clickY:F

    .line 1493
    const/4 p3, 0x1

    iput-boolean p3, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    .line 1494
    invoke-direct {p0, p3, p1, p2}, Lmodmenu/InputBridge;->ptrDown(IJ)V

    .line 1495
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object p2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1496
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object p2, p0, Lmodmenu/InputBridge;->clickEnd:Ljava/lang/Runnable;

    const-wide/16 v0, 0x2bc

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1497
    const-string p1, "MWInput"

    const-string p2, "center-touch down"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1498
    goto :goto_0

    .line 1499
    :cond_1
    invoke-direct {p0, p1, p2}, Lmodmenu/InputBridge;->releaseClick(J)V

    .line 1501
    :goto_0
    return-void
.end method

.method private clearMovement()V
    .locals 1

    .line 812
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmodmenu/InputBridge;->mvS:Z

    iput-boolean v0, p0, Lmodmenu/InputBridge;->mvJ:Z

    iput-boolean v0, p0, Lmodmenu/InputBridge;->mvR:Z

    iput-boolean v0, p0, Lmodmenu/InputBridge;->mvL:Z

    iput-boolean v0, p0, Lmodmenu/InputBridge;->mvB:Z

    iput-boolean v0, p0, Lmodmenu/InputBridge;->mvF:Z

    .line 813
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->fireMovement(Z)V

    .line 814
    return-void
.end method

.method private enableKeyBinds()V
    .locals 8

    .line 706
    const-string v0, "MWInput"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 707
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

    .line 710
    :cond_0
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastEnable:J

    .line 712
    :try_start_0
    const-string v1, "(function() pcall(function() local names={\"GameSettingsMgr\",\"GameSettings\"} for i=1,#names do local t=_G[names[i]] if t~=nil then local ok,fn=pcall(function() return t.enableAllKeyBind end) if ok and type(fn)==\"function\" and pcall(function() t:enableAllKeyBind() end) then return end end end local ok,ci=pcall(GetClientInfo) if ok and ci~=nil then pcall(function() ci:enableAllKeyBind() end) end end) end)"

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 713
    const-string v1, "keybind-on fired"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 714
    sget-boolean v1, Lmodmenu/InputBridge;->probed:Z

    if-nez v1, :cond_1

    .line 715
    const/4 v1, 0x1

    sput-boolean v1, Lmodmenu/InputBridge;->probed:Z

    .line 720
    sget-object v1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v2, p0, Lmodmenu/InputBridge;->probeBatch:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 724
    :cond_1
    goto :goto_0

    .line 722
    :catch_0
    move-exception v1

    .line 723
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

    .line 725
    :goto_0
    return-void

    .line 708
    :cond_2
    :goto_1
    return-void
.end method

.method private endLook(J)V
    .locals 2

    .line 1617
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1618
    iget-boolean v0, p0, Lmodmenu/InputBridge;->looking:Z

    if-nez v0, :cond_0

    .line 1619
    return-void

    .line 1621
    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lmodmenu/InputBridge;->ptrUp(IJ)V

    .line 1622
    iput-boolean v0, p0, Lmodmenu/InputBridge;->looking:Z

    .line 1623
    const-string p1, "MWInput"

    const-string p2, "look up"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1624
    return-void
.end method

.method private fireHotbar(I)V
    .locals 7

    .line 839
    const-string v0, "MWInput"

    iget-boolean v1, p0, Lmodmenu/InputBridge;->hotbarReported:Z

    .line 841
    :try_start_0
    const-string v2, "(function(d,rep) local p=nil pcall(function() p=CurMainPlayer end) if p==nil then pcall(function() p=ClientCurGame:getMainPlayer() end) end if p==nil then if rep==1 then error(\'MWP9|pl=no\',0) end return end local ok1,s=pcall(function() return p:getCurShortcut() end) if not ok1 or type(s)~=\'number\' then if rep==1 then error(\'MWP9|get=no\',0) end return end local path=\'none\' local nav=(d>0) and \'keyBindShortcutRight\' or \'keyBindShortcutLeft\' local nh={p,_G} pcall(function() local g=GetGameInfo() if g~=nil then nh[#nh+1]=g end end) for i=1,#nh do local okf,f=pcall(function() return nh[i][nav] end) if okf and type(f)==\'function\' then pcall(function() return f(nh[i]) end) local s2=nil pcall(function() s2=p:getCurShortcut() end) if type(s2)==\'number\' and s2~=s then path=\'nav->\'..s2 break end end end if path==\'none\' then local gh={p} pcall(function() local c=p:getContainer() if c~=nil then gh[#gh+1]=c end end) pcall(function() local c=GetClientInfo() if c~=nil then gh[#gh+1]=c end end) pcall(function() local c=ClientCurGame if c~=nil then gh[#gh+1]=c end end) for i=1,#gh do local okg,gc=pcall(function() return gh[i]:getShortcutGridCount() end) if okg and type(gc)==\'number\' and gc>0 then local lo=(s>=1000) and 1000 or 0 local n=((s-lo+d)%gc)+lo local ok4=pcall(function() p:setCurShortcut(n) end) local rb=nil pcall(function() rb=p:getCurShortcut() end) if rb==nil or rb==s then local okst,st=pcall(function() return p:getShortcutStartIndex() end) if okst and type(st)==\'number\' and st>0 then pcall(function() p:setCurShortcut(st+n) end) pcall(function() rb=p:getCurShortcut() end) end end path=\'grid,gc=\'..gc..\'->\'..n..\' set=\'..tostring(ok4) ..\' rb=\'..tostring(rb) break end end if path==\'none\' then local ok2,st=pcall(function() return p:getShortcutStartIndex() end) local ok3,cn=pcall(function() return p:getCurShortcutItemNum() end) st=(ok2 and type(st)==\'number\') and st or 1 cn=(ok3 and type(cn)==\'number\' and cn>0) and cn or 9 local n=s+d if n<st then n=st+cn-1 elseif n>=st+cn then n=st end local ok4,e4=pcall(function() p:setCurShortcut(n) end) path=\'legacy,st=\'..st..\',cn=\'..cn..\'->\'..n ..\' set=\'..tostring(ok4)..\',\'..tostring(e4):sub(1,40) end end if rep==1 then error(\'MWP9|s=\'..s..\' path=\'..path,0) end end)"

    .line 842
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

    .line 841
    invoke-static {v2, v6}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 843
    iput-boolean v5, p0, Lmodmenu/InputBridge;->hotbarReported:Z

    .line 844
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

    .line 847
    goto :goto_1

    .line 845
    :catch_0
    move-exception p1

    .line 846
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

    .line 848
    :goto_1
    return-void
.end method

.method private fireMovement(Z)V
    .locals 1

    .line 772
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lmodmenu/InputBridge;->fireMovement(ZZ)V

    .line 773
    return-void
.end method

.method private fireMovement(ZZ)V
    .locals 9

    .line 782
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

    .line 783
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

    .line 784
    :goto_1
    iget-boolean v4, p0, Lmodmenu/InputBridge;->mvJ:Z

    if-eqz v4, :cond_4

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_2

    :cond_4
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 785
    :goto_2
    iget-boolean v5, p0, Lmodmenu/InputBridge;->mvS:Z

    if-eqz v5, :cond_5

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_3

    :cond_5
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 787
    :goto_3
    :try_start_0
    const-string v6, "(function(fw,st,jp,sk,rep) local p=nil pcall(function() p=CurMainPlayer end) if p==nil then pcall(function() p=ClientCurGame:getMainPlayer() end) end if p==nil then if rep==1 then error(\'MWP8|pl=no\',0) end return end local ok1,e1=pcall(function() p:setMoveForward(fw) end) local ok2=pcall(function() p:setMoveStrafing(st) end) local ok3=pcall(function() p:setJumping(jp) end) local ok4=pcall(function() p:setSneaking(sk) end) if rep==1 then error(\'MWP8|mf=\'..tostring(ok1)..\',\'..tostring(e1):sub(1,60) ..\' ms=\'..tostring(ok2)..\' mj=\'..tostring(ok3) ..\' mk=\'..tostring(ok4),0) end end)"

    .line 788
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

    .line 787
    invoke-static {v6, v8}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 789
    if-nez p2, :cond_7

    .line 790
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

    .line 799
    :cond_7
    goto :goto_5

    .line 793
    :catch_0
    move-exception p1

    .line 794
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 795
    if-eqz p2, :cond_8

    iget-wide v3, p0, Lmodmenu/InputBridge;->lastMoveFail:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x3e8

    cmp-long p2, v3, v5

    if-lez p2, :cond_9

    .line 796
    :cond_8
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastMoveFail:J

    .line 797
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "move failed: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 800
    :cond_9
    :goto_5
    return-void
.end method

.method private handleWheel(Landroid/view/MotionEvent;)V
    .locals 2

    .line 820
    iget-boolean v0, p0, Lmodmenu/InputBridge;->stateInGame:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lmodmenu/InputBridge;->stateShown:Z

    if-eqz v0, :cond_0

    goto :goto_2

    .line 823
    :cond_0
    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result p1

    .line 824
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_1

    .line 825
    return-void

    .line 827
    :cond_1
    iget v0, p0, Lmodmenu/InputBridge;->wheelAcc:F

    add-float/2addr v0, p1

    iput v0, p0, Lmodmenu/InputBridge;->wheelAcc:F

    .line 828
    :goto_0
    iget p1, p0, Lmodmenu/InputBridge;->wheelAcc:F

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_2

    .line 829
    iget p1, p0, Lmodmenu/InputBridge;->wheelAcc:F

    sub-float/2addr p1, v0

    iput p1, p0, Lmodmenu/InputBridge;->wheelAcc:F

    .line 830
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->fireHotbar(I)V

    goto :goto_0

    .line 832
    :cond_2
    :goto_1
    iget p1, p0, Lmodmenu/InputBridge;->wheelAcc:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpg-float p1, p1, v1

    if-gtz p1, :cond_3

    .line 833
    iget p1, p0, Lmodmenu/InputBridge;->wheelAcc:F

    add-float/2addr p1, v0

    iput p1, p0, Lmodmenu/InputBridge;->wheelAcc:F

    .line 834
    const/4 p1, -0x1

    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->fireHotbar(I)V

    goto :goto_1

    .line 836
    :cond_3
    return-void

    .line 821
    :cond_4
    :goto_2
    return-void
.end method

.method public static install(Landroid/app/Activity;)V
    .locals 3

    .line 621
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 622
    invoke-virtual {v0}, Landroid/view/Window;->getCallback()Landroid/view/Window$Callback;

    move-result-object v1

    .line 623
    if-eqz v1, :cond_1

    instance-of v2, v1, Lmodmenu/InputBridge;

    if-eqz v2, :cond_0

    goto :goto_0

    .line 626
    :cond_0
    new-instance v2, Lmodmenu/InputBridge;

    invoke-direct {v2, v1, p0}, Lmodmenu/InputBridge;-><init>(Landroid/view/Window$Callback;Landroid/app/Activity;)V

    .line 627
    invoke-virtual {v0, v2}, Landroid/view/Window;->setCallback(Landroid/view/Window$Callback;)V

    .line 628
    invoke-direct {v2}, Lmodmenu/InputBridge;->startPoll()V

    .line 629
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

    .line 630
    return-void

    .line 624
    :cond_1
    :goto_0
    return-void
.end method

.method private static keepAndroid(I)Z
    .locals 0

    .line 671
    sparse-switch p0, :sswitch_data_0

    .line 695
    const/4 p0, 0x0

    return p0

    .line 693
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

    .line 990
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    if-nez v0, :cond_0

    .line 991
    return-void

    .line 993
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 994
    iget-wide v2, p0, Lmodmenu/InputBridge;->lastInLog:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x190

    cmp-long v6, v2, v4

    if-gtz v6, :cond_1

    .line 995
    return-void

    .line 997
    :cond_1
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastInLog:J

    .line 998
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

    .line 999
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

    .line 998
    const-string p2, "MWInput"

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1000
    return-void
.end method

.method private lookBy(Landroid/view/MotionEvent;)V
    .locals 8

    .line 1530
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 1531
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    .line 1532
    iget-boolean v2, p0, Lmodmenu/InputBridge;->primed:Z

    if-nez v2, :cond_1

    .line 1533
    const/4 p1, 0x1

    iput-boolean p1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 1534
    iput v0, p0, Lmodmenu/InputBridge;->lastX:F

    .line 1535
    iput v1, p0, Lmodmenu/InputBridge;->lastY:F

    .line 1536
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    .line 1537
    iget-wide v4, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v4, v2, v4

    const-wide/16 v6, 0x1f4

    cmp-long p1, v4, v6

    if-lez p1, :cond_0

    .line 1538
    iput-wide v2, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 1539
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

    .line 1541
    :cond_0
    return-void

    .line 1543
    :cond_1
    iget v2, p0, Lmodmenu/InputBridge;->lastX:F

    sub-float v2, v0, v2

    .line 1544
    iget v3, p0, Lmodmenu/InputBridge;->lastY:F

    sub-float v3, v1, v3

    .line 1545
    iput v0, p0, Lmodmenu/InputBridge;->lastX:F

    .line 1546
    iput v1, p0, Lmodmenu/InputBridge;->lastY:F

    .line 1547
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-direct {p0, v2, v3, v0, v1}, Lmodmenu/InputBridge;->lookMove(FFJ)V

    .line 1548
    return-void
.end method

.method private lookByRel(Landroid/view/MotionEvent;)V
    .locals 6

    .line 1552
    iget-boolean v0, p0, Lmodmenu/InputBridge;->primed:Z

    if-nez v0, :cond_0

    .line 1553
    const/4 p1, 0x1

    iput-boolean p1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 1554
    return-void

    .line 1556
    :cond_0
    nop

    .line 1557
    nop

    .line 1558
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getHistorySize()I

    move-result v0

    .line 1559
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v0, :cond_1

    .line 1560
    invoke-virtual {p1, v2, v4}, Landroid/view/MotionEvent;->getHistoricalX(II)F

    move-result v5

    add-float/2addr v1, v5

    .line 1561
    invoke-virtual {p1, v2, v4}, Landroid/view/MotionEvent;->getHistoricalY(II)F

    move-result v5

    add-float/2addr v3, v5

    .line 1559
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 1563
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    add-float/2addr v1, v0

    .line 1564
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    add-float/2addr v3, v0

    .line 1565
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    invoke-direct {p0, v1, v3, v4, v5}, Lmodmenu/InputBridge;->lookMove(FFJ)V

    .line 1566
    return-void
.end method

.method private lookMove(FFJ)V
    .locals 9

    .line 1569
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1570
    const-string v2, " dy="

    const-wide/16 v3, 0x1f4

    const-string v5, "MWInput"

    const/4 v6, 0x0

    cmpl-float v7, p1, v6

    if-nez v7, :cond_1

    cmpl-float v6, p2, v6

    if-nez v6, :cond_1

    .line 1571
    iget-wide p3, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    sub-long p3, v0, p3

    cmp-long v6, p3, v3

    if-lez v6, :cond_0

    .line 1572
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    .line 1573
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

    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1575
    :cond_0
    return-void

    .line 1577
    :cond_1
    iget-wide v6, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    sub-long v6, v0, v6

    cmp-long v8, v6, v3

    if-lez v8, :cond_2

    .line 1578
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastDeltaLog:J

    .line 1579
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

    invoke-static {v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1581
    :cond_2
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 1582
    iget-boolean v1, p0, Lmodmenu/InputBridge;->looking:Z

    const/4 v2, 0x0

    const/high16 v3, 0x40000000    # 2.0f

    if-nez v1, :cond_3

    .line 1583
    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v3

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 1584
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    div-float/2addr v1, v3

    iput v1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 1585
    const/4 v1, 0x1

    iput-boolean v1, p0, Lmodmenu/InputBridge;->looking:Z

    .line 1586
    invoke-direct {p0, v2, p3, p4}, Lmodmenu/InputBridge;->ptrDown(IJ)V

    .line 1587
    const-string v1, "look down"

    invoke-static {v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1589
    :cond_3
    iget v1, p0, Lmodmenu/InputBridge;->lookX:F

    add-float/2addr v1, p1

    iput v1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 1590
    iget p1, p0, Lmodmenu/InputBridge;->lookY:F

    add-float/2addr p1, p2

    iput p1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 1591
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

    .line 1593
    :cond_4
    invoke-direct {p0, v2, p3, p4}, Lmodmenu/InputBridge;->ptrUp(IJ)V

    .line 1594
    iget p1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p1, p1

    div-float/2addr p1, v3

    iput p1, p0, Lmodmenu/InputBridge;->lookX:F

    .line 1595
    iget p1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float p1, p1

    div-float/2addr p1, v3

    iput p1, p0, Lmodmenu/InputBridge;->lookY:F

    .line 1596
    invoke-direct {p0, v2, p3, p4}, Lmodmenu/InputBridge;->ptrDown(IJ)V

    .line 1598
    :cond_5
    invoke-direct {p0, p3, p4}, Lmodmenu/InputBridge;->ptrMove(J)V

    .line 1599
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    if-nez p1, :cond_7

    .line 1600
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object p2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1609
    iget-boolean p1, p0, Lmodmenu/InputBridge;->stateInGame:Z

    if-eqz p1, :cond_6

    iget-boolean p1, p0, Lmodmenu/InputBridge;->stateShown:Z

    if-eqz p1, :cond_7

    .line 1610
    :cond_6
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object p2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    const-wide/16 p3, 0x78

    invoke-virtual {p1, p2, p3, p4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1613
    :cond_7
    return-void
.end method

.method private static luaStr(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1457
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

    .line 735
    const/4 v0, 0x1

    const/4 v1, 0x0

    sparse-switch p1, :sswitch_data_0

    .line 762
    return v1

    .line 753
    :sswitch_0
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mvJ:Z

    if-ne p1, p2, :cond_0

    return v1

    .line 754
    :cond_0
    iput-boolean p2, p0, Lmodmenu/InputBridge;->mvJ:Z

    .line 755
    return v0

    .line 758
    :sswitch_1
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mvS:Z

    if-ne p1, p2, :cond_1

    return v1

    .line 759
    :cond_1
    iput-boolean p2, p0, Lmodmenu/InputBridge;->mvS:Z

    .line 760
    return v0

    .line 737
    :sswitch_2
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mvF:Z

    if-ne p1, p2, :cond_2

    return v1

    .line 738
    :cond_2
    iput-boolean p2, p0, Lmodmenu/InputBridge;->mvF:Z

    .line 739
    return v0

    .line 741
    :sswitch_3
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mvB:Z

    if-ne p1, p2, :cond_3

    return v1

    .line 742
    :cond_3
    iput-boolean p2, p0, Lmodmenu/InputBridge;->mvB:Z

    .line 743
    return v0

    .line 749
    :sswitch_4
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mvR:Z

    if-ne p1, p2, :cond_4

    return v1

    .line 750
    :cond_4
    iput-boolean p2, p0, Lmodmenu/InputBridge;->mvR:Z

    .line 751
    return v0

    .line 745
    :sswitch_5
    iget-boolean p1, p0, Lmodmenu/InputBridge;->mvL:Z

    if-ne p1, p2, :cond_5

    return v1

    .line 746
    :cond_5
    iput-boolean p2, p0, Lmodmenu/InputBridge;->mvL:Z

    .line 747
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

    .line 659
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    instance-of v0, v0, Lorg/appplay/lib/GameBaseActivity;

    if-nez v0, :cond_0

    .line 660
    const/4 v0, 0x0

    return-object v0

    .line 662
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    check-cast v0, Lorg/appplay/lib/GameBaseActivity;

    iget-object v0, v0, Lorg/appplay/lib/GameBaseActivity;->m_AppPlayer:Lcom/minitech/player/AppPlayer;

    return-object v0
.end method

.method private pollState()V
    .locals 8

    .line 1239
    const-string v0, "MWInput"

    iget-object v1, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    if-nez v1, :cond_0

    invoke-direct {p0}, Lmodmenu/InputBridge;->resolvePaths()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1240
    return-void

    .line 1243
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

    .line 1250
    nop

    .line 1251
    iget-object v2, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    invoke-static {v2}, Lmodmenu/InputBridge;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1252
    if-nez v2, :cond_1

    iget-object v4, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 1253
    iget-object v2, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    invoke-static {v2}, Lmodmenu/InputBridge;->readFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1255
    :cond_1
    if-eqz v2, :cond_9

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x2

    if-ge v4, v5, :cond_2

    goto/16 :goto_3

    .line 1258
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

    .line 1259
    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v5, :cond_4

    const/4 v6, 0x1

    goto :goto_1

    :cond_4
    const/4 v6, 0x0

    .line 1260
    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v5, :cond_5

    goto :goto_2

    :cond_5
    const/4 v1, 0x0

    .line 1261
    :goto_2
    iget-boolean v3, p0, Lmodmenu/InputBridge;->stateInGame:Z

    if-eq v6, v3, :cond_6

    .line 1262
    iput-boolean v6, p0, Lmodmenu/InputBridge;->stateInGame:Z

    .line 1263
    if-nez v6, :cond_6

    .line 1264
    invoke-direct {p0}, Lmodmenu/InputBridge;->clearMovement()V

    .line 1267
    :cond_6
    iget-boolean v3, p0, Lmodmenu/InputBridge;->stateShown:Z

    if-eq v1, v3, :cond_7

    .line 1268
    iput-boolean v1, p0, Lmodmenu/InputBridge;->stateShown:Z

    .line 1269
    if-eqz v1, :cond_7

    .line 1272
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    .line 1273
    invoke-direct {p0, v5, v6}, Lmodmenu/InputBridge;->endLook(J)V

    .line 1274
    invoke-direct {p0, v5, v6}, Lmodmenu/InputBridge;->releaseClick(J)V

    .line 1275
    const-string v1, "settings frame open: pointers closed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1278
    :cond_7
    iget-boolean v1, p0, Lmodmenu/InputBridge;->lastInMap:Z

    if-ne v4, v1, :cond_8

    .line 1279
    return-void

    .line 1281
    :cond_8
    iput-boolean v4, p0, Lmodmenu/InputBridge;->lastInMap:Z

    .line 1282
    iget-object v1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-static {v1, v4}, Lmodmenu/ModMenu;->setCrosshair(Landroid/content/Context;Z)V

    .line 1283
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 1284
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

    .line 1285
    return-void

    .line 1256
    :cond_9
    :goto_3
    return-void

    .line 1244
    :catch_0
    move-exception v2

    .line 1245
    iget-boolean v3, p0, Lmodmenu/InputBridge;->stateErrLogged:Z

    if-nez v3, :cond_a

    .line 1246
    iput-boolean v1, p0, Lmodmenu/InputBridge;->stateErrLogged:Z

    .line 1247
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

    .line 1249
    :cond_a
    return-void
.end method

.method private probeB()Ljava/lang/String;
    .locals 4

    .line 1356
    iget-object v0, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 1357
    invoke-direct {p0}, Lmodmenu/InputBridge;->resolvePaths()Z

    .line 1359
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->probePath:Ljava/lang/String;

    invoke-static {v0}, Lmodmenu/InputBridge;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1360
    iget-object v1, p0, Lmodmenu/InputBridge;->probePath2:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lmodmenu/InputBridge;->probePath2:Ljava/lang/String;

    invoke-static {v1}, Lmodmenu/InputBridge;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    const-string v1, ""

    .line 1361
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

    .line 1668
    iget v0, p0, Lmodmenu/InputBridge;->pCount:I

    iget-object v1, p0, Lmodmenu/InputBridge;->pIds:[I

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 1669
    return-void

    .line 1671
    :cond_0
    iget v0, p0, Lmodmenu/InputBridge;->pCount:I

    .line 1672
    if-nez v0, :cond_1

    .line 1673
    iput-wide p2, p0, Lmodmenu/InputBridge;->gestureDown:J

    .line 1675
    :cond_1
    iget-object v1, p0, Lmodmenu/InputBridge;->pIds:[I

    iget v2, p0, Lmodmenu/InputBridge;->pCount:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lmodmenu/InputBridge;->pCount:I

    aput p1, v1, v2

    .line 1676
    if-nez v0, :cond_2

    const/4 p1, 0x0

    goto :goto_0

    .line 1678
    :cond_2
    shl-int/lit8 p1, v0, 0x8

    or-int/lit8 p1, p1, 0x5

    .line 1679
    :goto_0
    invoke-direct {p0, p1, p2, p3}, Lmodmenu/InputBridge;->ptrEvent(IJ)V

    .line 1680
    return-void
.end method

.method private ptrEvent(IJ)V
    .locals 17

    .line 1641
    move-object/from16 v0, p0

    iget v6, v0, Lmodmenu/InputBridge;->pCount:I

    .line 1642
    if-nez v6, :cond_0

    .line 1643
    return-void

    .line 1645
    :cond_0
    new-array v7, v6, [Landroid/view/MotionEvent$PointerProperties;

    .line 1647
    new-array v8, v6, [Landroid/view/MotionEvent$PointerCoords;

    .line 1648
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v6, :cond_1

    .line 1649
    new-instance v2, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v2}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    .line 1650
    iget-object v3, v0, Lmodmenu/InputBridge;->pIds:[I

    aget v3, v3, v1

    iput v3, v2, Landroid/view/MotionEvent$PointerProperties;->id:I

    .line 1651
    const/4 v3, 0x1

    iput v3, v2, Landroid/view/MotionEvent$PointerProperties;->toolType:I

    .line 1652
    aput-object v2, v7, v1

    .line 1653
    new-instance v2, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v2}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    .line 1654
    iget-object v3, v0, Lmodmenu/InputBridge;->pIds:[I

    aget v3, v3, v1

    invoke-direct {v0, v3}, Lmodmenu/InputBridge;->ptrX(I)F

    move-result v3

    iput v3, v2, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 1655
    iget-object v3, v0, Lmodmenu/InputBridge;->pIds:[I

    aget v3, v3, v1

    invoke-direct {v0, v3}, Lmodmenu/InputBridge;->ptrY(I)F

    move-result v3

    iput v3, v2, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 1656
    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, v2, Landroid/view/MotionEvent$PointerCoords;->pressure:F

    .line 1657
    const v3, 0x3d4ccccd    # 0.05f

    iput v3, v2, Landroid/view/MotionEvent$PointerCoords;->size:F

    .line 1658
    aput-object v2, v8, v1

    .line 1648
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1660
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

    .line 1663
    iget-object v2, v0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v2, v1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 1664
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 1665
    return-void
.end method

.method private ptrMove(J)V
    .locals 1

    .line 1710
    const/4 v0, 0x2

    invoke-direct {p0, v0, p1, p2}, Lmodmenu/InputBridge;->ptrEvent(IJ)V

    .line 1711
    return-void
.end method

.method private ptrUp(IJ)V
    .locals 2

    .line 1683
    nop

    .line 1684
    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lmodmenu/InputBridge;->pCount:I

    if-ge v0, v1, :cond_1

    .line 1685
    iget-object v1, p0, Lmodmenu/InputBridge;->pIds:[I

    aget v1, v1, v0

    if-ne v1, p1, :cond_0

    .line 1686
    nop

    .line 1687
    goto :goto_1

    .line 1684
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    .line 1690
    :goto_1
    if-gez v0, :cond_2

    .line 1691
    return-void

    .line 1693
    :cond_2
    iget p1, p0, Lmodmenu/InputBridge;->pCount:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_3

    const/4 p1, 0x1

    goto :goto_2

    .line 1695
    :cond_3
    shl-int/lit8 p1, v0, 0x8

    or-int/lit8 p1, p1, 0x6

    .line 1696
    :goto_2
    invoke-direct {p0, p1, p2, p3}, Lmodmenu/InputBridge;->ptrEvent(IJ)V

    .line 1697
    nop

    :goto_3
    iget p1, p0, Lmodmenu/InputBridge;->pCount:I

    sub-int/2addr p1, v1

    if-ge v0, p1, :cond_4

    .line 1698
    iget-object p1, p0, Lmodmenu/InputBridge;->pIds:[I

    iget-object p2, p0, Lmodmenu/InputBridge;->pIds:[I

    add-int/lit8 p3, v0, 0x1

    aget p2, p2, p3

    aput p2, p1, v0

    .line 1697
    move v0, p3

    goto :goto_3

    .line 1700
    :cond_4
    iget p1, p0, Lmodmenu/InputBridge;->pCount:I

    sub-int/2addr p1, v1

    iput p1, p0, Lmodmenu/InputBridge;->pCount:I

    .line 1701
    iget p1, p0, Lmodmenu/InputBridge;->pCount:I

    if-nez p1, :cond_5

    .line 1705
    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lmodmenu/InputBridge;->gestureDown:J

    .line 1707
    :cond_5
    return-void
.end method

.method private ptrX(I)F
    .locals 0

    .line 1632
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

    .line 1636
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

    .line 1461
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 1462
    return-object v0

    .line 1465
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1467
    const/16 p0, 0x20

    :try_start_1
    new-array p0, p0, [B

    .line 1468
    invoke-virtual {v1, p0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 1469
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

    .line 1471
    :goto_0
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 1469
    return-object v3

    .line 1471
    :catchall_0
    move-exception p0

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 1472
    throw p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 1473
    :catch_0
    move-exception p0

    .line 1474
    return-object v0
.end method

.method private releaseCapture(Landroid/view/View;)V
    .locals 2

    .line 1221
    invoke-virtual {p1}, Landroid/view/View;->releasePointerCapture()V

    .line 1222
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmodmenu/InputBridge;->captured:Z

    .line 1223
    iput-boolean p1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 1224
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1225
    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 1226
    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->releaseClick(J)V

    .line 1227
    const-string p1, "MWInput"

    const-string v0, "xh capture released"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1228
    return-void
.end method

.method private releaseClick(J)V
    .locals 2

    .line 1504
    iget-boolean v0, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    if-nez v0, :cond_0

    .line 1505
    return-void

    .line 1507
    :cond_0
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->clickEnd:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1508
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2}, Lmodmenu/InputBridge;->ptrUp(IJ)V

    .line 1509
    const/4 p1, 0x0

    iput-boolean p1, p0, Lmodmenu/InputBridge;->mouseTouching:Z

    .line 1510
    iget-boolean p1, p0, Lmodmenu/InputBridge;->looking:Z

    if-eqz p1, :cond_2

    .line 1511
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object p2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1512
    iget-boolean p1, p0, Lmodmenu/InputBridge;->stateInGame:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lmodmenu/InputBridge;->stateShown:Z

    if-eqz p1, :cond_2

    .line 1513
    :cond_1
    sget-object p1, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object p2, p0, Lmodmenu/InputBridge;->lookEnd:Ljava/lang/Runnable;

    const-wide/16 v0, 0x78

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1516
    :cond_2
    const-string p1, "MWInput"

    const-string p2, "center-touch up"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1517
    return-void
.end method

.method private resolvePaths()Z
    .locals 6

    .line 1297
    const-string v0, "mw_probe.txt"

    const-string v1, "mw_state.txt"

    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 1298
    iget-object v4, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getFilesDir()Ljava/io/File;

    move-result-object v4

    .line 1299
    if-nez v4, :cond_0

    .line 1300
    return v2

    .line 1302
    :cond_0
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    .line 1303
    if-eqz v3, :cond_1

    .line 1304
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 1305
    :cond_1
    iget-object v1, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    :goto_0
    iput-object v1, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    .line 1308
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v4, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lmodmenu/InputBridge;->probePath2:Ljava/lang/String;

    .line 1309
    if-eqz v3, :cond_2

    .line 1310
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 1311
    :cond_2
    iget-object v0, p0, Lmodmenu/InputBridge;->probePath2:Ljava/lang/String;

    :goto_1
    iput-object v0, p0, Lmodmenu/InputBridge;->probePath:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1312
    const/4 v0, 0x1

    return v0

    .line 1313
    :catch_0
    move-exception v0

    .line 1314
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

    .line 1315
    return v2
.end method

.method private startPoll()V
    .locals 4

    .line 1288
    iget-boolean v0, p0, Lmodmenu/InputBridge;->polling:Z

    if-eqz v0, :cond_0

    .line 1289
    return-void

    .line 1291
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lmodmenu/InputBridge;->polling:Z

    .line 1292
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->poll:Ljava/lang/Runnable;

    const-wide/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1293
    return-void
.end method

.method private stateScript()Ljava/lang/String;
    .locals 4

    .line 1321
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(function() local ing,shown=false,false pcall(function() ing=(ClientCurGame and ClientCurGame.isInGame and ClientCurGame:isInGame()) and true or false end) pcall(function() local fr=getglobal(\'GameSetFrame\') shown=(fr and fr.IsShown and fr:IsShown()) and true or false end) local data=(ing and \'1\' or \'0\')..(shown and \'1\' or \'0\') local function w(p) local ok,fh=pcall(function() return io.open(p,\'w\') end) if ok and fh then pcall(function() fh:write(data) end) pcall(function() fh:close() end) end end w(\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    .line 1338
    invoke-static {v1}, Lmodmenu/InputBridge;->luaStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\')"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1339
    iget-object v2, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lmodmenu/InputBridge;->statePath2:Ljava/lang/String;

    iget-object v3, p0, Lmodmenu/InputBridge;->statePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1340
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

    .line 1321
    return-object v0
.end method

.method private syncCrosshair()V
    .locals 8

    .line 1191
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    .line 1192
    return-void

    .line 1194
    :cond_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 1195
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/minitech/player/AppPlayer;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1196
    :goto_0
    if-nez v0, :cond_2

    .line 1197
    return-void

    .line 1199
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 1200
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v3

    .line 1209
    iget-boolean v4, p0, Lmodmenu/InputBridge;->captured:Z

    .line 1200
    if-eqz v3, :cond_3

    .line 1201
    if-nez v4, :cond_5

    iget-wide v3, p0, Lmodmenu/InputBridge;->lastCaptureReq:J

    sub-long v3, v1, v3

    const-wide/16 v5, 0x5dc

    cmp-long v7, v3, v5

    if-lez v7, :cond_5

    .line 1202
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastCaptureReq:J

    .line 1203
    const/4 v1, 0x1

    iput-boolean v1, p0, Lmodmenu/InputBridge;->captured:Z

    .line 1204
    const/4 v1, 0x0

    iput-boolean v1, p0, Lmodmenu/InputBridge;->primed:Z

    .line 1205
    iget-object v1, p0, Lmodmenu/InputBridge;->captureListener:Landroid/view/View$OnCapturedPointerListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnCapturedPointerListener(Landroid/view/View$OnCapturedPointerListener;)V

    .line 1206
    invoke-virtual {v0}, Landroid/view/View;->requestPointerCapture()V

    .line 1207
    const-string v0, "MWInput"

    const-string v1, "xh capture requested"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 1209
    :cond_3
    if-eqz v4, :cond_4

    .line 1210
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->releaseCapture(Landroid/view/View;)V

    goto :goto_1

    .line 1215
    :cond_4
    invoke-direct {p0, v1, v2}, Lmodmenu/InputBridge;->endLook(J)V

    .line 1216
    invoke-direct {p0, v1, v2}, Lmodmenu/InputBridge;->releaseClick(J)V

    .line 1218
    :cond_5
    :goto_1
    return-void
.end method

.method private static toAscii(I)I
    .locals 4

    .line 858
    const/16 v0, 0x1d

    if-lt p0, v0, :cond_0

    const/16 v1, 0x36

    if-gt p0, v1, :cond_0

    .line 859
    sub-int/2addr p0, v0

    add-int/lit8 p0, p0, 0x41

    return p0

    .line 861
    :cond_0
    const/16 v0, 0x10

    const/4 v1, 0x7

    if-lt p0, v1, :cond_1

    if-gt p0, v0, :cond_1

    .line 862
    sub-int/2addr p0, v1

    add-int/lit8 p0, p0, 0x30

    return p0

    .line 864
    :cond_1
    const/16 v1, 0x83

    if-lt p0, v1, :cond_2

    const/16 v2, 0x8e

    if-gt p0, v2, :cond_2

    .line 865
    sub-int/2addr p0, v1

    add-int/lit8 p0, p0, 0x70

    return p0

    .line 867
    :cond_2
    const/16 v1, 0x2d

    const/16 v2, 0x2e

    const/16 v3, 0x27

    sparse-switch p0, :sswitch_data_0

    .line 902
    const/4 p0, -0x1

    return p0

    .line 889
    :sswitch_0
    return v1

    .line 886
    :sswitch_1
    const/16 p0, 0x23

    return p0

    .line 885
    :sswitch_2
    const/16 p0, 0x24

    return p0

    .line 884
    :sswitch_3
    const/16 p0, 0x14

    return p0

    .line 881
    :sswitch_4
    const/16 p0, 0x11

    return p0

    .line 872
    :sswitch_5
    return v2

    .line 873
    :sswitch_6
    const/16 p0, 0x1b

    return p0

    .line 888
    :sswitch_7
    const/16 p0, 0x22

    return p0

    .line 887
    :sswitch_8
    const/16 p0, 0x21

    return p0

    .line 892
    :sswitch_9
    const/16 p0, 0x2f

    return p0

    .line 894
    :sswitch_a
    return v3

    .line 893
    :sswitch_b
    const/16 p0, 0x3b

    return p0

    .line 899
    :sswitch_c
    const/16 p0, 0x5c

    return p0

    .line 898
    :sswitch_d
    const/16 p0, 0x5d

    return p0

    .line 897
    :sswitch_e
    const/16 p0, 0x5b

    return p0

    .line 896
    :sswitch_f
    const/16 p0, 0x3d

    return p0

    .line 895
    :sswitch_10
    return v1

    .line 900
    :sswitch_11
    const/16 p0, 0x60

    return p0

    .line 871
    :sswitch_12
    const/16 p0, 0x8

    return p0

    .line 869
    :sswitch_13
    const/16 p0, 0xd

    return p0

    .line 868
    :sswitch_14
    const/16 p0, 0x20

    return p0

    .line 870
    :sswitch_15
    const/16 p0, 0x9

    return p0

    .line 879
    :sswitch_16
    return v0

    .line 883
    :sswitch_17
    const/16 p0, 0x12

    return p0

    .line 891
    :sswitch_18
    return v2

    .line 890
    :sswitch_19
    const/16 p0, 0x2c

    return p0

    .line 877
    :sswitch_1a
    return v3

    .line 876
    :sswitch_1b
    const/16 p0, 0x25

    return p0

    .line 875
    :sswitch_1c
    const/16 p0, 0x28

    return p0

    .line 874
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

    .line 907
    new-instance v0, Landroid/view/KeyEvent;

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getDownTime()J

    move-result-wide v1

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v3

    .line 908
    invoke-virtual {p0}, Landroid/view/KeyEvent;->getAction()I

    move-result v5

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v7

    .line 909
    invoke-virtual {p0}, Landroid/view/KeyEvent;->getMetaState()I

    move-result v8

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v9

    invoke-virtual {p0}, Landroid/view/KeyEvent;->getScanCode()I

    move-result v10

    move v6, p1

    invoke-direct/range {v0 .. v10}, Landroid/view/KeyEvent;-><init>(JJIIIIII)V

    .line 907
    return-object v0
.end method


# virtual methods
.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 10

    .line 1004
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 1005
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v0

    const/4 v1, 0x2

    and-int/2addr v0, v1

    if-eqz v0, :cond_6

    .line 1006
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 1007
    const-string v2, "generic"

    invoke-direct {p0, v2, v0, p1}, Lmodmenu/InputBridge;->logCrosshairIn(Ljava/lang/String;ILandroid/view/MotionEvent;)V

    .line 1008
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v2

    .line 1009
    if-eqz v2, :cond_6

    .line 1010
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

    .line 1012
    :goto_0
    const-string v4, "MWInput"

    const/4 v6, 0x7

    if-eqz v3, :cond_3

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v3

    if-eqz v3, :cond_3

    if-eq v0, v6, :cond_1

    if-ne v0, v1, :cond_3

    .line 1015
    :cond_1
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 1016
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .line 1017
    iget-wide v6, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v6, v1, v6

    const-wide/16 v8, 0x1f4

    cmp-long v3, v6, v8

    if-lez v3, :cond_2

    .line 1018
    iput-wide v1, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 1019
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

    .line 1020
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1019
    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1022
    :cond_2
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookBy(Landroid/view/MotionEvent;)V

    .line 1023
    return v5

    .line 1025
    :cond_3
    invoke-virtual {v2, p1}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result v1

    .line 1026
    const/16 v2, 0x8

    if-ne v0, v2, :cond_4

    .line 1027
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->handleWheel(Landroid/view/MotionEvent;)V

    .line 1029
    :cond_4
    if-eq v0, v6, :cond_5

    .line 1030
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

    .line 1031
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

    .line 1030
    invoke-static {v4, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1033
    :cond_5
    return v5

    .line 1036
    :cond_6
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 7

    .line 914
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 915
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    .line 916
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 920
    :goto_0
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    const/16 v4, 0x83

    const-string v5, "MWInput"

    if-ne v3, v4, :cond_2

    .line 921
    if-eqz v0, :cond_1

    .line 922
    iget-object p1, p0, Lmodmenu/InputBridge;->activity:Landroid/app/Activity;

    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v0

    xor-int/2addr v0, v2

    invoke-static {p1, v0}, Lmodmenu/ModMenu;->setCrosshair(Landroid/content/Context;Z)V

    .line 923
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    .line 924
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

    .line 926
    :cond_1
    return v2

    .line 931
    :cond_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    const/16 v4, 0x84

    if-ne v3, v4, :cond_4

    .line 932
    if-eqz v0, :cond_3

    .line 934
    :try_start_0
    const-string p1, "(function() local cl,cl2,rk,rk2,cm,cm2 local okc,cfg=pcall(function() return GetIWorldConfig() end) if not okc or cfg==nil then error(\'MWP6|cfg=no\',0) end pcall(function() cl=cfg:getGameData(\'classical\') end) pcall(function() rk=cfg:getGameData(\'rocker\') end) pcall(function() cm=GetClientInfo():getContrlMode() end) local num=tonumber(cl) local newc=(num and num>0) and 0 or 1 local ok1=pcall(function() cfg:setGameData(\'classical\',newc) cfg:setGameData(\'rocker\',newc==1 and 0 or 1) end) local ok2=pcall(SetControlMoveSwithState) local ok3=pcall(function() GetClientInfo():appalyGameSetData() end) pcall(function() cl2=cfg:getGameData(\'classical\') end) pcall(function() rk2=cfg:getGameData(\'rocker\') end) pcall(function() cm2=GetClientInfo():getContrlMode() end) error(\'MWP6|cl=\'..tostring(cl)..\'->\'..tostring(cl2) ..\' rk=\'..tostring(rk)..\'->\'..tostring(rk2) ..\' cm=\'..tostring(cm)..\'->\'..tostring(cm2) ..\'|set=\'..tostring(ok1)..\' ui=\'..tostring(ok2) ..\' ap=\'..tostring(ok3),0) end)"

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p1, v0}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 935
    const-string p1, "ctrl-toggle fired"

    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 938
    goto :goto_1

    .line 936
    :catch_0
    move-exception p1

    .line 937
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

    .line 940
    :cond_3
    :goto_1
    return v2

    .line 942
    :cond_4
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    invoke-static {v3}, Lmodmenu/InputBridge;->keepAndroid(I)Z

    move-result v3

    if-nez v3, :cond_f

    .line 943
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v3

    .line 944
    if-nez v3, :cond_5

    .line 945
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 947
    :cond_5
    if-eqz v0, :cond_6

    .line 948
    invoke-direct {p0}, Lmodmenu/InputBridge;->enableKeyBinds()V

    .line 950
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

    .line 951
    :goto_3
    if-eqz v0, :cond_a

    iget-boolean v4, p0, Lmodmenu/InputBridge;->stateInGame:Z

    if-eqz v4, :cond_a

    .line 952
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    .line 953
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v6

    if-nez v6, :cond_9

    const/4 v6, 0x1

    goto :goto_4

    :cond_9
    const/4 v6, 0x0

    .line 952
    :goto_4
    invoke-direct {p0, v4, v6}, Lmodmenu/InputBridge;->movementKey(IZ)Z

    move-result v4

    if-eqz v4, :cond_a

    const/4 v1, 0x1

    goto :goto_5

    :cond_a
    nop

    .line 954
    :goto_5
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    invoke-static {v4}, Lmodmenu/InputBridge;->toAscii(I)I

    move-result v4

    .line 955
    if-ltz v4, :cond_b

    invoke-static {p1, v4}, Lmodmenu/InputBridge;->translate(Landroid/view/KeyEvent;I)Landroid/view/KeyEvent;

    move-result-object v6

    goto :goto_6

    :cond_b
    move-object v6, p1

    .line 959
    :goto_6
    invoke-virtual {v3, v6}, Lcom/minitech/player/AppPlayer;->injectEvent(Landroid/view/InputEvent;)Z

    move-result v3

    .line 960
    if-eqz v1, :cond_c

    .line 961
    iget-boolean v1, p0, Lmodmenu/InputBridge;->moveReported:Z

    xor-int/2addr v1, v2

    invoke-direct {p0, v1}, Lmodmenu/InputBridge;->fireMovement(Z)V

    .line 962
    iput-boolean v2, p0, Lmodmenu/InputBridge;->moveReported:Z

    .line 963
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_c

    .line 964
    invoke-direct {p0}, Lmodmenu/InputBridge;->armMoveReassert()V

    .line 967
    :cond_c
    if-eqz v0, :cond_e

    .line 970
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "key "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 971
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

    .line 972
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

    .line 973
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " src="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 974
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getSource()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " rep="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 975
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 970
    invoke-static {v5, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 977
    :cond_e
    return v2

    .line 980
    :cond_f
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 1715
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    .line 1725
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9

    .line 1041
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    .line 1042
    const-string v1, "touch"

    invoke-direct {p0, v1, v0, p1}, Lmodmenu/InputBridge;->logCrosshairIn(Ljava/lang/String;ILandroid/view/MotionEvent;)V

    .line 1043
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

    .line 1045
    :goto_0
    if-nez v1, :cond_1

    if-nez v0, :cond_1

    .line 1046
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lmodmenu/InputBridge;->endLook(J)V

    .line 1048
    :cond_1
    invoke-static {}, Lmodmenu/ModMenu;->isKbMouseOn()Z

    move-result v2

    if-eqz v2, :cond_9

    if-eqz v1, :cond_9

    .line 1049
    invoke-static {}, Lmodmenu/ModMenu;->isCrosshairOn()Z

    move-result v1

    .line 1050
    const-string v2, "MWInput"

    if-eqz v1, :cond_6

    .line 1054
    const/4 v5, 0x2

    if-ne v0, v5, :cond_3

    .line 1055
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1056
    iget-wide v5, p0, Lmodmenu/InputBridge;->lastArrLog:J

    sub-long v5, v0, v5

    const-wide/16 v7, 0x1f4

    cmp-long v3, v5, v7

    if-lez v3, :cond_2

    .line 1057
    iput-wide v0, p0, Lmodmenu/InputBridge;->lastArrLog:J

    .line 1058
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

    .line 1060
    :cond_2
    invoke-direct {p0, p1}, Lmodmenu/InputBridge;->lookBy(Landroid/view/MotionEvent;)V

    .line 1061
    return v4

    .line 1063
    :cond_3
    if-nez v0, :cond_4

    .line 1064
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-direct {p0, v0, v1, v4}, Lmodmenu/InputBridge;->centerTouch(JZ)V

    .line 1065
    return v4

    .line 1067
    :cond_4
    if-eq v0, v4, :cond_5

    const/4 v5, 0x3

    if-ne v0, v5, :cond_6

    .line 1069
    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-direct {p0, v0, v1, v3}, Lmodmenu/InputBridge;->centerTouch(JZ)V

    .line 1070
    return v4

    .line 1073
    :cond_6
    invoke-direct {p0, p1, v1}, Lmodmenu/InputBridge;->asFinger(Landroid/view/MotionEvent;Z)Landroid/view/MotionEvent;

    move-result-object v1

    .line 1074
    if-eqz v1, :cond_9

    .line 1075
    iget-object p1, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {p1, v1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    .line 1076
    invoke-virtual {v1}, Landroid/view/MotionEvent;->recycle()V

    .line 1077
    if-eqz v0, :cond_7

    if-ne v0, v4, :cond_8

    .line 1078
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

    .line 1080
    :cond_8
    return p1

    .line 1083
    :cond_9
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1720
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onActionModeFinished(Landroid/view/ActionMode;)V
    .locals 1

    .line 1828
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeFinished(Landroid/view/ActionMode;)V

    .line 1829
    return-void
.end method

.method public onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 1

    .line 1823
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeStarted(Landroid/view/ActionMode;)V

    .line 1824
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1803
    invoke-direct {p0}, Lmodmenu/InputBridge;->startPoll()V

    .line 1804
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onAttachedToWindow()V

    .line 1805
    return-void
.end method

.method public onContentChanged()V
    .locals 1

    .line 1740
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onContentChanged()V

    .line 1741
    return-void
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 1

    .line 1735
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .locals 1

    .line 1730
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onCreatePanelView(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1809
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmodmenu/InputBridge;->polling:Z

    .line 1810
    iput-boolean v0, p0, Lmodmenu/InputBridge;->reasserting:Z

    .line 1811
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->poll:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1812
    sget-object v0, Lmodmenu/InputBridge;->MAIN:Landroid/os/Handler;

    iget-object v1, p0, Lmodmenu/InputBridge;->moveHold:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1813
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onDetachedFromWindow()V

    .line 1814
    return-void
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 1

    .line 1775
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onMenuOpened(ILandroid/view/Menu;)Z
    .locals 1

    .line 1770
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .locals 1

    .line 1818
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 1819
    return-void
.end method

.method public onPointerCaptureChanged(Z)V
    .locals 2

    .line 1839
    if-nez p1, :cond_0

    iget-boolean v0, p0, Lmodmenu/InputBridge;->captured:Z

    if-eqz v0, :cond_0

    .line 1840
    const/4 v0, 0x0

    iput-boolean v0, p0, Lmodmenu/InputBridge;->captured:Z

    .line 1841
    iput-boolean v0, p0, Lmodmenu/InputBridge;->primed:Z

    .line 1842
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1843
    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 1844
    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->releaseClick(J)V

    .line 1845
    const-string v0, "MWInput"

    const-string v1, "xh capture lost"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1847
    :cond_0
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onPointerCaptureChanged(Z)V

    .line 1848
    return-void
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 1

    .line 1765
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

    .line 1834
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/Window$Callback;->onProvideKeyboardShortcuts(Ljava/util/List;Landroid/view/Menu;I)V

    .line 1835
    return-void
.end method

.method public onSearchRequested()Z
    .locals 1

    .line 1745
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onSearchRequested()Z

    move-result v0

    return v0
.end method

.method public onSearchRequested(Landroid/view/SearchEvent;)Z
    .locals 1

    .line 1750
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onSearchRequested(Landroid/view/SearchEvent;)Z

    move-result p1

    return p1
.end method

.method public onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
    .locals 1

    .line 1780
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    .line 1781
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2

    .line 1785
    if-eqz p1, :cond_0

    .line 1786
    invoke-direct {p0}, Lmodmenu/InputBridge;->syncCrosshair()V

    goto :goto_1

    .line 1788
    :cond_0
    invoke-direct {p0}, Lmodmenu/InputBridge;->player()Lcom/minitech/player/AppPlayer;

    move-result-object v0

    .line 1789
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/minitech/player/AppPlayer;->getSurfaceView()Landroid/view/SurfaceView;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 1790
    :goto_0
    iget-boolean v1, p0, Lmodmenu/InputBridge;->captured:Z

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    .line 1791
    invoke-direct {p0, v0}, Lmodmenu/InputBridge;->releaseCapture(Landroid/view/View;)V

    goto :goto_1

    .line 1793
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .line 1794
    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->endLook(J)V

    .line 1795
    invoke-direct {p0, v0, v1}, Lmodmenu/InputBridge;->releaseClick(J)V

    .line 1798
    :goto_1
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowFocusChanged(Z)V

    .line 1799
    return-void
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .locals 1

    .line 1755
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method

.method public onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;
    .locals 1

    .line 1760
    iget-object v0, p0, Lmodmenu/InputBridge;->orig:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1
.end method
