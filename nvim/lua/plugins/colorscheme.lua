-- navarasu/onedark
return {
	-- Using Lazy
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "cool",
				transparent = true,
				code_style = {
					comments = "italic",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},
				--colors = {
				--	comment_gray = "#9198A1",
				--},
				--highlights = {
				--	["@comment"] = { fg = "$comment_gray" },
				--},
			})
			-- Enable theme
			require("onedark").load()
		end,
	},
}

-- tokyonight
--return {
--	{
--		"folke/tokyonight.nvim",
--		lazy = false,
--		priority = 1000,
--		opts = {},
--		config = function()
--			require("tokyonight").setup({
--				-- use the night style
--				style = "night",
--				-- disable italic for functions
--				styles = {
--					functions = {},
--				},
--				-- Change the "hint" color to the "orange" color, and make the "error" color bright red
--				on_colors = function(colors)
--					colors.hint = colors.orange
--					colors.error = "#ff0000"
--				end,
--			})
--		end,
--	},
--}
