return {
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- Carga el tema antes que otros plugins
    lazy = false, -- No se carga de forma diferida para evitar parpadeos
    config = function()
      require("onedark").setup({
        -- Elige tu estilo: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' o 'light'
        style = "deep",
        transparent = false, -- Fondo transparente
        term_colors = true, -- Colores de terminal
        ending_tildes = false, -- Ocultar tildes al final del buffer
      })
      require("onedark").load()
    end,
  },
}
