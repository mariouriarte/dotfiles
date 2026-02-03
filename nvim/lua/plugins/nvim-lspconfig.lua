-- Instala lenguajes LSP
return {
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, {
				-- Python
				"pyright",
				-- PHP
				"intelephense",
				-- JS / TS / CSS / HTML
				"typescript-language-server",
				"css-lsp",
				"html-lsp",
				-- Twig
				"twiggy-language-server",
				-- Bash / Shell
				"bash-language-server",
				"marksman",
			})
		end,
	},
	-- add pyright to lspconfig
	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				-- pyright will be automatically installed with mason and loaded with lspconfig
				pyright = {},
				intelephense = {},
				twiggy_language_server = {},
				html = { filetypes = { "html", "twig" } },
				marksman = {},
				tsserver = {}, -- Para JS y TS
				bashls = {}, -- Para Bash
			},
		},
	},
}
