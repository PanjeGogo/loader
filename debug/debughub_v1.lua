--// DebugHub V1
--// Standalone debug UI + logger.
--// This file is intentionally independent from src/loader.lua.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local CONFIG = {
    Name = "DebugHub",
    MaxLogs = 150,
    Width = 440,
    Height = 400,
}

local State = {
    Logs = {},
    Minimized = false,
}

local function timestamp()
    return os.date("%H:%M:%S")
end

local function copyText(text)
    if type(setclipboard) ~= "function" then
        return false
    end

    local ok = pcall(setclipboard, text)
    return ok
end

local old = playerGui:FindFirstChild(CONFIG.Name)
if old then
    old:Destroy()
end

local gui = Instance.new("ScreenGui")
gui.Name = CONFIG.Name
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(CONFIG.Width, CONFIG.Height)
main.Position = UDim2.new(0.5, -CONFIG.Width / 2, 0.5, -CONFIG.Height / 2)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(55, 55, 65)
stroke.Thickness = 1
stroke.Parent = main

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 48)
header.BackgroundColor3 = Color3.fromRGB(29, 29, 35)
header.BorderSizePixel = 0
header.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -110, 1, 0)
title.Position = UDim2.fromOffset(15, 0)
title.BackgroundTransparency = 1
title.Text = "DEBUGHUB V1"
title.TextColor3 = Color3.fromRGB(240, 240, 245)
title.TextSize = 16
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local status = Instance.new("TextLabel")
status.Size = UDim2.fromOffset(75, 20)
status.Position = UDim2.new(1, -125, 0, 14)
status.BackgroundTransparency = 1
status.Text = "● READY"
status.TextColor3 = Color3.fromRGB(80, 220, 120)
status.TextSize = 11
status.Font = Enum.Font.GothamBold
status.Parent = header

local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(35, 35)
minimize.Position = UDim2.new(1, -42, 0, 6)
minimize.BackgroundColor3 = Color3.fromRGB(45, 45, 52)
minimize.Text = "—"
minimize.TextColor3 = Color3.new(1, 1, 1)
minimize.TextSize = 18
minimize.Font = Enum.Font.GothamBold
minimize.Parent = header

Instance.new("UICorner", minimize).CornerRadius = UDim.new(0, 7)

local consoleTitle = Instance.new("TextLabel")
consoleTitle.Size = UDim2.new(1, -20, 0, 28)
consoleTitle.Position = UDim2.fromOffset(10, 55)
consoleTitle.BackgroundTransparency = 1
consoleTitle.Text = "CONSOLE"
consoleTitle.TextColor3 = Color3.fromRGB(180, 180, 190)
consoleTitle.TextSize = 12
consoleTitle.Font = Enum.Font.GothamBold
consoleTitle.TextXAlignment = Enum.TextXAlignment.Left
consoleTitle.Parent = main

local console = Instance.new("ScrollingFrame")
console.Size = UDim2.new(1, -20, 0, 235)
console.Position = UDim2.fromOffset(10, 82)
console.BackgroundColor3 = Color3.fromRGB(11, 11, 14)
console.BorderSizePixel = 0
console.ScrollBarThickness = 4
console.CanvasSize = UDim2.fromOffset(0, 0)
console.Parent = main

Instance.new("UICorner", console).CornerRadius = UDim.new(0, 7)

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 2)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = console

local padding = Instance.new("UIPadding")
padding.PaddingTop = UDim.new(0, 7)
padding.PaddingBottom = UDim.new(0, 7)
padding.PaddingLeft = UDim.new(0, 7)
padding.PaddingRight = UDim.new(0, 7)
padding.Parent = console

local levelColor = {
    INFO = Color3.fromRGB(170, 190, 220),
    SUCCESS = Color3.fromRGB(100, 225, 135),
    WARN = Color3.fromRGB(240, 190, 80),
    ERROR = Color3.fromRGB(240, 90, 90),
}

local function updateCanvas()
    task.defer(function()
        console.CanvasSize = UDim2.fromOffset(0, layout.AbsoluteContentSize.Y + 14)
        console.CanvasPosition = Vector2.new(0, math.max(0, layout.AbsoluteContentSize.Y))
    end)
end

local function log(level, message)
    message = tostring(message)

    table.insert(State.Logs, {
        Time = timestamp(),
        Level = level,
        Message = message,
    })

    while #State.Logs > CONFIG.MaxLogs do
        table.remove(State.Logs, 1)
    end

    local line = Instance.new("TextLabel")
    line.Size = UDim2.new(1, -4, 0, 18)
    line.BackgroundTransparency = 1
    line.Text = string.format("[%s] [%s] %s", timestamp(), level, message)
    line.TextColor3 = levelColor[level] or levelColor.INFO
    line.TextSize = 12
    line.Font = Enum.Font.Code
    line.TextXAlignment = Enum.TextXAlignment.Left
    line.Parent = console

    updateCanvas()
    print(string.format("[DebugHub][%s] %s", level, message))
end

local function clearVisualLogs()
    for _, child in ipairs(console:GetChildren()) do
        if child:IsA("TextLabel") then
            child:Destroy()
        end
    end
end

local function button(name, text, x, width)
    local b = Instance.new("TextButton")
    b.Name = name
    b.Size = UDim2.fromOffset(width, 36)
    b.Position = UDim2.fromOffset(x, 348)
    b.BackgroundColor3 = Color3.fromRGB(39, 39, 47)
    b.BorderSizePixel = 0
    b.Text = text
    b.TextColor3 = Color3.fromRGB(230, 230, 235)
    b.TextSize = 11
    b.Font = Enum.Font.GothamBold
    b.Parent = main

    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    return b
end

local copyButton = button("CopyLog", "COPY LOG", 10, 130)
local clearButton = button("Clear", "CLEAR", 150, 130)
local testButton = button("Test", "TEST LOGGER", 290, 140)

copyButton.MouseButton1Click:Connect(function()
    if #State.Logs == 0 then
        log("WARN", "Tidak ada log untuk disalin.")
        return
    end

    local output = {}

    for _, entry in ipairs(State.Logs) do
        output[#output + 1] = string.format(
            "[%s] [%s] %s",
            entry.Time,
            entry.Level,
            entry.Message
        )
    end

    if copyText(table.concat(output, "\n")) then
        log("SUCCESS", "Log berhasil disalin.")
    else
        log("WARN", "Clipboard API tidak tersedia.")
    end
end)

clearButton.MouseButton1Click:Connect(function()
    State.Logs = {}
    clearVisualLogs()
    updateCanvas()
    log("INFO", "Console dibersihkan.")
end)

testButton.MouseButton1Click:Connect(function()
    log("INFO", "Test INFO berhasil.")
    log("SUCCESS", "Test SUCCESS berhasil.")
    log("WARN", "Test WARNING berhasil.")
    log("ERROR", "Test ERROR berhasil.")
end)

minimize.MouseButton1Click:Connect(function()
    State.Minimized = not State.Minimized

    if State.Minimized then
        main.Size = UDim2.fromOffset(CONFIG.Width, 48)
        minimize.Text = "+"
    else
        main.Size = UDim2.fromOffset(CONFIG.Width, CONFIG.Height)
        minimize.Text = "—"
    end
end)

local dragging = false
local dragStart
local startPosition

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPosition = main.Position
    end
end)

header.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if not dragging then
        return
    end

    if input.UserInputType ~= Enum.UserInputType.MouseMovement
        and input.UserInputType ~= Enum.UserInputType.Touch then
        return
    end

    local delta = input.Position - dragStart

    main.Position = UDim2.new(
        startPosition.X.Scale,
        startPosition.X.Offset + delta.X,
        startPosition.Y.Scale,
        startPosition.Y.Offset + delta.Y
    )
end)

log("INFO", "DebugHub V1 starting...")
log("INFO", "UI initialized.")
log("INFO", "Logger initialized.")
log("INFO", "Clipboard module initialized.")
log("SUCCESS", "DebugHub V1 READY.")
