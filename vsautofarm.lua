print("Sub to XorBlox")
--[[
Sub to XorBlox

--]]



--[[
Settings
--]]

timewait=0.1 --    TP time, wait "timewait" seconds and then TP.
racestarttime=2 --  2-7 is recommended. starts at 0.1 seconds.




--[[
Code
--]]

db=false
while wait() do
while db == false do
wait()
local A_1 = 14
local Event = game:GetService("ReplicatedStorage")["Game Modes V2"].Shared.Remotes.RemoteEvents.Invite
Event:FireServer(A_1)
local A_1 = 14
local Event = game:GetService("ReplicatedStorage")["Game Modes V2"].Shared.Remotes.RemoteFunctions["join_mode"]
Event:InvokeServer(A_1)
local A_1 = 14
local Event = game:GetService("ReplicatedStorage")["Game Modes V2"].Shared.Remotes.RemoteEvents.Invite
Event:FireServer(A_1)
guis = game.Players.LocalPlayer.PlayerGui
wait(timewait)
for i,v in pairs(guis:GetChildren()) do 
if v.Name == "RaceGui" then
gui=game.Players.localPlayer.PlayerGui.RaceGui
db = true
else
wait()
end
end
end
while db == true do
wait()
if tonumber(gui.top_bar.time_info.Text) > racestarttime then
function findVehicle()
while not found do
local vehicles = Workspace.Vehicles:getChildren()
for i=1,#vehicles do
if vehicles[i]:findFirstChild'owner' then
if vehicles[i].owner.Value == game:GetService'Players'.LocalPlayer.Name then 
found = true 
vehicle = vehicles[i]
elseif vehicles[i + 1] == nil and not found then
end
end
end
end
vehicle.PrimaryPart = vehicle.Chassis.VehicleSeat
end
findVehicle()
for i = 1,16 do
local seat = game.Players.LocalPlayer.Character.Humanoid.SeatPart
local vehicleModel = seat.Parent
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
local tor = char:WaitForChild("HumanoidRootPart")
wait(timewait)
local nextstop="Checkpoint_"..i
vehicle:SetPrimaryPartCFrame(game.Workspace.Camera:WaitForChild(nextstop).CFrame)
game:GetService('VirtualUser'):SetKeyDown('w')
game:GetService('VirtualUser'):SetKeyDown('w')
game:GetService('VirtualUser'):SetKeyDown('w')
wait()
game:GetService('VirtualUser'):SetKeyDown('w')
game:GetService('VirtualUser'):SetKeyDown('w')
game:GetService('VirtualUser'):SetKeyDown('w')
game:GetService('VirtualUser'):SetKeyDown('w')
game:GetService('VirtualUser'):SetKeyDown('w')
game:GetService('VirtualUser'):SetKeyDown('w')
end
db=false
end
end
db=false
end