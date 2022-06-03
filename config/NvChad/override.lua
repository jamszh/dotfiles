local M = {}

M.treesitter = {
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
}

return M
