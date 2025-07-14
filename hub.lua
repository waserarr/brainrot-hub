local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")

-- Edit your base position here
local baseCFrame = CFrame.new(-50, 10, -50)

-- GUI Setup
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "SaintBrainrotHub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 450, 0, 350)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Text = "Saint's Brainrot Hub 🍌"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.BackgroundTransparency = 1

-- WalkSpeed Section
local wsBox = Instance.new("TextBox", frame)
wsBox.Size = UDim2.new(0.8, 0, 0, 45)
wsBox.Position = UDim2.new(0.1, 0, 0.2, 0)
wsBox.PlaceholderText = "WalkSpeed (Default 16)"
wsBox.Text = ""
wsBox.TextColor3 = Color3.fromRGB(255, 255, 255)
wsBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
wsBox.TextScaled = true
wsBox.Font = Enum.Font.Gotham
wsBox.ClearTextOnFocus = false
Instance.new("UICorner", wsBox).CornerRadius = UDim.new(0, 8)

local wsBtn = Instance.new("TextButton", frame)
wsBtn.Size = UDim2.new(0.8, 0, 0, 45)
wsBtn.Position = UDim2.new(0.1, 0, 0.35, 0)
wsBtn.Text = "✅ Set WalkSpeed"
wsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
wsBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
wsBtn.TextScaled = true
wsBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", wsBtn).CornerRadius = UDim.new(0, 8)

wsBtn.MouseButton1Click:Connect(function()
    local speed = tonumber(wsBox.Text)
    if speed and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = speed
        StarterGui:SetCore("SendNotification", {
            Title = "✅ WalkSpeed Updated",
            Text = "WalkSpeed set to " .. speed,
            Duration = 3
        })
    else
        StarterGui:SetCore("SendNotification", {
            Title = "❌ Invalid Speed",
            Text = "Please input a valid number",
            Duration = 3
        })
    end
end)

-- Instant Steal (Teleport to Base)
local stealBtn = Instance.new("TextButton", frame)
stealBtn.Size = UDim2.new(0.8, 0, 0, 45)
stealBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
stealBtn.Text = "💀 Teleport to Base"
stealBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
stealBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
stealBtn.TextScaled = true
stealBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", stealBtn).CornerRadius = UDim.new(0, 8)

stealBtn.MouseButton1Click:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = baseCFrame
        StarterGui:SetCore("SendNotification", {
            Title = "✅ Teleported",
            Text = "You have been sent to base",
            Duration = 3
        })
    end
end)

-- Close Button
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 40, 0, 40)
close.Position = UDim2.new(1, -45, 0, 5)
close.Text = "X"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.Font = Enum.Font.GothamBold
close.BackgroundColor3 = Color3.fromRGB(30,30,30)
Instance.new("UICorner", close).CornerRadius = UDim.new(0,6)
close.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Draggable
local dragging, dragStart, startPos
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
