-- local statusline = require("custom.plugins.statusline")
local M = {}

M.treesitter = {
  indent = {
    enable = true
  },
  ensure_installed = {
    "lua",
    "vim",
    "typescript",
    "javascript",
    "python",
    "go",
    "dockerfile",
    "jsonc",
    "jsdoc",
    "prisma",
    "svelte",
    "scss",
    "tsx",
  },
}

M.nvimtree = {
  git = { enable = true },
  renderer = {
    highlight_git = true,
    icons = {
      show = { git = true },
    },
  },
  view = {
    side = "left",
    width = 40,
  }
}

-- M.statusline = statusline
return M
