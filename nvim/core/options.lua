local opt = vim.opt

opt.cmdheight = 2
opt.relativenumber = true
opt.numberwidth = 2

opt.smarttab = true
opt.softtabstop = 2
opt.tabstop = 2

opt.scrolloff = 8

opt.smartcase = false

opt.foldmethod = "indent"
opt.foldenable = false

opt.list = true
opt.listchars:append("tab:>-")
opt.listchars:append("space:⋅")
opt.listchars:append("trail:-")

vim.cmd("filetype plugin indent on")
