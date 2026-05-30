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
					section_separators = { left = "", right = "" },
					component_separators = { left = "╱", right = "╱" },
					theme = "sonokai", -- O el tema que estés usando
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {},
					lualine_c = {
						"filename",
						{ "navic", color_correction = "dynamic" },
					},
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				tabline = {
					lualine_a = {
						{
							"buffers",
							mode = 2,
							max_length = vim.o.columns,
							padding = 1,
							component_separators = { left = "│", right = "│" },
							section_separators = { left = "", right = "" },
							buffers_color = {
								active = { fg = "#2c2e34", bg = "#fc5d7c", gui = "bold" },
								inactive = { fg = "#c7c7c7", bg = "#3b3e48" },
							},
							symbols = { modified = " ●", alternate_file = "" },
						},
					},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "branch" },
				},
			}
		end,
	},
}
