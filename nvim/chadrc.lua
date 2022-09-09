local M = {}

M.plugins = require("custom.plugins")

M.ui = {
  theme_toggle = { "doomchad", "everforest_light" },
  theme = "everforest_light",
}

M.mappings = require("custom.core.mappings")

return M
