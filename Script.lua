local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local CoreGui=game:GetService("CoreGui")
local Workspace=game:GetService("Workspace")
local RS=game:GetService("ReplicatedStorage")
local Tween=game:GetService("TweenService")
local Lighting=game:GetService("Lighting")
local Stats=game:GetService("Stats")
local TCS=game:GetService("TextChatService")
local TPS=game:GetService("TeleportService")
local Sound=game:GetService("SoundService")
local Debris=game:GetService("Debris")
local Http=game:GetService("HttpService")
local LP=Players.LocalPlayer
local Cam=Workspace.CurrentCamera

_G.BLOODAIM={}
local G=_G.BLOODAIM

G.Players=Players
G.RunService=RunService
G.UIS=UIS
G.CoreGui=CoreGui
G.Workspace=Workspace
G.RS=RS
G.Tween=Tween
G.Lighting=Lighting
G.Stats=Stats
G.TCS=TCS
G.TPS=TPS
G.Sound=Sound
G.Debris=Debris
G.Http=Http
G.LP=LP
G.Cam=Cam

local function applyPC()
pcall(function()
LP:SetAttribute("Platform","Windows")
LP:SetAttribute("IsMobile",false)
LP:SetAttribute("DeviceType","Desktop")
LP:SetAttribute("InputType","Keyboard")
LP:SetAttribute("ClientType","PC")
LP:SetAttribute("IsPhone",false)
LP:SetAttribute("IsTablet",false)
LP:SetAttribute("OS","Windows")
LP:SetAttribute("PC",true)
LP:SetAttribute("Mobile",false)
LP:SetAttribute("IsTouch",false)
LP:SetAttribute("TouchEnabled",false)
end)
end

local function spoofVal(v)
if not v then return end
if v:IsA("BoolValue") then
local n=v.Name:lower()
if n:find("mobile") or n:find("phone") or n:find("tablet") or n:find("touch") then v.Value=false
elseif n:find("desktop") or n:find("pc") or n:find("keyboard") or n:find("mouse") then v.Value=true end
elseif v:IsA("StringValue") then
local n=v.Name:lower()
if n:find("platform") or n:find("devicetype") or n:find("clienttype") or n=="os" then v.Value="Windows"
elseif n:find("inputtype") then v.Value="Keyboard" end
elseif v:IsA("NumberValue") then
local n=v.Name:lower()
if n:find("ismobile") or n:find("isphone") then v.Value=0 end
if n:find("isdesktop") or n:find("ispc") then v.Value=1 end
end
end

local function hideMobileIcons()
pcall(function()
local pg=LP:FindFirstChild("PlayerGui")
if not pg then return end
for _,d in ipairs(pg:GetChildren())do
local targets={d}
if d:IsA("GuiObject") then for _,c in ipairs(d:GetChildren())do table.insert(targets,c)end end
for _,g in ipairs(targets)do
if g:IsA("ImageLabel") or g:IsA("ImageButton") or g:IsA("TextLabel") or g:IsA("TextButton") then
local n=(g.Name or ""):lower()
if n:find("mobile") or n:find("phone") or n:find("touch") or n:find("device") or n:find("platform") or n:find("tablet") then g.Visible=false end
end
end
end
end)
end

local function spoofAll()
applyPC()
pcall(function()
for _,c in ipairs(RS:GetChildren())do if c:IsA("BoolValue") or c:IsA("StringValue") or c:IsA("NumberValue") then spoofVal(c)end end
end)
pcall(function() for _,c in ipairs(LP:GetChildren())do spoofVal(c)end end)
hideMobileIcons()
end

G.applyPC=applyPC
G.spoofVal=spoofVal
G.hideMobileIcons=hideMobileIcons
G.spoofAll=spoofAll

spoofAll()

task.spawn(function()
while true do task.wait(5); spoofAll()end
end)
task.spawn(function()
while true do task.wait(2); hideMobileIcons()end
end)

print("[P1/5] loaded — paste PART 2") local G=_G.BLOODAIM
if not G then warn("run PART 1 first");return end

local C={
AimOn=false,TeamCheck=true,Circle=140,CircleVisible=true,
Assist=1,MaxRange=500,StickyTime=0.35,FlickThreshold=30,
AimPart="UpperTorso",AimPriority="ClosestToCrosshair",
MissChance=0,AimSmoothing="Linear",
HitboxOn=false,HitboxScale=3,ShrinkOn=false,ShrinkScale=0.35,
Prediction=false,PredStrength=0.15,FastRespawn=false,AutoRejoin=false,
TracerOn=false,NameTagOn=false,HealthBarOn=false,ESPBoxOn=false,
SkeletonOn=false,ChamsOn=false,DamageNumbersOn=false,
CrosshairOn=true,SilentOn=false,SilentPart="Head",
InfiniteJump=false,KillSay=false,KillSayMsg="lakas mo",
SpeedOn=false,SpeedValue=22,JumpOn=false,JumpValue=80,
FullbrightOn=false,NoFog=false,NoParticles=false,NoShadows=false,
TimeOfDay=0,TimeOn=false,NoGrass=false,MuteAmbient=false,
FOVValue=90,FPSUnlock=false,ShowFPS=true,ShowPing=true,
HitmarkerOn=true,HitmarkerVol=0.5,HitmarkerColor=Color3.fromRGB(255,255,255),
AntiVoidOn=false,AutoRunOn=false,
}
G.C=C

local PRIORITIES={"ClosestToCrosshair","LowestHP","ClosestDistance","HighestHP"}
local PRIORITY_LB={ClosestToCrosshair="CLOSEST",LowestHP="LOWEST HP",ClosestDistance="NEAREST",HighestHP="HIGHEST HP"}
local prioIdx=1

local AIM_PARTS={"Head","UpperTorso","Torso","HumanoidRootPart","LeftLeg","RightLeg"}
local AIM_LB={Head="HEAD",UpperTorso="UPPER TORSO",Torso="TORSO",HumanoidRootPart="ROOT",LeftLeg="LEFT LEG",RightLeg="RIGHT LEG"}
local aimIdx=2

local SILENT_PARTS={"Head","UpperTorso","Torso","HumanoidRootPart","LeftLeg","RightLeg"}
local SILENT_LB={Head="HEAD",UpperTorso="UPPER TORSO",Torso="TORSO",HumanoidRootPart="ROOT",LeftLeg="LEFT LEG",RightLeg="RIGHT LEG"}
local silIdx=1

G.PRIORITIES=PRIORITIES
G.PRIORITY_LB=PRIORITY_LB
G.AIM_PARTS=AIM_PARTS
G.AIM_LB=AIM_LB
G.SILENT_PARTS=SILENT_PARTS
G.SILENT_LB=SILENT_LB
G.getPrioIdx=function()return prioIdx end
G.setPrioIdx=function(v)prioIdx=v end
G.getAimIdx=function()return aimIdx end
G.setAimIdx=function(v)aimIdx=v end
G.getSilIdx=function()return silIdx end
G.setSilIdx=function(v)silIdx=v end

local sticky=nil
local stickyUntil=0
local lastMouse=nil
local lastMouseTime=0
local fpsValue=0
local silentTarget=nil
local sessionStart=tick()
local killCount=0
local deathCount=0

G.getSticky=function()return sticky end
G.setSticky=function(v)sticky=v end
G.getStickyUntil=function()return stickyUntil end
G.setStickyUntil=function(v)stickyUntil=v end
G.getSilentTarget=function()return silentTarget end
G.setSilentTarget=function(v)silentTarget=v end
G.getFpsValue=function()return fpsValue end
G.setFpsValue=function(v)fpsValue=v end
G.getSessionStart=function()return sessionStart end
G.getKillCount=function()return killCount end
G.getDeathCount=function()return deathCount end
G.addKill=function(n)killCount=killCount+n end
G.addDeath=function()deathCount=deathCount+1 end
G.getLastMouse=function()return lastMouse end
G.setLastMouse=function(v)lastMouse=v end
G.getLastMouseTime=function()return lastMouseTime end
G.setLastMouseTime=function(v)lastMouseTime=v end

print("[P2/5] loaded — paste PART 3") local G=_G.BLOODAIM
if not G then warn("run PART 1 + 2 first");return end

local Players=G.Players
local RS=G.RS
local Cam=G.Cam
local LP=G.LP
local C=G.C

local function partFor(ch,name)
if not ch then return nil end
local p=ch:FindFirstChild(name)
if p and p:IsA("BasePart") then return p end
for _,f in ipairs({"UpperTorso","Torso","HumanoidRootPart","Head"})do
local fp=ch:FindFirstChild(f)
if fp and fp:IsA("BasePart") then return fp end
end
return nil
end

local function aimPart(p) return partFor(p.Character,C.AimPart)end
local function silentPart(p) return partFor(p.Character,C.SilentPart)end
G.partFor=partFor
G.aimPart=aimPart
G.silentPart=silentPart

local function isEnemy(p)
if not p or p==LP then return false end
if not p.Character then return false end
local h=p.Character:FindFirstChildOfClass("Humanoid")
if not h or h.Health<=0 then return false end
if C.TeamCheck and p.Team and LP.Team and p.Team==LP.Team then return false end
return true
end
G.isEnemy=isEnemy

local function predictPos(p,part)
if not C.Prediction then return part.Position end
local hrp=p.Character and p.Character:FindFirstChild("HumanoidRootPart")
if not hrp then return part.Position end
local v=hrp.AssemblyLinearVelocity or Vector3.new(0,0,0)
return part.Position+(v*C.PredStrength)
end
G.predictPos=predictPos

local function inRange(p)
local part=aimPart(p)
if not part then return nil end
if (part.Position-Cam.CFrame.Position).Magnitude>C.MaxRange then return nil end
return part
end
G.inRange=inRange

local function pickTarget()
local c=Vector2.new(Cam.ViewportSize.X/2,Cam.ViewportSize.Y/2)
local r=C.Circle/2
local best,bestScore=nil,math.huge
for _,p in ipairs(Players:GetPlayers())do
if isEnemy(p) then
local part=inRange(p)
if part then
local pp=predictPos(p,part)
local sp,on=Cam:WorldToViewportPoint(pp)
if on then
local d=(Vector2.new(sp.X,sp.Y)-c).Magnitude
if d<=r then
local score=d
if C.AimPriority=="LowestHP" then
local h=p.Character:FindFirstChildOfClass("Humanoid")
score=h and h.Health or 0
elseif C.AimPriority=="ClosestDistance" then
score=(part.Position-Cam.CFrame.Position).Magnitude
elseif C.AimPriority=="HighestHP" then
local h=p.Character:FindFirstChildOfClass("Humanoid")
score=-(h and h.Health or 0)
end
if score<bestScore then bestScore=score;best=p end
end
end
end
end
end
end
return best
end
G.pickTarget=pickTarget

pcall(function()
local ok,module=pcall(function()return require(RS.Blaster.Scripts.BlasterController)end)
if ok and module and module.getShotOrigin then
local orig=module.getShotOrigin
module.getShotOrigin=function(self,...)
if C.SilentOn and G.getSilentTarget() and G.getSilentTarget().Character then
local part=silentPart(G.getSilentTarget())
if part then
local ok2,muzzle=pcall(function()
if self.muzzleLocalOffset and self.handle then return (self.handle.CFrame*self.muzzleLocalOffset).Position
elseif self.muzzleAttachment then return self.muzzleAttachment.WorldPosition
elseif self.handle then return self.handle.Position end
return Cam.CFrame.Position
end)
if ok2 and muzzle then
local dir=part.Position-muzzle
if dir.Magnitude>0.001 then return CFrame.lookAt(muzzle,muzzle+dir.Unit),dir.Magnitude end
end
end
end
return orig(self,...)
end
end
end)

G.updateLoop=G.RunService.RenderStepped:Connect(function(dt)
local now=tick()
local sticky=G.getSticky()
local stickyUntil=G.getStickyUntil()
local t=nil
if sticky and stickyUntil>now and isEnemy(sticky) and inRange(sticky) then t=sticky
else G.setSticky(nil);G.setStickyUntil(0) end
if not t then
if math.random()>C.MissChance then t=pickTarget();if t then G.setSticky(t);G.setStickyUntil(now+C.StickyTime) end end
end

if C.SilentOn then
if sticky and isEnemy(sticky) then G.setSilentTarget(sticky) else G.setSilentTarget(pickTarget())end
else G.setSilentTarget(nil) end

if C.AimOn and t then
local part=aimPart(t)
if part then
local pp=predictPos(t,part)
local camPos=Cam.CFrame.Position
local dir=(pp-camPos).Unit
local want=CFrame.new(camPos,camPos+dir)
local alpha=math.clamp(C.Assist*(dt*60),0,1)
if C.AimSmoothing=="EaseIn" then alpha=alpha*alpha
elseif C.AimSmoothing=="EaseOut" then alpha=1-(1-alpha)*(1-alpha)end
Cam.CFrame=Cam.CFrame:Lerp(want,alpha)
end
end

if C.AntiVoidOn and LP.Character then
local hrp=LP.Character:FindFirstChild("HumanoidRootPart")
if hrp and hrp.Position.Y<-50 then hrp.CFrame=CFrame.new(0,100,0)end
end

G.setFpsValue(math.floor(1/math.max(dt,0.001)))
end)

print("[P3/5] loaded — paste PART 4") local G=_G.BLOODAIM
if not G then warn("run 1+2+3 first");return end

local Players=G.Players
local UIS=G.UIS
local Workspace=G.Workspace
local RS=G.RS
local Lighting=G.Lighting
local TCS=G.TCS
local TPS=G.TPS
local Sound=G.Sound
local Debris=G.Debris
local Http=G.Http
local LP=G.LP
local Cam=G.Cam
local C=G.C

local originals={}
local savedParticles={}
local lastHealth={}

local function scalePart(part,f)
if not part then return end
pcall(function()
if not part:IsA("BasePart") then return end
local ov=part:FindFirstChild("_origSize")
if not ov then ov=Instance.new("Vector3Value");ov.Name="_origSize";ov.Value=part.Size;ov.Parent=part end
part.Size=ov.Value*f
end)
end

local function restorePart(part)
if not part then return end
pcall(function()
local ov=part:FindFirstChild("_origSize")
if ov then part.Size=ov.Value;ov:Destroy()end
end)
end

local function applyHitbox(p)
if not p.Character then return end
for _,n in ipairs({"Head","HumanoidRootPart","UpperTorso","Torso","LowerTorso","LeftLeg","RightLeg"})do
local part=p.Character:FindFirstChild(n)
if part then if C.HitboxOn then scalePart(part,C.HitboxScale)else restorePart(part)end end
end
end
G.applyHitbox=applyHitbox

local function applyHitboxAll()
for _,p in ipairs(Players:GetPlayers())do if p~=LP then applyHitbox(p)end end
end
G.applyHitboxAll=applyHitboxAll

local function applyShrinkSelf()
if not LP.Character then return end
for _,n in ipairs({"Head","UpperTorso","Torso","HumanoidRootPart","LowerTorso"})do
local part=LP.Character:FindFirstChild(n)
if part then if C.ShrinkOn then scalePart(part,C.ShrinkScale)else restorePart(part)end end
end
end
G.applyShrinkSelf=applyShrinkSelf

local function applySpeed()
local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
if h then
if C.SpeedOn then if not originals.ws then originals.ws=h.WalkSpeed end;h.WalkSpeed=C.SpeedValue
else if originals.ws then h.WalkSpeed=originals.ws end end
end
end
G.applySpeed=applySpeed

local function applyJump()
local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
if h then
if C.JumpOn then if not originals.jp then originals.jp=h.JumpPower end;h.JumpPower=C.JumpValue;h.UseJumpPower=true
else if originals.jp then h.JumpPower=originals.jp end end
end
end
G.applyJump=applyJump

local function applyLighting()
if C.FullbrightOn then
if not originals.amb then originals.amb=Lighting.Ambient end
if not originals.out then originals.out=Lighting.OutdoorAmbient end
Lighting.Ambient=Color3.fromRGB(180,180,180);Lighting.OutdoorAmbient=Color3.fromRGB(180,180,180);Lighting.Brightness=3
else
if originals.amb then Lighting.Ambient=originals.amb end
if originals.out then Lighting.OutdoorAmbient=originals.out end
end
if C.NoFog then if not originals.fog then originals.fog=Lighting.FogEnd end;Lighting.FogEnd=100000
else if originals.fog then Lighting.FogEnd=originals.fog end end
if C.TimeOn then Lighting.ClockTime=C.TimeOfDay end
Lighting.GlobalShadows=not C.NoShadows
end
G.applyLighting=applyLighting

local function applyParticles()
if C.NoParticles then
for _,d in ipairs(Workspace:GetDescendants())do
if d:IsA("ParticleEmitter") or d:IsA("Trail") or d:IsA("Smoke") or d:IsA("Fire") or d:IsA("Sparkles") then
if savedParticles[d]==nil then savedParticles[d]=d.Enabled end
pcall(function()d.Enabled=false end)
end
end
else
for d,s in pairs(savedParticles)do pcall(function()if d.Parent then d.Enabled=s end end)end
savedParticles={}
end
end
G.applyParticles=applyParticles

local function applyNoGrass()
if C.NoGrass then
pcall(function() for _,d in ipairs(Workspace:GetDescendants())do if d:IsA("TerrainDecoration") or (d:IsA("BasePart") and d.Name:lower():find("grass")) then d.Transparency=1 end end end)
else
pcall(function() for _,d in ipairs(Workspace:GetDescendants())do if d:IsA("TerrainDecoration") or (d:IsA("BasePart") and d.Name:lower():find("grass")) then d.Transparency=0 end end end)
end
end
G.applyNoGrass=applyNoGrass

local function applyFOV() Cam.FieldOfView=C.FOVValue end
G.applyFOV=applyFOV

local function applyFPSUnlock()
pcall(function() if setfpscap then if C.FPSUnlock then setfpscap(240)else setfpscap(60)end end end)
end
G.applyFPSUnlock=applyFPSUnlock

local function serverHop()
task.spawn(function()
local ok=pcall(function()
local servers=Http:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
local ids={}
for _,s in ipairs(servers.data or{})do if s.id and s.playing and s.maxPlayers and s.playing<s.maxPlayers then table.insert(ids,s.id)end end
if #ids==0 then return end
local pick=ids[math.random(1,#ids)]
TPS:TeleportToPlaceInstance(game.PlaceId,pick,LP)
end)
if not ok then pcall(function()TPS:Teleport(game.PlaceId,LP)end)end
end)
end
G.serverHop=serverHop

local hmSound=Instance.new("Sound")
hmSound.SoundId="rbxassetid://4833497113"
hmSound.Volume=C.HitmarkerVol
hmSound.Parent=Sound
G.hmSound=hmSound

local function playHitmarker()
if not C.HitmarkerOn then return end
pcall(function()
local s=hmSound:Clone();s.Volume=C.HitmarkerVol;s.Parent=Sound;s:Play();Debris:AddItem(s,1.5)
end)
end
G.playHitmarker=playHitmarker

local function watchHealth(p)
if not p or p==LP then return end
local function bind(ch)
local h=ch:WaitForChild("Humanoid",5)
if not h then return end
lastHealth[p]=h.Health
h.HealthChanged:Connect(function(nh)
local old=lastHealth[p] or nh
if nh<old then playHitmarker();if G.playHitmarkerVisual then G.playHitmarkerVisual()end end
lastHealth[p]=nh
end)
end
if p.Character then bind(p.Character)end
p.CharacterAdded:Connect(bind)
end

for _,p in ipairs(Players:GetPlayers())do watchHealth(p)end
Players.PlayerAdded:Connect(watchHealth)

local function fireKillSay()
pcall(function()
local cr=RS:FindFirstChild("DefaultChatSystemChatEvents")
if cr then local s=cr:FindFirstChild("SayMessageRequest");if s then s:FireServer(C.KillSayMsg,"All");return end end
if TCS and TCS.TextChannels then local ch=TCS.TextChannels:FindFirstChild("RBXGeneral");if ch then ch:SendAsync(C.KillSayMsg)end end
end)
end

local function watchKills()
for _,a in ipairs({"Kills","KillCount","Streak","Takedowns","Score"})do
pcall(function()
local s=LP:GetAttribute(a) or 0
LP:GetAttributeChangedSignal(a):Connect(function()
local n=LP:GetAttribute(a) or 0
if n>s then G.addKill(n-s);if C.KillSay then fireKillSay()end end
s=n
end)
end)
end
pcall(function()
for _,r in ipairs(RS:GetDescendants())do
if r:IsA("RemoteEvent") and (r.Name:lower():find("kill") or r.Name:lower():find("feed"))then
r.OnClientEvent:Connect(function(...)
if not C.KillSay then return end
for _,a in ipairs({...})do
if a==LP or a==LP.Name then fireKillSay();return end
if typeof(a)=="table" then for _,v in pairs(a)do if v==LP or v==LP.Name then fireKillSay();return end end end
end
end)
end
end
end)
end
watchKills()

UIS.JumpRequest:Connect(function()
if not C.InfiniteJump then return end
local h=LP.Character and LP.Character:FindFirstChildOfClass("Humanoid")
if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end
end)

LP.CharacterAdded:Connect(function(ch)
local h=ch:WaitForChild("Humanoid",5)
if h and C.FastRespawn then h.Died:Connect(function()task.wait(0.1);pcall(function()LP:LoadCharacter()end)end)end
if h then h.Died:Connect(function()G.addDeath()end)end
task.wait(1)
if C.ShrinkOn then applyShrinkSelf()end
if C.SpeedOn then applySpeed()end
if C.JumpOn then applyJump()end
end)

pcall(function()
LP.OnTeleport:Connect(function()
if C.AutoRejoin then task.wait(2);pcall(function()TPS:Teleport(game.PlaceId,LP)end)end
end)
end)

local function hookPlayer(p)
p.CharacterAdded:Connect(function()
task.wait(1)
if C.HitboxOn then applyHitbox(p)end
end)
end

Players.PlayerAdded:Connect(hookPlayer)
for _,p in ipairs(Players:GetPlayers())do if p~=LP then hookPlayer(p)end end

UIS.InputBegan:Connect(function(i,gp)
if gp then return end
G.setLastMouse(i.Position)
G.setLastMouseTime(tick())
end)

UIS.InputChanged:Connect(function(i,gp)
if gp then return end
if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement then
local lm=G.getLastMouse()
if lm then
local dt=tick()-(G.getLastMouseTime() or 0)
if dt>0 then local d=(i.Position-lm).Magnitude;if d>C.FlickThreshold then G.setSticky(nil);G.setStickyUntil(0)end end
end
G.setLastMouse(i.Position)
G.setLastMouseTime(tick())
end
end)

print("[P4/5] loaded — paste PART 5") local G=_G.BLOODAIM
if not G then warn("run 1+2+3+4 first");return end

local Players=G.Players
local RunService=G.RunService
local UIS=G.UIS
local CoreGui=G.CoreGui
local Cam=G.Cam
local Tween=G.Tween
local LP=G.LP
local Stats=G.Stats
local C=G.C
local PLB=G.PRIORITY_LB
local ALB=G.AIM_LB
local SLB=G.SILENT_LB
local PRIO=G.PRIORITIES
local AP=G.AIM_PARTS
local SP=G.SILENT_PARTS

local bg=Color3.fromRGB(10,10,12)
local pnl=Color3.fromRGB(16,16,19)
local hdr=Color3.fromRGB(26,26,31)
local sb=Color3.fromRGB(13,13,16)
local btn=Color3.fromRGB(24,24,29)
local btnH=Color3.fromRGB(36,36,42)
local btnA=Color3.fromRGB(130,20,20)
local acc=Color3.fromRGB(220,45,45)
local accG=Color3.fromRGB(255,80,80)
local txt=Color3.fromRGB(235,235,238)
local txtD=Color3.fromRGB(150,150,158)
local txtM=Color3.fromRGB(100,100,108)
local suc=Color3.fromRGB(80,220,130)
local wrn=Color3.fromRGB(255,180,60)
local dgr=Color3.fromRGB(255,80,80)
local pnk=Color3.fromRGB(255,105,180)
local cyn=Color3.fromRGB(90,220,255)

G.col={bg=bg,pnl=pnl,hdr=hdr,sb=sb,btn=btn,btnH=btnH,btnA=btnA,acc=acc,accG=accG,txt=txt,txtD=txtD,txtM=txtM,suc=suc,wrn=wrn,dgr=dgr,pnk=pnk,cyn=cyn}

local SG=Instance.new("ScreenGui")
SG.Name="_bloodaim_"
SG.Parent=CoreGui
SG.ResetOnSpawn=false
SG.IgnoreGuiInset=true
SG.DisplayOrder=999
G.SG=SG

local HM=Instance.new("Frame")
HM.Size=UDim2.new(0,24,0,24)
HM.Position=UDim2.new(0.5,-12,0.5,-12)
HM.BackgroundTransparency=1
HM.BorderSizePixel=0
HM.Visible=false
HM.ZIndex=8
HM.Parent=SG

local HML={}
for i=1,4 do
local l=Instance.new("Frame")
l.Size=UDim2.new(0,8,0,2)
l.BackgroundColor3=C.HitmarkerColor
l.BorderSizePixel=0
l.AnchorPoint=Vector2.new(0.5,0.5)
l.ZIndex=8
l.Parent=HM
table.insert(HML,l)
end
HML[1].Position=UDim2.new(0.5,-6,0.15,0);HML[1].Rotation=45
HML[2].Position=UDim2.new(0.5,6,0.15,0);HML[2].Rotation=-45
HML[3].Position=UDim2.new(0.5,-6,0.85,0);HML[3].Rotation=-45
HML[4].Position=UDim2.new(0.5,6,0.85,0);HML[4].Rotation=45

local function hmv()
if not C.HitmarkerOn then return end
HM.Visible=true;HM.Size=UDim2.new(0,24,0,24);HM.Position=UDim2.new(0.5,-12,0.5,-12)
for _,l in ipairs(HML)do l.BackgroundTransparency=0;l.BackgroundColor3=C.HitmarkerColor end
task.spawn(function()
task.wait(0.08)
for _,l in ipairs(HML)do Tween:Create(l,TweenInfo.new(0.15),{BackgroundTransparency=1}):Play()end
Tween:Create(HM,TweenInfo.new(0.15),{Size=UDim2.new(0,34,0,34)}):Play()
task.wait(0.2);HM.Visible=false
end)
end
G.playHitmarkerVisual=hmv

local Circle=Instance.new("Frame")
Circle.Size=UDim2.new(0,C.Circle,0,C.Circle)
Circle.Position=UDim2.new(0.5,-C.Circle/2,0.5,-C.Circle/2)
Circle.BackgroundTransparency=1
Circle.BorderSizePixel=0
Circle.ZIndex=5
Circle.Parent=SG
local RC=Instance.new("UICorner");RC.CornerRadius=UDim.new(1,0);RC.Parent=Circle
local RS=Instance.new("UIStroke");RS.Color=acc;RS.Thickness=1.5;RS.Transparency=0.2;RS.Parent=Circle

local CH=Instance.new("Frame")
CH.Size=UDim2.new(0,14,0,1);CH.Position=UDim2.new(0.5,-7,0.5,-0.5)
CH.BackgroundColor3=accG;CH.BorderSizePixel=0;CH.BackgroundTransparency=0.1;CH.ZIndex=5;CH.Parent=SG
local CH2=Instance.new("Frame")
CH2.Size=UDim2.new(0,1,0,14);CH2.Position=UDim2.new(0.5,-0.5,0.5,-7)
CH2.BackgroundColor3=accG;CH2.BorderSizePixel=0;CH2.BackgroundTransparency=0.1;CH2.ZIndex=5;CH2.Parent=SG

local TR=Instance.new("Frame")
TR.Size=UDim2.new(0,44,0,44);TR.BackgroundTransparency=1;TR.BorderSizePixel=0;TR.Visible=false;TR.ZIndex=5;TR.Parent=SG
local TRC=Instance.new("UICorner");TRC.CornerRadius=UDim.new(1,0);TRC.Parent=TR
local TRS=Instance.new("UIStroke");TRS.Color=wrn;TRS.Thickness=1.5;TRS.Parent=TR

G.Circle=Circle
G.CH=CH
G.CH2=CH2
G.TR=TR

local IP=Instance.new("Frame")
IP.Size=UDim2.new(0,160,0,104);IP.Position=UDim2.new(1,-170,0,90)
IP.BackgroundColor3=pnl;IP.BackgroundTransparency=0.15;IP.BorderSizePixel=0;IP.ZIndex=10;IP.Parent=SG
local IPC=Instance.new("UICorner");IPC.CornerRadius=UDim.new(0,8);IPC.Parent=IP
local IPS=Instance.new("UIStroke");IPS.Color=pnk;IPS.Thickness=1;IPS.Parent=IP

local IT=Instance.new("Frame")
IT.Size=UDim2.new(1,0,0,22);IT.BackgroundColor3=hdr;IT.BorderSizePixel=0;IT.ZIndex=10;IT.Parent=IP
local ITC=Instance.new("UICorner");ITC.CornerRadius=UDim.new(0,8);ITC.Parent=IT

local ITi=Instance.new("TextLabel")
ITi.Size=UDim2.new(1,-10,1,0);ITi.Position=UDim2.new(0,8,0,0)
ITi.BackgroundTransparency=1;ITi.Text="LOKIO MADE BY AQUARIUMAN1🩷";ITi.TextColor3=pnk;ITi.Font=Enum.Font.GothamBold;ITi.TextSize=9;ITi.TextXAlignment=Enum.TextXAlignment.Left;ITi.ZIndex=10;ITi.Parent=IT

local FL=Instance.new("TextLabel")
FL.Size=UDim2.new(1,-16,0,14);FL.Position=UDim2.new(0,8,0,26)
FL.BackgroundTransparency=1;FL.Text="FPS  --";FL.TextColor3=txt;FL.Font=Enum.Font.Code;FL.TextSize=11;FL.TextXAlignment=Enum.TextXAlignment.Left;FL.ZIndex=10;FL.Parent=IP

local PL=Instance.new("TextLabel")
PL.Size=UDim2.new(1,-16,0,14);PL.Position=UDim2.new(0,8,0,40)
PL.BackgroundTransparency=1;PL.Text="PING --";PL.TextColor3=txt;PL.Font=Enum.Font.Code;PL.TextSize=11;PL.TextXAlignment=Enum.TextXAlignment.Left;PL.ZIndex=10;PL.Parent=IP

local TL=Instance.new("TextLabel")
TL.Size=UDim2.new(1,-16,0,14);TL.Position=UDim2.new(0,8,0,54)
TL.BackgroundTransparency=1;TL.Text="TARGET --";TL.TextColor3=wrn;TL.Font=Enum.Font.Code;TL.TextSize=11;TL.TextXAlignment=Enum.TextXAlignment.Left;TL.ZIndex=10;TL.Parent=IP

local SL=Instance.new("TextLabel")
SL.Size=UDim2.new(1,-16,0,14);SL.Position=UDim2.new(0,8,0,68)
SL.BackgroundTransparency=1;SL.Text="K/D 0/0";SL.TextColor3=txtD;SL.Font=Enum.Font.Code;SL.TextSize=10;SL.TextXAlignment=Enum.TextXAlignment.Left;SL.ZIndex=10;SL.Parent=IP

local SSL=Instance.new("TextLabel")
SSL.Size=UDim2.new(1,-16,0,14);SSL.Position=UDim2.new(0,8,0,82)
SSL.BackgroundTransparency=1;SSL.Text="SESSION 0s";SSL.TextColor3=txtD;SSL.Font=Enum.Font.Code;SSL.TextSize=10;SSL.TextXAlignment=Enum.TextXAlignment.Left;SSL.ZIndex=10;SSL.Parent=IP

G.FL=FL
G.PL=PL
G.TL=TL
G.SL=SL
G.SSL=SSL

local KF=Instance.new("Frame")
KF.Size=UDim2.new(0,220,0,140);KF.Position=UDim2.new(1,-230,0,200)
KF.BackgroundTransparency=1
KF.ZIndex=11
KF.Parent=SG
local KFL=Instance.new("UIListLayout");KFL.Padding=UDim.new(0,3);KFL.Parent=KF

local function kfe(t,c)
local l=Instance.new("TextLabel")
l.Size=UDim2.new(1,0,0,18)
l.BackgroundColor3=pnl
l.BackgroundTransparency=0.3
l.Text="  "..t
l.TextColor3=c or txt
l.Font=Enum.Font.GothamBold
l.TextSize=10
l.TextXAlignment=Enum.TextXAlignment.Left
l.ZIndex=11
l.Parent=KF
local lc=Instance.new("UICorner");lc.CornerRadius=UDim.new(0,4);lc.Parent=l
Tween:Create(l,TweenInfo.new(0.3),{BackgroundTransparency=0.7,TextTransparency=0.5}):Play()
G.Debris:AddItem(l,4)
end
G.addKillFeedEntry=kfe
G.kfe=kfe

local P=Instance.new("Frame")
P.Size=UDim2.new(0,540,0,360);P.Position=UDim2.new(0.5,-270,0.5,-180)
P.BackgroundColor3=pnl;P.BorderSizePixel=0;P.Active=true;P.Draggable=true;P.ZIndex=20;P.Parent=SG
local PC=Instance.new("UICorner");PC.CornerRadius=UDim.new(0,10);PC.Parent=P
local PS=Instance.new("UIStroke");PS.Color=pnk;PS.Thickness=1;PS.Parent=P

local H=Instance.new("Frame")
H.Size=UDim2.new(1,0,0,48);H.BackgroundColor3=hdr;H.BorderSizePixel=0;H.ZIndex=21;H.Parent=P
local HC=Instance.new("UICorner");HC.CornerRadius=UDim.new(0,10);HC.Parent=H

local HCv=Instance.new("Frame")
HCv.Size=UDim2.new(1,0,0,10);HCv.Position=UDim2.new(0,0,1,-10)
HCv.BackgroundColor3=hdr;HCv.BorderSizePixel=0;HCv.ZIndex=21;HCv.Parent=H

local AB=Instance.new("Frame")
AB.Size=UDim2.new(0,4,1,-12);AB.Position=UDim2.new(0,10,0,6)
AB.BackgroundColor3=pnk;AB.BorderSizePixel=0;AB.ZIndex=22;AB.Parent=H
local ABC=Instance.new("UICorner");ABC.CornerRadius=UDim.new(0,2);ABC.Parent=AB

local T=Instance.new("TextLabel")
T.Size=UDim2.new(0,380,0,22);T.Position=UDim2.new(0,22,0,4)
T.BackgroundTransparency=1;T.Text="LOKIO MADE BY AQUARIUMAN1🩷";T.TextColor3=pnk;T.Font=Enum.Font.GothamBlack;T.TextSize=14;T.TextXAlignment=Enum.TextXAlignment.Left;T.ZIndex=22;T.Parent=H

local Sub=Instance.new("TextLabel")
Sub.Size=UDim2.new(0,380,0,16);Sub.Position=UDim2.new(0,22,0,26)
Sub.BackgroundTransparency=1;Sub.Text="v9.0 6-part";Sub.TextColor3=txtM;Sub.Font=Enum.Font.Gotham;Sub.TextSize=10;Sub.TextXAlignment=Enum.TextXAlignment.Left;Sub.ZIndex=22;Sub.Parent=H

local SD=Instance.new("Frame")
SD.Size=UDim2.new(0,8,0,8);SD.Position=UDim2.new(1,-110,0,20)
SD.BackgroundColor3=dgr;SD.BorderSizePixel=0;SD.ZIndex=22;SD.Parent=H
local SDC=Instance.new("UICorner");SDC.CornerRadius=UDim.new(1,0);SDC.Parent=SD

local ST=Instance.new("TextLabel")
ST.Size=UDim2.new(0,60,0,20);ST.Position=UDim2.new(1,-98,0,14)
ST.BackgroundTransparency=1;ST.Text="IDLE";ST.TextColor3=txtD;ST.Font=Enum.Font.Code;ST.TextSize=11;ST.TextXAlignment=Enum.TextXAlignment.Left;ST.ZIndex=22;ST.Parent=H

local MB=Instance.new("TextButton")
MB.Size=UDim2.new(0,26,0,22);MB.Position=UDim2.new(1,-60,0,13)
MB.BackgroundColor3=btn;MB.Text="—";MB.TextColor3=txtD;MB.Font=Enum.Font.GothamBold;MB.TextSize=12;MB.AutoButtonColor=false;MB.ZIndex=22;MB.Parent=H
local MBC=Instance.new("UICorner");MBC.CornerRadius=UDim.new(0,5);MBC.Parent=MB

local CB=Instance.new("TextButton")
CB.Size=UDim2.new(0,26,0,22);CB.Position=UDim2.new(1,-32,0,13)
CB.BackgroundColor3=btn;CB.Text="X";CB.TextColor3=txtD;CB.Font=Enum.Font.GothamBold;CB.TextSize=12;CB.AutoButtonColor=false;CB.ZIndex=22;CB.Parent=H
local CBC=Instance.new("UICorner");CBC.CornerRadius=UDim.new(0,5);CBC.Parent=CB

local OB=Instance.new("TextButton")
OB.Size=UDim2.new(0,50,0,50);OB.Position=UDim2.new(0,20,0.5,-25)
OB.BackgroundColor3=pnl;OB.Text="L";OB.TextColor3=pnk;OB.Font=Enum.Font.GothamBlack;OB.TextSize=17;OB.Active=true;OB.Draggable=true;OB.Visible=false;OB.ZIndex=20;OB.Parent=SG
local OBC=Instance.new("UICorner");OBC.CornerRadius=UDim.new(1,0);OBC.Parent=OB
local OBS=Instance.new("UIStroke");OBS.Color=pnk;OBS.Thickness=1.5;OBS.Parent=OB

G.P=P
G.ST=ST
G.SD=SD
G.MB=MB
G.CB=CB
G.OB=OB

local Tb=Instance.new("Frame")
Tb.Size=UDim2.new(0,100,1,-64);Tb.Position=UDim2.new(0,6,0,54)
Tb.BackgroundColor3=sb;Tb.BorderSizePixel=0;Tb.ZIndex=21;Tb.Parent=P
local TbC=Instance.new("UICorner");TbC.CornerRadius=UDim.new(0,8);TbC.Parent=Tb
local TbL=Instance.new("UIListLayout");TbL.Padding=UDim.new(0,3);TbL.Parent=Tb
local TbP=Instance.new("UIPadding");TbP.PaddingTop=UDim.new(0,6);TbP.PaddingLeft=UDim.new(0,5);TbP.PaddingRight=UDim.new(0,5);TbP.Parent=Tb

local Pg=Instance.new("Frame")
Pg.Size=UDim2.new(1,-114,1,-64)
Pg.Position=UDim2.new(0,108,0,54)
Pg.BackgroundTransparency=1
Pg.ZIndex=21
Pg.Parent=P

local function mkTab(n,o)
local b=Instance.new("TextButton")
b.Size=UDim2.new(1,0,0,32);b.BackgroundColor3=btn;b.Text=n;b.TextColor3=txtD;b.Font=Enum.Font.GothamBold;b.TextSize=11;b.LayoutOrder=o;b.AutoButtonColor=false;b.ZIndex=22;b.Parent=Tb
local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,6);c.Parent=b
return b
end

local function mkPg()
local p=Instance.new("ScrollingFrame")
p.Size=UDim2.new(1,0,1,0);p.BackgroundTransparency=1;p.BorderSizePixel=0;p.ScrollBarThickness=3;p.ScrollBarImageColor3=pnk;p.CanvasSize=UDim2.new(0,0,0,0);p.AutomaticCanvasSize=Enum.AutomaticSize.Y;p.Visible=false;p.ZIndex=22;p.Parent=Pg
local l=Instance.new("UIListLayout");l.Padding=UDim.new(0,6);l.Parent=p
return p
end

local TA=mkTab("AIM",1)
local TV=mkTab("VISUAL",2)
local TP=mkTab("PLAYER",3)
local TW=mkTab("WORLD",4)
local TM=mkTab("MISC",5)
local TS=mkTab("STATS",6)

local PA=mkPg()
local PV=mkPg()
local PP=mkPg()
local PW=mkPg()
local PM=mkPg()
local PSt=mkPg()

local AT={TA,TV,TP,TW,TM,TS}
local APG={PA,PV,PP,PW,PM,PSt}

local function show(i)
for k,p in ipairs(APG)do
p.Visible=(k==i)
AT[k].BackgroundColor3=(k==i) and btnA or btn
AT[k].TextColor3=(k==i) and Color3.fromRGB(255,255,255) or txtD
end
end

TA.MouseButton1Click:Connect(function()show(1)end)
TV.MouseButton1Click:Connect(function()show(2)end)
TP.MouseButton1Click:Connect(function()show(3)end)
TW.MouseButton1Click:Connect(function()show(4)end)
TM.MouseButton1Click:Connect(function()show(5)end)
TS.MouseButton1Click:Connect(function()show(6)end)
show(1)

local function mkSec(par,ttl)
local h=Instance.new("Frame");h.Size=UDim2.new(1,0,0,20);h.BackgroundTransparency=1;h.ZIndex=23;h.Parent=par
local b=Instance.new("Frame");b.Size=UDim2.new(0,3,0,12);b.Position=UDim2.new(0,0,0,4);b.BackgroundColor3=pnk;b.BorderSizePixel=0;b.ZIndex=23;b.Parent=h
local bc=Instance.new("UICorner");bc.CornerRadius=UDim.new(0,2);bc.Parent=b
local l=Instance.new("TextLabel");l.Size=UDim2.new(1,-10,1,0);l.Position=UDim2.new(0,10,0,0);l.BackgroundTransparency=1;l.Text=ttl;l.TextColor3=txtD;l.Font=Enum.Font.GothamBold;l.TextSize=10;l.TextXAlignment=Enum.TextXAlignment.Left;l.ZIndex=23;l.Parent=h
return h
end

local function mkB(par,txt)
local b=Instance.new("TextButton")
b.Size=UDim2.new(1,0,0,30);b.BackgroundColor3=btn;b.Text=txt;b.TextColor3=txt;b.Font=Enum.Font.GothamBold;b.TextSize=11;b.AutoButtonColor=false;b.ZIndex=23;b.Parent=par
local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,6);c.Parent=b
b.MouseEnter:Connect(function()if b.BackgroundColor3==btn then Tween:Create(b,TweenInfo.new(0.12),{BackgroundColor3=btnH}):Play()end end)
b.MouseLeave:Connect(function()if b.BackgroundColor3==btnH then Tween:Create(b,TweenInfo.new(0.12),{BackgroundColor3=btn}):Play()end end)
return b
end

local function mkSl(par,lbl)
local h=Instance.new("Frame");h.Size=UDim2.new(1,0,0,40);h.BackgroundTransparency=1;h.ZIndex=23;h.Parent=par
local l=Instance.new("TextLabel");l.Size=UDim2.new(0.7,0,0,16);l.BackgroundTransparency=1;l.Text=lbl;l.TextColor3=txtD;l.Font=Enum.Font.Gotham;l.TextSize=11;l.TextXAlignment=Enum.TextXAlignment.Left;l.ZIndex=23;l.Parent=h
local v=Instance.new("TextLabel");v.Size=UDim2.new(0.3,0,0,16);v.Position=UDim2.new(0.7,0,0,0);v.BackgroundTransparency=1;v.Text="";v.TextColor3=pnk;v.Font=Enum.Font.Code;v.TextSize=11;v.TextXAlignment=Enum.TextXAlignment.Right;v.ZIndex=23;v.Parent=h
local b=Instance.new("Frame");b.Size=UDim2.new(1,0,0,14);b.Position=UDim2.new(0,0,0,20);b.BackgroundColor3=bg;b.BorderSizePixel=0;b.ZIndex=23;b.Parent=h
local bc=Instance.new("UICorner");bc.CornerRadius=UDim.new(1,0);bc.Parent=b
local f=Instance.new("Frame");f.Size=UDim2.new(0.5,0,1,0);f.BackgroundColor3=acc;f.BorderSizePixel=0;f.ZIndex=23;f.Parent=b
local fc=Instance.new("UICorner");fc.CornerRadius=UDim.new(1,0);fc.Parent=f
local k=Instance.new("Frame");k.Size=UDim2.new(0,10,0,10);k.Position=UDim2.new(0.5,-5,0,2);k.BackgroundColor3=Color3.fromRGB(255,255,255);k.BorderSizePixel=0;k.ZIndex=24;k.Parent=b
local kc=Instance.new("UICorner");kc.CornerRadius=UDim.new(1,0);kc.Parent=k
return l,v,b,f,k
end

local function sl(b,f,k,cb)
local d=false
b.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then d=true end end)
UIS.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then d=false end end)
UIS.InputChanged:Connect(function(i)
if not d then return end
if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement then
local p=math.clamp((i.Position.X-b.AbsolutePosition.X)/b.AbsoluteSize.X,0,1)
f.Size=UDim2.new(p,0,1,0);k.Position=UDim2.new(p,-5,0,2);cb(p)
end
end)
end

G.mkTab=mkTab
G.mkPg=mkPg
G.mkSec=mkSec
G.mkB=mkB
G.mkSl=mkSl
G.sl=sl
G.show=show
G.PA=PA
G.PV=PV
G.PP=PP
G.PW=PW
G.PM=PM
G.PSt=PSt

print("[P5/6] loaded — paste PART 6") local G=_G.BLOODAIM
if not G then warn("run 1-5 first");return end

local Players=G.Players
local RunService=G.RunService
local Cam=G.Cam
local Tween=G.Tween
local LP=G.LP
local Stats=G.Stats
local C=G.C
local PLB=G.PRIORITY_LB
local ALB=G.AIM_LB
local SLB=G.SILENT_LB
local PRIO=G.PRIORITIES
local AP=G.AIM_PARTS
local SP=G.SILENT_PARTS

local bg=G.col.bg
local pnl=G.col.pnl
local btn=G.col.btn
local btnA=G.col.btnA
local acc=G.col.acc
local txt=G.col.txt
local txtD=G.col.txtD
local suc=G.col.suc
local wrn=G.col.wrn
local dgr=G.col.dgr
local pnk=G.col.pnk
local cyn=G.col.cyn

local mkB=G.mkB
local mkSl=G.mkSl
local mkSec=G.mkSec
local sl=G.sl
local kfe=G.kfe

local PA=G.PA
local PV=G.PV
local PP=G.PP
local PW=G.PW
local PM=G.PM
local PSt=G.PSt

local Circle=G.Circle
local CH=G.CH
local CH2=G.CH2
local TR=G.TR
local ST=G.ST
local SD=G.SD
local FL=G.FL
local PL=G.PL
local TL=G.TL
local SL=G.SL
local SSL=G.SSL
local P=G.P
local MB=G.MB
local CB=G.CB
local OB=G.OB
local SG=G.SG

mkSec(PA,"TARGETING")
local AB_=mkB(PA,"AIM  OFF")
local TB=mkB(PA,"TEAM CHECK  ON")
local PB=mkB(PA,"PREDICTION  OFF")
local APB=mkB(PA,"AIM PART  UPPER TORSO")
local PrioB=mkB(PA,"PRIORITY  CLOSEST")

mkSec(PA,"SILENT AIM")
local SiB=mkB(PA,"SILENT AIM  OFF")
local SPB=mkB(PA,"SILENT PART  HEAD")

mkSec(PA,"AIM SETTINGS")
local CL,CV,CBar,CFill,CKnob=mkSl(PA,"CIRCLE")
local SLL,SV,SBar,SFill,SKnob=mkSl(PA,"SMOOTH")
local StL,StV,StBar,StFill,StKnob=mkSl(PA,"STICKY")
local FlL,FlV,FlBar,FlFill,FlKnob=mkSl(PA,"FLICK")
local ML,MV,MBar,MFill,MKnob=mkSl(PA,"MISS CHANCE")

mkSec(PA,"OVERLAY")
local CirB=mkB(PA,"CIRCLE  ON")
local CrB=mkB(PA,"CROSSHAIR  ON")

mkSec(PV,"HITBOX")
local HiB=mkB(PV,"HITBOX EXPAND  OFF")
local ShB=mkB(PV,"SHRINK SELF  OFF")
local HL,HV,HBar,HFill,HKnob=mkSl(PV,"HITBOX SCALE")
local SHL,SHV,SHBar,SHFill,SHKnob=mkSl(PV,"SHRINK SCALE")

mkSec(PV,"PLAYER OVERLAY")
local TrB=mkB(PV,"TRACER  OFF")
local NB=mkB(PV,"NAMETAG  OFF")
local HPB=mkB(PV,"HEALTHBAR  OFF")
local EB=mkB(PV,"ESP BOX  OFF")
local ChB=mkB(PV,"CHAMS  OFF")
local HMB=mkB(PV,"HITMARKER  ON")

mkSec(PP,"MOVEMENT")
local SpB=mkB(PP,"SPEED  OFF")
local JmB=mkB(PP,"JUMP  OFF")
local IJB=mkB(PP,"INFINITE JUMP  OFF")
local SpL,SpV,SpBar,SpFill,SpKnob=mkSl(PP,"SPEED")
local JpL,JpV,JpBar,JpFill,JpKnob=mkSl(PP,"JUMP")

mkSec(PP,"SURVIVAL")
local AVB=mkB(PP,"ANTI VOID  OFF")
local RB=mkB(PP,"FAST RESPAWN  OFF")
local RjB=mkB(PP,"AUTO REJOIN  OFF")
local HB=mkB(PP,"SERVER HOP")

mkSec(PW,"VISUALS")
local FB=mkB(PW,"FULLBRIGHT  OFF")
local FgB=mkB(PW,"NO FOG  OFF")
local ShdB=mkB(PW,"NO SHADOWS  OFF")
local PtB=mkB(PW,"NO PARTICLES  OFF")
local GrB=mkB(PW,"NO GRASS  OFF")

mkSec(PW,"CAMERA")
local FOVL,FOVV,FOVBar,FOVFill,FOVKnob=mkSl(PW,"FIELD OF VIEW")
local TmB=mkB(PW,"TIME OF DAY  OFF")
local TmL,TmV,TmBar,TmFill,TmKnob=mkSl(PW,"CLOCK TIME")
local FPSB=mkB(PW,"FPS UNLOCK  OFF")

mkSec(PM,"FEEDBACK")
local KSB=mkB(PM,"KILL SAY  OFF")
local FPSLB=mkB(PM,"SHOW FPS  ON")
local PingLB=mkB(PM,"SHOW PING  ON")

mkSec(PM,"PREDICTION")
local PrSL,PrV,PrBar,PrFill,PrKnob=mkSl(PM,"PRED STRENGTH")

mkSec(PSt,"LIVE")
local SKL=Instance.new("TextLabel")
SKL.Size=UDim2.new(1,0,0,22);SKL.BackgroundColor3=btn;SKL.Text="  KILLS  0";SKL.TextColor3=txt;SKL.Font=Enum.Font.GothamBold;SKL.TextSize=11;SKL.TextXAlignment=Enum.TextXAlignment.Left;SKL.ZIndex=23;SKL.Parent=PSt
local SKC=Instance.new("UICorner");SKC.CornerRadius=UDim.new(0,6);SKC.Parent=SKL

local SDL=Instance.new("TextLabel")
SDL.Size=UDim2.new(1,0,0,22);SDL.BackgroundColor3=btn;SDL.Text="  DEATHS  0";SDL.TextColor3=txt;SDL.Font=Enum.Font.GothamBold;SDL.TextSize=11;SDL.TextXAlignment=Enum.TextXAlignment.Left;SDL.ZIndex=23;SDL.Parent=PSt
local SDC2=Instance.new("UICorner");SDC2.CornerRadius=UDim.new(0,6);SDC2.Parent=SDL

local SKDL=Instance.new("TextLabel")
SKDL.Size=UDim2.new(1,0,0,22);SKDL.BackgroundColor3=btn;SKDL.Text="  K/D  0.00";SKDL.TextColor3=wrn;SKDL.Font=Enum.Font.GothamBold;SKDL.TextSize=11;SKDL.TextXAlignment=Enum.TextXAlignment.Left;SKDL.ZIndex=23;SKDL.Parent=PSt
local SKDC=Instance.new("UICorner");SKDC.CornerRadius=UDim.new(0,6);SKDC.Parent=SKDL

mkSec(PSt,"PLAYERS")
local PLF=Instance.new("Frame")
PLF.Size=UDim2.new(1,0,0,220)
PLF.BackgroundColor3=bg
PLF.BackgroundTransparency=0.3
PLF.BorderSizePixel=0
PLF.ZIndex=23
PLF.Parent=PSt
local PLC=Instance.new("UICorner");PLC.CornerRadius=UDim.new(0,6);PLC.Parent=PLF
local PLS=Instance.new("ScrollingFrame")
PLS.Size=UDim2.new(1,-4,1,-4)
PLS.Position=UDim2.new(0,2,0,2)
PLS.BackgroundTransparency=1
PLS.BorderSizePixel=0
PLS.ScrollBarThickness=3
PLS.ScrollBarImageColor3=pnk
PLS.CanvasSize=UDim2.new(0,0,0,0)
PLS.AutomaticCanvasSize=Enum.AutomaticSize.Y
PLS.ZIndex=23
PLS.Parent=PLF
local PLL=Instance.new("UIListLayout");PLL.Padding=UDim.new(0,2);PLL.Parent=PLS

local pRows={}
local function refreshPL()
for _,r in ipairs(pRows)do r:Destroy()end
pRows={}
for _,p in ipairs(Players:GetPlayers())do
local d=0
if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
d=math.floor((p.Character.HumanoidRootPart.Position-Cam.CFrame.Position).Magnitude)
end
local l=Instance.new("TextLabel")
l.Size=UDim2.new(1,0,0,22)
l.BackgroundColor3=(p==LP) and btnA or btn
l.Text="  "..p.Name:sub(1,14).." · "..d.."m"
l.TextColor3=txt
l.Font=Enum.Font.GothamBold
l.TextSize=10
l.TextXAlignment=Enum.TextXAlignment.Left
l.ZIndex=23
l.Parent=PLS
local lc=Instance.new("UICorner");lc.CornerRadius=UDim.new(0,4);lc.Parent=l
l.MouseButton1Click:Connect(function()
if p.Character and p.Character:FindFirstChild("HumanoidRootPart") and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
LP.Character.HumanoidRootPart.CFrame=p.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,3)
kfe("teleported to "..p.Name,cyn)
end
end)
table.insert(pRows,l)
end
end

sl(CBar,CFill,CKnob,function(p)C.Circle=math.floor(40+p*360);CV.Text=tostring(C.Circle);Circle.Size=UDim2.new(0,C.Circle,0,C.Circle);Circle.Position=UDim2.new(0.5,-C.Circle/2,0.5,-C.Circle/2)end)
sl(SBar,SFill,SKnob,function(p)C.Assist=math.floor((0.1+p*0.9)*100)/100;SV.Text=tostring(C.Assist)end)
sl(StBar,StFill,StKnob,function(p)C.StickyTime=math.floor((0.05+p*1.45)*100)/100;StV.Text=C.StickyTime.."s"end)
sl(FlBar,FlFill,FlKnob,function(p)C.FlickThreshold=math.floor(5+p*95);FlV.Text=C.FlickThreshold.."px"end)
sl(MBar,MFill,MKnob,function(p)C.MissChance=math.floor(p*100)/100;MV.Text=math.floor(C.MissChance*100).."%"end)
sl(HBar,HFill,HKnob,function(p)C.HitboxScale=math.floor((1+p*9)*10)/10;HV.Text=C.HitboxScale.."x";if C.HitboxOn then G.applyHitboxAll()end end)
sl(SHBar,SHFill,SHKnob,function(p)C.ShrinkScale=math.floor((0.1+p*0.7)*100)/100;SHV.Text=C.ShrinkScale.."x";if C.ShrinkOn then G.applyShrinkSelf()end end)
sl(SpBar,SpFill,SpKnob,function(p)C.SpeedValue=math.floor(16+p*84);SpV.Text=tostring(C.SpeedValue);if C.SpeedOn then G.applySpeed()end end)
sl(JpBar,JpFill,JpKnob,function(p)C.JumpValue=math.floor(50+p*150);JpV.Text=tostring(C.JumpValue);if C.JumpOn then G.applyJump()end end)
sl(FOVBar,FOVFill,FOVKnob,function(p)C.FOVValue=math.floor(70+p*60);FOVV.Text=tostring(C.FOVValue);G.applyFOV()end)
sl(PrBar,PrFill,PrKnob,function(p)C.PredStrength=math.floor(p*40)/100;PrV.Text=tostring(C.PredStrength)end)
sl(TmBar,TmFill,TmKnob,function(p)C.TimeOfDay=math.floor(p*24);TmV.Text=tostring(C.TimeOfDay).."h";if C.TimeOn then G.applyLighting()end end)

CV.Text="140";SV.Text="1";StV.Text="0.35s";FlV.Text="30px";MV.Text="0%";HV.Text="3x";SHV.Text="0.35x";SpV.Text="22";JpV.Text="80";FOVV.Text="90";PrV.Text="0.15";TmV.Text="0h"

local function tg(b,k,l,fn)
b.MouseButton1Click:Connect(function()
C[k]=not C[k]
b.Text=l.."  "..(C[k] and "ON" or "OFF")
b.BackgroundColor3=C[k] and btnA or btn
if fn then fn()end
end)
end

tg(AB_,"AimOn","AIM")
tg(TB,"TeamCheck","TEAM CHECK")
tg(PB,"Prediction","PREDICTION")
tg(SiB,"SilentOn","SILENT AIM")
tg(CirB,"CircleVisible","CIRCLE",function()Circle.Visible=C.CircleVisible end)
tg(CrB,"CrosshairOn","CROSSHAIR",function()CH.Visible=C.CrosshairOn;CH2.Visible=C.CrosshairOn end)
tg(HiB,"HitboxOn","HITBOX EXPAND",G.applyHitboxAll)
tg(ShB,"ShrinkOn","SHRINK SELF",G.applyShrinkSelf)
tg(TrB,"TracerOn","TRACER")
tg(NB,"NameTagOn","NAMETAG")
tg(HPB,"HealthBarOn","HEALTHBAR")
tg(EB,"ESPBoxOn","ESP BOX")
tg(ChB,"ChamsOn","CHAMS")
tg(HMB,"HitmarkerOn","HITMARKER")
tg(SpB,"SpeedOn","SPEED",G.applySpeed)
tg(JmB,"JumpOn","JUMP",G.applyJump)
tg(IJB,"InfiniteJump","INFINITE JUMP")
tg(AVB,"AntiVoidOn","ANTI VOID")
tg(RB,"FastRespawn","FAST RESPAWN")
tg(RjB,"AutoRejoin","AUTO REJOIN")
tg(FB,"FullbrightOn","FULLBRIGHT",G.applyLighting)
tg(FgB,"NoFog","NO FOG",G.applyLighting)
tg(ShdB,"NoShadows","NO SHADOWS",G.applyLighting)
tg(PtB,"NoParticles","NO PARTICLES",G.applyParticles)
tg(GrB,"NoGrass","NO GRASS",G.applyNoGrass)
tg(TmB,"TimeOn","TIME OF DAY",G.applyLighting)
tg(FPSB,"FPSUnlock","FPS UNLOCK",G.applyFPSUnlock)
tg(KSB,"KillSay","KILL SAY")
tg(FPSLB,"ShowFPS","SHOW FPS",function()FL.Visible=C.ShowFPS end)
tg(PingLB,"ShowPing","SHOW PING",function()PL.Visible=C.ShowPing end)

APB.MouseButton1Click:Connect(function()
local i=G.getAimIdx()+1;if i>#AP then i=1 end
G.setAimIdx(i)
C.AimPart=AP[i]
APB.Text="AIM PART  "..ALB[C.AimPart]
end)

SPB.MouseButton1Click:Connect(function()
local i=G.getSilIdx()+1;if i>#SP then i=1 end
G.setSilIdx(i)
C.SilentPart=SP[i]
SPB.Text="SILENT PART  "..SLB[C.SilentPart]
end)

PrioB.MouseButton1Click:Connect(function()
local i=G.getPrioIdx()+1;if i>#PRIO then i=1 end
G.setPrioIdx(i)
C.AimPriority=PRIO[i]
PrioB.Text="PRIORITY  "..PLB[C.AimPriority]
end)

HB.MouseButton1Click:Connect(function()HB.Text="HOPPING...";G.serverHop()end)
MB.MouseButton1Click:Connect(function()P.Visible=false;OB.Visible=true end)
OB.MouseButton1Click:Connect(function()P.Visible=true;OB.Visible=false end)
CB.MouseButton1Click:Connect(function()SG:Destroy()end)

local function uti(p)
if p and p.Character then
local hum=p.Character:FindFirstChildOfClass("Humanoid")
local hrp=p.Character:FindFirstChild("HumanoidRootPart")
if hum and hrp then
local d=(hrp.Position-Cam.CFrame.Position).Magnitude
TL.Text=p.Name:sub(1,12).." "..math.floor(d).."m"
end
else TL.Text="TARGET --" end
end

local lastKill=0
local lastRefresh=0
local chams={}

local function applyChams(p)
if not p.Character then return end
if C.ChamsOn then
if not chams[p] then
local h=Instance.new("Highlight")
h.Name="_c_"..p.Name
h.FillColor=Color3.fromRGB(255,80,80)
h.FillTransparency=0.5
h.OutlineColor=Color3.fromRGB(255,255,255)
h.OutlineTransparency=0
h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
h.Parent=p.Character
chams[p]=h
end
else
if chams[p] then chams[p]:Destroy();chams[p]=nil end
end
end

RunService.RenderStepped:Connect(function(dt)
local st=G.getSticky()
if C.AimOn and st then
local part=G.aimPart(st)
if part then
local pp=G.predictPos(st,part)
local sp,on=Cam:WorldToViewportPoint(pp)
if on then
TR.Visible=true
TR.Position=UDim2.new(0,sp.X-22,0,sp.Y-22)
else TR.Visible=false end
ST.Text="LOCKED";ST.TextColor3=suc;SD.BackgroundColor3=suc
uti(st)
end
else
TR.Visible=false
ST.Text="IDLE";ST.TextColor3=txtD;SD.BackgroundColor3=dgr
uti(nil)
end

if C.ShowFPS then FL.Text="FPS  "..G.getFpsValue() end
if C.ShowPing then pcall(function()local pg=Stats.Network.ServerStatsItem["Data Ping"]:GetValue();PL.Text="PING "..math.floor(pg)end)end
local k=G.getKillCount()
local d2=G.getDeathCount()
SL.Text="K/D "..k.."/"..d2
local ss=math.floor(tick()-G.getSessionStart())
SSL.Text="SESSION "..ss.."s"
local kd=d2>0 and (k/d2) or k
SKL.Text="  KILLS  "..k
SDL.Text="  DEATHS  "..d2
SKDL.Text="  K/D  "..string.format("%.2f",kd)

local now=tick()
if k>lastKill then
lastKill=k
kfe("kill · total "..k,suc)
end

if now-lastRefresh>2 then
lastRefresh=now
refreshPL()
end

for _,p in ipairs(Players:GetPlayers())do
if p~=LP then
if C.ChamsOn then applyChams(p) end
local tag=SG:FindFirstChild("tag_"..p.Name)
local box=SG:FindFirstChild("box_"..p.Name)
local line=SG:FindFirstChild("line_"..p.Name)
local hpbg=SG:FindFirstChild("hpbg_"..p.Name)
local hpb=SG:FindFirstChild("hpb_"..p.Name)
if G.isEnemy(p) and p.Character then
local hrp=p.Character:FindFirstChild("HumanoidRootPart") or p.Character:FindFirstChild("Head")
local head=p.Character:FindFirstChild("Head")
local hum=p.Character:FindFirstChildOfClass("Humanoid")
if hrp then
local sp,on=Cam:WorldToViewportPoint(hrp.Position)
if on then
local topY=sp.Y-40
local botY=sp.Y+40
if head then local hp,hs=Cam:WorldToViewportPoint(head.Position+Vector3.new(0,0.5,0));if hs then topY=hp.Y end end
local h=botY-topY
local w=h*0.55
if C.NameTagOn then
if not tag then
tag=Instance.new("TextLabel");tag.Name="tag_"..p.Name;tag.Size=UDim2.new(0,100,0,14);tag.BackgroundTransparency=1;tag.TextColor3=txt;tag.Font=Enum.Font.GothamBold;tag.TextSize=11;tag.TextStrokeTransparency=0;tag.ZIndex=5;tag.Parent=SG
end
tag.Visible=true;tag.Text=p.Name;tag.Position=UDim2.new(0,sp.X-50,0,topY-16)
elseif tag then tag.Visible=false end
if C.ESPBoxOn then
if not box then
box=Instance.new("Frame");box.Name="box_"..p.Name;box.BackgroundTransparency=1;box.BorderSizePixel=0;box.ZIndex=5;box.Parent=SG
local bc=Instance.new("UICorner");bc.CornerRadius=UDim.new(0,2);bc.Parent=box
local bs=Instance.new("UIStroke");bs.Color=acc;bs.Thickness=1.5;bs.Parent=box
end
box.Visible=true;box.Size=UDim2.new(0,w,0,h);box.Position=UDim2.new(0,sp.X-w/2,0,topY)
elseif box then box.Visible=false end
if C.HealthBarOn and hum then
local pct=hum.Health/hum.MaxHealth
if not hpbg then
hpbg=Instance.new("Frame");hpbg.Name="hpbg_"..p.Name;hpbg.BackgroundColor3=bg;hpbg.BorderSizePixel=0;hpbg.ZIndex=5;hpbg.Parent=SG
local bgc=Instance.new("UICorner");bgc.CornerRadius=UDim.new(0,1);bgc.Parent=hpbg
hpb=Instance.new("Frame");hpb.Name="hpb_"..p.Name;hpb.BorderSizePixel=0;hpb.ZIndex=6;hpb.Parent=SG
local bhc=Instance.new("UICorner");bhc.CornerRadius=UDim.new(0,1);bhc.Parent=hpb
end
hpbg.Visible=true;hpbg.Size=UDim2.new(0,3,0,h);hpbg.Position=UDim2.new(0,sp.X-w/2-5,0,topY)
hpb.Visible=true;hpb.Size=UDim2.new(0,3,0,h*pct);hpb.Position=UDim2.new(0,sp.X-w/2-5,0,topY+h*(1-pct))
hpb.BackgroundColor3=pct>0.5 and suc or pct>0.2 and wrn or dgr
else
if hpbg then hpbg.Visible=false end
if hpb then hpb.Visible=false end
end
if C.TracerOn then
if not line then
line=Instance.new("Frame");line.Name="line_"..p.Name;line.BorderSizePixel=0;line.BackgroundColor3=acc;line.BackgroundTransparency=0.4;line.ZIndex=5;line.Parent=SG
end
line.Visible=true
local fx=Cam.ViewportSize.X/2
local fy=Cam.ViewportSize.Y-10
local dx=sp.X-fx
local dy=botY-fy
local len=math.sqrt(dx*dx+dy*dy)
local ang=math.atan2(dy,dx)
line.Size=UDim2.new(0,len,0,1);line.Position=UDim2.new(0,fx,0,fy);line.Rotation=math.deg(ang);line.AnchorPoint=Vector2.new(0,0.5)
elseif line then line.Visible=false end
else
if tag then tag.Visible=false end
if box then box.Visible=false end
if line then line.Visible=false end
if hpbg then hpbg.Visible=false end
if hpb then hpb.Visible=false end
end
end
else
if tag then tag.Visible=false end
if box then box.Visible=false end
if line then line.Visible=false end
if hpbg then hpbg.Visible=false end
if hpb then hpb.Visible=false end
end
end
end
end)

print("[P6/6] loaded — LOKIO MADE BY AQUARIUMAN1🩷")
