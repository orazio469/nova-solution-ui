-- NOVA SOLUTION configuration using the pasted Linoria-style interface
-- UI/settings only; callbacks are intentionally empty.
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/orazio469/nova-solution-ui/main/nova-interface.lua"))()

-- The pasted interface exposes CreateWindow; this alias gives it a simple SetInterface entry point.
function Library:SetInterface(Config)
    return self:CreateWindow(Config)
end

Library.AccentColor = Color3.fromRGB(255, 18, 56)
Library.AccentColorDark = Color3.fromRGB(125, 8, 28)
Library.MainColor = Color3.fromRGB(16, 12, 16)
Library.BackgroundColor = Color3.fromRGB(10, 9, 12)
Library.OutlineColor = Color3.fromRGB(85, 24, 37)
Library.FontColor = Color3.fromRGB(245, 232, 235)

local Window = Library:SetInterface({
    Title = "NOVA SOLUTION",
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2,
    Size = UDim2.fromOffset(620, 560),
})

local Combat = Window:AddTab("Combat")
local CombatBox = Combat:AddLeftGroupbox("Combat settings")
CombatBox:AddToggle("Nova_AimAssist", { Text = "Aim assist", Default = false })
CombatBox:AddToggle("Nova_HitMarkers", { Text = "Hit markers", Default = true })
CombatBox:AddSlider("Nova_Sensitivity", { Text = "Sensitivity", Default = 5, Min = 1, Max = 10, Rounding = 1 })

local Movement = Window:AddTab("Movement")
local MovementBox = Movement:AddLeftGroupbox("Movement settings")
MovementBox:AddToggle("Nova_AutoRun", { Text = "Auto run", Default = false })
MovementBox:AddSlider("Nova_RunSpeed", { Text = "Run speed", Default = 16, Min = 8, Max = 32, Rounding = 1 })

local Visuals = Window:AddTab("Visuals")
local VisualsBox = Visuals:AddLeftGroupbox("Visual settings")
VisualsBox:AddToggle("Nova_Bloom", { Text = "Red glow", Default = true })
VisualsBox:AddToggle("Nova_HUD", { Text = "Show HUD", Default = true })
VisualsBox:AddDropdown("Nova_Theme", { Text = "Theme", Values = { "NOVA Red", "Dark", "Crimson" }, Default = 1 })

local Misc = Window:AddTab("Misc")
local MiscBox = Misc:AddLeftGroupbox("General")
MiscBox:AddToggle("Nova_Notifications", { Text = "Notifications", Default = true })
MiscBox:AddButton("Nova_Unload", { Text = "Unload interface", Func = function() Library:Unload() end })

local Docs = Window:AddTab("Documentation")
local DocsBox = Docs:AddLeftGroupbox("How to extend")
DocsBox:AddLabel("AddToggle: option ON/OFF")
DocsBox:AddLabel("AddSlider: numeric slider")
DocsBox:AddLabel("AddDropdown: selection list")
DocsBox:AddLabel("AddTab + AddLeftGroupbox: new category")

return Library
