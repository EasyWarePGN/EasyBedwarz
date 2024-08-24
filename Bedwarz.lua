local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/OrionDev/OrionLib/main/source.lua"))()
local Window = OrionLib:MakeWindow({Name = "OrionHub AntiCheat", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionHub"})

local Tab1 = Window:MakeTab({
    Name = "AntiCheat Status",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab1:AddSection({
    Name = "Status",
    Side = "Left"
})

local statusLabel = Tab1:AddLabel({
    Name = "AntiCheat Status",
    Text = "Checking..."
})

local function UpdateStatus()
    local status = "Anticheat Status: Enabled"
    if not anticheat then
        status = "Anticheat Status: Disabled"
    end
    statusLabel:SetText(status)
end

local updateConnection = game:GetService("RunService").Heartbeat:Connect(function()
    UpdateStatus()
end)

Tab1:AddButton({
    Name = "Toggle AntiCheat",
    Callback = function()
        anticheat = not anticheat
        UpdateStatus()
    end
})

Tab1:AddNotification({
    Title = "Welcome!",
    Text = "Use the UI to toggle anti-cheat and view status.",
    Duration = 5
})

game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
    if updateConnection then
        updateConnection:Disconnect()
    end
end)
