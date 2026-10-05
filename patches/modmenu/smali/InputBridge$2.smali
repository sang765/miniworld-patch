.class Lmodmenu/InputBridge$2;
.super Ljava/lang/Object;
.source "InputBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmodmenu/InputBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lmodmenu/InputBridge;


# direct methods
.method constructor <init>(Lmodmenu/InputBridge;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 556
    iput-object p1, p0, Lmodmenu/InputBridge$2;->this$0:Lmodmenu/InputBridge;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 560
    const-string v0, "MWInput"

    :try_start_0
    const-string v1, "(function() local r={} local ok,e=pcall(function() local fr=getglobal(\'GameSetFrame\') if fr==nil then error(\'noframe\') end fr:Show() end) r[#r+1]=\'show=\'..tostring(ok)..\',\'..tostring(e) local ok2,e2=pcall(function() local f=rawget(_G,\'GameSetFrameHotkey_OnShow\') if type(f)~=\'function\' then error(\'missing\') end f() end) r[#r+1]=\'onshow=\'..tostring(ok2)..\',\'..tostring(e2) local ok3=pcall(function() press_btn(\'GameSetFrameHotkeyBtn\') end) r[#r+1]=\'tab=\'..tostring(ok3) local vis=\'?\' pcall(function() local fr=getglobal(\'GameSetFrame\') vis=tostring(fr~=nil and fr.IsShown and fr:IsShown()) end) r[#r+1]=\'vis=\'..vis error(\'HKUI2|\'..table.concat(r,\'|\'):sub(1,2900),0) end)"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 561
    const-string v1, "(function() local eb=\'none\' local names={\"GameSettingsMgr\",\"GameSettings\"} for i=1,#names do local t=_G[names[i]] if t~=nil then local ok,fn=pcall(function() return t.enableAllKeyBind end) if ok and type(fn)==\"function\" then local ran,er=pcall(function() t:enableAllKeyBind() end) eb=names[i]..(ran and \':ok\' or \':err:\'..tostring(er)) break end end end if eb==\'none\' then local okb,ci2=pcall(GetClientInfo) if okb and ci2~=nil then local ranb=pcall(function() ci2:enableAllKeyBind() end) eb=\'ClientInfo\'..(ranb and \':ok\' or \':err\') end end local cm,cl,rk,ing,mid pcall(function() cm=GetClientInfo():getContrlMode() end) pcall(function() local c=GetIWorldConfig() cl=c:getGameData(\'classical\') rk=c:getGameData(\'rocker\') end) pcall(function() ing=ClientCurGame and ClientCurGame.isInGame and ClientCurGame:isInGame() end) pcall(function() mid=GetClientInfo():getCurrentGameMapId() end) local hits,seen={},{} local ok,ci=pcall(GetClientInfo) if ok and type(ci)==\'table\' then local pok=pcall(function() for k in pairs(ci) do if type(k)==\'string\' and (k:find(\'ontrl\') or k:find(\'ontrol\') or k:find(\'witch\') or k:find(\'KeyBind\')) then if not seen[k] then seen[k]=true hits[#hits+1]=k end end end end) if not pok then hits[#hits+1]=\'pairs-fail\' end end local cand={\'setContrlMode\',\'setControlMode\',\'setContrlType\',\'setMoveMode\',\'setUIMode\',\'disableAllKeyBind\'} for i=1,#cand do if ci~=nil then local okf,f=pcall(function() return ci[cand[i]] end) if okf and type(f)==\'function\' and not seen[cand[i]] then seen[cand[i]]=true hits[#hits+1]=cand[i] end end end local s=\'MWP4|eb=\'..eb..\'|cm=\'..tostring(cm) ..\'|cl=\'..tostring(cl)..\',rk=\'..tostring(rk) ..\'|in=\'..tostring(ing)..\',mid=\'..tostring(mid) ..\'|set=\'..table.concat(hits,\',\') error(s:sub(1,2900),0) end)"

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 562
    iget-object v1, p0, Lmodmenu/InputBridge$2;->this$0:Lmodmenu/InputBridge;

    invoke-static {v1}, Lmodmenu/InputBridge;->access$1000(Lmodmenu/InputBridge;)Ljava/lang/String;

    move-result-object v1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 563
    const-string v1, "(function() local okn,n=pcall(function() return DefMgr:getHotkeyNum() end) if not okn or type(n)~=\'number\' then error(\'MWP7|nonum\',0) end local okgi,gi=pcall(GetGameInfo) if not okgi or gi==nil then error(\'MWP7|nogi\',0) end local set,ok=0,0 local dump={} for i=1,n do local okd,d=pcall(function() return DefMgr:getHotkeyDef(i) end) if okd and d~=nil then local okf,fn=pcall(function() return d.FuncName end) local okc,code=pcall(function() return d.DefaultCode end) if okf and type(fn)==\'string\' then local cur=nil pcall(function() cur=gi:GetGameHotkey(fn) end) dump[#dump+1]=fn..\'=\'..tostring(cur) if (cur==nil or (type(cur)==\'number\' and cur<0)) and type(code)==\'number\' then set=set+1 local order={ function() gi:SetGameHotkey(fn,code) end, function() gi:SetGameHotkey(code,fn) end, function() DefMgr:SetGameHotkey(fn,code) end, function() SetGameHotkey(fn,code) end} for k=1,#order do pcall(order[k]) local after=nil pcall(function() after=gi:GetGameHotkey(fn) end) if type(after)==\'number\' and after==code then ok=ok+1 break end end end end end end error(\'MWP7|n=\'..n..\' set=\'..set..\' ok=\'..ok ..\'|b=\'..table.concat(dump,\';\'):sub(1,2700),0) end)"

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 564
    const-string v1, "(function() local names={\'SendEvent\',\'AddEvent\',\'UIReceiveMessage\',\'SetRightClickDown\',\'IsRightClickDown\',\'excuteWithRightClickCmd\'} local hs={} hs[1]={\'_G\',_G} pcall(function() local g=GetGameInfo() if g~=nil then hs[#hs+1]={\'gi\',g} end end) pcall(function() local c=GetClientInfo() if c~=nil then hs[#hs+1]={\'ci\',c} end end) pcall(function() if DefMgr~=nil then hs[#hs+1]={\'def\',DefMgr} end end) pcall(function() if type(miniui)==\'table\' then hs[#hs+1]={\'ui\',miniui} end end) pcall(function() if CurMainPlayer~=nil then hs[#hs+1]={\'pl\',CurMainPlayer} end end) pcall(function() if ClientCurGame~=nil then hs[#hs+1]={\'game\',ClientCurGame} end end) local parts={\'MWP10\'} for i=1,#names do local nm=names[i] local hit=\'absent\' for j=1,#hs do local h=hs[j] local okv,v=pcall(function() return h[2][nm] end) if okv and v~=nil then if type(v)==\'function\' then local okc,e=pcall(function() return v() end) hit=h[1]..\':fn:\' ..(okc and \'ok\' or tostring(e):sub(1,70)) else hit=h[1]..\':\'..type(v) end break end end parts[#parts+1]=nm..\'=\'..hit end error(table.concat(parts,\'|\'):sub(1,2900),0) end)"

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v1, v3}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 567
    const-string v1, "(function() local fr=nil pcall(function() fr=getglobal(\'GameSetFrame\') end) if fr==nil then error(\'HKCL|noframe\',0) end local ok1,e1=pcall(function() fr:Hide() end) local vis=\'?\' pcall(function() vis=tostring(fr.IsShown and fr:IsShown()) end) local alt=\'\' if vis==\'true\' then local ok2=pcall(function() fr:SetVisible(false) end) alt=\',alt=\'..tostring(ok2) pcall(function() vis=tostring(fr.IsShown and fr:IsShown()) end) end error(\'HKCL|hide=\'..tostring(ok1)..\',\'..tostring(e1) ..alt..\',vis=\'..vis,0) end)"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lorg/appplay/lib/CommonNatives;->javaCallLuaEvent(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 568
    const-string v1, "probes fired"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 571
    goto :goto_0

    .line 569
    :catch_0
    move-exception v1

    .line 570
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "probe batch failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 572
    :goto_0
    return-void
.end method
