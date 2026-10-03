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
local originals={}
local fpsValue=0
local savedParticles={}
local lastHealth={}
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
G.getSessionStart=function()return sessionStart end
G.getKillCount=function()return killCount end
G.getDeathCount=function()return deathCount end
G.addKill=function(n)killCount=killCount+n end
G.addDeath=function()deathCount=deathCount+1 end

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
if C.SilentOn and silentTarget and silentTarget.Character then
local part=silentPart(silentTarget)
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

print("[P1] loaded — paste PART 2 next")
