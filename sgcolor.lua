mouse = game.Players.LocalPlayer:GetMouse()
mouse.KeyDown:Connect(function(key)
        if key:lower() == "m" then

    local shotty = game.Players.LocalPlayer.Backpack.Shotty:GetChildren()


for i,v in pairs (shotty) do
    if v.Name == "Union" then
    v.UsePartColor = true
    wait()
    v.Material = "Neon"
    v.Color = Color3.fromRGB(255, 0, 0)
    v.Transparency = 0.6
end
end
end
end)