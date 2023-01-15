local installed_grammar_list = {
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
  "regex",
  "bash",
  "markdown",
  "markdown_inline",
}

local config = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  opts ={
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false },
    ensure_installed = installed_grammar_list,
  }
}

return { config }
