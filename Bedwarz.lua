local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/OrionDev/OrionLib/main/source.lua"))()
local Window = OrionLib:MakeWindow({
    Name = "My OrionLib GUI",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "MyOrionLibConfig"
})

local Tab1 = Window:MakeTab({
    Name = "Main Tab",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab1:AddSection({
    Name = "Controls",
    Side = "Left"
})

local statusLabel = Tab1:AddLabel({
    Name = "Status Label",
    Text = "Status: Not activated"
})

local isActivated = false

local function UpdateStatus()
    if isActivated then
        statusLabel:SetText("Status: Activated")
    else
        statusLabel:SetText("Status: Not activated")
    end
end

Tab1:AddButton({
    Name = "Toggle Status",
    Callback = function()
        isActivated = not isActivated
        UpdateStatus()
    end
})

Tab1:AddNotification({
    Title = "Welcome!",
    Text = "Welcome to the OrionLib GUI example!",
    Duration = 5
})

local player = game.Players.LocalPlayer
if player and player.Character then
    player.Character:WaitForChild("Humanoid").Died:Connect(function()
        print("Character died, handling cleanup.")
    end)
end
