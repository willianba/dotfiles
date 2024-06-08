return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
    })
  end,
  keys = {
    { "<C-n>", "<cmd>Oil<cr>" },
  },
}
