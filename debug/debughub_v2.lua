--// DebugHub V2
--// Standalone Lua Source Analyzer.
--// Paste source Lua into the analyzer to inspect functions and common event calls.
--// This file is independent from src/loader.lua.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local GUI_NAME = "DebugHubV2"
local old = playerGui:FindFirstChild(GUI_NAME)
if old then
    old:Destroy()
end

local State = {
    Unloaded = false,
    Results = {},
}

local Connections = {}

local function addConnection(connection)
    table.insert(Connections, connection)
    return connection
end

local function disconnectAll()
    for _, connection in ipairs(Connections) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    table.clear(Connections)
end

local function copyText(text)
    if type(setclipboard) ~= "function" then
        return false
    end

    return pcall(setclipboard, text)
end

local function newInstance(className, properties, parent)
    local object = Instance.new(className)

    for key, value in pairs(properties or {}) do
        object[key] = value
    end

    object.Parent = parent
    return object
end

local gui = newInstance("ScreenGui", {
    Name = GUI_NAME,
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, playerGui)

local main = newInstance("Frame", {
    Name = "Main",
    Size = UDim2.fromOffset(500, 560),
    Position = UDim2.new(0.5, -250, 0.5, -280),
    BackgroundColor3 = Color3.fromRGB(20, 20, 24),
    BorderSizePixel = 0,
    ClipsDescendants = true,
}, gui)

newInstance("UICorner", {
    CornerRadius = UDim.new(0, 10),
}, main)

newInstance("UIStroke", {
    Color = Color3.fromRGB(55, 55, 65),
    Thickness = 1,
}, main)

local header = newInstance("Frame", {
    Size = UDim2.new(1, 0, 0, 48),
    BackgroundColor3 = Color3.fromRGB(29, 29, 35),
    BorderSizePixel = 0,
}, main)

newInstance("TextLabel", {
    Size = UDim2.new(1, -160, 1, 0),
    Position = UDim2.fromOffset(15, 0),
    BackgroundTransparency = 1,
    Text = "DEBUGHUB V2",
    TextColor3 = Color3.fromRGB(240, 240, 245),
    TextSize = 16,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
}, header)

local status = newInstance("TextLabel", {
    Size = UDim2.fromOffset(100, 20),
    Position = UDim2.new(1, -190, 0, 14),
    BackgroundTransparency = 1,
    Text = "● READY",
    TextColor3 = Color3.fromRGB(80, 220, 120),
    TextSize = 11,
    Font = Enum.Font.GothamBold,
}, header)

local unloadButton = newInstance("TextButton", {
    Size = UDim2.fromOffset(70, 34),
    Position = UDim2.new(1, -78, 0, 7),
    BackgroundColor3 = Color3.fromRGB(65, 38, 42),
    BorderSizePixel = 0,
    Text = "UNLOAD",
    TextColor3 = Color3.fromRGB(255, 220, 220),
    TextSize = 10,
    Font = Enum.Font.GothamBold,
}, header)

newInstance("UICorner", {
    CornerRadius = UDim.new(0, 7),
}, unloadButton)

newInstance("TextLabel", {
    Size = UDim2.new(1, -20, 0, 25),
    Position = UDim2.fromOffset(10, 55),
    BackgroundTransparency = 1,
    Text = "LUA SOURCE",
    TextColor3 = Color3.fromRGB(180, 180, 190),
    TextSize = 12,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
}, main)

local sourceBox = newInstance("TextBox", {
    Name = "SourceInput",
    Size = UDim2.new(1, -20, 0, 175),
    Position = UDim2.fromOffset(10, 80),
    BackgroundColor3 = Color3.fromRGB(11, 11, 14),
    BorderSizePixel = 0,
    ClearTextOnFocus = false,
    MultiLine = true,
    Text = "",
    PlaceholderText = "Paste Lua source here...",
    TextColor3 = Color3.fromRGB(220, 220, 225),
    PlaceholderColor3 = Color3.fromRGB(100, 100, 110),
    TextSize = 12,
    Font = Enum.Font.Code,
    TextXAlignment = Enum.TextXAlignment.Left,
    TextYAlignment = Enum.TextYAlignment.Top,
}, main)

newInstance("UICorner", {
    CornerRadius = UDim.new(0, 7),
}, sourceBox)

newInstance("UIPadding", {
    PaddingTop = UDim.new(0, 8),
    PaddingBottom = UDim.new(0, 8),
    PaddingLeft = UDim.new(0, 8),
    PaddingRight = UDim.new(0, 8),
}, sourceBox)

local analyzeButton = newInstance("TextButton", {
    Size = UDim2.fromOffset(145, 36),
    Position = UDim2.fromOffset(10, 265),
    BackgroundColor3 = Color3.fromRGB(39, 65, 52),
    BorderSizePixel = 0,
    Text = "ANALYZE SOURCE",
    TextColor3 = Color3.fromRGB(220, 255, 230),
    TextSize = 11,
    Font = Enum.Font.GothamBold,
}, main)

local copyButton = newInstance("TextButton", {
    Size = UDim2.fromOffset(115, 36),
    Position = UDim2.fromOffset(165, 265),
    BackgroundColor3 = Color3.fromRGB(39, 39, 47),
    BorderSizePixel = 0,
    Text = "COPY RESULTS",
    TextColor3 = Color3.fromRGB(230, 230, 235),
    TextSize = 11,
    Font = Enum.Font.GothamBold,
}, main)

local clearButton = newInstance("TextButton", {
    Size = UDim2.fromOffset(95, 36),
    Position = UDim2.fromOffset(290, 265),
    BackgroundColor3 = Color3.fromRGB(55, 45, 35),
    BorderSizePixel = 0,
    Text = "CLEAR",
    TextColor3 = Color3.fromRGB(245, 225, 205),
    TextSize = 11,
    Font = Enum.Font.GothamBold,
}, main)

local countLabel = newInstance("TextLabel", {
    Size = UDim2.fromOffset(100, 36),
    Position = UDim2.new(1, -110, 0, 265),
    BackgroundTransparency = 1,
    Text = "0 results",
    TextColor3 = Color3.fromRGB(160, 160, 170),
    TextSize = 11,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Right,
}, main)

for _, button in ipairs({analyzeButton, copyButton, clearButton, unloadButton}) do
    newInstance("UICorner", {
        CornerRadius = UDim.new(0, 7),
    }, button)
end

newInstance("TextLabel", {
    Size = UDim2.new(1, -20, 0, 25),
    Position = UDim2.fromOffset(10, 310),
    BackgroundTransparency = 1,
    Text = "ANALYSIS RESULTS",
    TextColor3 = Color3.fromRGB(180, 180, 190),
    TextSize = 12,
    Font = Enum.Font.GothamBold,
    TextXAlignment = Enum.TextXAlignment.Left,
}, main)

local results = newInstance("ScrollingFrame", {
    Name = "Results",
    Size = UDim2.new(1, -20, 0, 225),
    Position = UDim2.fromOffset(10, 335),
    BackgroundColor3 = Color3.fromRGB(11, 11, 14),
    BorderSizePixel = 0,
    ScrollBarThickness = 4,
    CanvasSize = UDim2.fromOffset(0, 0),
}, main)

newInstance("UICorner", {
    CornerRadius = UDim.new(0, 7),
}, results)

local resultsLayout = newInstance("UIListLayout", {
    Padding = UDim.new(0, 4),
    SortOrder = Enum.SortOrder.LayoutOrder,
}, results)

newInstance("UIPadding", {
    PaddingTop = UDim.new(0, 7),
    PaddingBottom = UDim.new(0, 7),
    PaddingLeft = UDim.new(0, 7),
    PaddingRight = UDim.new(0, 7),
}, results)

local function refreshCanvas()
    results.CanvasSize = UDim2.fromOffset(0, resultsLayout.AbsoluteContentSize.Y + 14)
end

local function clearResults()
    State.Results = {}

    for _, child in ipairs(results:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextLabel") then
            child:Destroy()
        end
    end

    countLabel.Text = "0 results"
    refreshCanvas()
end

local function addResult(kind, value, line)
    local result = {
        Kind = kind,
        Value = value,
        Line = line,
    }

    table.insert(State.Results, result)

    local button = newInstance("TextButton", {
        Size = UDim2.new(1, -4, 0, 34),
        BackgroundColor3 = Color3.fromRGB(25, 25, 30),
        BorderSizePixel = 0,
        AutoButtonColor = true,
        Text = string.format("[%s] L%s  %s", kind, tostring(line), value),
        TextColor3 = Color3.fromRGB(220, 220, 225),
        TextSize = 11,
        Font = Enum.Font.Code,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, results)

    newInstance("UICorner", {
        CornerRadius = UDim.new(0, 5),
    }, button)

    addConnection(button.MouseButton1Click:Connect(function()
        if State.Unloaded then
            return
        end

        if copyText(value) then
            status.Text = "● COPIED"
            status.TextColor3 = Color3.fromRGB(100, 225, 135)
        else
            status.Text = "● NO CLIP"
            status.TextColor3 = Color3.fromRGB(240, 190, 80)
        end
    end))

    countLabel.Text = tostring(#State.Results) .. " results"
    refreshCanvas()
end

local function lineNumber(source, position)
    local prefix = source:sub(1, position)
    local _, count = prefix:gsub("\n", "")
    return count + 1
end

local function analyzeSource(source)
    clearResults()

    if source == nil or source:match("^%s*$") then
        status.Text = "● EMPTY"
        status.TextColor3 = Color3.fromRGB(240, 190, 80)
        return
    end

    local seen = {}

    local function push(kind, value, position)
        local key = kind .. "|" .. value .. "|" .. tostring(position)
        if seen[key] then
            return
        end

        seen[key] = true
        addResult(kind, value, lineNumber(source, position))
    end

    -- Function declarations.
    for startPos, name in source:gmatch("()local%s+function%s+([%w_%.:]+)") do
        push("FUNCTION", name, startPos)
    end

    for startPos, name in source:gmatch("()function%s+([%w_%.:]+)") do
        push("FUNCTION", name, startPos)
    end

    -- Remote declarations/references.
    for startPos, name in source:gmatch("()([%w_%.:]+RemoteEvent[%w_%.:]*)") do
        push("REMOTE", name, startPos)
    end

    for startPos, name in source:gmatch("()([%w_%.:]+RemoteFunction[%w_%.:]*)") do
        push("REMOTE", name, startPos)
    end

    -- Server calls.
    for startPos in source:gmatch("():FireServer%s*%(") do
        push("FIRESERVER", ":FireServer()", startPos)
    end

    for startPos in source:gmatch("():InvokeServer%s*%(") do
        push("INVOKESERVER", ":InvokeServer()", startPos)
    end

    -- Common Roblox event connections.
    for startPos, name in source:gmatch("()([%w_%.:]+)%.OnClientEvent%s*:%s*Connect") do
        push("EVENT", name .. ".OnClientEvent", startPos)
    end

    for startPos, name in source:gmatch("()([%w_%.:]+)%.OnServerEvent%s*:%s*Connect") do
        push("EVENT", name .. ".OnServerEvent", startPos)
    end

    for startPos, name in source:gmatch("()([%w_%.:]+)%.Touched%s*:%s*Connect") do
        push("EVENT", name .. ".Touched", startPos)
    end

    -- Http/network references.
    for startPos, name in source:gmatch("()game%s*:%s*GetService%s*%(%s*["']([Hh][Tt][Tt][Pp][Ss]Service)["']") do
        push("SERVICE", name, startPos)
    end

    -- loadstring / HTTP source loading.
    for startPos in source:gmatch("()loadstring%s*%(") do
        push("LOADSTRING", "loadstring()", startPos)
    end

    for startPos in source:gmatch("()game%s*:%s*HttpGet%s*%(") do
        push("HTTPGET", "game:HttpGet()", startPos)
    end

    status.Text = "● ANALYZED"
    status.TextColor3 = Color3.fromRGB(100, 225, 135)
end

addConnection(analyzeButton.MouseButton1Click:Connect(function()
    local ok, err = pcall(function()
        analyzeSource(sourceBox.Text)
    end)

    if not ok then
        status.Text = "● ERROR"
        status.TextColor3 = Color3.fromRGB(240, 90, 90)
        warn("[DebugHub V2] " .. tostring(err))
    end
end))

addConnection(copyButton.MouseButton1Click:Connect(function()
    local output = {}

    for _, item in ipairs(State.Results) do
        output[#output + 1] = string.format(
            "[%s] L%s %s",
            item.Kind,
            tostring(item.Line),
            item.Value
        )
    end

    if #output == 0 then
        status.Text = "● NO DATA"
        status.TextColor3 = Color3.fromRGB(240, 190, 80)
        return
    end

    if copyText(table.concat(output, "\n")) then
        status.Text = "● COPIED"
        status.TextColor3 = Color3.fromRGB(100, 225, 135)
    else
        status.Text = "● NO CLIP"
        status.TextColor3 = Color3.fromRGB(240, 190, 80)
    end
end))

addConnection(clearButton.MouseButton1Click:Connect(function()
    sourceBox.Text = ""
    clearResults()
    status.Text = "● READY"
    status.TextColor3 = Color3.fromRGB(80, 220, 120)
end))

addConnection(unloadButton.MouseButton1Click:Connect(function()
    if State.Unloaded then
        return
    end

    State.Unloaded = true
    disconnectAll()

    if gui and gui.Parent then
        gui:Destroy()
    end
end))

local dragging = false
local dragStart
local startPosition

addConnection(header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPosition = main.Position
    end
end))

addConnection(header.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end))

addConnection(UserInputService.InputChanged:Connect(function(input)
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
end))

print("[DebugHub V2] Source Analyzer ready.")
