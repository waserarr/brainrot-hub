-- Saint's Brainrot Exploit Hub - Advanced Xeno-Style Full Hub with Key System

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0

local Shadow = Instance.new("ImageLabel", MainFrame)
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
Shadow.Size = UDim2.new(1, 60, 1, 60)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageTransparency = 0.4
Shadow.ZIndex = -1

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 12)

local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 2

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundTransparency = 1
Title.Text = "Brainrot Hub 🍌"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBlack
Title.TextScaled = true

local TextBox = Instance.new("TextBox", MainFrame)
TextBox.PlaceholderText = "Enter Key Here"
TextBox.Size = UDim2.new(0.9, 0, 0, 40)
TextBox.Position = UDim2.new(0.05, 0, 0.3, 0)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.TextScaled = true
TextBox.Font = Enum.Font.Gotham
TextBox.ClearTextOnFocus = false
local TextBoxCorner = Instance.new("UICorner", TextBox)
TextBoxCorner.CornerRadius = UDim.new(0, 8)

local function createButton(text, pos, callback)
    local Button = Instance.new("TextButton", MainFrame)
    Button.Size = UDim2.new(0.4, 0, 0, 40)
    Button.Position = pos
    Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Font = Enum.Font.GothamBold
    Button.TextScaled = true

    local corner = Instance.new("UICorner", Button)
    corner.CornerRadius = UDim.new(0, 8)

    local stroke = Instance.new("UIStroke", Button)
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Thickness = 1.5

    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
    end)
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}):Play()
    end)

    Button.MouseButton1Click:Connect(callback)
    return Button
end

createButton("Check Key", UDim2.new(0.05, 0, 0.5, 0), function()
    if TextBox.Text == "saint1451-9" then
        MainFrame:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/waserarr/brainrot/main/hub.lua"))()
    else
        StarterGui:SetCore("SendNotification", {
            Title = "❌ Invalid Key", Text = "Join the discord and get a valid key.", Duration = 4
        })
    end
end)

createButton("Get Key", UDim2.new(0.55, 0, 0.5, 0), function()
    setclipboard("https://discord.gg/MUnTPtKvhG")
    StarterGui:SetCore("SendNotification", {
        Title = "✅ Copied Link", Text = "Discord invite copied to clipboard.", Duration = 3
    })
end)
