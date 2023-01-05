local autocmd = vim.api.nvim_create_autocmd

autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- set astro filetype for TS to work
autocmd("BufEnter", {
  pattern = "*.astro",
  callback = function()
    vim.opt.filetype = "astro"
  end,
})

-- fix terraform syntax highlighting
autocmd("BufEnter", {
  pattern = "*.tf",
  callback = function()
    vim.opt.filetype = "terraform"
  end,
})

autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    print("⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms")
  end,
})
