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

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.formatting_sync()
  end,
})

-- set astro filetype for TS to work
autocmd("BufEnter", {
  pattern = "*.astro",
  callback = function()
    vim.opt.filetype = "astro"
  end,
})
