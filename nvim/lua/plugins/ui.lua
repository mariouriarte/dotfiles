return {
	-- Barra superior: la dibuja Lualine para tener separadores Powerline reales.
	{
		"akinsho/bufferline.nvim",
		enabled = false,
	},

	-- Barra inferior (Lualine)
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return {
				options = {
					always_show_tabline = true,
					theme = "sonokai", -- Usamos explícitamente el tema Sonokai
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				tabline = {
					lualine_a = {
						{
							"buffers",
							mode = 2,
							padding = 1,
							component_separators = { left = "", right = "" },
							section_separators = { left = "", right = "" },
							buffers_color = {
								active = { fg = "#2c2e34", bg = "#fc5d7c", gui = "bold" },
								inactive = { fg = "#c7c7c7", bg = "#3b3e48" },
							},
							symbols = { modified = " +", alternate_file = "" },
						},
					},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
			}
		end,
	},
}
