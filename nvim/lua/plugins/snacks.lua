-- Mustra archivos ocultos en el explorer
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true, -- Shows hidden files (e.g., .git, .config)
        --ignored = true, -- Shows files ignored by .gitignore
        exclude = {
          "__init__.py",
          "__pycache__",
        },
      },
      sources = {
        explorer = {
          hidden = true,
          exclude = {
            "__init__.py",
            "__pycache__",
          },
        },
      },
    },
  },
}
