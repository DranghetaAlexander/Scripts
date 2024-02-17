while true do
    local WChild = workspace:GetChildren()
        for i = 1,#WChild do 
                if WChild[i].Name == "Door" and WChild[i]:FindFirstChild'Click' and WChild[i]:FindFirstChild'Lock' then
                        WChild[i].Lock.ClickDetector:FindFirstChildOfClass'RemoteEvent':FireServer()
                        WChild[i].Click.ClickDetector:FindFirstChildOfClass'RemoteEvent':FireServer()
                        wait()
                end
        end
    wait(0.2)
end