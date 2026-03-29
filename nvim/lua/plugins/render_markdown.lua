return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- Opcional pero recomendado
		ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
		opts = {
			-- Aquí puedes personalizar para que no sea tan "cargado"
			heading = {
				enabled = true,
				sign = false, -- Quita los iconos de la columna lateral si te molestan
				position = "overlay",
			},
			code = {
				style = "language", -- Solo resalta el lenguaje, evita bordes pesados
			},
			checkbox = {
				enabled = true,
			},
		},
	},
	{
		"HakonHarnes/img-clip.nvim",
		opts = {
			filetypes = {
				codecompanion = {
					prompt_for_file_name = false,
					template = "[Image]($FILE_PATH)",
					use_absolute_path = true,
				},
			},
		},
	},
}
