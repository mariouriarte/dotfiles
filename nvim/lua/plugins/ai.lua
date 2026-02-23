return {
  "olimorris/codecompanion.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- "nvim-tree/nvim-web-devicons",
    -- "stevearc/dressing.nvim",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        http = {
          gemini = function()
            return require("codecompanion.adapters").extend("gemini", {
              env = {
                api_key = "GEMINI_API_KEY",
              },
              schema = {
                model = {
                  order = 1,
                  -- default = "gemini-2.5-flash",
                  default = "gemini-3-flash-preview",
                },
                thinking_level = {
                  default = "MEDIUM",
                },
              },
            })
          end,
          opts = {
            show_presets = false,
          },
        },
        -- ollama = require("codecompanion.adapters").extend("ollama", {
        --   schema = {
        --     model = { default = "deepseek-coder-v2:16b-lite-instruct-q5_K_M" },
        --   },
        -- }),
      },
      interactions = {
        chat = {
          adapter = "gemini",
          roles = {
            user = "Mario",
          },
          keymaps = {
            completion = {
              modes = { i = "<C-m>" },
              index = 1,
              callback = "keymaps.completion",
              description = "[Chat] Completion menu",
            },
          },
        },
        inline = {
          adapter = "gemini",
        },
        cmd = {
          adapter = "gemini",
        },
      },
      display = {
        action_palette = {
          width = 95,
          height = 10,
          prompt = "Prompt ", -- Prompt used for interactive LLM calls
          provider = "default", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
          opts = {
            show_preset_actions = true, -- Show the preset actions in the action palette?
            show_preset_prompts = true, -- Show the preset prompts in the action palette?
            title = "CodeCompanion actions", -- The title of the action palette
          },
        },
        chat = {
          -- Esto es vital para que NO se vean las etiquetas feas
          -- show_settings = false,
          -- render_headers = true,
          diff = {
            provider = "mini_diff",
            enabled = true,
          },
        },
        diff = {
          provider = "default", -- O "default" / "virt-diff"
        },
      },
      opts = {
        log_level = "DEBUG",
      },
    })

    -- -- Atajos de teclado
    -- vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "IA Chat" })
    -- vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionActions<cr>", { desc = "IA Acciones" })
    -- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
    --
    -- -- Expand 'cc' into 'CodeCompanion' in the command line
    -- vim.cmd([[cab cc CodeCompanion]])
    --
    --  back
    -- IA Chat (Toggle)
    vim.keymap.set(
      { "n", "v" },
      "<leader>a",
      "<cmd>CodeCompanionChat Toggle<cr>",
      { desc = "IA Chat", noremap = true, silent = true }
    )
    -- Menú de acciones generales (Explicar, optimizar, etc.)
    vim.keymap.set(
      { "n", "v" },
      "<C-a>",
      "<cmd>CodeCompanionActions<cr>",
      { desc = "IA Acciones", noremap = true, silent = true }
    )

    -- Para añadir código seleccionado al chat sin conflictos
    vim.keymap.set(
      "v",
      "<leader>ga",
      "<cmd>CodeCompanionChat Add<cr>",
      { desc = "Add to Chat", noremap = true, silent = true }
    )

    -- Expandir 'cc' en la línea de comandos
    vim.cmd([[cab cc CodeCompanion]])

    -- ****
    -- vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    -- vim.keymap.set(
    --   { "n", "v" },
    --   "<LocalLeader>a",
    --   "<cmd>CodeCompanionChat Toggle<cr>",
    --   { noremap = true, silent = true }
    -- )
    -- vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
    --
    -- -- Expand 'cc' into 'CodeCompanion' in the command line
    -- vim.cmd([[cab cc CodeCompanion]])
  end,
}
