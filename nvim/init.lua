-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.opt.guifont = "Dank Mono" -- Example with a Nerd Font

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Change $ color for onedark
--vim.cmd("highlight phpVarSelector guifg=#E55561 ctermfg=Red")
--

require("autocommands.bash_template")
require("autocommands.php_template")

-- 1. Configurar opciones de Catppuccin
-- require("catppuccin").setup({
--   flavour = "mocha", -- latte, frappe, macchiato, mocha
--   transparent_background = false,
--   integrations = {
--     treesitter = true,
--     native_lsp = { enabled = true },
--     telescope = { enabled = true },
--   },
-- })
--
-- -- 2. Cargar el esquema de colores
-- vim.cmd.colorscheme("catppuccin")
vim.g.lazyvim_colorscheme = "onedark"
