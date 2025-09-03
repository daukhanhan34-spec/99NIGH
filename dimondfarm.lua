--// Auto chạy script gốc CpsHub
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Rx1m/CpsHub/refs/heads/main/Cpsnerf"))()
end)

-- UI Screen
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ModernDiamondUI"
ScreenGui.Parent = game:GetService("CoreGui")

-- Nền gradient full màn hình
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(1,0,1,0)
Frame.BackgroundColor3 = Color3.fromRGB(10,10,20)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

local BgGradient = Instance.new("UIGradient")
BgGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20,20,40)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(40,0,80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,60,120))
}
BgGradient.Rotation = 45
BgGradient.Parent = Frame

-- Chữ hiển thị
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,0,1,0)
Title.Text = "💎 ĐANG TỰ ĐỘNG CÀY KIM CƯƠNG 💎"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.TextStrokeTransparency = 0.3
Title.Parent = Frame

-- Gradient chữ kiểu hiện đại
local TxtGradient = Instance.new("UIGradient")
TxtGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,200,255)), -- xanh cyan
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180,0,255)), -- tím neon
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255,100,0)) -- cam neon
}
TxtGradient.Rotation = 0
TxtGradient.Parent = Title

-- Animation gradient chữ xoay
task.spawn(function()
    while task.wait(0.04) do
        TxtGradient.Rotation = (TxtGradient.Rotation + 1) % 360
    end
end)

-- Glow mượt
local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 6
UIStroke.Color = Color3.fromRGB(255,255,255)
UIStroke.Transparency = 0.7 -- glow nhẹ, sang
UIStroke.Parent = Title