local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")

-- ScreenGui Setup
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "SaintKeySystem"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 450, 0, 300)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(60, 60, 60)
stroke.Thickness = 2

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 8)

-- Top Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "Saint's Brainrot | Key System"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

-- Close Button
local close = Instance.new("TextButton", frame)
close.Size = UDim2.new(0, 40, 0, 40)
close.Position = UDim2.new(1, -45, 0, 5)
close.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
close.Text = "X"
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBold
close.TextScaled = true
close.MouseButton1Click:Connect(function() gui:Destroy() end)
local closeCorner = Instance.new("UICorner", close)
closeCorner.CornerRadius = UDim.new(0, 6)

-- TextBox
local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.9, 0, 0, 45)
box.Position = UDim2.new(0.05, 0, 0.25, 0)
box.PlaceholderText = "Enter Key"
box.Text = ""
box.TextColor3 = Color3.new(1,1,1)
box.BackgroundColor3 = Color3.fromRGB(35,35,35)
box.TextScaled = true
box.Font = Enum.Font.Gotham
local boxCorner = Instance.new("UICorner", box)
boxCorner.CornerRadius = UDim.new(0, 6)

-- Check Key Button
local check = Instance.new("TextButton", frame)
check.Size = UDim2.new(0.9, 0, 0, 45)
check.Position = UDim2.new(0.05, 0, 0.4, 0)
check.Text = "Check Key"
check.TextColor3 = Color3.new(1,1,1)
check.BackgroundColor3 = Color3.fromRGB(40,40,40)
check.Font = Enum.Font.GothamBold
check.TextScaled = true
local checkCorner = Instance.new("UICorner", check)
checkCorner.CornerRadius = UDim.new(0, 6)

-- User PFP + Username + Free Version Footer
local userIcon = Instance.new("ImageLabel", frame)
userIcon.Size = UDim2.new(0, 50, 0, 50)
userIcon.Position = UDim2.new(0.03,0,0.78,0)
userIcon.BackgroundTransparency = 1

local username = Instance.new("TextLabel", frame)
