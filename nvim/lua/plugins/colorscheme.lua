return {
  -- Instalar catppuccin
  {
    "catppuccin/nvim",
    opts = {
      flavour = "mocha",
      transparent_background = false,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd([[colorscheme catppuccin]])
    end,
  },

  -- Forzar a LazyVim a usarlo por defecto
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
