return {
  -- Instalar tokyodark.nvim
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- Puedes añadir opciones aquí, ej: transparent_background = true
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- El setup es opcional pero recomendado
      vim.cmd([[colorscheme tokyodark]])
    end,
  },

  -- Forzar a LazyVim a usarlo por defecto
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyodark",
    },
  },
}
