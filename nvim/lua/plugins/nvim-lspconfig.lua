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
        phpactor = {
          init_options = {
            ["php_version"] = "7.4",
            ["code_transform.diagnostic_providers"] = {
              "unimported_names",
              "unused_imports",
              -- "undefined_methods", -- Quitamos esto para evitar avisos de métodos mágicos de Doctrine/Symfony
            },
          },
        },
        -- intelephense = {
        --   settings = {
        --     intelephense = {
        --       diagnostics = {
        --         undefinedTypes = false,
        --       },
        --     },
        --   },
        -- },
      },
    },
  },
}
