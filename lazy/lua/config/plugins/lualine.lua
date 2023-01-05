return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "kyazdani42/nvim-web-devicons" },
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = vim.g.colors_name,
        section_separators = { left = " ", right = " " },
        component_separators = { left = " ", right = " " },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename" },
        lualine_c = { "branch", "diff" },
        lualine_x = { "diagnostics", "filetype" },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
    })
  end,
}
