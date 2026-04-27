-- formateador de codigo
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      php = { "php_cs_fixer" },
      ["*"] = { "trim_whitespace", "trim_newlines" },
    },
    formatters = {
      php_cs_fixer = {
        -- php-cs-fixer no tiene un flag de longitud de línea directo,
        -- pero PSR12 aplica el estándar recomendado de 120 columnas.
        prepend_args = { "--rules=@PSR12" },
      },
    },
    -- format_on_save = {
    --   timeout_ms = 1500,
    --   lsp_format = "fallback",
    -- },
  },
}
