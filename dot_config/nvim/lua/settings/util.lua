local M = {}

local function refresh_lualine(theme)
  local ok, lualine = pcall(require, "lualine")
  if not ok then
    return
  end

  local config = lualine.get_config()
  config.options = vim.tbl_deep_extend("force", config.options or {}, { theme = theme })
  lualine.setup(config)
end

M.toggle_autoformat = function()
  local autoformat = vim.g.disable_autoformat

  if not autoformat then
    vim.cmd("FormatDisable")
  else
    vim.cmd("FormatEnable")
  end
  vim.notify(autoformat and "Enabled format on save" or "Disabled format on save")
end

M.toggle_dark_mode = function()
  local theme_color = vim.o.background == "dark" and "light" or "dark"
  vim.o.background = theme_color
  -- Refresh lualine to update its theme
  refresh_lualine(vim.g.colors_name)
end

M.disable_diagnostics = function()
  vim.diagnostic.enable(false)
  vim.notify("Disabled diagnostics")
end

M.enable_diagnostics = function()
  vim.diagnostic.enable(true)
  vim.notify("Enabled diagnostics")
end

M.toggle_theme = function()
  vim.ui.select({ "catppuccin", "rose-pine", "everforest" }, {
    prompt = "Select theme",
  }, function(theme)
    if not theme then
      return
    end

    vim.cmd.colorscheme(theme)
    refresh_lualine(theme)
  end)
end

return M
