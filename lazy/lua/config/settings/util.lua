local M = {}

M.toggle_dark_mode = function()
  local theme_color = vim.o.background == "dark" and "light" or "dark"
  vim.o.background = theme_color
end

M.toggle_theme = function()
  vim.ui.select({ "catppuccin", "rose-pine", "everforest" }, {
    prompt = "Select theme",
  }, function(theme)
    vim.cmd.colorscheme(theme)
    vim.cmd("lua require('lualine').setup({ options = { theme = '" .. theme .. "' } })")
  end)
end

return M
