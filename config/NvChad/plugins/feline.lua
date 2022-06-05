local fn = vim.fn
local M = {}

local function get_color(group, attr)
   return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end

M.time = {
  left_sep = {
    str = " ",
    hl = function()
      return {
        fg = get_color("Feline_time", "fg#"),
        bg = get_color("Feline_EmptySpace", "fg#"),
      }
    end,
  },

  icon = {
    str = ' ',
    hl = function()
      return {
        fg = get_color("Feline_time", "bg#"),
        bg = get_color("Feline_EmptySpace", "fg#"),
      }
    end,
  },
  provider = 'position',
}

return M

