-- LSP Config: Configuración y conexión de los servidores de lenguaje.
return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- es la Pyright, analizador de typos
        basedpyright = {
          on_attach = function(client, bufnr)
            if client.server_capabilities.inlayHintProvider then
              vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
          end,
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
                autoSearchPaths = true,
                inlayHints = {
                  callArgumentNames = true,
                  functionReturnTypes = true,
                },
                diagnosticSeverityOverrides = {
                  reportUnusedImport = "none",
                  reportUnusedVariable = "none",
                  reportMissingImports = "none",
                  reportUnresolvedImport = "none",
                  reportDuplicateImport = "none",
                },
              },
            },
          },
        },
        -- Ruff es para verificar python linter y formateador
        ruff = {
          on_attach = function(client, _)
            -- Deshabilitamos el hover de Ruff a favor de Pyright
            client.server_capabilities.hoverProvider = false
          end,
        },
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
          on_attach = function(client, _)
            -- Deshabilitamos funciones que ya cubre Intelephense para evitar duplicados
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.completionProvider = false
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
            client.server_capabilities.diagnosticProvider = nil
          end,
          init_options = {
            ["code_transform.diagnostic_providers"] = {
              "unimported_names",
              "unused_imports",
              -- "undefined_methods", -- Quitamos esto para evitar avisos de métodos mágicos de Doctrine/Symfony
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
