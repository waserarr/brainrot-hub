local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

-- Settings:
local correctKey = "saint1451-9"
local hubURL = "https://raw.githubusercontent.com/waserarr/brainrot-hub/main/hub.lua"

-- Create GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "SaintKeySystem"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 450, 0, 320)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(60, 60, 60)
stroke.Thickness = 2

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Saint's Brainrot | Key System"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.BackgroundTransparency = 1

-- Close Button
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 40, 0, 40)
close.Position = UDim2.new(1, -45, 0, 5)
close.Text = "X"
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBold
close.BackgroundColor3 = Color3.fromRGB(30,30,30)
local closeCorner = Instance.new("UICorner", close)
closeCorner.CornerRadius = UDim.new(0,6)
close.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Textbox
local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.9, 0, 0, 45)
box.Position = UDim2.new(0.05,0,0.25,0)
box.PlaceholderText = "Enter Key"
box.Text = ""
box.TextColor3 = Color3.new(1,1,1)
box.BackgroundColor3 = Color3.fromRGB(35,35,35)
box.TextScaled = true
box.ClearTextOnFocus = false
box.Font = Enum.Font.Gotham
Instance.new("UICorner", box).CornerRadius = UDim.new(0,6)

-- Check Key Button
local check = Instance.new("TextButton", frame)
check.Size = UDim2.new(0.9, 0, 0, 45)
check.Position = UDim2.new(0.05,0,0.42,0)
check.Text = "Check Key"
check.TextColor3 = Color3.new(1,1,1)
check.BackgroundColor3 = Color3.fromRGB(40,40,40)
check.Font = Enum.Font.GothamBold
check.TextScaled = true
Instance.new("UICorner", check).CornerRadius = UDim.new(0,6)

-- Avatar + Username
local avatar = Instance.new("ImageLabel", frame)
avatar.Size = UDim2.new(0,50,0,50)
avatar.Position = UDim2.new(0.03,0,0.78,0)
avatar.BackgroundTransparency = 1
avatar.Image = "rbxthumb://type=AvatarHeadShot&id="..LocalPlayer.UserId.."&w=420&h=420"

local user = Instance.new("TextLabel", frame)
user.Size = UDim2.new(0,200,0,25)
user.Position = UDim2.new(0.15,0,0.78,0)
user.Text = LocalPlayer.DisplayName.." ("..LocalPlayer.Name..")"
user.Font = Enum.Font.Gotham
user.TextScaled = true
user.TextColor3 = Color3.new(1,1,1)
user.BackgroundTransparency = 1
user.TextXAlignment = Enum.TextXAlignment.Left

local free = Instance.new("TextLabel", frame)
free.Size = UDim2.new(0,200,0,25)
free.Position = UDim2.new(0.15,0,0.88,0)
free.Text = "Free Version"
free.Font = Enum.Font.Gotham
free.TextScaled = true
free.TextColor3 = Color3.fromRGB(120,255,120)
free.BackgroundTransparency = 1
free.TextXAlignment = Enum.TextXAlignment.Left

-- Key Checking Logic
check.MouseButton1Click:Connect(function()
    if box.Text == correctKey then
        StarterGui:SetCore("SendNotification", {
            Title = "✅ Key Correct",
            Text = "Loading Brainrot Hub...",
            Duration = 4
        })
        gui:Destroy()
        loadstring(game:HttpGet(hubURL))()
    else
        StarterGui:SetCore("SendNotification", {
            Title = "❌ Wrong Key",
            Text = "Get key in Discord",
            Duration = 4
        })
    end
end)

-- Dragging
local dragging, dragInput, dragStart, startPos
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                   startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
