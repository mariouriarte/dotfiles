vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  pattern = "*.php",
  callback = function()
    -- Solo si el buffer está vacío
    if not (vim.fn.line("$") == 1 and vim.fn.getline(1) == "") then
      return
    end

    -- Obtiene el nombre del archivo sin la extensión
    local filename = vim.fn.expand("%:t:r")
    if filename == "" then
      return
    end

    -- Convierte la primera letra del nombre a mayúscula
    local class_name = filename:sub(1, 1):upper() .. filename:sub(2)

    -- La plantilla de la clase (exactamente como la tenías)
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

    -- Inserta el contenido de forma segura en el buffer 0 (el actual)
    vim.api.nvim_buf_set_lines(0, 0, -1, false, template)

    -- Posiciona el cursor dentro del constructor (Línea 7, Columna 8)
    -- Nota: La API usa base 0 para líneas en set_cursor, por eso restamos 1 o ajustamos
    pcall(vim.api.nvim_win_set_cursor, 0, { 7, 8 })
  end,
})
