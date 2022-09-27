local M = {}

M.plugins = require("custom.plugins")

M.ui = {
  theme_toggle = { "catppuccin", "catppuccin_latte" },
  theme = "catppuccin",
}

M.mappings = require("custom.core.mappings")

return M
