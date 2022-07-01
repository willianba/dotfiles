local overrides = require 'custom.plugins.overrides'

local M = {}

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = 'custom.plugins.lspconfig'
    }
  },
  override = {
    ['hrsh7th/nvim-cmp'] = overrides.cmp,
    ['kyazdani42/nvim-tree.lua'] = overrides.nvimtree,
    ['nvim-treesitter/nvim-treesitter'] = overrides.treesitter,
    ['nvim-telescope/telescope.nvim'] = overrides.telescope,
    ['NvChad/nvterm'] = overrides.nvterm
  },
  user = require 'custom.plugins'
}

M.options = {
  user = function()
    require 'custom.core.options'
  end
}

M.ui = {
  theme_toggle = { 'doomchad', 'everforest_light' },
  theme = "doomchad"
}

M.mappings = require 'custom.core.mappings'

return M
