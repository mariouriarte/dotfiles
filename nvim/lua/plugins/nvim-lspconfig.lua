-- LSP Config: Configuración y conexión de los servidores de lenguaje.
return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {},
        twiggy_language_server = {},
        html = { filetypes = { "html", "twig" } },
        marksman = {},
        ts_ls = {}, -- Para JS y TS (nombre actualizado)
        cssls = {}, -- Añadido para CSS
        bashls = {}, -- Para Bash
        jsonls = {}, -- Añadido para JSON
        lua_ls = { -- Añadido para Neovim/Lua
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        intelephense = {
          settings = {
            intelephense = {
              diagnostics = {
                undefinedTypes = false,
              },
            },
          },
        },
      },
    },
  },
}
