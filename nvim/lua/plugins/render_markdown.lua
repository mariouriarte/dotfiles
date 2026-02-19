return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" }, -- file types to enable for
    config = function()
      require("render-markdown").setup({}) -- empty setup for defaults
    end,
  },
}
