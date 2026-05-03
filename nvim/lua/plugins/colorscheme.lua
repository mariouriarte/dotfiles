return {
  -- Instalar catppuccin
  {
    "catppuccin/nvim",
    opts = {
      flavour = "mocha",
      transparent_background = true,
      custom_highlights = function()
        return {
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          FloatTitle = { bg = "NONE" },
          TelescopeNormal = { bg = "NONE" },
          TelescopeBorder = { bg = "NONE" },
          NvimTreeNormal = { bg = "NONE" },
          NvimTreeNormalNC = { bg = "NONE" },
        }
      end,
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
