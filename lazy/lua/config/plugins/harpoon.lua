return {
  "ThePrimeagen/harpoon",
  event = "BufReadPre",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  cmd = { "Harpoon" },
  config = true,
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon.mark").add_file()
      end,
    },
    {
      "<leader>h",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
    },
    {
      "<M-j>",
      function()
        require("harpoon.ui").nav_next()
      end,
    },
    {
      "<M-k>",
      function()
        require("harpoon.ui").nav_prev()
      end,
    },
  },
}
