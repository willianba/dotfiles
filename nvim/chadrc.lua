local M = {}

M.plugins = require("custom.plugins")

M.ui = {
  theme_toggle = { "doomchad", "everforest_light" },
  theme = "doomchad",
}

M.mappings = require("custom.core.mappings")

return M
