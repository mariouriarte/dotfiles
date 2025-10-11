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

--require("tokyonight").setup({
--	style = "night", -- Choose your preferred style: "storm", "moon", "night", or "day"
--	light_style = "day", -- Style to use when vim.o.background is "light"
--	transparent = false, -- Enable transparent background
--	terminal_colors = true, -- Enable setting terminal colors
--	styles = {
--		comments = { italic = true },
--		keywords = { italic = true },
--		functions = {},
--		variables = {},
--	},
--	on_colors = function(colors)
--		-- You can override individual colors here if needed
--		-- colors.bg = "#242424"
--	end,
--	on_highlights = function(highlights, colors)
--		-- You can override highlight groups here
--		-- highlights.Normal.fg = colors.fg_dark
--	end,
--})

-- in your init.lua or a dedicated plugin file
return {
	-- ... other plugins
	{
		"olimorris/onedarkpro.nvim",
		lazy = false, -- Make sure it loads immediately
		priority = 1000, -- Set a high priority to load it early
		config = function()
			vim.cmd("colorscheme onedark")
			-- Optional: Further configuration for the theme
			--require("onedark").setup({
			--	-- your specific options here
			--	style = "warm", -- "dark", "darker", "cool", "deep", "warm", "transparent"
			--	toggle_style_key = "<leader>ts", -- keybind to toggle style or nil
			--	toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "transparent" }, -- list of styles to toggle between
			--	-- ... other settings
			--})
		end,
	},
	-- ... other plugins
}
