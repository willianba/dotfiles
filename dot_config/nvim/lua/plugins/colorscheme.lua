local function select_theme()
  local process = io.popen("uname -a")
  local sys_arch = process:read("*a")
  process:close()

  local hour = tonumber(os.date("%H"))

  if hour >= 8 and hour < 18 then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end

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
      select_theme()
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
