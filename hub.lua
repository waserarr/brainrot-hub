-- Saint's Brainrot Exploit Hub (hub.lua)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")

-- Create main GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 450, 0, 400)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BorderSizePixel = 0

-- Shadow Effect
local shadow = Instance.new("ImageLabel", frame)
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
shadow.Size = UDim2.new(1, 60, 1, 60)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://5554236805"
shadow.ImageTransparency = 0.5
shadow.ZIndex = -1

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.new(1, 1, 1)
stroke.Thickness = 2

-- Title label
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "Saint's Brainrot Hub 🧠"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBlack
title.TextScaled = true

-- WalkSpeed TextBox
local speedInput = Instance.new("TextBox", frame)
speedInput.PlaceholderText = "WalkSpeed (Default: 16)"
speedInput.Text = ""
speedInput.Size = UDim2.new(0.8, 0, 0, 40)
speedInput.Position = UDim2.new(0.1, 0, 0.2, 0)
speedInput.TextColor3 = Color3.new(1, 1, 1)
speedInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
speedInput.Font = Enum.Font.Gotham
speedInput.TextScaled = true
speedInput.ClearTextOnFocus = false
local speedInputCorner = Instance.new("UICorner", speedInput)
speedInputCorner.CornerRadius = UDim.new(0, 8)

-- Apply WalkSpeed button
local applySpeedBtn = Instance.new("TextButton", frame)
applySpeedBtn.Size = UDim2.new(0.8, 0, 0, 40)
applySpeedBtn.Position = UDim2.new(0.1, 0, 0.35, 0)
applySpeedBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
applySpeedBtn.Text = "✅ Apply WalkSpeed"
applySpeedBtn.TextColor3 = Color3.new(1,1,1)
applySpeedBtn.Font = Enum.Font.GothamBold
applySpeedBtn.TextScaled = true
local applySpeedCorner = Instance.new("UICorner", applySpeedBtn)
applySpeedCorner.CornerRadius = UDim.new(0, 8)

applySpeedBtn.MouseEnter:Connect(function()
    TweenService:Create(applySpeedBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
end)
applySpeedBtn.MouseLeave:Connect(function()
    TweenService:Create(applySpeedBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
end)

applySpeedBtn.MouseButton1Click:Connect(function()
    local speed = tonumber(speedInput.Text)
    if speed and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = speed
        StarterGui:SetCore("SendNotification", {
            Title = "✅ Walkspeed Change Successful",
            Text = "WalkSpeed set to "..speed,
            Duration = 3,
        })
    else
        StarterGui:SetCore("SendNotification", {
            Title = "❌ Invalid WalkSpeed",
            Text = "Please enter a valid number.",
            Duration = 3,
        })
    end
end)

-- Instant Steal button
local instantStealBtn = Instance.new("TextButton", frame)
instantStealBtn.Size = UDim2.new(0.8, 0, 0, 40)
instantStealBtn.Position = UDim2.new(0.1, 0, 0.5, 0)
instantStealBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
instantStealBtn.Text = "💀 INSTANT STEAL 💀"
instantStealBtn.TextColor3 = Color3.new(1,1,1)
instantStealBtn.Font = Enum.Font.GothamBold
instantStealBtn.TextScaled = true
local instantStealCorner = Instance.new("UICorner", instantStealBtn)
instantStealCorner.CornerRadius = UDim.new(0, 8)

instantStealBtn.MouseEnter:Connect(function()
    TweenService:Create(instantStealBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
end)
instantStealBtn.MouseLeave:Connect(function()
    TweenService:Create(instantStealBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play()
end)

instantStealBtn.MouseButton1Click:Connect(function()
    local found = false
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local tool = player.Character:FindFirstChild("Brainrot")
            if tool and tool:IsA("Tool") and tool:FindFirstChild("Handle") then
                found = true
                -- Teleport you 5 studs above the target player
                LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame + Vector3.new(0,5,0)
                wait(0.3)
                -- Fire touch to pick up the Brainrot tool
                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, tool.Handle, 0)
                firetouchinterest(LocalPlayer.Character.HumanoidRootPart, tool.Handle, 1)
                break
            end
        end
    end
    if found then
        StarterGui:SetCore("SendNotification", {
            Title = "✅ Instant steal activated",
            Text = "Attempted to steal Brainrot tool.",
            Duration = 3,
        })
    else
        StarterGui:SetCore("SendNotification", {
            Title = "❌ No Brainrot found",
            Text = "No player is holding Brainrot nearby.",
            Duration = 3,
        })
    end
end)

-- Draggable UI logic
local dragging = false
local dragInput, dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)
