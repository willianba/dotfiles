return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = {
          dark = "macchiato",
        },
        no_italic = true,
        no_bold = true,
        term_colors = true,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        dark_variant = "moon", -- main, moon
        disable_italics = true,
      })
    end,
  },
  {
    "neanias/everforest-nvim",
    lazy = true,
    name = "everforest",
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "medium", -- soft, medium, hard
        transparent_background_level = 0, -- 0, 1, 2
      })
    end,
  },
}
