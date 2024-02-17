function GunAnims()
local lplr = game:GetService("Players").LocalPlayer
local shotty = lplr.Backpack:FindFirstChild("Shotty")
local Animation = Instance.new("Animation")
Animation.AnimationId = "rbxassetid://9863740031"
local plr = game:GetService('Players').LocalPlayer
local HUM = plr.Character.Humanoid:LoadAnimation(Animation)
shotty.Equipped:connect(function()
    wait(.1)
    HUM:Play()
    HUM:AdjustSpeed(0.0)
end)
shotty.Unequipped:connect(function()
    HUM:Stop()
end)
local lplr = game:GetService("Players").LocalPlayer
local Glock = lplr.Backpack:FindFirstChild("Glock")
local Animation = Instance.new("Animation")
Animation.AnimationId = "rbxassetid://9863740031"
local plr = game:GetService('Players').LocalPlayer
local HUM = plr.Character.Humanoid:LoadAnimation(Animation)
Glock.Equipped:connect(function()
    wait(.1)
    HUM:Play()
    HUM:AdjustSpeed(0.0)
end)
Glock.Unequipped:connect(function()
    HUM:Stop()
end)
end


game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
 if key == "z" then
GunAnims()
 end
end)