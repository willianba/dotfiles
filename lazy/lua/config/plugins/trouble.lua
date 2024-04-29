return {
  "folke/trouble.nvim",
  enable = false,
  cmd = { "Trouble", "TroubleToggle" },
  keys = {
    { "<leader>tr", "<cmd>TroubleToggle<cr>" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
