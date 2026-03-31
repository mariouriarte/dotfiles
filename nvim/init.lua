-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.guifont = "Dank Mono" -- Example with a Nerd Font

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

require("autocommands.bash_template")
require("autocommands.php_template")

vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

-- vim.opt.spell = true
-- vim.opt.spelllang = { "es", "en" }
