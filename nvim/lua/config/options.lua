-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.path:append("templates/**")

vim.opt.suffixesadd:append(".html.twig")
vim.opt.suffixesadd:append(".twig")

vim.opt.title = true
vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
  callback = function()
    -- Obtiene el nombre del directorio actual (solo la carpeta final)
    local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    vim.opt.titlestring = "    " .. dir_name .. " — nvim"
  end,
})
