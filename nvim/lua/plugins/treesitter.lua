return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "php",
        "python",
        "bash",
        "markdown",
        "markdown_inline",
        "lua",
        "vim",
        "vimdoc", -- Importante para la ayuda de Neovim
        "yaml",
        "sql",
      },
      highlight = {
        enable = true, -- ESTO es lo que activa los colores en el chat
      },
    },
  },
}

-- return {
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		opts = function(_, opts)
-- 			-- Añadimos php y twig a la lista de instalación automática
-- 			if type(opts.ensure_installed) == "table" then
-- 				vim.list_extend(opts.ensure_installed, {
-- 					"php",
-- 					"php_only", -- Opcional: para archivos PHP sin HTML
-- 					"python",
-- 					"typescript",
-- 					"javascript",
-- 					"tsx", -- Si usas React
-- 					"bash",
-- 					"twig",
-- 					"html",
-- 					"css",
-- 					"markdown",
-- 					"markdown_inline",
-- 				})
-- 			end
-- 		end,
-- 	},
-- }

--local spec = {
--  "nvim-treesitter/nvim-treesitter",
--  build = ":TSUpdate",
--  config = function()
--    require("nvim-treesitter.configs").setup({
--      ensure_installed = {
--        -- "bash",
--        "latex",
--        "lua",
--        "vim",
--        "vimdoc",
--      },
--      sync_install = false,
--      auto_install = false,
--      highlight = {
--        enable = true,
--        disable = { "latex" },
--      },
--      indent = {
--        enable = true,
--        disable = { "latex" },
--      },
--    })
--  end,
--}
--return spec
--
