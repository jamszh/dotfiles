local modes = require("lib.vim-mode")
local icons = require("lib.icons")

local M = {}

-- Mode
M.mode_indicator = {
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
    return "  %2("..self.mode_names[self.mode].."%)"
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = self.mode_colors[mode], bold = true }
  end,
  update = {
    "ModeChanged"
  },
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
    if not conditions.width_percent_below(#filename, 0.25) then
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
    provider = "",
    hl = { fg = "orange" },
  }
}

local file_name_modifier = {
  hl = function()
    if vim.bo.modified then
      return { fg = "cyan", bold = true, force=true }
    end
  end,
}

M.build_file_block = function()
  local utils = require("heirline.utils")
  local result = utils.insert(file_name_block,
    file_icon,
    utils.insert(file_name_modifier, file_name),
    file_flags,
    { provider = "%<" }
  )
  return result
end

return M
