-- this file tracks new and replaced plugins
local configs = require("custom.plugins.configs")

return {
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["williamboman/mason-lspconfig.nvim"] = {
    config = configs.mason_lspconfig,
  },
  ["neovim/nvim-lspconfig"] = {
    after = "mason-lspconfig.nvim",
    config = configs.lspconfig,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = configs.null_ls,
  },
  ["nvim-treesitter/nvim-treesitter-context"] = {
    after = "nvim-treesitter",
    config = configs.ts_context,
  },
  ["natecraddock/workspaces.nvim"] = {
    after = "nvim-treesitter",
    config = configs.workspaces,
  },
  ["p00f/nvim-ts-rainbow"] = {
    after = "nvim-treesitter",
  },
  ["windwp/nvim-ts-autotag"] = {
    after = "nvim-treesitter",
  },
  ["APZelos/blamer.nvim"] = {
    config = configs.blamer,
  },
  ["folke/trouble.nvim"] = {
    config = configs.trouble,
  },
  ["kylechui/nvim-surround"] = {
    config = configs.surround,
  },
  ["github/copilot.vim"] = {
    config = configs.copilot,
  },
  ["karb94/neoscroll.nvim"] = {
    config = configs.neoscroll,
  },
  ["mg979/vim-visual-multi"] = {
    branch = "master",
  },
  ["NvChad/ui"] = {
    commit = "6d18c5482b30bbcb02ac20049f2b0b67be9ea164",
  },
}
