-- =========================
-- Diamond Farm - Hacker UI (500 Falling Effects)
-- Paste vào exploit và chạy
-- =========================

-- Auto settings
getgenv().AutoFarm = true
getgenv().hop = "old"

-- Auto-run original script (suppress errors)
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Farm%20Diamond%20v2.lua"))()
    end)
end)

-- ---------- UI CREATION ----------
local CoreGui = game:GetService("CoreGui")

-- Main ScreenGui (UI chính)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DiamondFarm_UI"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Background overlay (slightly darken whole screen for contrast)
local BG = Instance.new("Frame")
BG.Parent = ScreenGui
BG.AnchorPoint = Vector2.new(0.5,0.5)
BG.Position = UDim2.new(0.5,0.5,0,0)
BG.Size = UDim2.new(1,0,1,0)
BG.BackgroundTransparency = 0.95
BG.ZIndex = -10
BG.BackgroundColor3 = Color3.fromRGB(0,0,0)

-- Main Frame
local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 280, 0, 320) -- portrait friendly
Frame.Position = UDim2.new(0.05, 0, 0.18, 0)
Frame.Active = true
Frame.Draggable = true
Frame.BackgroundColor3 = Color3.fromRGB(6,6,6)
Frame.BorderSizePixel = 0
Frame.ZIndex = 50

-- Rounded corners
local Corner = Instance.new("UICorner")
Corner.Parent = Frame
Corner.CornerRadius = UDim.new(0, 12)

-- Outer glow (thicker neon)
local Glow = Instance.new("UIStroke")
Glow.Parent = Frame
Glow.Color = Color3.fromRGB(0,255,120)
Glow.Thickness = 3
Glow.Transparency = 0.08

-- Subtle inner border
local InnerStroke = Instance.new("UIStroke")
InnerStroke.Parent = Frame
InnerStroke.Color = Color3.fromRGB(0,120,60)
InnerStroke.Thickness = 1
InnerStroke.LineJoinMode = Enum.LineJoinMode.Round

-- Moving gradient background
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,10,0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,40,20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,8,0))
}
Gradient.Rotation = 45
Gradient.Parent = Frame

-- Top Title bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Parent = Frame
TitleBar.Size = UDim2.new(1,0,0,46)
TitleBar.Position = UDim2.new(0,0,0,0)
TitleBar.BackgroundTransparency = 1

local Title = Instance.new("TextLabel")
Title.Parent = TitleBar
Title.Size = UDim2.new(1,0,1,0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.Code
Title.TextSize = 18
Title.TextColor3 = Color3.fromRGB(0,255,120)
Title.Text = ""
Title.ZIndex = 51

-- Typewriter title text
task.spawn(function()
    local txt = ">> DIAMOND FARM <<"
    for i = 1, #txt do
        Title.Text = string.sub(txt,1,i)
        task.wait(0.04)
    end
    -- small blink
    while true do
        Title.TextTransparency = 0.15
        task.wait(0.25)
        Title.TextTransparency = 0
        task.wait(0.25)
    end
end)

-- Subtitle / status
local Status = Instance.new("TextLabel")
Status.Parent = Frame
Status.Position = UDim2.new(0,12,0,48)
Status.Size = UDim2.new(1,-24,0,20)
Status.BackgroundTransparency = 1
Status.Font = Enum.Font.Code
Status.TextSize = 12
Status.TextColor3 = Color3.fromRGB(160,255,180)
Status.Text = "Status: AUTO RUNNING | Hop: old"
Status.ZIndex = 51

-- Buttons container
local ButtonsFrame = Instance.new("Frame")
ButtonsFrame.Parent = Frame
ButtonsFrame.Position = UDim2.new(0,12,0,76)
ButtonsFrame.Size = UDim2.new(1,-24,0,140)
ButtonsFrame.BackgroundTransparency = 1

-- AutoFarm Toggle
local AutoFarmToggle = Instance.new("TextButton")
AutoFarmToggle.Parent = ButtonsFrame
AutoFarmToggle.Size = UDim2.new(1,0,0,40)
AutoFarmToggle.Position = UDim2.new(0,0,0,0)
AutoFarmToggle.Font = Enum.Font.Code
AutoFarmToggle.TextSize = 14
AutoFarmToggle.TextColor3 = Color3.fromRGB(0,255,120)
AutoFarmToggle.Text = "✅ AutoFarm: ON"
AutoFarmToggle.BackgroundColor3 = Color3.fromRGB(8,8,8)
AutoFarmToggle.BorderSizePixel = 0
AutoFarmToggle.ZIndex = 51
local autoState = true
AutoFarmToggle.MouseButton1Click:Connect(function()
    autoState = not autoState
    getgenv().AutoFarm = autoState
    AutoFarmToggle.Text = autoState and "✅ AutoFarm: ON" or "❌ AutoFarm: OFF"
    AutoFarmToggle.TextColor3 = autoState and Color3.fromRGB(0,255,120) or Color3.fromRGB(255,90,90)
    -- funny log
    if autoState then
        Status.Text = "Status: AUTO RUNNING | Hop: "..tostring(getgenv().hop)
        warn("[😂 Hacker Log] AutoFarm enabled — kim cương chuẩn bị rơi!")
    else
        Status.Text = "Status: MANUAL | Hop: "..tostring(getgenv().hop)
        warn("[😂 Hacker Log] AutoFarm disabled — thời gian đào bới thủ công.")
    end
end)

-- Hop dropdown (cycle)
local HopBtn = Instance.new("TextButton")
HopBtn.Parent = ButtonsFrame
HopBtn.Position = UDim2.new(0,0,0,48)
HopBtn.Size = UDim2.new(1,0,0,40)
HopBtn.Font = Enum.Font.Code
HopBtn.TextSize = 14
HopBtn.TextColor3 = Color3.fromRGB(0,255,120)
HopBtn.Text = "🔄 Hop Server: old"
HopBtn.BackgroundColor3 = Color3.fromRGB(8,8,8)
HopBtn.BorderSizePixel = 0
HopBtn.ZIndex = 51
local hops = {"old","new"}
local hopIndex = 1
HopBtn.MouseButton1Click:Connect(function()
    hopIndex = hopIndex % #hops + 1
    getgenv().hop = hops[hopIndex]
    HopBtn.Text = "🔄 Hop Server: "..getgenv().hop
    Status.Text = "Status: "..(autoState and "AUTO RUNNING" or "MANUAL").." | Hop: "..tostring(getgenv().hop)
end)

-- Self Destruct (fake)
local SelfDestruct = Instance.new("TextButton")
SelfDestruct.Parent = ButtonsFrame
SelfDestruct.Position = UDim2.new(0,0,0,96)
SelfDestruct.Size = UDim2.new(1,0,0,36)
SelfDestruct.Font = Enum.Font.Code
SelfDestruct.TextSize = 14
SelfDestruct.TextColor3 = Color3.fromRGB(255,120,0)
SelfDestruct.Text = "Self Destruct 💣 (Fake)"
SelfDestruct.BackgroundColor3 = Color3.fromRGB(18,18,18)
SelfDestruct.BorderSizePixel = 0
SelfDestruct.ZIndex = 51
SelfDestruct.MouseButton1Click:Connect(function()
    -- shake + vanish fake
    local origPos = Frame.Position
    for i = 1, 18 do
        Frame.Position = origPos + UDim2.new(0, math.random(-8,8), 0, math.random(-8,8))
        task.wait(0.03)
    end
    for i = 1, 10 do
        Frame.BackgroundTransparency = Frame.BackgroundTransparency + 0.08
        task.wait(0.04)
    end
    Frame:Destroy()
    warn("[💥] Self Destruct executed. (Just kidding!)")
end)

-- ---------- Extra small decorations ----------
local footer = Instance.new("TextLabel")
footer.Parent = Frame
footer.Size = UDim2.new(1,0,0,20)
footer.Position = UDim2.new(0,0,1,-24)
footer.BackgroundTransparency = 1
footer.Font = Enum.Font.Code
footer.TextSize = 12
footer.TextColor3 = Color3.fromRGB(80,255,150)
footer.Text = "khanhaim™ • stealth ui • be careful"
footer.ZIndex = 51

-- Animated gradient offset (subtle)
task.spawn(function()
    local dir = 1
    local off = 0
    while Frame.Parent do
        off = off + 0.005 * dir
        if off > 0.35 then dir = -1 elseif off < -0.05 then dir = 1 end
        Gradient.Offset = Vector2.new(off, -off)
        task.wait(0.04)
    end
end)

-- ---------- Falling Effects Manager (500 items) ----------
local EffectsGui = Instance.new("ScreenGui")
EffectsGui.Name = "DF_Effects"
EffectsGui.Parent = CoreGui
EffectsGui.ResetOnSpawn = false
EffectsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Pool params
local TOTAL_STREAMS = 1           -- as requested
local MIN_X = 0.0
local MAX_X = 1.0
local MIN_SIZE = 12
local MAX_SIZE = 20
local MIN_SPEED = 0.03            -- very slow
local MAX_SPEED = 0.08
local SPAWN_JITTER_MIN = 0.1
local SPAWN_JITTER_MAX = 0.22

-- symbols pool (mix of matrix 0/1 and emoji)
local symbols = {"⚡","😂"}

-- helper: random float
local function rndf(a,b)
    return (math.random()*(b-a))+a
end

-- Create a single falling label (returns the label)
local function createFallingLabel()
    local lbl = Instance.new("TextLabel")
    lbl.Parent = EffectsGui
    local w = math.random(MIN_SIZE, MAX_SIZE)
    lbl.Size = UDim2.new(0, w, 0, w)
    lbl.AnchorPoint = Vector2.new(0.5,0)
    local xscale = math.random(0,1000)/1000
    lbl.Position = UDim2.new(xscale, 0, -0.05, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = symbols[math.random(1,#symbols)]
    lbl.TextColor3 = Color3.fromRGB(0,255,120)
    lbl.Font = Enum.Font.Code
    lbl.TextSize = math.clamp(w*0.9,10,20)
    lbl.ZIndex = 5  -- behind main UI (main UI zindex is 50)
    return lbl
end

-- Single falling behavior
local function runFall(lbl, speed)
    -- use coarse updates to save CPU
    while lbl and lbl.Parent do
        local curY = lbl.Position.Y.Scale
        lbl.Position = UDim2.new(lbl.Position.X.Scale, 0, curY + speed, 0)
        -- slight horizontal drift
        local drift = (math.random(-15,15)/10000)
        local newX = math.clamp(lbl.Position.X.Scale + drift, 0, 1)
        lbl.Position = UDim2.new(newX, 0, lbl.Position.Y.Scale, 0)
        task.wait(0.06) -- low-frequency update for smoothness & performance
        if lbl.Position.Y.Scale > 1.2 then
            lbl:Destroy()
            break
        end
    end
end

-- Spawn many streams (each stream creates its own falling labels with jitter)
for i = 1, TOTAL_STREAMS do
    task.spawn(function()
        while EffectsGui.Parent do
            local lbl = createFallingLabel()
            local speed = rndf(MIN_SPEED, MAX_SPEED)
            task.spawn(function() runFall(lbl, speed) end)
            -- slightly random spawn interval per stream so they aren't synchronized
            task.wait(rndf(SPAWN_JITTER_MIN, SPAWN_JITTER_MAX))
        end
    end)
    -- small stagger when creating streams to avoid massive instant spike
    task.wait(0.006)
end

-- Update Status text initial
Status.Text = "Status: AUTO RUNNING | Hop: "..tostring(getgenv().hop)

-- End of script
warn("[UI] Diamond Farm UI loaded with "..TOTAL_STREAMS.." falling streams. Enjoy!")