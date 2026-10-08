local v1 = setmetatable({}, { __index = {}, __metatable = nil })

pcall(function()
  loadstring(game:HttpGet(v1[22126428612671]))(v1[12834712622936], v1[18063688655067], false)
end)

local v2 = request or http_request or http and http.request or syn and syn.request

if not v2 then
  warn("[NEOX AUTH] Critical Error: HTTP request functionality not available")
  return
end

local v3 = getgenv and getgenv() or _G or {}

local f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, scriptId, f14, f15, f16, f17, f18,
  f19, f20, f21, v4, band, bxor, bnot, rshift, lshift, rrotate, byte, char, sub, rep, concat,
  v5, f22, f23, v6, f24, starterGui, marketplaceService, tweenService, players, httpService,
  rbxAnalyticsService, getClientId, f25, v7, v8, v9, v10, v11, name, placeId, v12, v13, v14,
  v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, f26, f27, renderStepped, f28,
  scriptId2, gameName, v28, v29, v30, f29, mainFrame, gradientOverlay, uiGradient,
  discordButton, icon, closeButton, tutorialText, textSECONDARY, keyInputContainer, uiStroke,
  uiStroke2, keyInput, statusLabel, helpLabel, loadingDots, buttonContainer, premiumRow,
  uiStroke3, size, udim, redeemPromptFrame, redeemCopyBtn, redeemCheckBtn,
  paidScriptPromptFrame, paidScriptMessageLabel, paidScriptWebsiteBtn, paidScriptDiscordBtn,
  paidScriptEnterKeyBtn, v31, f30, v32, v33, f31, f32, f33, f34, v34

if v3.__NEOX_LOADER_ACTIVE then
  return
else
  v3.__NEOX_LOADER_ACTIVE = true

  v4 = {
    HUB_NAME = "NEOX HUB",
    BASE_URL = "https://neoxsoftworks.eu",
    ICON_ID = "rbxthumb://type=Asset&id=80622869023191&w=150&h=150",
    KEY_FILE = "neoxkey.txt",
    HTTP_ATTEMPTS = 3,
    HARD_TIMEOUT = 600,
    ANIMATION_SPEED = 0.25,
    STRICT_ENVIRONMENT = true,
    NOTIFICATION_DURATION = { LOADING = 3, ERROR = 4, SUCCESS = 4 },
  }

  band = bit32.band
  bxor = bit32.bxor
  bnot = bit32.bnot
  rshift = bit32.rshift
  lshift = bit32.lshift
  rrotate = bit32.rrotate
  byte = string.byte
  char = string.char
  sub = string.sub
  rep = string.rep
  concat = table.concat

  function f1(p1)
    local v35 = 2773480762
    local v36 = 1013904242
    local v37 = 3144134277
    local v38 = 1541459225
    local v39 = 528734635
    local v40 = 2600822924
    local v41 = 1779033703
    local v42 = 1359893119
    local v43 = #p1
    local v44 = v43 * 8

    local v45 = p1 .. "\128" .. rep("\0", (55 - v43) % 64) .. "\0\0\0\0" .. char(
      band(rshift(v44, 24), 255), band(rshift(v44, 16), 255), band(rshift(v44, 8), 255),
      band(v44, 255)
    )

    local v46 = #v45
    local v47 = {}
    local v48 = -63

    while true do
      v48 = 64 + v48

      if not (v46 >= v48) then
        break
      end

      local v49 = v48

      for i = 0, 15 do
        local v50 = v49 + i * 4
        local v51, v52, v53, v54 = byte(v45, v50, v50 + 3)
        v47[i + 1] = lshift(v51, 24) + lshift(v52, 16) + lshift(v53, 8) + v54
      end

      for j = 17, 64 do
        local v55 = v47[j - 15]
        local v56 = v47[j - 2]

        v47[j] = band(v47[j - 16] + bxor(rrotate(v55, 7), rrotate(v55, 18), rshift(v55, 3))
          + v47[j - 7] + bxor(rrotate(v56, 17), rrotate(v56, 19), rshift(v56, 10)), 4294967295)
      end

      local v57 = v41
      local v58 = v42
      local v59 = v37
      local v60 = v35
      local v61 = v38
      local v62 = v39
      local v63 = v36
      local count = 0
      local v64 = v40

      while true do
        count = 1 + count

        if not (count <= 64) then
          break
        end

        local v65 = count

        local v66 = band(v61 + bxor(rrotate(v58, 6), rrotate(v58, 11), rrotate(v58, 25))
          + bxor(band(v58, v64), band(bnot(v58), v62)) + v5[v65] + v47[v65], 4294967295)

        local v67 = band(bxor(rrotate(v57, 2), rrotate(v57, 13), rrotate(v57, 22))
          + bxor(band(v57, v59), band(v57, v63), band(v59, v63)), 4294967295)

        local v68 = v64
        v61 = v62
        v64 = v58
        v58 = band(v60 + v66, 4294967295)
        v60 = v63
        v62 = v68
        local v69 = v59
        v59 = v57
        v63 = v69
        v57 = band(v66 + v67, 4294967295)
      end

      v41 = band(v41 + v57, 4294967295)
      v37 = band(v37 + v59, 4294967295)
      v36 = band(v36 + v63, 4294967295)
      v35 = band(v35 + v60, 4294967295)
      v42 = band(v42 + v58, 4294967295)
      v40 = band(v40 + v64, 4294967295)
      v39 = band(v39 + v62, 4294967295)
      v38 = band(v38 + v61, 4294967295)
    end

    local v70 = {}
    local v71 = { v41, v37, v36, v35, v42, v40, v39, v38 }

    for k = 1, 8 do
      local v72 = v71[k]

      v70[k] = char(
        band(rshift(v72, 24), 255), band(rshift(v72, 16), 255), band(rshift(v72, 8), 255),
        band(v72, 255)
      )
    end

    return concat(v70)
  end

  v5 = {
    1116352408, 1899447441, 3049323471, 3921009573, 961987163, 1508970993, 2453635748,
    2870763221, 3624381080, 310598401, 607225278, 1426881987, 1925078388, 2162078206,
    2614888103, 3248222580, 3835390401, 4022224774, 264347078, 604807628, 770255983, 1249150122,
    1555081692, 1996064986, 2554220882, 2821834349, 2952996808, 3210313671, 3336571891,
    3584528711, 113926993, 338241895, 666307205, 773529912, 1294757372, 1396182291, 1695183700,
    1986661051, 2177026350, 2456956037, 2730485921, 2820302411, 3259730800, 3345764771,
    3516065817, 3600352804, 4094571909, 275423344, 430227734, 506948616, 659060556, 883997877,
    958139571, 1322822218, 1537002063, 1747873779, 1955562222, 2024104815, 2227730452,
    2361852424, 2428436474, 2756734187, 3204031479, 3329325298,
  }

  function f22(p2, p3)
    local v73 = rshift(p2, 16)
    local v74 = band(p2, 65535)
    local v75 = rshift(p3, 16)
    local v76 = band(p3, 65535)
    return band(v74 * v76 + band(v74 * v75 + v73 * v76, 65535) * 65536, 4294967295)
  end

  function f23(p4)
    local v77 = 2166136261
    local v78 = #p4
    local count2 = 0

    while true do
      count2 = 1 + count2

      if not (v78 >= count2) then
        break
      end

      v77 = f22(bxor(v77, byte(p4, count2)), 16777619)
    end

    return string.format("%08x", v77)
  end

  v6 = {}

  for m = 1, #"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/" do
    v6[byte("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", m)] = m - 1
  end

  function f5(p5)
    local v79 = string.gsub(p5, "[^A-Za-z0-9%+/=]", "")
    local v80 = {}
    local count3 = 0
    local v81 = 0
    local v82 = #v79
    local v83 = 0

    for n = 1, v82 do
      local v84 = byte(v79, n)

      if v84 == 61 then
        break
      else
        local v85 = v6[v84]

        if v85 then
          v81 = v81 * 64 + v85
          v83 = v83 + 6

          if v83 >= 8 then
            v83 = v83 - 8
            local v86 = math.floor(v81 / 2 ^ v83)
            v81 = v81 - v86 * 2 ^ v83
            count3 = count3 + 1
            v80[count3] = char(v86)
          end
        end

        if n % 60000 == 0 then
          task.wait()
        end
      end
    end

    return concat(v80)
  end

  function f2(p6, p7)
    local v87 = {}

    for i6 = 1, math.min(#p6, #p7) do
      v87[i6] = char(bxor(byte(p6, i6), byte(p7, i6)))
    end

    return concat(v87)
  end

  function f3(p8, p9, p10)
    local v88 = {}

    for i7 = 0, 255 do
      v88[i7] = i7
    end

    local v89 = #p9
    local v90 = 0

    for i8 = 0, 255 do
      v90 = band(v90 + v88[i8] + byte(p9, i8 % v89 + 1), 255)
      local v91 = v88[i8]

      v88[i8] = v88[v90]
      v88[v90] = v91
    end

    local v92 = 0
    local v93 = 0
    local count4 = 0

    while true do
      count4 = 1 + count4

      if not (p10 >= count4) then
        break
      end

      v93 = band(v93 + 1, 255)
      v92 = band(v92 + v88[v93], 255)
      local v94 = v88[v93]

      v88[v93] = v88[v92]
      v88[v92] = v94
    end

    local v95 = {}
    local count5 = 0
    local v96 = {}
    local v97 = #p8
    local v98 = 0
    local count6 = 0

    while true do
      count6 = 1 + count6

      if not (count6 <= v97) then
        break
      end

      v93 = band(v93 + 1, 255)
      v92 = band(v92 + v88[v93], 255)
      local v99 = v88[v93]

      v88[v93] = v88[v92]
      v88[v92] = v99

      v98 = v98 + 1
      v96[v98] = char(bxor(byte(p8, count6), v88[band(v88[v93] + v88[v92], 255)]))

      if v98 >= 4096 then
        count5 = count5 + 1
        v95[count5] = concat(v96)
        v96 = {}
        v98 = 0

        if count5 % 12 == 0 then
          task.wait()
        end
      end
    end

    if v98 > 0 then
      local v100 = count5 + 1
      v95[v100] = concat(v96)
    end

    return concat(v95)
  end

  function f4(p11, p12)
    local v101, v102 = pcall(game.GetService, game, p11)

    if v101 and v102 then
      return v102
    end

    return p12
  end

  function f24(p13)
    if type(p13) ~= "string" then
      return nil
    else
      local v103 = string.gsub(p13, "%s", "")

      if #v103 % 2 ~= 0 then
        return nil
      else
        local v104 = {}
        local v105 = #v103
        local count7 = 0

        for i9 = 1, v105, 2 do
          local v106 = tonumber(sub(v103, i9, i9 + 1), 16)

          if not v106 then
            return nil
          end

          count7 = count7 + 1
          v104[count7] = char(v106)
        end

        return concat(v104)
      end
    end
  end

  starterGui = f4("StarterGui")
  marketplaceService = f4("MarketplaceService")
  tweenService = f4("TweenService")
  local runService = f4("RunService")
  players = f4("Players")
  httpService = f4("HttpService")
  rbxAnalyticsService = f4("RbxAnalyticsService")
  local userInputService = f4("UserInputService")
  getClientId = nil
  pcall(function() getClientId = rbxAnalyticsService:GetClientId() end)

  if not getClientId or getClientId == "" then
    v3.__NEOX_LOADER_ACTIVE = nil
    warn("[NEOX AUTH] Critical Error: Failed to retrieve hardware identifier")
    return
  else
    function f25(p14, p15)
      local v107, v108 = pcall(function() return Enum[p14][p15] end)

      if v107 then
        return v108
      end

      return nil
    end

    local function f35(p16, p17)
      return f25("Font", p16) or f25("Font", p17) or f25("Font", "SourceSans")
    end

    local v109 = {
      Bold = f35("GothamBold", "SourceSansBold"),
      Regular = f35("Gotham", "SourceSans"),
      Medium = f35("GothamMedium", "SourceSansSemibold"),
      Mono = f35("Code", "SourceSans"),
    }

    task.spawn(function()
      pcall(function()
        return v2({ Url = v4.BASE_URL .. "/api/increment-count", Method = "POST", Timeout = 5 })
      end)
    end)

    v7 = {
      Panel = Color3.fromRGB(15, 16, 20),
      Edge = Color3.fromRGB(35, 38, 46),
      Rule = Color3.fromRGB(26, 28, 35),
      Track = Color3.fromRGB(32, 35, 43),
      Tile = Color3.fromRGB(23, 25, 31),
      Primary = Color3.fromRGB(238, 241, 246),
      Secondary = Color3.fromRGB(134, 141, 156),
      Muted = Color3.fromRGB(64, 69, 81),
      Neutral = Color3.fromRGB(232, 236, 242),
      Error = Color3.fromRGB(240, 92, 92),
      Success = Color3.fromRGB(92, 208, 138),
    }

    v8 = {
      PRIMARY = Color3.fromRGB(121, 56, 234),
      PRIMARY_HOVER = Color3.fromRGB(141, 76, 254),
      SECONDARY = Color3.fromRGB(50, 34, 76),
      SECONDARY_HOVER = Color3.fromRGB(70, 54, 96),
      BACKGROUND = Color3.fromRGB(26, 17, 47),
      INPUT_BG = Color3.fromRGB(21, 15, 42),
      BORDER = Color3.fromRGB(59, 42, 89),
      SUCCESS = Color3.fromRGB(50, 200, 100),
      ERROR = Color3.fromRGB(255, 100, 100),
      WARNING = Color3.fromRGB(255, 150, 50),
      INFO = Color3.fromRGB(180, 180, 190),
      TEXT = Color3.fromRGB(255, 255, 255),
      TEXT_SECONDARY = Color3.fromRGB(123, 101, 188),
      DISCORD = Color3.fromRGB(140, 116, 213),
      HEADER_LINE = Color3.fromRGB(27, 42, 53),
      PREMIUM = Color3.fromRGB(255, 200, 50),
      PREMIUM_HOVER = Color3.fromRGB(255, 220, 80),
    }

    function f6(p18, p19, p20)
      if not p18 or not tweenService then
        return
      end

      pcall(function() tweenService:Create(p18, p19, p20):Play() end)
    end

    function f7(p21, p22, p23)
      if not p21 then
        return
      end

      pcall(function() p21[p22] = p23 end)
    end

    local function f36(p24, p25)
      local v110, v111 = pcall(Instance.new, p24)

      if not v110 or not v111 then
        return nil
      end

      local parent = p25.Parent
      p25.Parent = nil

      for key, value in pairs(p25) do
        local v112 = key
        local v113 = value
        pcall(function() v111[v112] = v113 end)
      end

      if parent then
        pcall(function() v111.Parent = parent end)
      end

      return v111
    end

    local v114 = loadstring

    local function f37(p26)
      pcall(function()
        if syn and syn.protect_gui then
          syn.protect_gui(p26)
        elseif protect_gui then
          protect_gui(p26)
        end
      end)

      local v115 = {}

      if gethui then
        table.insert(v115, function() return gethui() end)
      end

      table.insert(v115, function() return f4("CoreGui") end)

      table.insert(v115, function()
        local localPlayer = players and players.LocalPlayer
        return localPlayer and localPlayer:FindFirstChildOfClass("PlayerGui")
      end)

      for index, value2 in ipairs(v115) do
        local v116, v117 = pcall(value2)

        if v116 and v117 then
          if pcall(function() p26.Parent = v117 end) and p26.Parent then
            return true
          end
        end
      end

      return false
    end

    v9 = v114 or load

    function f8(title, text, p27)
      if not starterGui then
        return
      end

      pcall(function()
        starterGui:SetCore("SendNotification", {
          Title = title,
          Text = text,
          Duration = p27 or 3,
          Icon = v4.ICON_ID,
        })
      end)
    end

    function f9(p28)
      if type(p28) ~= "function" then
        return false
      end

      if iscclosure then
        local v118, v119 = pcall(iscclosure, p28)

        if v118 then
          return v119 == true
        end
      end

      if is_synapse_function then
        local v120, v121 = pcall(is_synapse_function, p28)

        if v120 and v121 == true then
          return true
        end
      end

      if debug and debug.info then
        local v122, v123 = pcall(debug.info, p28, "s")

        if v122 and type(v123) == "string" then
          return v123 == "[C]" or v123 == ""
        end

        return true
      end

      return true
    end

    v10 = {}
    v11 = false

    local function f38(p29, p30)
      if p30 == nil then
        return
      end

      if not f9(p30) then
        v10[p29] = "hooked"
        v11 = true
      end
    end

    f38("request", v2)
    f38("loadstring", v9)
    f38("writefile", writefile)
    f38("readfile", readfile)
    f38("isfile", isfile)
    f38("setclipboard", setclipboard)
    f38("httpget", game.HttpGet)
    f38("instance_new", Instance.new)
    f38("tween_create", tweenService.Create)

    name = "this game"
    placeId = 0

    pcall(function() placeId = game.PlaceId end)

    pcall(function()
      local getProductInfo = marketplaceService:GetProductInfo(placeId)

      if getProductInfo and type(getProductInfo.Name) == "string" and #getProductInfo.Name > 0 then
        name = getProductInfo.Name
      end
    end)

    v12 = { paid_only = false, title = nil }

    pcall(function()
      local v124, v125 = pcall(function()
        return v2({
          Url = v4.BASE_URL .. "/api/games/check-paid?place_id=" .. tostring(placeId)
            .. "&game_name=" .. httpService:UrlEncode(name),
          Method = "GET",
        })
      end)

      if v124 and v125 and v125.StatusCode == 200 then
        local jsonDecode = httpService:JSONDecode(v125.Body)

        if jsonDecode and jsonDecode.paid_only then
          v12.paid_only = true
          v12.title = jsonDecode.title
        end
      end
    end)

    if v11 then
      task.spawn(function()
        pcall(function()
          v2({
            Url = v4.BASE_URL .. "/api/report-tamper",
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = httpService:JSONEncode({ hwid = getClientId, game_name = name, flags = v10 }),
          })
        end)
      end)
    end

    v13 = f36("ScreenGui", {
      Name = "NX_" .. tostring(math.random(100000, 999999)),
      IgnoreGuiInset = true,
      ScreenInsets = f25("ScreenInsets", "DeviceSafeInsets"),
      ResetOnSpawn = false,
      ZIndexBehavior = f25("ZIndexBehavior", "Sibling"),
      DisplayOrder = 999999,
    })

    if not v13 then
      v3.__NEOX_LOADER_ACTIVE = nil
      warn("[NEOX] Unable to create interface")
      return
    elseif not f37(v13) then
      pcall(function() v13:Destroy() end)
      v3.__NEOX_LOADER_ACTIVE = nil
      warn("[NEOX] Unable to mount interface")
      return
    else
      v14 = f36("Frame", {
        Name = "Panel",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = v7.Panel,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Position = UDim2.new(0.5, 0, 0.5, 14),
        Size = UDim2.new(0, 460, 0, 190),
        Parent = v13,
      })

      v15 = f36("UIScale", { Scale = 1, Parent = v14 })
      f36("UICorner", { CornerRadius = UDim.new(0, 14), Parent = v14 })

      local v126 = f36("UIStroke", {
        Color = v7.Edge,
        Thickness = 1,
        Transparency = 1,
        ApplyStrokeMode = f25("ApplyStrokeMode", "Border"),
        Parent = v14,
      })

      local v127 = f36("ImageLabel", {
        Name = "Texture",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = "http://www.roblox.com/asset/?id=91961368561481",
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        ImageTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        ZIndex = 1,
        Parent = v14,
      })

      local v128 = f36("ImageLabel", {
        Name = "Tile",
        BackgroundColor3 = v7.Tile,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Image = v4.ICON_ID,
        ImageTransparency = 1,
        Position = UDim2.new(0, 26, 0, 24),
        Size = UDim2.new(0, 40, 0, 40),
        ZIndex = 3,
        Parent = v14,
      })

      f36("UICorner", { CornerRadius = UDim.new(0, 10), Parent = v128 })

      local v129 = f36("UIStroke", {
        Color = v7.Edge,
        Thickness = 1,
        Transparency = 1,
        Parent = v128,
      })

      local v130 = f36("TextLabel", {
        Name = "Title",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Font = v109.Bold,
        Text = "NEOX HUB",
        TextColor3 = v7.Primary,
        TextSize = 17,
        TextTransparency = 1,
        TextXAlignment = f25("TextXAlignment", "Left"),
        Position = UDim2.new(0, 78, 0, 25),
        Size = UDim2.new(0, 260, 0, 18),
        ZIndex = 3,
        Parent = v14,
      })

      local v131 = f36("TextLabel", {
        Name = "Tagline",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Font = v109.Regular,
        Text = "Shaping the future of scripting",
        TextColor3 = v7.Secondary,
        TextSize = 11,
        TextTransparency = 1,
        TextXAlignment = f25("TextXAlignment", "Left"),
        Position = UDim2.new(0, 78, 0, 45),
        Size = UDim2.new(0, 300, 0, 16),
        ZIndex = 3,
        Parent = v14,
      })

      local v132 = f36("Frame", {
        Name = "Rule",
        BackgroundColor3 = v7.Rule,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 88),
        Size = UDim2.new(1, 0, 0, 1),
        ZIndex = 3,
        Parent = v14,
      })

      v16 = f36("Frame", {
        Name = "Dot",
        BackgroundColor3 = v7.Neutral,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 26, 0, 114),
        Size = UDim2.new(0, 5, 0, 5),
        ZIndex = 3,
        Parent = v14,
      })

      f36("UICorner", { CornerRadius = UDim.new(1, 0), Parent = v16 })

      v17 = f36("TextLabel", {
        Name = "Status",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Font = v109.Regular,
        Text = "Initializing",
        TextColor3 = v7.Secondary,
        TextSize = 12,
        TextTransparency = 1,
        TextTruncate = f25("TextTruncate", "AtEnd"),
        TextXAlignment = f25("TextXAlignment", "Left"),
        Position = UDim2.new(0, 40, 0, 107),
        Size = UDim2.new(1, -120, 0, 18),
        ZIndex = 3,
        Parent = v14,
      })

      v18 = f36("TextLabel", {
        Name = "Percent",
        AnchorPoint = Vector2.new(1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Font = v109.Mono,
        Text = "00",
        TextColor3 = v7.Primary,
        TextSize = 12,
        TextTransparency = 1,
        TextXAlignment = f25("TextXAlignment", "Right"),
        Position = UDim2.new(1, -26, 0, 107),
        Size = UDim2.new(0, 60, 0, 18),
        ZIndex = 3,
        Parent = v14,
      })

      local v133 = f36("Frame", {
        Name = "Track",
        BackgroundColor3 = v7.Track,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Position = UDim2.new(0, 26, 0, 138),
        Size = UDim2.new(1, -52, 0, 2),
        ZIndex = 3,
        Parent = v14,
      })

      f36("UICorner", { CornerRadius = UDim.new(1, 0), Parent = v133 })

      v19 = f36("Frame", {
        Name = "Fill",
        BackgroundColor3 = v7.Neutral,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 0, 1, 0),
        ZIndex = 4,
        Parent = v133,
      })

      f36("UICorner", { CornerRadius = UDim.new(1, 0), Parent = v19 })

      v20 = f36("UIGradient", {
        Transparency = NumberSequence.new({
          NumberSequenceKeypoint.new(0, 0.35), NumberSequenceKeypoint.new(0.45, 0),
          NumberSequenceKeypoint.new(0.55, 0), NumberSequenceKeypoint.new(1, 0.35),
        }),
        Offset = Vector2.new(-1, 0),
        Parent = v19,
      })

      local v134 = f36("TextLabel", {
        Name = "Footer",
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Font = v109.Medium,
        Text = "N E O X   S O F T W O R K S",
        TextColor3 = v7.Muted,
        TextSize = 9,
        TextTransparency = 1,
        TextXAlignment = f25("TextXAlignment", "Center"),
        Position = UDim2.new(0, 26, 0, 156),
        Size = UDim2.new(1, -52, 0, 12),
        ZIndex = 3,
        Parent = v14,
      })

      v21 = {}

      local function f39(p31, property, shown, order)
        if p31 then
          table.insert(v21, {
            Object = p31,
            Property = property,
            Shown = shown,
            Order = order,
          })
        end
      end

      f39(v14, "BackgroundTransparency", 0, 0)
      f39(v126, "Transparency", 0, 0)
      f39(v127, "ImageTransparency", 0.95, 0)
      f39(v128, "BackgroundTransparency", 0, 1)
      f39(v128, "ImageTransparency", 0, 1)
      f39(v129, "Transparency", 0, 1)
      f39(v130, "TextTransparency", 0, 2)
      f39(v131, "TextTransparency", 0, 3)
      f39(v132, "BackgroundTransparency", 0, 3)
      f39(v16, "BackgroundTransparency", 0, 4)
      f39(v17, "TextTransparency", 0, 4)
      f39(v18, "TextTransparency", 0, 4)
      f39(v133, "BackgroundTransparency", 0, 5)
      f39(v19, "BackgroundTransparency", 0, 5)

      function f10()
        if not v15 then
          return
        else
          local currentCamera = workspace and workspace.CurrentCamera

          local viewportSize = currentCamera and currentCamera.ViewportSize
            or Vector2.new(1280, 720)

          if viewportSize.X <= 0 or viewportSize.Y <= 0 then
            return
          else
            local v135 = math.min(viewportSize.X / 520, viewportSize.Y / 300)
            v15.Scale = math.clamp(v135, 0.5, 1)
            return
          end
        end
      end

      f39(v134, "TextTransparency", 0, 6)
      v22 = false
      v23 = false
      v24 = 0
      v25 = 0
      v26 = {}

      pcall(f10)

      pcall(function()
        local currentCamera2 = workspace.CurrentCamera

        if currentCamera2 then
          local viewportSize2 = currentCamera2:GetPropertyChangedSignal("ViewportSize")
          table.insert(v26, viewportSize2:Connect(f10))
        end

        local currentCamera3 = workspace:GetPropertyChangedSignal("CurrentCamera")
        table.insert(v26, currentCamera3:Connect(function() pcall(f10) end))
      end)

      v27 = nil

      function f26()
        if v23 then
          return
        end

        v23 = true
        v22 = true

        for index2, value3 in ipairs(v26) do
        end

        pcall(function() v13:Destroy() end)

        if v27 then
          pcall(function() v27:Destroy() end)
        end

        v3.__NEOX_LOADER_ACTIVE = nil
      end

      function f11(p32)
        v25 = math.clamp(p32, 0, 100)
      end

      task.delay(v4.HARD_TIMEOUT, f26)

      function f27(p33)
        for index3, value4 in ipairs(v21) do
          local v136 = {}
          local property2 = value4.Property
          v136[property2] = p33 and value4.Shown or 1

          local tweenInfo = TweenInfo.new(
            p33 and 0.4 or 0.28, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false,
            p33 and value4.Order * 0.045 or 0
          )

          f6(value4.Object, tweenInfo, v136)
        end
      end

      function f13(backgroundColor3)
        f6(v19, TweenInfo.new(0.3), { BackgroundColor3 = backgroundColor3 })
        f6(v16, TweenInfo.new(0.3), { BackgroundColor3 = backgroundColor3 })
      end

      function f12(p34)
        if v22 or not v17 or v17.Text == p34 then
          return
        end

        f6(v17, TweenInfo.new(0.12), { TextTransparency = 1 })

        task.delay(0.13, function()
          if v22 then
            return
          end

          f7(v17, "Text", p34)
          f6(v17, TweenInfo.new(0.2), { TextTransparency = 0 })
        end)
      end

      task.spawn(function()
        while not v22 and v20 and v20.Parent do
          f7(v20, "Offset", Vector2.new(-1, 0))

          f6(v20, TweenInfo.new(1.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            Offset = Vector2.new(1, 0),
          })

          task.wait(2.4)
        end
      end)

      renderStepped = runService and (runService.RenderStepped or runService.Heartbeat)
      local v137 = nil

      if renderStepped then
        local v138, v139 = pcall(function()
          return renderStepped:Connect(function(p35)
            if v23 then
              return
            end

            v24 = v24 + (v25 - v24) * math.min((p35 or 0.016) * 7, 1)

            if math.abs(v25 - v24) < 0.15 then
              v24 = v25
            end

            f7(v19, "Size", UDim2.new(v24 / 100, 0, 1, 0))
            f7(v18, "Text", string.format("%02d", math.floor(v24 + 0.5)))
          end)
        end)

        if v138 and v139 then
          v137 = v139
          table.insert(v26, v139)
        end
      end

      if not v137 then
        task.spawn(function()
          while not v23 do
            v24 = v24 + (v25 - v24) * 0.2

            if math.abs(v25 - v24) < 0.15 then
              v24 = v25
            end

            f7(v19, "Size", UDim2.new(v24 / 100, 0, 1, 0))
            f7(v18, "Text", string.format("%02d", math.floor(v24 + 0.5)))

            task.wait(0.03)
          end
        end)
      end

      function f28()
        if v22 then
          return
        end

        v22 = true
        f27(false)

        f6(v14, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
          Position = UDim2.new(0.5, 0, 0.5, 10),
        })

        task.wait(0.45)
        pcall(function() v13:Destroy() end)
      end

      local function f40(p36)
        f13(v7.Error)
        f12(p36)
        f11(100)
        task.wait(2)
        f28()
        f26()
        f8(v4.HUB_NAME .. " - ERROR", p36, v4.NOTIFICATION_DURATION.ERROR)
      end

      pcall(function()
        f27(true)

        f6(v14, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
          Position = UDim2.new(0.5, 0, 0.5, 0),
        })

        task.wait(0.45)
      end)

      f12("Initializing NEOX HUB")
      f11(10)
      f12("Looking up this game")
      f11(32)
      scriptId2 = nil
      gameName = nil
      v28 = false
      v29 = false
      v30 = false

      pcall(function()
        local v140 = v2({
          Url = v4.BASE_URL .. "/api/games/resolve?place_id=" .. tostring(placeId),
          Method = "GET",
        })

        if v140 and v140.StatusCode == 200 then
          v28 = true
          local jsonDecode2 = httpService:JSONDecode(v140.Body)

          if jsonDecode2 and jsonDecode2.success and type(jsonDecode2.script_id) == "string"
            and #jsonDecode2.script_id > 0 then
            scriptId2 = jsonDecode2.script_id
            gameName = jsonDecode2.game_name
            v30 = jsonDecode2.keyless == true
            v29 = true
          end
        end
      end)

      if not v28 then
        f40("Unable to reach the server")
        return
      end

      if not v29 then
        f13(v7.Error)
        f12("Unsupported game: " .. name)
        f11(100)
        task.wait(2.2)
        f12("Request this game on our Discord")
        task.wait(2.8)
        f28()
        f26()

        f8(
          v4.HUB_NAME .. " - INFO",
          "You Can Request Script For This Game On Our Discord Server",
          v4.NOTIFICATION_DURATION.ERROR
        )

        return
      end

      f12("Verifying compatibility")
      f11(54)

      if type(gameName) == "string" and #gameName > 0 then
        name = gameName
      end

      f12(name)
      f11(70)
      task.wait(0.7)
      f12("Waiting for authentication")
      f11(75)
      task.wait(0.4)
      f28()

      v27 = f36("ScreenGui", {
        Name = "NXK_" .. tostring(math.random(100000, 999999)),
        IgnoreGuiInset = true,
        ResetOnSpawn = false,
        ZIndexBehavior = f25("ZIndexBehavior", "Sibling"),
        DisplayOrder = 999999,
      })

      if not v27 or not f37(v27) then
        f26()
        warn("[NEOX] Unable to mount authentication interface")
        return
      else
        function f29(p37, p38)
          return tweenService:Create(p37, TweenInfo.new(
            v4.ANIMATION_SPEED, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
          ), p38)
        end

        mainFrame = Instance.new("Frame")
        mainFrame.Name = "MainFrame"
        mainFrame.Size = UDim2.new(0, 370, 0, 235)
        mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        mainFrame.BackgroundColor3 = v8.BACKGROUND
        mainFrame.BorderSizePixel = 0
        mainFrame.Active = true
        mainFrame.Draggable = true
        mainFrame.ClipsDescendants = true
        mainFrame.Parent = v27

        local uiCorner = Instance.new("UICorner")
        uiCorner.CornerRadius = UDim.new(0, 10)
        uiCorner.Parent = mainFrame

        gradientOverlay = Instance.new("Frame")
        gradientOverlay.Name = "GradientOverlay"
        gradientOverlay.Size = UDim2.new(1, 0, 1, 0)
        gradientOverlay.BackgroundTransparency = 0.95
        gradientOverlay.BorderSizePixel = 0
        gradientOverlay.ZIndex = 0
        gradientOverlay.Parent = mainFrame

        uiGradient = Instance.new("UIGradient")
        uiGradient.Rotation = 45

        uiGradient.Color = ColorSequence.new({
          ColorSequenceKeypoint.new(0, Color3.fromRGB(121, 56, 234)),
          ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 34, 76)),
        })

        uiGradient.Parent = gradientOverlay

        local uiCorner2 = Instance.new("UICorner")
        uiCorner2.CornerRadius = UDim.new(0, 10)
        uiCorner2.Parent = gradientOverlay

        task.spawn(function()
          while gradientOverlay.Parent do
            f29(uiGradient, { Rotation = uiGradient.Rotation + 360 }):Play()
            task.wait(10)
          end
        end)

        local header = Instance.new("Frame")
        header.Name = "Header"
        header.Size = UDim2.new(1, 0, 0, 35)
        header.BackgroundTransparency = 1
        header.BorderSizePixel = 0
        header.ZIndex = 2
        header.Parent = mainFrame

        local separator = Instance.new("Frame")
        separator.Name = "Separator"
        separator.Size = UDim2.new(1, 0, 0, 1)
        separator.Position = UDim2.new(0, 0, 1, 0)
        separator.BackgroundColor3 = v8.HEADER_LINE
        separator.BorderSizePixel = 0
        separator.Parent = header

        local title2 = Instance.new("TextLabel")
        title2.Name = "Title"
        title2.Size = UDim2.new(0, 100, 1, 0)
        title2.Position = UDim2.new(0, 15, 0, 0)
        title2.BackgroundTransparency = 1
        title2.Text = "NEOX HUB"
        title2.TextColor3 = v8.TEXT
        title2.TextSize = 18
        title2.Font = v109.Bold
        title2.TextXAlignment = Enum.TextXAlignment.Left
        title2.Parent = header

        discordButton = Instance.new("TextButton")
        discordButton.Name = "DiscordButton"
        discordButton.Size = UDim2.new(0, 50, 0, 20)
        discordButton.Position = UDim2.new(1, -60, 0.5, 0)
        discordButton.AnchorPoint = Vector2.new(1, 0.5)
        discordButton.BackgroundTransparency = 1
        discordButton.Text = "Discord"
        discordButton.TextSize = 13
        discordButton.TextColor3 = v8.DISCORD
        discordButton.Font = v109.Bold
        discordButton.AutoButtonColor = false
        discordButton.Parent = header

        icon = Instance.new("ImageLabel")
        icon.Name = "Icon"
        icon.Size = UDim2.new(0, 14, 0, 14)
        icon.Position = UDim2.new(1, 2, 0.5, 0)
        icon.AnchorPoint = Vector2.new(0, 0.5)
        icon.BackgroundTransparency = 1
        icon.Image = "rbxassetid://10734943193"
        icon.ImageColor3 = v8.DISCORD
        icon.Parent = discordButton

        closeButton = Instance.new("TextButton")
        closeButton.Name = "CloseButton"
        closeButton.Size = UDim2.new(0, 25, 0, 25)
        closeButton.Position = UDim2.new(1, -7, 0.5, 0)
        closeButton.AnchorPoint = Vector2.new(1, 0.5)
        closeButton.BackgroundTransparency = 1
        closeButton.Text = "X"
        closeButton.TextSize = 18
        closeButton.TextColor3 = v8.TEXT
        closeButton.Font = v109.Bold
        closeButton.AutoButtonColor = false
        closeButton.Parent = header

        tutorialText = Instance.new("TextLabel")
        tutorialText.Name = "TutorialText"

        textSECONDARY = v8.TEXT_SECONDARY

        tutorialText.Size = UDim2.new(0.9, 0, 0, 40)
        tutorialText.Position = UDim2.new(0.5, 0, 0, 45)
        tutorialText.AnchorPoint = Vector2.new(0.5, 0)
        tutorialText.BackgroundTransparency = 1
        tutorialText.Text = "Get a new key by clicking 'Get Key' It Only Takes (10 Sec) To Generate Key. Press Enter or click Verify to authenticate. Join Discord for support."
        tutorialText.TextColor3 = textSECONDARY
        tutorialText.TextSize = 12
        tutorialText.Font = v109.Regular
        tutorialText.TextWrapped = true
        tutorialText.TextXAlignment = Enum.TextXAlignment.Left
        tutorialText.ZIndex = 2
        tutorialText.Parent = mainFrame

        keyInputContainer = Instance.new("Frame")
        keyInputContainer.Name = "KeyInputContainer"
        keyInputContainer.Size = UDim2.new(0.9, 0, 0, 35)
        keyInputContainer.Position = UDim2.new(0.5, 0, 0, 95)
        keyInputContainer.AnchorPoint = Vector2.new(0.5, 0)
        keyInputContainer.BackgroundColor3 = v8.INPUT_BG
        keyInputContainer.BorderSizePixel = 0
        keyInputContainer.ZIndex = 2
        keyInputContainer.Parent = mainFrame

        uiStroke = Instance.new("UIStroke")
        uiStroke.Thickness = 1
        uiStroke.Color = v8.BORDER
        uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        uiStroke.Parent = keyInputContainer

        local uiCorner3 = Instance.new("UICorner")
        uiCorner3.CornerRadius = UDim.new(0, 6)
        uiCorner3.Parent = keyInputContainer

        uiStroke2 = Instance.new("UIStroke")
        uiStroke2.Thickness = 0
        uiStroke2.Color = v8.PRIMARY
        uiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        uiStroke2.Transparency = 1
        uiStroke2.Parent = keyInputContainer

        keyInput = Instance.new("TextBox")
        keyInput.Name = "KeyInput"
        keyInput.Size = UDim2.new(1, -20, 1, 0)
        keyInput.Position = UDim2.new(0, 10, 0, 0)
        keyInput.BackgroundTransparency = 1
        keyInput.PlaceholderText = "Enter Your Key (Press Enter to Verify)"
        keyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
        keyInput.Text = ""
        keyInput.TextSize = 14
        keyInput.TextColor3 = v8.TEXT
        keyInput.Font = v109.Regular
        keyInput.ClearTextOnFocus = false
        keyInput.TextXAlignment = Enum.TextXAlignment.Left
        keyInput.ZIndex = 3
        keyInput.Parent = keyInputContainer

        keyInput.Focused:Connect(function()
          f29(uiStroke2, { Thickness = 2, Transparency = 0.5 }):Play()
          f29(uiStroke, { Transparency = 0.3 }):Play()
        end)

        keyInput.FocusLost:Connect(function()
          f29(uiStroke2, { Thickness = 0, Transparency = 1 }):Play()
          f29(uiStroke, { Transparency = 0 }):Play()
        end)

        statusLabel = Instance.new("TextLabel")
        statusLabel.Name = "StatusLabel"
        statusLabel.Size = UDim2.new(0.9, 0, 0, 40)
        statusLabel.Position = UDim2.new(0.5, 0, 0.55, 0)
        statusLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        statusLabel.BackgroundTransparency = 1
        statusLabel.Text = ""
        statusLabel.TextColor3 = v8.INFO
        statusLabel.TextSize = 13
        statusLabel.Font = v109.Medium
        statusLabel.TextWrapped = true
        statusLabel.ZIndex = 2
        statusLabel.Parent = mainFrame

        helpLabel = Instance.new("TextLabel")
        helpLabel.Name = "HelpLabel"
        helpLabel.Size = UDim2.new(0.9, 0, 0, 30)
        helpLabel.Position = UDim2.new(0.5, 0, 0.7, 0)
        helpLabel.AnchorPoint = Vector2.new(0.5, 0.5)
        helpLabel.BackgroundTransparency = 1
        helpLabel.Text = ""
        helpLabel.TextColor3 = v8.TEXT_SECONDARY
        helpLabel.TextSize = 11
        helpLabel.Font = v109.Regular
        helpLabel.TextWrapped = true
        helpLabel.ZIndex = 2
        helpLabel.Visible = false
        helpLabel.Parent = mainFrame

        loadingDots = Instance.new("TextLabel")
        loadingDots.Name = "LoadingDots"
        loadingDots.Size = UDim2.new(0, 30, 0, 20)
        loadingDots.Position = UDim2.new(0.5, 0, 0.65, 0)
        loadingDots.AnchorPoint = Vector2.new(0.5, 0.5)
        loadingDots.BackgroundTransparency = 1
        loadingDots.Text = ""
        loadingDots.TextColor3 = v8.PRIMARY
        loadingDots.TextSize = 20
        loadingDots.Font = v109.Bold
        loadingDots.ZIndex = 2
        loadingDots.Visible = false
        loadingDots.Parent = mainFrame

        buttonContainer = Instance.new("Frame")
        buttonContainer.Name = "ButtonContainer"
        buttonContainer.Size = UDim2.new(0.9, 0, 0, 30)
        buttonContainer.Position = UDim2.new(0.5, 0, 1, -50)
        buttonContainer.AnchorPoint = Vector2.new(0.5, 1)
        buttonContainer.BackgroundTransparency = 1
        buttonContainer.ZIndex = 2
        buttonContainer.Parent = mainFrame

        local getKeyButton = Instance.new("TextButton")
        getKeyButton.Name = "GetKeyButton"
        getKeyButton.Size = UDim2.new(0.48, 0, 1, 0)
        getKeyButton.Position = UDim2.new(0, 0, 0, 0)
        getKeyButton.BackgroundColor3 = v8.PRIMARY
        getKeyButton.Text = "Get Key"
        getKeyButton.TextSize = 13
        getKeyButton.TextColor3 = v8.TEXT
        getKeyButton.Font = v109.Bold
        getKeyButton.AutoButtonColor = false
        getKeyButton.ZIndex = 3
        getKeyButton.Parent = buttonContainer

        local uiCorner4 = Instance.new("UICorner")
        uiCorner4.CornerRadius = UDim.new(0, 7)
        uiCorner4.Parent = getKeyButton

        local verifyButton = Instance.new("TextButton")
        verifyButton.Name = "VerifyButton"
        verifyButton.Size = UDim2.new(0.48, 0, 1, 0)
        verifyButton.Position = UDim2.new(1, 0, 0, 0)
        verifyButton.AnchorPoint = Vector2.new(1, 0)
        verifyButton.BackgroundColor3 = v8.SECONDARY
        verifyButton.Text = "Verify"
        verifyButton.TextSize = 13
        verifyButton.TextColor3 = v8.TEXT
        verifyButton.Font = v109.Bold
        verifyButton.AutoButtonColor = false
        verifyButton.ZIndex = 3
        verifyButton.Parent = buttonContainer

        local uiCorner5 = Instance.new("UICorner")
        uiCorner5.CornerRadius = UDim.new(0, 7)
        uiCorner5.Parent = verifyButton

        premiumRow = Instance.new("Frame")
        premiumRow.Name = "PremiumRow"
        premiumRow.Size = UDim2.new(0.9, 0, 0, 26)
        premiumRow.Position = UDim2.new(0.5, 0, 1, -15)
        premiumRow.AnchorPoint = Vector2.new(0.5, 1)
        premiumRow.BackgroundColor3 = Color3.fromRGB(30, 20, 55)
        premiumRow.BorderSizePixel = 0
        premiumRow.ZIndex = 2
        premiumRow.Parent = mainFrame

        local uiCorner6 = Instance.new("UICorner")
        uiCorner6.CornerRadius = UDim.new(0, 7)
        uiCorner6.Parent = premiumRow

        uiStroke3 = Instance.new("UIStroke")
        uiStroke3.Thickness = 1
        uiStroke3.Color = v8.PREMIUM
        uiStroke3.Transparency = 0.55
        uiStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        uiStroke3.Parent = premiumRow

        task.spawn(function()
          while premiumRow.Parent do
            f29(uiStroke3, { Transparency = 0.1 }):Play()
            task.wait(1)
            f29(uiStroke3, { Transparency = 0.6 }):Play()
            task.wait(1)
          end
        end)

        local premiumLabel = Instance.new("TextLabel")
        premiumLabel.Name = "PremiumLabel"
        premiumLabel.Size = UDim2.new(1, -80, 1, 0)
        premiumLabel.Position = UDim2.new(0, 10, 0, 0)
        premiumLabel.BackgroundTransparency = 1
        premiumLabel.Text = "Tired of key system? Buy Premium"
        premiumLabel.TextColor3 = v8.PREMIUM
        premiumLabel.TextSize = 12
        premiumLabel.Font = v109.Medium
        premiumLabel.TextXAlignment = Enum.TextXAlignment.Left
        premiumLabel.TextYAlignment = Enum.TextYAlignment.Center
        premiumLabel.ZIndex = 3
        premiumLabel.Parent = premiumRow

        local buyButton = Instance.new("TextButton")
        buyButton.Name = "BuyButton"
        buyButton.Size = UDim2.new(0, 70, 1, -6)
        buyButton.Position = UDim2.new(1, -3, 0.5, 0)
        buyButton.AnchorPoint = Vector2.new(1, 0.5)
        buyButton.BackgroundColor3 = v8.PREMIUM
        buyButton.Text = "Buy Now"
        buyButton.TextSize = 12
        buyButton.TextColor3 = Color3.fromRGB(20, 10, 40)
        buyButton.Font = v109.Bold
        buyButton.AutoButtonColor = false
        buyButton.ZIndex = 4
        buyButton.Parent = premiumRow

        local uiCorner7 = Instance.new("UICorner")
        uiCorner7.CornerRadius = UDim.new(0, 5)
        uiCorner7.Parent = buyButton

        size = mainFrame.Size
        udim = UDim2.new(0, 370, 0, 300)

        redeemPromptFrame = Instance.new("Frame")
        redeemPromptFrame.Name = "RedeemPromptFrame"
        redeemPromptFrame.Size = UDim2.new(0.9, 0, 0, 225)
        redeemPromptFrame.Position = UDim2.new(0.5, 0, 0, 45)
        redeemPromptFrame.AnchorPoint = Vector2.new(0.5, 0)
        redeemPromptFrame.BackgroundTransparency = 1
        redeemPromptFrame.Visible = false
        redeemPromptFrame.ZIndex = 2
        redeemPromptFrame.Parent = mainFrame

        local redeemMessageLabel = Instance.new("TextLabel")
        redeemMessageLabel.Name = "RedeemMessageLabel"
        redeemMessageLabel.Size = UDim2.new(1, 0, 0, 62)
        redeemMessageLabel.Position = UDim2.new(0, 0, 0, 0)
        redeemMessageLabel.BackgroundTransparency = 1
        redeemMessageLabel.Text = "This is a Premium or Lifetime key, but it has not been redeemed yet. You must redeem it before you can use it."
        redeemMessageLabel.TextColor3 = v8.ERROR
        redeemMessageLabel.TextSize = 13
        redeemMessageLabel.Font = v109.Medium
        redeemMessageLabel.TextWrapped = true
        redeemMessageLabel.TextYAlignment = Enum.TextYAlignment.Top
        redeemMessageLabel.ZIndex = 3
        redeemMessageLabel.Parent = redeemPromptFrame

        redeemCopyBtn = Instance.new("TextButton")
        redeemCopyBtn.Name = "RedeemCopyBtn"
        redeemCopyBtn.Size = UDim2.new(1, 0, 0, 36)
        redeemCopyBtn.Position = UDim2.new(0, 0, 0, 70)
        redeemCopyBtn.BackgroundColor3 = v8.PRIMARY
        redeemCopyBtn.Text = "Copy User Portal URL"
        redeemCopyBtn.TextSize = 13
        redeemCopyBtn.TextColor3 = v8.TEXT
        redeemCopyBtn.Font = v109.Bold
        redeemCopyBtn.AutoButtonColor = false
        redeemCopyBtn.ZIndex = 3
        redeemCopyBtn.Parent = redeemPromptFrame

        local uiCorner8 = Instance.new("UICorner")
        uiCorner8.CornerRadius = UDim.new(0, 7)
        uiCorner8.Parent = redeemCopyBtn

        redeemCheckBtn = Instance.new("TextButton")
        redeemCheckBtn.Name = "RedeemCheckBtn"
        redeemCheckBtn.Size = UDim2.new(1, 0, 0, 36)
        redeemCheckBtn.Position = UDim2.new(0, 0, 0, 112)
        redeemCheckBtn.BackgroundColor3 = v8.SECONDARY
        redeemCheckBtn.Text = "I've Redeemed - Check Again"
        redeemCheckBtn.TextSize = 13
        redeemCheckBtn.TextColor3 = v8.TEXT
        redeemCheckBtn.Font = v109.Bold
        redeemCheckBtn.AutoButtonColor = false
        redeemCheckBtn.ZIndex = 3
        redeemCheckBtn.Parent = redeemPromptFrame

        local uiCorner9 = Instance.new("UICorner")
        uiCorner9.CornerRadius = UDim.new(0, 7)
        uiCorner9.Parent = redeemCheckBtn

        local redeemHintLabel = Instance.new("TextLabel")
        redeemHintLabel.Name = "RedeemHintLabel"
        redeemHintLabel.Size = UDim2.new(1, 0, 0, 46)
        redeemHintLabel.Position = UDim2.new(0, 0, 0, 160)
        redeemHintLabel.BackgroundTransparency = 1
        redeemHintLabel.Text = "You can also redeem your key at our Discord server."
        redeemHintLabel.TextColor3 = v8.TEXT_SECONDARY
        redeemHintLabel.TextSize = 12
        redeemHintLabel.Font = v109.Regular
        redeemHintLabel.TextWrapped = true
        redeemHintLabel.ZIndex = 3
        redeemHintLabel.Parent = redeemPromptFrame

        paidScriptPromptFrame = Instance.new("Frame")
        paidScriptPromptFrame.Name = "PaidScriptPromptFrame"
        paidScriptPromptFrame.Size = UDim2.new(0.9, 0, 0, 205)
        paidScriptPromptFrame.Position = UDim2.new(0.5, 0, 0, 45)
        paidScriptPromptFrame.AnchorPoint = Vector2.new(0.5, 0)
        paidScriptPromptFrame.BackgroundTransparency = 1
        paidScriptPromptFrame.Visible = false
        paidScriptPromptFrame.ZIndex = 2
        paidScriptPromptFrame.Parent = mainFrame

        local paidScriptIconLabel = Instance.new("TextLabel")
        paidScriptIconLabel.Name = "PaidScriptIconLabel"
        paidScriptIconLabel.Size = UDim2.new(1, 0, 0, 26)
        paidScriptIconLabel.Position = UDim2.new(0, 0, 0, 0)
        paidScriptIconLabel.BackgroundTransparency = 1
        paidScriptIconLabel.Text = "PAID ONLY SCRIPT"
        paidScriptIconLabel.TextColor3 = v8.PREMIUM
        paidScriptIconLabel.TextSize = 14
        paidScriptIconLabel.Font = v109.Bold
        paidScriptIconLabel.ZIndex = 3
        paidScriptIconLabel.Parent = paidScriptPromptFrame

        paidScriptMessageLabel = Instance.new("TextLabel")
        paidScriptMessageLabel.Name = "PaidScriptMessageLabel"
        paidScriptMessageLabel.Size = UDim2.new(1, 0, 0, 40)
        paidScriptMessageLabel.Position = UDim2.new(0, 0, 0, 28)

        function f14()
          local v141, v142 = pcall(function()
            return v2({
              Url = v4.BASE_URL .. "/api/get-nonce",
              Method = "GET",
              Headers = { ["Content-Type"] = "application/json" },
            })
          end)

          if not v141 or not v142 or not v142.Body then
            return nil, "Connection error. Please try again. (NX-0007)"
          else
            local v143, v144 = pcall(function() return httpService:JSONDecode(v142.Body) end)

            if not v143 or not v144 or not v144.nonce then
              return nil, "Connection error. Please try again. (NX-0008)"
            end

            return v144.nonce, nil
          end
        end

        paidScriptMessageLabel.BackgroundTransparency = 1
        paidScriptMessageLabel.Text = "This is a paid script. You need to buy it to use it."
        paidScriptMessageLabel.TextColor3 = v8.TEXT_SECONDARY
        paidScriptMessageLabel.TextSize = 13
        paidScriptMessageLabel.Font = v109.Medium
        paidScriptMessageLabel.TextWrapped = true
        paidScriptMessageLabel.TextYAlignment = Enum.TextYAlignment.Top
        paidScriptMessageLabel.ZIndex = 3
        paidScriptMessageLabel.Parent = paidScriptPromptFrame

        paidScriptWebsiteBtn = Instance.new("TextButton")
        paidScriptWebsiteBtn.Name = "PaidScriptWebsiteBtn"
        paidScriptWebsiteBtn.Size = UDim2.new(1, 0, 0, 38)
        paidScriptWebsiteBtn.Position = UDim2.new(0, 0, 0, 72)
        paidScriptWebsiteBtn.BackgroundColor3 = v8.PREMIUM
        paidScriptWebsiteBtn.Text = "Buy On Site"
        paidScriptWebsiteBtn.TextSize = 14
        paidScriptWebsiteBtn.TextColor3 = Color3.fromRGB(20, 15, 0)
        paidScriptWebsiteBtn.Font = v109.Bold
        paidScriptWebsiteBtn.AutoButtonColor = false
        paidScriptWebsiteBtn.ZIndex = 3
        paidScriptWebsiteBtn.Parent = paidScriptPromptFrame

        local uiCorner10 = Instance.new("UICorner")
        uiCorner10.CornerRadius = UDim.new(0, 7)
        uiCorner10.Parent = paidScriptWebsiteBtn

        paidScriptDiscordBtn = Instance.new("TextButton")
        paidScriptDiscordBtn.Name = "PaidScriptDiscordBtn"
        paidScriptDiscordBtn.Size = UDim2.new(1, 0, 0, 36)
        paidScriptDiscordBtn.Position = UDim2.new(0, 0, 0, 116)
        paidScriptDiscordBtn.BackgroundColor3 = v8.DISCORD
        paidScriptDiscordBtn.Text = "Need Help? Join Discord"
        paidScriptDiscordBtn.TextSize = 13
        paidScriptDiscordBtn.TextColor3 = v8.TEXT
        paidScriptDiscordBtn.Font = v109.Bold
        paidScriptDiscordBtn.AutoButtonColor = false
        paidScriptDiscordBtn.ZIndex = 3
        paidScriptDiscordBtn.Parent = paidScriptPromptFrame

        local uiCorner11 = Instance.new("UICorner")
        uiCorner11.CornerRadius = UDim.new(0, 7)
        uiCorner11.Parent = paidScriptDiscordBtn

        paidScriptEnterKeyBtn = Instance.new("TextButton")
        paidScriptEnterKeyBtn.Name = "PaidScriptEnterKeyBtn"
        paidScriptEnterKeyBtn.Size = UDim2.new(1, 0, 0, 30)
        paidScriptEnterKeyBtn.Position = UDim2.new(0, 0, 0, 158)
        paidScriptEnterKeyBtn.BackgroundTransparency = 1
        paidScriptEnterKeyBtn.Text = "Already Bought? Enter Your Key"
        paidScriptEnterKeyBtn.TextColor3 = v8.PREMIUM
        paidScriptEnterKeyBtn.TextSize = 13
        paidScriptEnterKeyBtn.Font = v109.Bold
        paidScriptEnterKeyBtn.AutoButtonColor = false
        paidScriptEnterKeyBtn.ZIndex = 3
        paidScriptEnterKeyBtn.Parent = paidScriptPromptFrame

        local function f41(p39, backgroundColor32, backgroundColor33)
          p39.MouseEnter:Connect(function()
            f29(p39, { BackgroundColor3 = backgroundColor33 }):Play()
          end)

          p39.MouseLeave:Connect(function()
            f29(p39, { BackgroundColor3 = backgroundColor32 }):Play()
          end)
        end

        f41(getKeyButton, v8.PRIMARY, v8.PRIMARY_HOVER)
        f41(verifyButton, v8.SECONDARY, v8.SECONDARY_HOVER)
        f41(buyButton, v8.PREMIUM, v8.PREMIUM_HOVER)
        f41(redeemCopyBtn, v8.PRIMARY, v8.PRIMARY_HOVER)
        f41(redeemCheckBtn, v8.SECONDARY, v8.SECONDARY_HOVER)
        f41(paidScriptDiscordBtn, v8.DISCORD, Color3.fromRGB(160, 136, 233))

        paidScriptEnterKeyBtn.MouseEnter:Connect(function()
          f29(paidScriptEnterKeyBtn, { TextColor3 = v8.PREMIUM_HOVER }):Play()
        end)

        paidScriptEnterKeyBtn.MouseLeave:Connect(function()
          f29(paidScriptEnterKeyBtn, { TextColor3 = v8.PREMIUM }):Play()
        end)

        f41(paidScriptWebsiteBtn, v8.PREMIUM, v8.PREMIUM_HOVER)

        closeButton.MouseEnter:Connect(function()
          f29(closeButton, { TextColor3 = v8.ERROR, Rotation = 90 }):Play()
        end)

        closeButton.MouseLeave:Connect(function()
          f29(closeButton, { TextColor3 = v8.TEXT, Rotation = 0 }):Play()
        end)

        discordButton.MouseEnter:Connect(function()
          f29(discordButton, { TextColor3 = Color3.fromRGB(160, 136, 233) }):Play()
          f29(icon, { ImageColor3 = Color3.fromRGB(160, 136, 233) }):Play()
        end)

        function f15(p40)
          return pcall(function()
            if writefile then
              writefile(v4.KEY_FILE, p40)
            end
          end)
        end

        discordButton.MouseLeave:Connect(function()
          f29(discordButton, { TextColor3 = v8.DISCORD }):Play()
          f29(icon, { ImageColor3 = v8.DISCORD }):Play()
        end)

        v31 = nil

        function f16(p41)
          f30(false)
          statusLabel.Text = ""
          loadingDots.Visible = false
          helpLabel.Visible = false

          paidScriptMessageLabel.Text = (p41 and p41 ~= "" and p41 or "This script")
            .. " is a paid script. You need to buy it to use it."

          f29(mainFrame, { Size = udim }):Play()
          paidScriptPromptFrame.Visible = true
        end

        function f17()
          v32 = nil
          redeemPromptFrame.Visible = false
          f29(mainFrame, { Size = size }):Play()
        end

        function f18(p42)
          v32 = p42
          f30(false)
          statusLabel.Text = ""
          loadingDots.Visible = false
          helpLabel.Visible = false
          redeemCheckBtn.Text = "I've Redeemed - Check Again"
          f29(mainFrame, { Size = udim }):Play()
          redeemPromptFrame.Visible = true
        end

        function f30(visible)
          keyInput.Visible = visible
          tutorialText.Visible = visible
          buttonContainer.Visible = visible
          keyInputContainer.Visible = visible
          premiumRow.Visible = visible
        end

        function f19(text2, p43, p44, p45, p46)
          if v31 then
            pcall(task.cancel, v31)
            v31 = nil
          end

          statusLabel.Text = text2
          statusLabel.TextColor3 = p43 or v8.INFO

          loadingDots.Visible = p45 or false

          if p46 then
            helpLabel.Text = p46
            helpLabel.Visible = true
          else
            helpLabel.Visible = false
          end

          if p45 then
            task.spawn(function()
              local v145 = 0

              while loadingDots.Visible do
                v145 = v145 % 3 + 1
                loadingDots.Text = rep(".", v145)
                task.wait(0.5)
              end
            end)
          end

          if p44 then
            v31 = task.spawn(function()
              task.wait(p44)
              statusLabel.Text = ""
              loadingDots.Visible = false
              helpLabel.Visible = false
            end)
          end
        end

        v32 = nil

        function f20()
          paidScriptPromptFrame.Visible = false
          f29(mainFrame, { Size = size }):Play()
        end

        local function f42()
          local v146, v147 = pcall(function()
            if readfile and isfile and isfile(v4.KEY_FILE) then
              return readfile(v4.KEY_FILE)
            end

            return nil
          end)

          return v146 and v147 or nil
        end

        v33 = false
        scriptId = scriptId2 or ""

        function f31(p47)
          local s = p47 == "" or p47:match("^%s*$")
          local v148, v149

          if s then
            f19("Key field is empty", v8.WARNING, 2)
            return nil
          else
            f19("Connecting...", v8.INFO, nil, true)
            task.wait(0.5)
            local v150
            v148, v150 = f14()

            if not v148 then
              f19(
                "Connection error. Please try again. (NX-0001)", v8.ERROR, 3, false,
                "Help: Check your internet connection, disable VPN if using one, and try again."
              )

              return nil
            else
              f19("Connecting...", v8.INFO, nil, true)
              task.wait(0.5)

              local v151

              v151, v149 = pcall(function()
                return v2({
                  Url = v4.BASE_URL .. "/api/validate-key",
                  Method = "POST",
                  Headers = { ["Content-Type"] = "application/json" },
                  Body = httpService:JSONEncode({
                    key = p47,
                    hwid = getClientId,
                    nonce = v148,
                    game_name = name,
                    script_id = scriptId,
                    place_id = placeId,
                    roblox_username = players.LocalPlayer and players.LocalPlayer.Name or nil,
                  }),
                })
              end)

              if not v151 then
                f19(
                  "Connection error. Please try again. (NX-0002)", v8.ERROR, 3, false,
                  "Help: Please check your internet connection and try again."
                )

                return nil
              end

              if not v149 then
                f19(
                  "Connection error. Please try again. (NX-0003)", v8.ERROR, 3, false,
                  "Help: Server might be down or your internet is slow. Try again later."
                )

                return nil
              end

              f19("Verifying key...", v8.INFO, nil, true)
              task.wait(0.3)

              if not v149.Body then
                f19(
                  "Connection error. Please try again. (NX-0004)", v8.ERROR, 3, false,
                  "Help: Please check your internet connection and try again."
                )

                return nil
              else
                local v152, v153 = pcall(function() return httpService:JSONDecode(v149.Body) end)

                if not v152 or type(v153) ~= "table" then
                  f19(
                    "Connection error. Please try again. (NX-0005)", v8.ERROR, 3, false,
                    "Help: Please check your internet connection and try again."
                  )

                  return nil
                elseif not v153.valid then
                  if v153.reason then
                    local v154 = string.lower(tostring(v153.reason))

                    if string.find(v154, "not redeemed") then
                      f18(p47)
                      return nil, "not_redeemed"
                    end

                    if string.find(v154, "separate purchase")
                      or string.find(v154, "not valid for this script") then
                      f16(name)
                      return nil, "paid_only"
                    end

                    if string.find(v154, "nonce") then
                      f19(
                        "Verification failed. Please try again. (NX-0006)", v8.ERROR, 3, false,
                        "Help: Please disable any VPN and try again."
                      )
                    elseif string.find(v154, "hwid blacklist") then
                      f19(
                        "Your HWID Is Blocked (contact us)", v8.ERROR, 3, false,
                        "Help: Contact support in Discord for assistance."
                      )
                    elseif string.find(v154, "hwid") or string.find(v154, "hardware") then
                      f19(
                        "Key bound to another HWID", v8.ERROR, 3, false,
                        "Help: This key is already used on different device. Get a new key."
                      )
                    else
                      f19(
                        "Key validation failed: " .. tostring(v153.reason), v8.ERROR, 3, false,
                        "Help: Check if key is correct and not expired. Get a new key if needed."
                      )
                    end

                    return nil
                  end

                  f19(
                    "Key is invalid or expired", v8.ERROR, 3, false,
                    "Help: Key might be expired or incorrect. Get a new key from our website."
                  )

                  return nil
                else
                  if type(v153.unlock) ~= "string" or #v153.unlock ~= 64 then
                    f19(
                      "Session could not be verified. (NX-1000)", v8.ERROR, 4, false,
                      "Help: Please close other scripts, rejoin the game and try again."
                    )

                    return nil
                  end

                  return {
                    unlock = v153.unlock,
                    nonce = v148,
                    key = p47,
                    payload = v153.payload,
                    expiry = v153.expiry,
                    is_lifetime = v153.is_lifetime,
                    key_type = v153.key_type,
                    usage_count = v153.usage_count,
                    discord_username = v153.discord_username,
                  }
                end
              end
            end
          end
        end

        function f32(p48)
          local v155 = tostring(p48)

          if #v155 > 200 then
            v155 = sub(v155, 1, 200) .. "..."
          end

          return v155
        end

        function f21(p49)
          local v156, v157, v158 = pcall(f33, p49)

          if not v156 then
            return false, "Failed to load. Please rejoin and try again. (NX-5001)"
          end

          return v157, v158
        end

        function f33(p50)
          local v159

          if type(p50.session_key_hex) == "string" then
            v159 = f24(p50.session_key_hex)

            if not v159 or #v159 ~= 32 then
              return false, "Session error. Please try again. (NX-1003)"
            end
          else
            local v160 = f24(p50.unlock)

            if not v160 or #v160 ~= 32 then
              return false, "Session error. Please try again. (NX-1001)"
            end

            v159 = f2(v160, (f1(p50.nonce .. "|" .. getClientId .. "|" .. p50.key)))

            if #v159 ~= 32 then
              return false, "Session error. Please try again. (NX-1002)"
            end
          end

          f19("Loading NEOX HUB...", v8.INFO, nil, true)

          if type(p50.payload) ~= "string" or #p50.payload == 0 then
            return false, "This game has not been migrated to the server yet. (NX-2003)"
          else
            local v161 = f5(p50.payload)

            if not v161 or #v161 < 24 then
              return false, "Failed to load. Please rejoin and try again. (NX-2004)"
            else
              local v162 = f3(v161, v159, 768)

              if sub(v162, 1, 7) ~= "NEOXP1|" or sub(v162, 16, 16) ~= "|" then
                return false, "Failed to load. Please rejoin and try again. (NX-3001)"
              else
                local v163 = sub(v162, 8, 15)
                local v164 = sub(v162, 17)

                if #v164 < 16 then
                  return false, "Failed to load. Please rejoin and try again. (NX-3002)"
                elseif f23(v164) ~= v163 then
                  return false, "Failed to load. Please rejoin and try again. (NX-3003)"
                else
                  f19("Loading NEOX HUB...", v8.SUCCESS, nil, true)
                  -- Dump the decrypted game source instead of executing it.
                  -- Key verification, payload retrieval, decryption, checksum validation,
                  -- UI, and heartbeat flow remain unchanged.
                  local v165, v166 = pcall(function()
                    if type(writefile) ~= "function" then
                      error("writefile is unavailable")
                    end
                    writefile("NEOX_dump.lua", v164)
                    return true
                  end)

                  if not v165 then
                    return false, "Failed to save payload: " .. f32(v166) .. " (NX-4001)"
                  else
                    pcall(function()
                      if p50.key then
                        getgenv().NEOX_ACTIVE_KEY = p50.key
                        getgenv().NEOX_ACTIVE_HWID = getClientId
                        getgenv().NEOX_KEY_EXPIRY = p50.expiry
                        getgenv().NEOX_KEY_IS_LIFETIME = p50.is_lifetime
                        getgenv().NEOX_KEY_TYPE = p50.key_type
                        getgenv().NEOX_KEY_USAGE_COUNT = p50.usage_count
                        getgenv().NEOX_KEY_DISCORD = p50.discord_username
                      end
                    end)

                    local v168, v169 = pcall(v166)
                    local v170 = v169

                    if not v168 then
                      return false, "Script error: " .. f32(v170) .. " (NX-4003)"
                    else
                      local count8 = 0

                      while type(v170) == "function" and count8 < 5 do
                        count8 = count8 + 1
                        local v171, v172 = pcall(v170)

                        if not v171 then
                          return false, "Script error: " .. f32(v172) .. " (NX-4004)"
                        end

                        v170 = v172
                      end

                      task.spawn(function()
                        local function f43()
                          pcall(function()
                            v2({
                              Url = v4.BASE_URL .. "/api/heartbeat",
                              Method = "POST",
                              Headers = { ["Content-Type"] = "application/json" },
                              Body = httpService:JSONEncode({
                                key = p50.key,
                                hwid = getClientId,
                                game_name = name,
                              }),
                            })
                          end)
                        end

                        f43()

                        while true do
                          task.wait(45)
                          f43()
                        end
                      end)

                      return true, nil
                    end
                  end
                end
              end
            end
          end
        end

        function f34()
          if v33 then
            return
          else
            tutorialText.Text = "Get a new key by clicking 'Get Key' It Only Takes (10 Sec) To Generate Key. Press Enter or click Verify to authenticate. Join Discord for support."
            tutorialText.TextColor3 = textSECONDARY

            local text3 = keyInput.Text
            v33 = true
            f30(false)
            f19("Verifying key...", v8.INFO, nil, true)
            task.wait(1)
            local v173, v174 = f31(text3)

            if v173 then
              f19("Key verified", v8.SUCCESS, 1)
              task.wait(1)

              if writefile and f15(text3) then
                f19("Key saved", v8.SUCCESS, 1)
                task.wait(1)
              end

              local v175, v176 = f21(v173)

              if v175 then
                f26()
                return
              end

              f19(
                v176 or "Failed to load. Please try again. (NX-5000)", v8.ERROR, 5, false,
                "Help: Please rejoin the game and try again. Contact support if this continues."
              )

              f8(
                v4.HUB_NAME .. " - ERROR", v176 or "Failed to load script",
                v4.NOTIFICATION_DURATION.ERROR
              )

              v33 = false
              task.wait(5)
              f30(true)
              return
            elseif v174 == "not_redeemed" then
              v33 = false
            elseif v174 == "paid_only" then
              v33 = false
            else
              v33 = false
              task.wait(3)
              f30(true)
            end
          end
        end

        closeButton.MouseButton1Click:Connect(function() f26() end)

        getKeyButton.MouseButton1Click:Connect(function()
          if v33 then
            return
          end

          f30(false)

          if setclipboard then
            setclipboard("https://neoxsoftworks.eu/key.html")
            f19("Key link copied to clipboard", v8.PRIMARY, 2)
          else
            f19("Clipboard not supported on this executor", v8.WARNING, 3)
          end

          task.wait(2)
          f30(true)
        end)

        discordButton.MouseButton1Click:Connect(function()
          if v33 then
            return
          end

          f30(false)

          if setclipboard then
            setclipboard("https://neoxsoftworks.eu/discord")
            f19("Discord invite copied to clipboard", v8.DISCORD, 2)
          else
            f19("Clipboard not supported on this executor", v8.WARNING, 3)
          end

          task.wait(2)
          f30(true)
        end)

        buyButton.MouseButton1Click:Connect(function()
          if v33 then
            return
          end

          f30(false)

          if setclipboard then
            setclipboard("https://neoxsoftworks.eu/getneox.html")
            f19("Premium link copied to clipboard", v8.PREMIUM, 3)
          else
            f19("Clipboard not supported on this executor", v8.WARNING, 3)
          end

          task.wait(3)
          f30(true)
        end)

        verifyButton.MouseButton1Click:Connect(function() f34() end)

        redeemCopyBtn.MouseButton1Click:Connect(function()
          if setclipboard then
            setclipboard("https://neoxsoftworks.eu/userportal")
            local text4 = redeemCopyBtn.Text
            redeemCopyBtn.Text = "Copied!"
            task.wait(1.5)

            if redeemPromptFrame.Visible then
              redeemCopyBtn.Text = text4
            end
          end
        end)

        redeemCheckBtn.MouseButton1Click:Connect(function()
          if not v32 or v33 then
            return
          else
            v33 = true
            redeemCheckBtn.Text = "Checking..."
            local v177 = v32
            local v178, v179 = f31(v177)

            if v178 then
              f17()
              local v180 = writefile and f15(v177)
              local v181, v182 = f21(v178)

              if v181 then
                f26()
                return
              end

              v33 = false
              f30(true)

              f19(
                v182 or "Failed to load. Please try again. (NX-5000)", v8.ERROR, 5, false,
                "Help: Please rejoin the game and try again. Contact support if this continues."
              )

              return
            elseif v179 == "not_redeemed" then
              v33 = false
            else
              v33 = false
              f17()
              f30(true)
            end
          end
        end)

        paidScriptDiscordBtn.MouseButton1Click:Connect(function()
          if setclipboard then
            setclipboard("https://neoxsoftworks.eu/discord")
            local text5 = paidScriptDiscordBtn.Text
            paidScriptDiscordBtn.Text = "Copied!"
            task.wait(1.5)

            if paidScriptPromptFrame.Visible then
              paidScriptDiscordBtn.Text = text5
            end
          end
        end)

        paidScriptWebsiteBtn.MouseButton1Click:Connect(function()
          if setclipboard then
            setclipboard("https://shop.neoxsoftworks.eu")
            local text6 = paidScriptWebsiteBtn.Text
            paidScriptWebsiteBtn.Text = "Copied!"
            task.wait(1.5)

            if paidScriptPromptFrame.Visible then
              paidScriptWebsiteBtn.Text = text6
            end
          end
        end)

        paidScriptEnterKeyBtn.MouseButton1Click:Connect(function()
          f20()
          f30(true)
        end)

        keyInput.FocusLost:Connect(function(p51)
          if p51 and not v33 then
            f34()
          end
        end)

        if userInputService then
          userInputService.InputBegan:Connect(function(input, p52)
            if p52 then
              return
            end

            if input.KeyCode == Enum.KeyCode.Return or input.KeyCode == Enum.KeyCode.KeypadEnter then
              if v27 and v27.Parent and not v33 then
                f34()
              end
            end
          end)
        end

        if v11 and v4.STRICT_ENVIRONMENT then
          f30(false)
          v33 = true

          f19(
            "Nice try.", v8.ERROR, nil, false,
            "Help: This script is protected and dumping it does not work. This attempt has been logged."
          )

          return
        end

        if v11 then
          f19(
            "Environment warning (NX-0101)", v8.WARNING, 5, false,
            "Help: Please close other scripts if verification fails."
          )
        end

        if v30 then
          f30(false)
          v33 = true

          task.spawn(function()
            f19("Loading NEOX HUB...", v8.INFO, nil, true)
            local v183 = false
            local payload, sessionKey

            pcall(function()
              local v184 = v2({
                Url = v4.BASE_URL .. "/api/keyless-payload",
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = httpService:JSONEncode({ script_id = scriptId2 }),
              })

              if v184 and v184.StatusCode == 200 then
                local jsonDecode3 = httpService:JSONDecode(v184.Body)

                if jsonDecode3 and jsonDecode3.success then
                  v183 = true
                  payload = jsonDecode3.payload
                  sessionKey = jsonDecode3.session_key
                end
              end
            end)

            if not v183 then
              f19(
                "Failed to load. Please rejoin and try again. (NX-6001)", v8.ERROR, 5, false,
                "Help: Please rejoin the game and try again. Contact support if this continues."
              )

              return
            else
              local v185, v186 = f21({ payload = payload, session_key_hex = sessionKey })

              if v185 then
                f26()
                return
              end

              f19(
                v186 or "Failed to load. Please try again. (NX-6002)", v8.ERROR, 5, false,
                "Help: Please rejoin the game and try again. Contact support if this continues."
              )

              return
            end
          end)

          return
        end

        v34 = f42()

        if v34 and v34 ~= "" then
          f30(false)
          v33 = true

          task.spawn(function()
            f19("Verifying key...", v8.INFO, nil, true)
            task.wait(0.5)
            local v187, v188 = f31(v34)

            if v187 then
              local v189, v190 = f21(v187)

              if v189 then
                f26()
                return
              end

              f19(
                v190 or "Failed to load. Please try again. (NX-5000)", v8.ERROR, 5, false,
                "Help: Please rejoin the game and try again. Contact support if this continues."
              )

              task.wait(5)
              v33 = false
              f30(true)
              return
            elseif v188 == "not_redeemed" then
              v33 = false
            elseif v188 == "paid_only" then
              v33 = false
            else
              f19(
                "Saved key expired. Enter new key.", v8.WARNING, 2, false,
                "Help: Your saved key is no longer valid. Get a new key from our website."
              )

              tutorialText.Text = "Saved key expired. Please enter a new key. Press Enter or click Verify to authenticate."
              tutorialText.TextColor3 = v8.WARNING

              keyInput.Text = ""
              task.wait(2)
              v33 = false
              f30(true)
            end
          end)
        elseif v12.paid_only then
          f16(v12.title or name)
        end

        return
      end
    end
  end
end
