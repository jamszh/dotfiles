local modes = require("lib.vim-mode")

local M = {}

-- Alignment components
local space = { provider = " " }
local align = { provider = "%=" }

-- Mode
local mode_indicator = {
  init = function(self)
    self.mode = vim.fn.mode(1)

    if not self.once then
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:*o",
        command = "redrawstatus",
      })
      self.once = true
    end
  end,
  static = {
    mode_names = modes.mode_names,
    mode_colors = modes.mode_colors,
  },
  provider = function(self)
    return " %2("..self.mode_names[self.mode].."%)"
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = self.mode_colors[mode], bold = true }
  end,
  update = {
    "ModeChanged"
  },
}

-- Terminal
local terminal_name = {
    -- we could add a condition to check that buftype == 'terminal'
    -- or we could do that later (see #conditional-statuslines below)
    provider = function()
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
        return " " .. tname
    end,
    hl = { fg = "blue", bold = true },
}

-- Files
local file_name_block = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

local file_icon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end
}

local file_name = {
  provider = function(self)
    local conditions = require("heirline.conditions")
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "[No Name]" end
    if not conditions.width_percent_below(#filename, 0.8) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
}

local file_flags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = "[+]",
    hl = { fg = "green" },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = " ",
    hl = { fg = "orange" },
  }
}

local file_name_modifier = {
  hl = function()
    if vim.bo.modified then
      return { fg = "cyan", bold = true, force = true }
    end
  end,
}

-- Blocks
M.build_file_block = function()
  local utils = require("heirline.utils")
  local conditions = require("heirline.conditions")
  local result = utils.insert(file_name_block,
    align,
    file_icon,
    utils.insert(file_name_modifier, file_name),
    file_flags,
    space
  )
  return {
    condition = function ()
      return conditions.buffer_matches({ buftype = { "" } })
    end,
    result
  }
end

M.build_terminal_block = function()
  local utils = require("heirline.utils")
  local conditions = require("heirline.conditions")
  local block = {
    utils.surround({ "", "" }, utils.get_highlight("DiffDelete").bg, {
      terminal_name,
    }),
  }
  local result = utils.insert(align, block)
  return {
    condition = function ()
      return conditions.buffer_matches({ buftype = { "terminal" } })
    end,
    result
  }
end

-- Ruler
local ruler = {
  -- %l = current line number
  -- %L = number of lines in the buffer
  -- %c = column number
  -- %P = percentage through file of displayed window
  provider = "%7(%l/%3L%):%2c %P"
}

local scroll_bar = {
  static = {
    sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
  },
  provider = function(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local idx = math.floor((curr_line - 1) / lines * #self.sbar) + 1
    return string.rep(self.sbar[idx], 2)
  end,
}

M.build_statuslines = function()
  local conditions = require("heirline.conditions")
  local DEFAULT_STATUS_LINE = { space, mode_indicator, align, ruler, space, scroll_bar }

  local result = {
    hl = function()
      if conditions.is_active() then
        return "StatusLine"
      else
        return "StatusLineNC"
      end
    end,

    fallthrough = false,

    DEFAULT_STATUS_LINE
  }

  return result
end

return M
