-- Mason: Gestor de instalación para LSP, linters y formateadores.
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "basedpyright",
        "typescript-language-server",
        "css-lsp",
        "html-lsp",
        "twiggy-language-server",
        "bash-language-server",
        "marksman",
        "intelephense",
        "json-lsp",
        "lua-language-server",
        "ruff",
        "php-cs-fixer",
      })
    end,
  },
}
