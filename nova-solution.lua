-- NOVA SOLUTION UI - Roblox client menu
-- Use in your own Roblox experience or an environment where you have permission.
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
if not player then return end

local gui = Instance.new("ScreenGui")
gui.Name = "NovaSolutionUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild("PlayerGui")

local red = Color3.fromRGB(255, 18, 56)
local dark = Color3.fromRGB(12, 12, 17)
local panel = Color3.fromRGB(18, 15, 20)
local muted = Color3.fromRGB(165, 140, 148)

local function corner(obj, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = obj
end

local function stroke(obj, color, thickness, transparency)
    local s = Instance.new("UIStroke")
    s.Color, s.Thickness, s.Transparency = color, thickness, transparency or 0
    s.Parent = obj
end

local loading = Instance.new("Frame")
loading.Size = UDim2.fromScale(1, 1)
loading.BackgroundColor3 = dark
loading.Parent = gui
local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.fromScale(1, 0.08)
loadingText.Position = UDim2.fromScale(0, 0.45)
loadingText.BackgroundTransparency = 1
loadingText.Text = "NOVA SOLUTION"
loadingText.TextColor3 = red
loadingText.TextScaled = true
loadingText.Font = Enum.Font.GothamBold
loadingText.Parent = loading
local bar = Instance.new("Frame")
bar.Size = UDim2.fromScale(0.22, 0.006)
bar.Position = UDim2.fromScale(0.39, 0.55)
bar.BackgroundColor3 = red
bar.Parent = loading
corner(bar, 8)
task.wait(1)
TweenService:Create(loading, TweenInfo.new(0.45), {BackgroundTransparency = 1}):Play()
task.wait(0.5)
loading:Destroy()

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(720, 470)
main.Position = UDim2.fromScale(0.5, 0.5)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = panel
main.Parent = gui
corner(main, 10)
stroke(main, red, 1, 0.35)

local top = Instance.new("Frame")
top.Size = UDim2.new(1, 0, 0, 68)
top.BackgroundColor3 = Color3.fromRGB(15, 13, 17)
top.Parent = main
corner(top, 10)
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.6, 0, 1, 0)
title.Position = UDim2.fromOffset(22, 0)
title.BackgroundTransparency = 1
title.Text = "◆  NOVA SOLUTION"
title.TextColor3 = Color3.fromRGB(255, 235, 239)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = top
local status = Instance.new("TextLabel")
status.Size = UDim2.new(0.25, 0, 1, 0)
status.Position = UDim2.new(0.72, 0, 0, 0)
status.BackgroundTransparency = 1
status.Text = "●  ONLINE"
status.TextColor3 = red
status.TextSize = 12
status.Font = Enum.Font.GothamMedium
status.Parent = top

local tabs = Instance.new("Frame")
tabs.Size = UDim2.new(1, -40, 0, 45)
tabs.Position = UDim2.fromOffset(20, 82)
tabs.BackgroundTransparency = 1
tabs.Parent = main
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -40, 1, -145)
content.Position = UDim2.fromOffset(20, 130)
content.BackgroundTransparency = 1
content.Parent = main

local function clearContent()
    for _, child in ipairs(content:GetChildren()) do child:Destroy() end
end

local function addTab(name, index)
    local b = Instance.new("TextButton")
    b.Size = UDim2.fromOffset(145, 36)
    b.Position = UDim2.fromOffset((index - 1) * 153, 0)
    b.Text = name
    b.TextSize = 12
    b.Font = Enum.Font.GothamMedium
    b.TextColor3 = muted
    b.BackgroundColor3 = Color3.fromRGB(30, 17, 23)
    b.Parent = tabs
    corner(b, 5)
    b.MouseButton1Click:Connect(function()
        clearContent()
        b.TextColor3 = Color3.new(1, 1, 1)
        if name == "Documentation" then
            local info = Instance.new("TextLabel")
            info.Size = UDim2.fromScale(1, 1)
            info.BackgroundTransparency = 1
            info.TextWrapped = true
            info.Text = "NOVA SOLUTION\n\nAjoute tes contrôles dans content.\nUtilise des boutons, sliders et catégories avec les mêmes styles rouges."
            info.TextColor3 = muted
            info.TextSize = 16
            info.Font = Enum.Font.Gotham
            info.Parent = content
        else
            local note = Instance.new("TextLabel")
            note.Size = UDim2.new(1, 0, 0, 40)
            note.BackgroundTransparency = 1
            note.Text = name .. "  •  Catégories prêtes à configurer"
            note.TextColor3 = Color3.fromRGB(220, 190, 198)
            note.TextSize = 14
            note.Font = Enum.Font.GothamMedium
            note.TextXAlignment = Enum.TextXAlignment.Left
            note.Parent = content
        end
    end)
end

addTab("Dashboard", 1)
addTab("Options", 2)
addTab("Documentation", 3)

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(34, 30)
close.Position = UDim2.new(1, -45, 0, 19)
close.Text = "×"
close.TextColor3 = muted
close.TextSize = 22
close.BackgroundTransparency = 1
close.Parent = top
close.MouseButton1Click:Connect(function() gui:Destroy() end)

local hint = Instance.new("TextLabel")
hint.Size = UDim2.new(1, 0, 0, 45)
hint.Position = UDim2.fromOffset(0, 55)
hint.BackgroundTransparency = 1
hint.Text = "Combat     Movement     Visuals     Miscellaneous"
hint.TextColor3 = muted
hint.TextSize = 13
hint.Font = Enum.Font.Gotham
hint.Parent = content
