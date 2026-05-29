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
        -- PHP 5.6 no soporta visibilidad en constantes de clase.
        prepend_args = {
          '--rules={"@PSR12": true, "modifier_keywords": {"elements": ["method", "property"]}}',
        },
      },
    },
    -- format_on_save = {
    --   timeout_ms = 1500,
    --   lsp_format = "fallback",
    -- },
  },
}
