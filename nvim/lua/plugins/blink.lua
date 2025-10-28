-- Plugin de autocompletado
return {
	"saghen/blink.cmp",
	opts = function(_, opts)
		-- Desactivar la aparición automática del menú de completado.
		opts.completion = vim.tbl_deep_extend("force", opts.completion or {}, {
			menu = {
				auto_show = true,
			},
			documentation = {
				auto_show = true,
			},
			ghost_text = {
				enabled = false,
			},
		})

		-- Desactivar la ayuda de firma experimental que también puede ser intrusiva.
		opts.signature = {
			enabled = true,
		}

		-- Definir los atajos de teclado para mostrar el menú de forma manual.
		-- Aquí se usa <C-space> (Ctrl + barra espaciadora) para invocarlo.
		-- Puedes cambiarlo a tu gusto.
		opts.keymap = vim.tbl_deep_extend("force", opts.keymap or {}, {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		})

		return opts
	end,
}
