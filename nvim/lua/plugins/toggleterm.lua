local function toggle_toggleterm()
	if vim.fn.mode():sub(1, 1) == "t" then
		vim.cmd("stopinsert")
	end

	vim.cmd("ToggleTerm")
end

return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = {
			{ "<leader>tt", toggle_toggleterm, mode = { "n", "t" }, desc = "ToggleTerm" },
		},
		opts = {},
	},
}
