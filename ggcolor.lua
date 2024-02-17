mouse = game.Players.LocalPlayer:GetMouse()
mouse.KeyDown:Connect(function(key)
        if key:lower() == "g" then

    local glock  = game.Players.LocalPlayer.Backpack.Glock:GetChildren()


for i,v in pairs (glock) do
   if v.Name == "Union" or "Heh" or "Handle" or "Barrel" or "Clip" then
    v.UsePartColor = true
    wait()
    v.Material = "Neon"
    v.Color = Color3.fromRGB(255, 0, 0)
    v.Transparency = 0.6


    end
end
end
end)