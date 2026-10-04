-- Kick a Lucky Block — ReefHub loader
-- Baseline loader saved for compatibility testing.
-- Source reference verified from ScriptBlox on 2026-10-04.

local SOURCE_URL = "https://pastefy.app/idKSonlX/raw"

local ok, err = pcall(function()
    local source = game:HttpGet(SOURCE_URL)
    local fn, compileErr = loadstring(source)

    if not fn then
        error("Failed to compile remote source: " .. tostring(compileErr))
    end

    fn()
end)

if not ok then
    warn("[Kick a Lucky Block] Loader error: " .. tostring(err))
end
