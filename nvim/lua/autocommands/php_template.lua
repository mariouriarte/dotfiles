vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.php",
	callback = function()
		-- Solo si el buffer está vacío
		if not (vim.fn.line("$") == 1 and vim.fn.getline(1) == "") then
			return
		end

		-- Obtiene el nombre del archivo sin la extensión
		local filename = vim.fn.expand("%:t:r")

		-- Convierte la primera letra del nombre a mayúscula para el nombre de la clase
		local class_name = filename:sub(1, 1):upper() .. filename:sub(2)

		-- La plantilla de la clase
		local template = {
			"<?php",
			"",
			"class " .. class_name,
			"{",
			"    public function __construct()",
			"    {",
			"        // code ...",
			"    }",
			"}",
		}

		-- Inserta el contenido en el buffer
		vim.fn.setline(1, template)

		-- Posiciona el cursor dentro de la clase para empezar a escribir
		local class_line = vim.fn.search("class " .. class_name)
		if class_line then
			vim.api.nvim_win_set_cursor(0, { class_line + 2, 8 })
		end
	end,
})
