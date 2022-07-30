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

M.nvterm = {
  behavior = {
     close_on_exit = true,
     auto_insert = false,
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "html",
    "cssls",
    "bashls",
    "emmet_ls",
    "tsserver",
    "clangd",
    "pyright",
    "gopls",
    "svelte",
    "rust_analyzer",
  },
}

-- M.lspconfig = {
--   config = function()
--     require "plugins.configs.lspconfig"
--     require "custom.plugins.lspconfig"
--   end,
-- }

M.ui = {
  statusline = {
    separator_style = "block",
    overriden_modules = function()
      return require("custom.plugins.statusline")
    end,
  }
}

M.alpha = {
  header = {
    val = {
      "           ▄ ▄                   ",
      "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄ ",
      "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █ ",
      "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █ ",
      "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█     ",
    },
  },
}

return M
