local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local user_autocmds = augroup("user_autocmds", { clear = true })

autocmd("InsertEnter", {
  group = user_autocmds,
  callback = function()
    vim.wo.relativenumber = false
  end,
})

autocmd("InsertLeave", {
  group = user_autocmds,
  callback = function()
    vim.wo.relativenumber = vim.wo.number
  end,
})

-- fix terraform syntax highlighting
autocmd("BufEnter", {
  group = user_autocmds,
  pattern = "*.tf",
  callback = function()
    vim.bo.filetype = "terraform"
  end,
})

autocmd("VimResized", {
  group = user_autocmds,
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd("User", {
  group = user_autocmds,
  pattern = "LazyVimStarted",
  callback = function()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    print("⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms")
  end,
})
