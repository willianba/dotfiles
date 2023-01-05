local opt = vim.opt

opt.relativenumber = true
opt.cmdheight = 2
opt.numberwidth = 2

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 0
opt.shiftwidth = 0

opt.scrolloff = 8

opt.smartcase = false

opt.cursorline = true

opt.foldmethod = "indent"
opt.foldenable = false

opt.list = true
opt.listchars:append("tab:>-")
opt.listchars:append("space:⋅")
opt.listchars:append("trail:-")

vim.cmd("filetype plugin indent on")
