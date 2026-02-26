return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "gbprod/php-enhanced-treesitter.nvim",
    },
    opts = function(_, opts)
      -- Aseguramos que los parsers necesarios estén instalados
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "php", "sql" })
      end
    end,
  },
}
