-- Advanced Saint's Brainrot Hub (hub.lua)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 450, 0, 400)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0

local shadow = Instance.new("ImageLabel", frame)
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
shadow.Size = UDim2.new(1, 60, 1, 60)
shadow.Image = "rbxassetid://5554236805"
shadow.BackgroundTransparency = 1
shadow.ImageTransparency = 0.5
shadow.ZIndex = -1

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 10)
local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "Saint's Brainrot Hub 🧠"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextScaled = true

local speedSlider = Instance.new("TextBox", frame)
speedSlider.PlaceholderText = "WalkSpeed (Default: 16)"
speedSlider.Text = ""
speedSlider.Size = UDim2.new(0.8, 0, 0, 40)
speedSlider.Position = UDim2.new(0.1, 0, 0.2, 0)
speedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
speedSlider.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
speedSlider.Font = Enum.Font.Gotham
speedSlider.TextScaled = true
speedSlider.ClearTextOnFocus = false
local speedCorner = Instance.new("UICorner", speedSlider)
speedCorner.CornerRadius = UDim.new(0, 8)

local speedButton = Instance.new("TextButton", frame)
speedButton.Size = UDim2.new(0.8, 0, 0, 40)
speedButton.Position = UDim2.new(0.1, 0, 0.35, 0)
speedButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
speedButton.Text = "✅ Apply WalkSpeed"
speedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
speedButton.TextScaled = true
speedButton.Font = Enum.Font.GothamBold
local speedButtonCorner = Instance.new("UICorner", speedButton)
speedButtonCorner.CornerRadius = UDim.new(0, 8)

speedButton.MouseButton1Click:Connect(function()
    local speed = tonumber(speedSlider.Text)
    if speed and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = speed
        StarterGui:SetCore("SendNotification", {Title="✅ Success", Text="Walkspeed Changed", Duration=3})
    else
        StarterGui:SetCore("SendNotification", {Title="❌ Error", Text="Invalid Walkspeed", Duration=3})
    end
end)

local instantSteal = Instance.new("TextButton", frame)
instantSteal.Size = UDim2.new(0.8, 0, 0, 40)
instantSteal.Position = UDim2.new(0.1, 0, 0.5, 0)
instantSteal.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
instantSteal.Text = "💀 INSTANT STEAL 💀"
instantSteal.TextColor3 = Color3.fromRGB(255, 255, 255)
instantSteal.TextScaled = true
instantSteal.Font = Enum.Font.GothamBold
local instantCorner = Instance.new("UICorner", instantSteal)
instantCorner.CornerRadius = UDim.new(0, 8)

instantSteal.MouseButton1Click:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Brainrot") then
            LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
            wait(0.3)
            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, player.Character.Brainrot.Handle, 0)
            firetouchinterest(LocalPlayer.Character.HumanoidRootPart, player.Character.Brainrot.Handle, 1)
        end
    end
    StarterGui:SetCore("SendNotification", {Title="✅ Instant Steal Activated", Text="Teleported to brainrot holder.", Duration=3})
end)

-- Draggable Frame
local dragging, dragStart, startPos = false, nil, nil

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
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
