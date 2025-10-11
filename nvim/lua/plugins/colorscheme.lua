--return {
--  -- add gruvbox
--  { "catppuccin/nvim" },
--
--  -- Configure LazyVim to load gruvbox
--  {
--    "LazyVim/LazyVim",
--    opts = {
--      colorscheme = "catppuccin",
--    },
--  },
--}
--

require("tokyonight").setup({
	style = "night", -- Choose your preferred style: "storm", "moon", "night", or "day"
	light_style = "day", -- Style to use when vim.o.background is "light"
	transparent = false, -- Enable transparent background
	terminal_colors = true, -- Enable setting terminal colors
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
	},
	on_colors = function(colors)
		-- You can override individual colors here if needed
		-- colors.bg = "#242424"
	end,
	on_highlights = function(highlights, colors)
		-- You can override highlight groups here
		-- highlights.Normal.fg = colors.fg_dark
	end,
})
