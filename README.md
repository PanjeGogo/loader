# Loader

Named game-file loader for supported Roblox experiences.

## Load

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/PanjeGogo/loader/main/src/loader.lua"))()
```

## Structure

- `src/loader.lua` — detects the current PlaceId and resolves it to a named game file.
- `src/prospecting.lua` — Prospecting module.
- `src/utils/TaskManager.lua` — shared prerequisite.
- `src/utils/ShoppingMart.lua` — shared prerequisite.

## Game mapping

- Prospecting — PlaceId `129827112113663` → `src/prospecting.lua`

To add another supported game, add its PlaceId and filename to the `MAPS` table in `src/loader.lua`.
