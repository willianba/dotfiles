local function cwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "kyazdani42/nvim-web-devicons" },
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = vim.g.colors_name,
        component_separators = "|",
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" } } },
        lualine_b = { { "filetype", icon_only = true, padding = { left = 1, right = 0 }, separator = {} }, "filename" },
        lualine_c = { "branch", "diff" },
        lualine_x = { "diagnostics", cwd },
        lualine_y = { { "location", padding = 0 } },
        lualine_z = { { "progress", separator = { right = "" } } },
      },
    })
  end,
}
