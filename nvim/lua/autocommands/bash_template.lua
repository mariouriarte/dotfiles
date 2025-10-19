-- Bash files
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.sh",
	callback = function()
		-- Only insert if the buffer is empty
		if not (vim.fn.line("$$") == 1 and vim.fn.getline(1) == "") then
			return
		end

		local template = {
			"#!/bin/bash",
			"",
			"# Your code...",
		}

		vim.fn.setline(1, template)

		-- Posiciona el cursor
		vim.api.nvim_win_set_cursor(0, { 3, 0 })
	end,
})
