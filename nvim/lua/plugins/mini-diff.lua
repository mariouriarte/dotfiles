return {
  "nvim-mini/mini.diff",
  event = "VeryLazy",
  config = function()
    require("mini.diff").setup()
    vim.keymap.set("n", "<leader>go", function()
      require("mini.diff").toggle_overlay()
    end, { desc = "Toggle git diff overlay" })
  end,
}
