-- TFFA Pokemon Ball visual reskin.
-- Replaces only the visible appearance of ReplicatedStorage.Food templates.
-- Original food models, names, attributes, and gameplay scripts remain intact.

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local foodFolder = ReplicatedStorage:WaitForChild("Food")

local variants = {
    {"Classic Poké Ball", Color3.fromRGB(235, 55, 55), Color3.fromRGB(245, 245, 245), Color3.fromRGB(28, 28, 32)},
    {"Great Ball", Color3.fromRGB(45, 105, 220), Color3.fromRGB(245, 245, 245), Color3.fromRGB(235, 65, 65)},
    {"Ultra Ball", Color3.fromRGB(35, 35, 45), Color3.fromRGB(245, 205, 45), Color3.fromRGB(235, 75, 55)},
    {"Master Ball", Color3.fromRGB(150, 65, 195), Color3.fromRGB(245, 245, 245), Color3.fromRGB(235, 95, 175)},
    {"Safari Ball", Color3.fromRGB(100, 155, 80), Color3.fromRGB(225, 205, 135), Color3.fromRGB(65, 115, 65)},
    {"Net Ball", Color3.fromRGB(50, 155, 185), Color3.fromRGB(225, 240, 235), Color3.fromRGB(35, 95, 125)},
    {"Dive Ball", Color3.fromRGB(45, 125, 210), Color3.fromRGB(190, 225, 245), Color3.fromRGB(35, 75, 145)},
    {"Nest Ball", Color3.fromRGB(115, 175, 75), Color3.fromRGB(235, 225, 175), Color3.fromRGB(70, 125, 55)},
    {"Repeat Ball", Color3.fromRGB(220, 155, 45), Color3.fromRGB(245, 235, 205), Color3.fromRGB(165, 80, 35)},
    {"Timer Ball", Color3.fromRGB(190, 65, 55), Color3.fromRGB(235, 235, 225), Color3.fromRGB(70, 70, 75)},
    {"Luxury Ball", Color3.fromRGB(35, 35, 40), Color3.fromRGB(220, 55, 55), Color3.fromRGB(235, 195, 65)},
    {"Premier Ball", Color3.fromRGB(235, 235, 235), Color3.fromRGB(250, 250, 250), Color3.fromRGB(220, 55, 55)},
    {"Dusk Ball", Color3.fromRGB(55, 95, 65), Color3.fromRGB(45, 55, 75), Color3.fromRGB(145, 195, 95)},
    {"Heal Ball", Color3.fromRGB(245, 125, 165), Color3.fromRGB(250, 245, 245), Color3.fromRGB(110, 185, 225)},
    {"Quick Ball", Color3.fromRGB(65, 165, 225), Color3.fromRGB(245, 225, 70), Color3.fromRGB(35, 85, 155)},
    {"Cherish Ball", Color3.fromRGB(190, 55, 75), Color3.fromRGB(245, 225, 225), Color3.fromRGB(235, 175, 185)},
    {"Fast Ball", Color3.fromRGB(225, 65, 45), Color3.fromRGB(245, 235, 205), Color3.fromRGB(65, 65, 75)},
    {"Level Ball", Color3.fromRGB(225, 155, 45), Color3.fromRGB(245, 235, 195), Color3.fromRGB(125, 75, 35)},
    {"Lure Ball", Color3.fromRGB(55, 135, 205), Color3.fromRGB(225, 240, 245), Color3.fromRGB(65, 95, 165)},
    {"Heavy Ball", Color3.fromRGB(75, 95, 125), Color3.fromRGB(165, 185, 205), Color3.fromRGB(40, 50, 65)},
    {"Love Ball", Color3.fromRGB(245, 125, 175), Color3.fromRGB(255, 230, 240), Color3.fromRGB(185, 65, 125)},
    {"Friend Ball", Color3.fromRGB(85, 175, 105), Color3.fromRGB(235, 235, 195), Color3.fromRGB(65, 125, 75)},
    {"Moon Ball", Color3.fromRGB(55, 65, 125), Color3.fromRGB(185, 195, 225), Color3.fromRGB(235, 205, 85)},
    {"Sport Ball", Color3.fromRGB(205, 65, 55), Color3.fromRGB(245, 235, 205), Color3.fromRGB(65, 145, 85)},
    {"Dream Ball", Color3.fromRGB(175, 115, 195), Color3.fromRGB(235, 205, 235), Color3.fromRGB(95, 85, 165)},
    {"Beast Ball", Color3.fromRGB(55, 105, 195), Color3.fromRGB(45, 45, 65), Color3.fromRGB(225, 145, 55)},
    {"Strange Ball", Color3.fromRGB(115, 85, 165), Color3.fromRGB(220, 215, 235), Color3.fromRGB(75, 65, 115)},
    {"Origin Ball", Color3.fromRGB(175, 45, 55), Color3.fromRGB(245, 235, 215), Color3.fromRGB(235, 195, 85)},
    {"Hisuian Poké Ball", Color3.fromRGB(165, 75, 55), Color3.fromRGB(225, 205, 165), Color3.fromRGB(65, 55, 45)},
    {"Feather Ball", Color3.fromRGB(85, 155, 205), Color3.fromRGB(225, 240, 245), Color3.fromRGB(65, 105, 165)},
    {"Wing Ball", Color3.fromRGB(65, 135, 205), Color3.fromRGB(235, 235, 225), Color3.fromRGB(85, 175, 215)},
    {"Jet Ball", Color3.fromRGB(55, 115, 195), Color3.fromRGB(225, 235, 245), Color3.fromRGB(165, 195, 225)},
    {"Leaden Ball", Color3.fromRGB(85, 95, 115), Color3.fromRGB(175, 185, 195), Color3.fromRGB(55, 65, 75)},
    {"Gigaton Ball", Color3.fromRGB(65, 75, 95), Color3.fromRGB(155, 165, 175), Color3.fromRGB(45, 55, 65)},
    {"Ancient Ball", Color3.fromRGB(135, 75, 45), Color3.fromRGB(215, 185, 135), Color3.fromRGB(85, 55, 35)},
    {"Hisuian Great Ball", Color3.fromRGB(55, 115, 175), Color3.fromRGB(225, 205, 165), Color3.fromRGB(55, 65, 85)},
    {"Hisuian Ultra Ball", Color3.fromRGB(55, 55, 65), Color3.fromRGB(205, 175, 75), Color3.fromRGB(145, 65, 45)},
    {"GS Ball", Color3.fromRGB(205, 175, 55), Color3.fromRGB(235, 215, 125), Color3.fromRGB(125, 95, 35)},
    {"Park Ball", Color3.fromRGB(95, 155, 85), Color3.fromRGB(225, 235, 195), Color3.fromRGB(65, 105, 65)},
    {"Crystal Ball", Color3.fromRGB(95, 195, 215), Color3.fromRGB(225, 250, 250), Color3.fromRGB(65, 135, 165)},
    {"Shadow Ball", Color3.fromRGB(65, 45, 95), Color3.fromRGB(115, 95, 145), Color3.fromRGB(35, 25, 55)},
    {"Aqua Ball", Color3.fromRGB(45, 155, 195), Color3.fromRGB(195, 235, 245), Color3.fromRGB(35, 95, 145)},
    {"Flame Ball", Color3.fromRGB(225, 75, 35), Color3.fromRGB(250, 205, 95), Color3.fromRGB(145, 45, 25)},
    {"Leaf Ball", Color3.fromRGB(85, 165, 75), Color3.fromRGB(215, 235, 175), Color3.fromRGB(45, 105, 45)},
    {"Thunder Ball", Color3.fromRGB(235, 195, 35), Color3.fromRGB(245, 235, 145), Color3.fromRGB(95, 85, 35)},
    {"Mystic Ball", Color3.fromRGB(115, 85, 195), Color3.fromRGB(215, 195, 245), Color3.fromRGB(65, 45, 135)},
    {"Nova Ball", Color3.fromRGB(55, 105, 165), Color3.fromRGB(225, 225, 245), Color3.fromRGB(185, 115, 225)},
    {"Eclipse Ball", Color3.fromRGB(45, 45, 65), Color3.fromRGB(115, 85, 145), Color3.fromRGB(225, 185, 85)},
    {"Prism Ball", Color3.fromRGB(225, 95, 145), Color3.fromRGB(195, 225, 245), Color3.fromRGB(95, 185, 195)},
    {"Aurora Ball", Color3.fromRGB(75, 175, 165), Color3.fromRGB(225, 215, 245), Color3.fromRGB(145, 105, 195)},
    {"Comet Ball", Color3.fromRGB(75, 105, 175), Color3.fromRGB(225, 235, 245), Color3.fromRGB(225, 145, 75)},
    {"Galaxy Ball", Color3.fromRGB(75, 55, 125), Color3.fromRGB(165, 145, 205), Color3.fromRGB(55, 35, 95)},
}

local function makePart(parent, name, shape, size, cf, color, material)
    local part = Instance.new("Part")
    part.Name = name
    part.Shape = shape
    part.Size = size
    part.CFrame = cf
    part.Color = color
    part.Material = material or Enum.Material.SmoothPlastic
    part.Anchored = true
    part.CanCollide = false
    part.CanTouch = false
    part.CanQuery = false
    part.CastShadow = true
    part.TopSurface = Enum.SurfaceType.Smooth
    part.BottomSurface = Enum.SurfaceType.Smooth
    part.Parent = parent
    return part
end

local function applyBall(model, index, variant)
    if model:FindFirstChild("_PokemonBallVisual") then return end
    local ok, boxCF, boxSize = pcall(function()
        local cf, size = model:GetBoundingBox()
        return cf, size
    end)
    if not ok or not boxCF then return end

    local diameter = math.clamp(math.min(boxSize.X, boxSize.Y, boxSize.Z), 1.35, 3.25)
    if diameter ~= diameter then diameter = 2 end
    local center = boxCF
    local visual = Instance.new("Folder")
    visual.Name = "_PokemonBallVisual"
    visual:SetAttribute("Variant", variant[1])
    visual.Parent = model

    for _, obj in ipairs(model:GetDescendants()) do
        if obj:IsA("BasePart") and not obj:IsDescendantOf(visual) then
            obj.Transparency = 1
            obj.CanCollide = false
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            obj.Transparency = 1
        end
    end

    local d = diameter
    local bodyColor = variant[3]
    local topColor = variant[2]
    local bandColor = variant[4]
    makePart(visual, "BallBody", Enum.PartType.Ball, Vector3.new(d, d, d), center, bodyColor)
    makePart(visual, "TopShell", Enum.PartType.Ball, Vector3.new(d * 0.985, d * 0.52, d * 0.985), center * CFrame.new(0, d * 0.235, 0), topColor)
    makePart(visual, "EquatorBand", Enum.PartType.Cylinder, Vector3.new(d * 1.012, d * 0.075, d * 1.012), center * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, math.rad(90)), Color3.fromRGB(25, 25, 30), Enum.Material.Metal)
    makePart(visual, "ButtonOuter", Enum.PartType.Ball, Vector3.new(d * 0.24, d * 0.24, d * 0.12), center * CFrame.new(0, 0, -d * 0.485), Color3.fromRGB(25, 25, 30), Enum.Material.Metal)
    makePart(visual, "ButtonInner", Enum.PartType.Ball, Vector3.new(d * 0.13, d * 0.13, d * 0.07), center * CFrame.new(0, 0, -d * 0.535), bandColor)
end

local foods = {}
for _, child in ipairs(foodFolder:GetChildren()) do
    if child:IsA("Model") then
        table.insert(foods, child)
    end
end
table.sort(foods, function(a, b) return a.Name < b.Name end)

for index, model in ipairs(foods) do
    local variant = variants[((index - 1) % #variants) + 1]
    applyBall(model, index, variant)
end

print(("[TFFA Pokemon Visuals] Reskinned %d food models with %d distinct ball variants."):format(#foods, math.min(#foods, #variants)))
