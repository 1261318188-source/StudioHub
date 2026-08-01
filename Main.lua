local WindUI = loadstring(game:HttpGet(
"https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local plr = Players.LocalPlayer


local Window = WindUI:CreateWindow({
    Title = "Studio Test Hub",
    Icon = "code",
    Author = "kgu",
    Folder = "StudioHub"
})


WindUI:Notify({
    Title = "Loaded",
    Content = "Studio Hub Ready",
    Duration = 3
})


local Tab = Window:Tab({
    Title="Player",
    Icon="user"
})


Tab:Slider({
    Title="Speed",
    Value={
        Min=16,
        Max=150,
        Default=16
    },
    Callback=function(v)
        local h=plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
        if h then
            h.WalkSpeed=v
        end
    end
})


Tab:Slider({
    Title="Jump",
    Value={
        Min=50,
        Max=200,
        Default=50
    },
    Callback=function(v)
        local h=plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
        if h then
            h.JumpPower=v
        end
    end
})


local Move = Window:Tab({
    Title="Movement",
    Icon="move"
})


local InfJump=false

Move:Toggle({
    Title="Infinite Jump",
    Callback=function(v)
        InfJump=v
    end
})


UIS.JumpRequest:Connect(function()
    if InfJump then
        local h=plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
        if h then
            h:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)



local Invisible=false

Move:Toggle({
    Title="Invisible Test",
    Callback=function(v)
        Invisible=v

        local char=plr.Character

        if char then
            for _,p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.Transparency=v and 1 or 0
                end
            end
        end
    end
})



local Utility=Window:Tab({
    Title="Utility",
    Icon="settings"
})


Utility:Button({
    Title="Respawn",
    Callback=function()
        plr:LoadCharacter()
    end
})


Utility:Button({
    Title="Show Notification",
    Callback=function()
        WindUI:Notify({
            Title="Test",
            Content="Button works",
            Duration=2
        })
    end
})


Window:SelectTab(1)
