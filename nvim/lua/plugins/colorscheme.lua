return {
  -- Instalar sonokai
  {
    "sainnhe/sonokai",
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.g.sonokai_style = "shusia"
      vim.cmd.colorscheme("sonokai")
    end,
  },

  -- Forzar a LazyVim a usarlo por defecto
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "sonokai",
    },
  },
}
