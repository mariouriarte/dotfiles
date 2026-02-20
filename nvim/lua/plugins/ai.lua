return {
  "olimorris/codecompanion.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
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
                  default = "gemini-3-flash",
                },
                thinking_level = {
                  default = "MEDIUM",
                },
              },
            })
          end,
        },
        -- 2. Configuración de Gemini (Google Online)
        -- gemini = require("codecompanion.adapters").extend("gemini", {
        --   env = { api_key = "GEMINI_API_KEY" }, -- Lee la variable de entorno
        --   schema = {
        --     model = { default = "gemini-3-flash" }, -- Flash es ultra rápido y gratis
        --   },
        -- }),
        -- 1. Configuración de Ollama (DeepSeek Local)
        -- ollama = require("codecompanion.adapters").extend("ollama", {
        --   schema = {
        --     model = { default = "deepseek-coder-v2:16b-lite-instruct-q5_K_M" },
        --   },
        -- }),
      },
      interactions = {
        chat = {
          adapter = "gemini",
        },
        inline = {
          adapter = "gemini",
        },
        cmd = {
          adapter = "gemini",
        },
      },
      display = {
        chat = {
          -- Esto es vital para que NO se vean las etiquetas feas
          -- show_settings = false,
          -- render_headers = true,
          -- diff = {
          --   provider = "mini_diff",
          --   enabled = true,
          -- },
        },
      },
      opts = {
        -- Esto hace que los nombres de los roles sean más descriptivos
        -- user_header = "## Usuario",
        -- assistant_header = "## Asistente (IA)",
        -- use_default_actions = true,
        -- use_default_prompts = true,
      },
    })

    -- Atajos de teclado
    vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "IA Chat" })
    vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionActions<cr>", { desc = "IA Acciones" })
    vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

    -- Expand 'cc' into 'CodeCompanion' in the command line
    vim.cmd([[cab cc CodeCompanion]])
  end,
}
