-- lua/config/lsp/intelephense.lua (or similar)
return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				intelephense = {
					-- Intelephense specific settings
					-- For example, to set the license key (if you have one)
					-- You might want to load this from a secure location like a file
					-- local get_intelephense_license = function ()
					--   local f = assert(io.open(os.getenv("HOME") .. "/intelephense/license.txt", "rb"))
					--   local content = f:read("*a")
					--   f:close()
					--   return string.gsub(content, "%s+", "")
					-- end
					-- settings = {
					--   intelephense = {
					--     licenceKey = get_intelephense_license(), -- if using a license
					--     -- other Intelephense settings
					--   },
					-- },
				},
			},
		},
	},
}
