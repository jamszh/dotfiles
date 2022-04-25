local M = {}

local options = {
  numbers = function(opts)
    return string.format('%s·', opts.raise(opts.id))
  end,
  separator_style = "slant",
  show_close_icon = false,
}

M.options = options

return M
