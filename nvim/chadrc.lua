local pluginConfigs = require 'custom.plugins.configs'

local M = {}

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = 'custom.plugins.lspconfig'
    }
  },
  override = {
    ['kyazdani42/nvim-tree.lua'] = pluginConfigs.nvimtree,
    ['nvim-treesitter/nvim-treesitter'] = pluginConfigs.treesitter,
    ['nvim-telescope/telescope.nvim'] = pluginConfigs.telescope,
  },
  user = require 'custom.plugins'
}

M.options = {
  user = function()
    require 'custom.core.options'
  end
}

M.ui = {
  theme_toggle = { 'doomchad', 'catppuccin' },
  theme = "doomchad"
}

M.mappings = require 'custom.core.mappings'

return M
