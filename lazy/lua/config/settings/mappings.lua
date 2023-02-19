local util = require("config.settings.util")

vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>")
vim.keymap.set("n", "<C-c>", "<cmd>%y+<cr>")
vim.keymap.set("n", "<leader>b", "<cmd>enew<cr>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("i", "jk", "<ESC>")

vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>tt", util.toggle_dark_mode)
vim.keymap.set("n", "<leader>ct", util.toggle_theme)
vim.keymap.set("n", "<leader>dd", vim.diagnostic.disable)
vim.keymap.set("n", "<leader>ed", vim.diagnostic.enable)

vim.keymap.set("n", "<leader>x", "<cmd>bd<cr>")
vim.keymap.set("n", "<leader>X", "<cmd>%bd | e#<cr>")

vim.keymap.set("x", "<leader>p", '"_dP')
