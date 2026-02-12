-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Comentar linea o seleccion con control + shift + /
vim.keymap.set("n", "<C-S-/>", "gcc", { remap = true })
vim.keymap.set("v", "<C-S-/>", "gc", { remap = true })

-- Cerrar buffer actual con Alt + w
-- Usamos Snacks.bufdelete() porque es el estándar de LazyVim para no romper el layout
vim.keymap.set("n", "<M-w>", function()
	Snacks.bufdelete()
end, { desc = "Cerrar Buffer (Alt+w)" })
