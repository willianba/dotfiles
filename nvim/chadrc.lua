local overrides = require("custom.plugins.overrides")

local M = {}

M.plugins = {
  override = {
    ["hrsh7th/nvim-cmp"] = overrides.cmp,
    ["kyazdani42/nvim-tree.lua"] = overrides.nvimtree,
    ["nvim-treesitter/nvim-treesitter"] = overrides.treesitter,
    ["nvim-telescope/telescope.nvim"] = overrides.telescope,
    ["NvChad/nvterm"] = overrides.nvterm,
    ["williamboman/mason.nvim"] = overrides.mason,
  },
  user = require("custom.plugins"),
}

M.ui = {
  theme_toggle = { "doomchad", "everforest_light" },
  theme = "doomchad",
}

M.mappings = require("custom.core.mappings")

return M
