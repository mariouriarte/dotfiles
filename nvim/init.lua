-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.guifont = "Dank Mono" -- Example with a Nerd Font

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Change $ color for onedark
--vim.cmd("highlight phpVarSelector guifg=#E55561 ctermfg=Red")
