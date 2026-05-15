return {
	-- Instalar sonokai
	{
		"sainnhe/sonokai",
		priority = 1000,
		init = function()
			vim.g.sonokai_style = "andromeda"
		end,
	},

	-- Forzar a LazyVim a usarlo por defecto
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "sonokai",
		},
	},
}
