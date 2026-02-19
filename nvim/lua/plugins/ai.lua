return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("codecompanion").setup({
      display = {
        chat = {
          -- Esto es vital para que NO se vean las etiquetas feas
          show_settings = false,
          render_headers = true,
          diff = { enabled = true },
          -- window = {
          --   layout = "float",
          --   border = "rounded",
          -- },
        },
      },
      opts = {
        -- Esto hace que los nombres de los roles sean más descriptivos
        -- user_header = "## Usuario",
        -- assistant_header = "## Asistente (IA)",
        use_default_actions = true,
        use_default_prompts = true,
      },
      strategies = {
        chat = {
          adapter = "ollama",
          variables = {
            ["buffer"] = {
              callback = "helpers.variables.buffer",
              -- Aquí forzamos que use el icono del archivo
              opts = { contains_code = true },
            },
          },
        },
      },
      -- Definimos qué usar por defecto
      adapters = {
        -- 1. Configuración de Ollama (DeepSeek Local)
        ollama = require("codecompanion.adapters").extend("ollama", {
          schema = {
            model = { default = "deepseek-coder-v2:16b-lite-instruct-q5_K_M" },
          },
        }),
        -- 2. Configuración de Gemini (Google Online)
        gemini = require("codecompanion.adapters").extend("gemini", {
          env = { api_key = "GEMINI_API_KEY" }, -- Lee la variable de entorno
          schema = {
            model = { default = "gemini-1.5-flash" }, -- Flash es ultra rápido y gratis
          },
        }),
      },
    })

    -- Atajos de teclado
    vim.keymap.set({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "IA Chat" })
    vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionActions<cr>", { desc = "IA Acciones" })
  end,
}

-- return {
--   "olimorris/codecompanion.nvim",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-treesitter/nvim-treesitter",
--     "hrsh7th/nvim-cmp", -- Opcional: para autocompletado
--   },
--   config = function()
--     require("codecompanion").setup({
--       strategies = {
--         chat = { adapter = "ollama" },
--         inline = { adapter = "ollama" },
--         agent = { adapter = "ollama" },
--       },
--       adapters = {
--         ollama = require("codecompanion.adapters").extend("ollama", {
--           schema = {
--             model = {
--               default = "deepseek-coder-v2:16b-lite-instruct-q5_K_M",
--             },
--           },
--         }),
--       },
--     })
--
--     -- Atajos de teclado recomendados
--     vim.api.nvim_set_keymap("n", "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
--     vim.api.nvim_set_keymap("v", "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
--     vim.api.nvim_set_keymap("n", "<leader>ac", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true })
--     vim.api.nvim_set_keymap("v", "<leader>ae", "<cmd>CodeCompanion /explain<cr>", { noremap = true, silent = true })
--   end,
-- }
