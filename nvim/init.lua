-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.o.background = "dark" -- Set Neovim's background to dark
vim.cmd([[colorscheme gruvbox]]) -- Apply the Gruvbox colorscheme
