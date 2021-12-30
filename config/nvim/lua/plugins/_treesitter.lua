local treesitter_config = require "nvim-treesitter.configs"

treesitter_config.setup {
  ensure_installed = {
    "c",
    "css",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "svelte",
    "typescript",
    "tsx",
    "yaml",
  },
  highlight = { enable = true },
  indent = { enable = false },
  lsp_interop = { enable = true },
}

