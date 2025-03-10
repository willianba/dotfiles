return {
  "olimorris/codecompanion.nvim",
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  event = "BufRead",
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<CR>" },
  },
}
