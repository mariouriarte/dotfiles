return {
	-- 1. Configurar ToggleTerm con leader + a
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			-- size = 60,
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.5
				end
			end,
			open_mapping = [[<C-a>]], -- Mapeo principal
			direction = "vertical",
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
		},
		keys = {
			{ "<C-a>", "<cmd>ToggleTerm<cr>", desc = "Terminal IA (Vertical)" },
		},
	},
}
