return {
  cwd = function()
    return ""
  end,

  LSP_status = function()
    if rawget(vim, "lsp") then
      for _, client in ipairs(vim.lsp.get_active_clients()) do
        if client.attached_buffers[vim.api.nvim_get_current_buf()] then
          return (vim.o.columns > 100 and "%#St_LspStatus#" .. " [" .. client.name .. "]  ") or "  "
        end
      end
    end
  end,

  cursor_position = function()
   local left_sep = "%#St_pos_sep#" .. "█"
   local icon = "%#St_pos_icon#" .. " "

   local current_line = vim.fn.line "."
   local total_line = vim.fn.line "$"
   local text = string.format("%-5s", math.modf((current_line / total_line) * 100) .. tostring "%%")

   if current_line == 1 then
      text = "Top "
   elseif current_line == total_line then
      text = "Bot "
   end

   local row, col = unpack(vim.api.nvim_win_get_cursor(0))
   local position = string.format("%3s", row) .. "," .. string.format("%-3s", col) .. " "

   return left_sep .. icon .. "%#St_pos_text#" .. " " .. position .. text
  end,
}

