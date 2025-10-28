-- Treesitter analiza y entiende la esturctura del codigo fuente
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		--config = function()
		--  require("nvim-treesitter.configs").setup({})
		--end,
	},
}

--local spec = {
--  "nvim-treesitter/nvim-treesitter",
--  build = ":TSUpdate",
--  config = function()
--    require("nvim-treesitter.configs").setup({
--      ensure_installed = {
--        -- "bash",
--        "latex",
--        "lua",
--        "vim",
--        "vimdoc",
--      },
--      sync_install = false,
--      auto_install = false,
--      highlight = {
--        enable = true,
--        disable = { "latex" },
--      },
--      indent = {
--        enable = true,
--        disable = { "latex" },
--      },
--    })
--  end,
--}
--return spec
--
