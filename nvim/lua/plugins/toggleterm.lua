local float_terminal

local function toggle_float_terminal()
	if vim.fn.mode():sub(1, 1) == "t" then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, false, true), "n", false)
	end

	vim.schedule(function()
		local Terminal = require("toggleterm.terminal").Terminal
		float_terminal = float_terminal
			or Terminal:new({
				count = 991,
				direction = "float",
				display_name = " Terminal ",
				hidden = true,
				float_opts = {
					border = "curved",
					title_pos = "center",
					width = function()
						return math.floor(vim.o.columns * 0.85)
					end,
					height = function()
						return math.floor(vim.o.lines * 0.75)
					end,
				},
			})

		float_terminal:toggle()
	end)
end

return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = {
			{ "<C-/>", toggle_float_terminal, mode = { "n", "i", "t" }, desc = "Terminal Flotante" },
			{ "<C-_>", toggle_float_terminal, mode = { "n", "i", "t" }, desc = "Terminal Flotante" },
		},
		config = function()
			require("toggleterm").setup({
				size = 28,
				hide_numbers = true,
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = "float",
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = "curved",
					winblend = 3,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})

			local function set_terminal_keymaps()
				local opts = { noremap = true, buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
				vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
				vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
				vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)
			end

			local term_group = vim.api.nvim_create_augroup("UserToggleTermKeymaps", { clear = true })
			vim.api.nvim_create_autocmd("TermOpen", {
				group = term_group,
				pattern = "term://*",
				callback = set_terminal_keymaps,
			})
		end,
	},
}
