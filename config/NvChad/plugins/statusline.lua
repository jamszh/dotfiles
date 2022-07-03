local fn = vim.fn
local api = vim.api

local sep_style = {
   default = {
      left = "",
      right = " ",
   },

   round = {
      left = "",
      right = "",
   },

   block = {
      left = "█",
      right = "█",
   },

   arrow = {
      left = "",
      right = "",
   },
}

local user_sep_style = "block"
local sep_l = sep_style[user_sep_style]["left"]
local sep_r = sep_style[user_sep_style]["right"]

local modes = {
   ["n"] = { "NORMAL", "St_NormalMode" },
   ["niI"] = { "NORMAL i", "St_NormalMode" },
   ["niR"] = { "NORMAL r", "St_NormalMode" },
   ["niV"] = { "NORMAL v", "St_NormalMode" },
   ["no"] = { "N-PENDING", "St_NormalMode" },
   ["i"] = { "INSERT", "St_InsertMode" },
   ["ic"] = { "INSERT", "St_InsertMode" },
   ["ix"] = { "INSERT completion", "St_InsertMode" },
   ["t"] = { "TERMINAL", "St_TerminalMode" },
   ["nt"] = { "NTERMINAL", "St_NTerminalMode" },
   ["v"] = { "VISUAL", "St_VisualMode" },
   ["V"] = { "V-LINE", "St_VisualMode" },
   [""] = { "V-BLOCK", "St_VisualMode" },
   ["R"] = { "REPLACE", "St_ReplaceMode" },
   ["Rv"] = { "V-REPLACE", "St_ReplaceMode" },
   ["s"] = { "SELECT", "St_SelectMode" },
   ["S"] = { "S-LINE", "St_SelectMode" },
   [""] = { "S-BLOCK", "St_SelectMode" },
   ["c"] = { "COMMAND", "St_CommandMode" },
   ["cv"] = { "COMMAND", "St_CommandMode" },
   ["ce"] = { "COMMAND", "St_CommandMode" },
   ["r"] = { "PROMPT", "St_ConfirmMode" },
   ["rm"] = { "MORE", "St_ConfirmMode" },
   ["r?"] = { "CONFIRM", "St_ConfirmMode" },
   ["!"] = { "SHELL", "St_TerminalMode" },
}

local M = {}

M.separator_style = "block"
M.config = "%!v:lua.require'custom.plugins.statusline'.run()"

M.mode = function()
   local m = vim.api.nvim_get_mode().mode
   local current_mode = "%#" .. modes[m][2] .. "#" .. "  " .. modes[m][1] .. " "
   local mode_sep1 = "%#" .. modes[m][2] .. "Sep" .. "#" .. " "

   return current_mode .. mode_sep1
end

M.sep_r = function()
  return sep_r
end

M.sep_empty = function()
  return "%#ST_EmptySpace#"
end

M.fileicon = function()
   local icon = "  "

   local filename = fn.fnamemodify(fn.expand "%:t", ":r")
   local extension = fn.expand "%:e"

   if filename ~= "" then
      local devicons_present, devicons = pcall(require, "nvim-web-devicons")

      if devicons_present then
         local ft_icon = devicons.get_icon(filename, extension)
         icon = (ft_icon ~= nil and " " .. ft_icon) or ""
      end
   end

   return "%#St_file_info#" .. icon
end

M.filename = function()
   local filename = fn.fnamemodify(fn.expand "%:t", ":r")

   if filename == "" then
      filename = "Empty "
   else
      filename = " " .. filename .. " "
   end

   return "%#St_file_info#" .. filename .. "%#St_file_sep#"
end

M.git = function()
   if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
      return ""
   end

   local git_status = vim.b.gitsigns_status_dict

   local added = (git_status.added and git_status.added ~= 0) and ("  " .. git_status.added) or ""
   local changed = (git_status.changed and git_status.changed ~= 0) and ("  " .. git_status.changed) or ""
   local removed = (git_status.removed and git_status.removed ~= 0) and ("  " .. git_status.removed) or ""
   local branch_name = "   " .. git_status.head .. " "
   local git_info = branch_name .. added .. changed .. removed

   return "%#St_gitIcons#" .. git_info
end

-- LSP STUFF
M.LSP_progress = function()
   local Lsp = vim.lsp.util.get_progress_messages()[1]

   if vim.o.columns < 120 or not Lsp then
      return ""
   end

   local msg = Lsp.message or ""
   local percentage = Lsp.percentage or 0
   local title = Lsp.title or ""
   local spinners = { "", "" }
   local ms = vim.loop.hrtime() / 1000000
   local frame = math.floor(ms / 120) % #spinners
   local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)

   return ("%#St_LspProgress#" .. content) or ""
end

M.LSP_Diagnostics = function()
   if not #vim.diagnostic.get(0) then
      return ""
   end

   local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
   local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
   local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
   local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

   errors = (errors and errors > 0) and ("%#St_lspError#" .. " " .. errors .. " ") or ""
   warnings = (warnings and warnings > 0) and ("%#St_lspWarning#" .. "  " .. warnings .. " ") or ""
   hints = (hints and hints > 0) and ("%#St_lspHints#" .. "ﯧ " .. hints .. " ") or ""
   info = (info and info > 0) and ("%#St_lspInfo#" .. " " .. info .. " ") or ""

   return errors .. warnings .. hints .. info
end

M.LSP_status = function()
   local clients = vim.lsp.get_active_clients()
   local names = {}
   for _, client in ipairs(clients) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] then
         table.insert(names, client.name)
      end
   end

   local name = false
   if next(names) then
      name = table.concat(names, '|')
   end

   local content = name and "  " .. name .. " " or false
   return content and ("%#St_gitIcons#" .. content) or ""
end

M.cwd = function()
   -- local left_sep = "%#St_cwd_sep#" .. sep_l
   local dir_icon = " "
   local dir_name = "%#St_cwd_text#" .. " " .. fn.fnamemodify(fn.getcwd(), ":t") .. " "
   return (vim.o.columns > 120 and dir_icon .. dir_name) or ""
end

M.cursor_position = function()
   local left_sep = "%#St_pos_sep#" .. sep_l
   local icon = "%#St_pos_icon#" .. " "

   local current_line = fn.line "."
   local total_line = fn.line "$"
   local text = string.format("%-5s", math.modf((current_line / total_line) * 100) .. tostring "%%")

   if current_line == 1 then
      text = "Top "
   elseif current_line == total_line then
      text = "Bot "
   end

   local row, col = unpack(api.nvim_win_get_cursor(0))
   local position = string.format("%3s", row) .. "," .. string.format("%-3s", col) .. " "

   return left_sep .. icon .. "%#St_pos_text#" .. " " .. position .. text
end

M.run = function()
   return table.concat {
      M.mode(),
      M.cwd(),
      M.fileicon(),
      M.filename(),
      M.git(),

      "%=",
      M.LSP_progress(),
      "%=",

      M.LSP_Diagnostics(),
      M.LSP_status(),
      M.cursor_position(),
   }
end

return M
