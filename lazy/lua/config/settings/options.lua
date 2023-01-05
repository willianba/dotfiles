local opt = vim.opt

opt.laststatus = 3 -- global statusline

opt.number = true
opt.ruler = false
opt.relativenumber = true
opt.cmdheight = 2
opt.numberwidth = 2

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2 -- it was 0
opt.shiftwidth = 2 -- it was 0
opt.scrolloff = 8
opt.smartindent = true

opt.smartcase = false
opt.ignorecase = true
opt.mouse = "a"

opt.showmode = false
opt.clipboard = "unnamedplus"
opt.cursorline = true

opt.foldmethod = "indent"
opt.foldenable = false

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

opt.list = true
opt.listchars:append("tab:>-")
opt.listchars:append("space:⋅")
opt.listchars:append("trail:-")

opt.fillchars = { eob = " " }

opt.shortmess:append("sI")

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd("filetype plugin indent on")
