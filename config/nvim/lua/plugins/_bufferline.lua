vim.opt.termguicolors = true

local diagnostics_indicator = function(count, level, diagnostics_dict, context)
  local s = " "
  for e, n in pairs(diagnostics_dict) do
    local sym = e == "error" and " "
      or (e == "warning" and " " or "ⓘ" )
    s = s .. n .. sym
  end
  return s
end

local numbers = function(opts)
  return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
end

require("bufferline").setup{
  options = {
    mode = "buffers",
    separator_style = "thin",
    show_buffer_close_icons = false,
    show_close_icon = false,
    -- diagnostics = "nvim_lsp",
    -- diagnostics_indicator = diagnostics_indicator,
    numbers = numbers,
    offsets = {
      {
        filetype = "NvimTree",
        highlight = "Directory",
        text = "File Explorer",
        text_align = "left",
      }
    }
  },
  highlights = {
    buffer_selected = {
      gui = "bold"
    }

  }
}
