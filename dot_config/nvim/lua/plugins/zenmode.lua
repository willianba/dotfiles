return {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>zm", "<cmd>ZenMode<cr>" },
  },
  config = function()
    require("zen-mode").setup({
      window = {
        backdrop = 1,
      },
    })
  end,
}
