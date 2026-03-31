-- Treesitter: Resaltado de sintaxis avanzado y análisis de código.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- Plugin para detectar inyecciones de código como SQL en PHP
      "gbprod/php-enhanced-treesitter.nvim",
    },
    opts = {
      ensure_installed = {
        "php",
        "python",
        "bash",
        "markdown",
        "markdown_inline",
        "lua",
        "vim",
        "vimdoc",
        "yaml",
        "sql",
        "javascript",
        "typescript",
        "html",
        "css",
        "twig",
        "json",
      },
      auto_install = true,
      highlight = {
        enable = true, -- ESTO es lo que activa los colores en el chat
      },
    },
  },
}
