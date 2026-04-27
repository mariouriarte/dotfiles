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

vim.api.nvim_create_user_command("LspForceRestart", function()
  local clients = vim.lsp.get_clients()
  if #clients == 0 then
    vim.notify("No active LSP clients to restart", vim.log.levels.WARN)
    return
  end

  vim.lsp.stop_client(clients, true)

  -- Wait briefly for clients to stop, then reload the buffer
  vim.defer_fn(function()
    vim.cmd("edit")
    vim.notify("LSP restarted successfully", vim.log.levels.INFO)
  end, 500)
end, { desc = "Force restart all active LSP clients" })

vim.opt.spell = false
vim.opt.spelllang = { "es", "en" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "gitcommit", "codecompanion" },
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.list = false
  end,
})
