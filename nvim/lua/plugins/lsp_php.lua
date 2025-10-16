require("lspconfig").intelephense.setup({
	settings = {
		intelephense = {
			diagnostics = {
				undefinedTypes = false,
			},
		},
	},
})
