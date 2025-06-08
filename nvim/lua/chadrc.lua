-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
}

M.base46 = {
  theme = "kanagawa",
  transparency = false,

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.nvdash = {
--   load_on_startup = true,
  -- buttons = {
  --   { txt = "  Find File", keys = "f", cmd = "Telescope find_files" },
  --   { txt = "  Recent Files", keys = "o", cmd = "Telescope oldfiles" },
  -- },
-- }

return M
