vim.opt.termguicolors = true

local numbers = function(opts)
  return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
end

local filter = function(buf_number)
  local present_type, type = pcall(function()
    return vim.api.nvim.buf_get_var(buf_number, "term_type")
  end)
  if present_type then
    if type == "vert" or type == "hori" then
      return false
    end
    return true
  end
  return true
end

require("bufferline").setup{
  options = {
    mode = "buffers",
    separator_style = "thin",
    show_buffer_close_icons = false,
    view = "multiwindow",
    show_close_icon = false,
    diagnostics = false,
    numbers = numbers,
    enforce_regular_tabs = false,
    custom_filter = filter,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        padding = 1,
      }
    }
  },
  highlights = {
    buffer_selected = {
      gui = "bold"
    }

  }
}
