local M = {}

M.toggle_dark_mode = function()
  local theme_color = vim.o.background == "dark" and "light" or "dark"
  vim.o.background = theme_color
end

M.toggle_theme = function()
  local theme = vim.ui.select({ "catppuccin", "rose-pine", "everforest" }, {
    prompt = "Select theme",
  }, function(theme)
    vim.cmd.colorscheme(theme)
    vim.cmd("lua require('lualine').setup({ options = { theme = '" .. theme .. "' } })")
  end)
end

-- create function that toggles on and off the diagnostics
M.toggle_diagnostics = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local enabled = vim.diagnostic.get(bufnr)
  if vim.tbl_isempty(enabled) then
    vim.diagnostic.enable(bufnr)
  else
    vim.diagnostic.disable(bufnr)
  end
end

return M
