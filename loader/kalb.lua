local SOURCE_URL = "https://raw.githubusercontent.com/xyaxzj/sigmamaboi.lua/4d8ae0a5ad4a93d261cc3da5fc302ee04a03b220/auto%20farm%20kalb.lua"
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"

if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Safe initial defaults so UI can still open even if the remote payload fails.
for _, name in ipairs({
    "autoFarm", "onlyCandyEvent", "enableCandyEvent", "expandCandyHitbox",
    "candyWaypointNav", "candyAntiOvershoot", "verifyDebrisPickup", "enableFireTouch",
    "autoSellAll", "autoWorldTeleport", "useBrainrotWhitelist", "autoRemovePlayer",
    "antiLag", "muteAudio", "disable3dRender", "debugConsoleLog"
}) do
    _G[name] = false
end

local uiOk, uiErr = pcall(function()
    local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
    local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
    local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()

    Library.ForceCheckbox = false
    Library.ShowToggleFrameInKeybinds = true

    local Window = Library:CreateWindow({
        Title = "Kick a Lucky Block",
        Footer = "KALB Auto Farm | Obsidian UI",
        AutoShow = true,
        NotifySide = "Right",
        ShowCustomCursor = false,
    })

    local Tabs = {
        farm = Window:AddTab("Auto Farm", "pickaxe"),
        candy = Window:AddTab("Candy Event", "candy-cane"),
        utility = Window:AddTab("Utilities", "settings"),
        settings = Window:AddTab("Settings", "settings"),
    }

    local FarmBox = Tabs.farm:AddLeftGroupbox("Main Controls", "zap")
    FarmBox:AddLabel("Semua toggle dimulai dalam keadaan OFF.", true)

    FarmBox:AddToggle("KALB_AutoFarm", {
        Text = "Auto Farm",
        Default = false,
        Callback = function(value)
            _G.autoFarm = value
        end,
    })

    FarmBox:AddToggle("KALB_OnlyCandy", {
        Text = "Only Farm During Candy Event",
        Default = false,
        Callback = function(value)
            _G.onlyCandyEvent = value
        end,
    })

    FarmBox:AddSlider("KALB_KickDelay", {
        Text = "Kick Delay",
        Default = 0.5,
        Min = 0.1,
        Max = 3,
        Rounding = 1,
        Suffix = " s",
        Compact = false,
        Callback = function(value)
            _G.kickDelay = value
        end,
    })

    FarmBox:AddSlider("KALB_Failsafe", {
        Text = "Failsafe Timeout",
        Default = 25,
        Min = 5,
        Max = 60,
        Rounding = 0,
        Suffix = " s",
        Compact = false,
        Callback = function(value)
            _G.failsafeTimeout = value
        end,
    })

    local CandyBox = Tabs.candy:AddLeftGroupbox("Candy Event", "candy-cane")
    CandyBox:AddToggle("KALB_CandyMaster", {
        Text = "Enable Candy Event Handler",
        Default = false,
        Callback = function(value)
            _G.enableCandyEvent = value
        end,
    })

    CandyBox:AddToggle("KALB_CandyHitbox", {
        Text = "Expand Candy Hitbox",
        Default = false,
        Callback = function(value)
            _G.expandCandyHitbox = value
        end,
    })

    CandyBox:AddSlider("KALB_CandyHitboxSize", {
        Text = "Candy Hitbox Size",
        Default = 100,
        Min = 10,
        Max = 150,
        Rounding = 0,
        Compact = false,
        Callback = function(value)
            _G.candyHitboxSize = Vector3.new(value, value, value)
        end,
    })

    CandyBox:AddToggle("KALB_CandyWaypoint", {
        Text = "Candy Waypoint Navigation",
        Default = false,
        Callback = function(value)
            _G.candyWaypointNav = value
        end,
    })

    CandyBox:AddToggle("KALB_CandyAntiOvershoot", {
        Text = "Candy Anti-Overshoot",
        Default = false,
        Callback = function(value)
            _G.candyAntiOvershoot = value
        end,
    })

    CandyBox:AddToggle("KALB_DebrisCheck", {
        Text = "Verify Candy Pickup",
        Default = false,
        Callback = function(value)
            _G.verifyDebrisPickup = value
        end,
    })

    CandyBox:AddToggle("KALB_FireTouch", {
        Text = "FireTouch (Experimental)",
        Default = false,
        Callback = function(value)
            _G.enableFireTouch = value
        end,
    })

    local UtilityBox = Tabs.utility:AddLeftGroupbox("Selling & World", "package")
    UtilityBox:AddToggle("KALB_AutoSell", {
        Text = "Auto Sell All",
        Default = false,
        Callback = function(value)
            _G.autoSellAll = value
        end,
    })

    UtilityBox:AddToggle("KALB_AutoWorldTP", {
        Text = "Auto Teleport on Start",
        Default = false,
        Callback = function(value)
            _G.autoWorldTeleport = value
        end,
    })

    UtilityBox:AddDropdown("KALB_TargetWorld", {
        Text = "Target World",
        Values = {"1", "2", "3", "4", "5"},
        Default = "2",
        Multi = false,
        Callback = function(value)
            _G.targetWorld = tonumber(value) or 2
        end,
    })

    UtilityBox:AddToggle("KALB_Whitelist", {
        Text = "Use Brainrot Whitelist",
        Default = false,
        Callback = function(value)
            _G.useBrainrotWhitelist = value
        end,
    })

    UtilityBox:AddToggle("KALB_RemovePlayers", {
        Text = "Remove Other Players Locally",
        Default = false,
        Callback = function(value)
            _G.autoRemovePlayer = value
        end,
    })

    local SettingsBox = Tabs.settings:AddLeftGroupbox("Performance & Logs", "gauge")
    SettingsBox:AddToggle("KALB_AntiLag", {
        Text = "Anti-Lag / Potato Mode",
        Default = false,
        Callback = function(value)
            _G.antiLag = value
        end,
    })

    SettingsBox:AddToggle("KALB_MuteAudio", {
        Text = "Mute Audio",
        Default = false,
        Callback = function(value)
            _G.muteAudio = value
        end,
    })

    SettingsBox:AddToggle("KALB_Disable3D", {
        Text = "Disable 3D Rendering",
        Default = false,
        Callback = function(value)
            _G.disable3dRender = value
            pcall(function()
                game:GetService("RunService"):Set3dRenderingEnabled(not value)
            end)
        end,
    })

    SettingsBox:AddToggle("KALB_Debug", {
        Text = "Debug Console Log",
        Default = false,
        Callback = function(value)
            _G.debugConsoleLog = value
        end,
    })

    SettingsBox:AddSlider("KALB_FPSCap", {
        Text = "FPS Cap",
        Default = 60,
        Min = 0,
        Max = 120,
        Rounding = 0,
        Compact = false,
        Callback = function(value)
            _G.fpsCap = value
            if value > 0 and setfpscap then
                pcall(function()
                    setfpscap(value)
                end)
            end
        end,
    })

    SettingsBox:AddButton("Unload Script", {
        Text = "Unload Script",
        Func = function()
            -- Matikan fitur yang dikendalikan melalui toggle sebelum menutup UI.
            _G.autoFarm = false
            _G.onlyCandyEvent = false
            _G.enableCandyEvent = false
            _G.expandCandyHitbox = false
            _G.candyWaypointNav = false
            _G.candyAntiOvershoot = false
            _G.verifyDebrisPickup = false
            _G.enableFireTouch = false
            _G.autoSellAll = false
            _G.autoWorldTeleport = false
            _G.autoRemovePlayer = false
            _G.antiLag = false
            _G.muteAudio = false
            _G.disable3dRender = false
            _G.debugConsoleLog = false

            pcall(function()
                game:GetService("RunService"):Set3dRenderingEnabled(true)
            end)
            Library:Unload()
        end,
        Tooltip = "Matikan toggle fitur dan tutup UI Obsidian."
    })

    local InfoBox = Tabs.settings:AddRightGroupbox("Info", "info")
    InfoBox:AddLabel("Build: KALB V5.1 + Obsidian UI", true)
    InfoBox:AddLabel("Toggle ON/OFF secara manual. Default semua fitur OFF.", true)

    SaveManager:SetLibrary(Library)
    ThemeManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    ThemeManager:SetFolder("KALB_Obsidian")
    SaveManager:SetFolder("KALB_Obsidian/configs")
    ThemeManager:ApplyToTab(Tabs.settings)
    SaveManager:BuildConfigSection(Tabs.settings)

    Library:Notify("KALB Obsidian UI loaded. Semua toggle OFF.", 4)
end)

if not uiOk then
    warn("[KALB UI] UI Obsidian gagal dibuat: " .. tostring(uiErr))
end


-- Load/run the farm payload only AFTER the UI has been created.
-- Payload errors must not prevent the UI from appearing.
local sourceOk, source = pcall(function()
    return game:HttpGet(SOURCE_URL)
end)

if not sourceOk or type(source) ~= "string" or #source < 1000 then
    warn("[KALB UI] Gagal mengambil source KALB.")
    return
end

-- 
local forceOff = {
    "autoFarm", "enableCandyEvent", "candyWaypointNav", "candyAntiOvershoot",
    "verifyDebrisPickup", "useBrainrotWhitelist", "autoSellAll", "autoRemovePlayer",
    "antiLag", "muteAudio",
}
for _, name in ipairs(forceOff) do
    local pattern = "(_G%." .. name .. "%s*=%s*)true"
    source = source:gsub(pattern, "%1false", 1)
end
local forceOffAlso = {
    "onlyCandyEvent", "expandCandyHitbox", "enableFireTouch",
    "autoWorldTeleport", "debugConsoleLog", "disable3dRender",
}
for _, name in ipairs(forceOffAlso) do
    local pattern = "(_G%." .. name .. "%s*=%s*)true"
    source = source:gsub(pattern, "%1false", 1)
end

local compiled, compileErr = loadstring(source)
if not compiled then
    warn("[KALB UI] Embedded KALB source gagal dikompilasi: " .. tostring(compileErr))
    return
end
local runOk, runErr = pcall(compiled)
if not runOk then
    warn("[KALB UI] Embedded KALB source berhenti dengan error: " .. tostring(runErr))
    return
end

