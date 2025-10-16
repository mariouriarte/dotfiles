return {
	-- ... other plugins ...
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		--config = function()
		--	require("nvim-treesitter.configs").setup({
		--		highlight = { enable = true },
		--		indent = { enable = true },
		--		-- Add other treesitter configurations here as needed
		--	})
		--end,
	},
	--{
	--	"nvim-treesitter/playground",
	--},
}
