local installed_grammar_list = {
  "bash",
  "css",
  "dockerfile",
  "go",
  "help",
  "html",
  "javascript",
  "lua",
  "python",
  "json",
  "jsonc",
  "jsdoc",
  "markdown",
  "markdown_inline",
  "prisma",
  "svelte",
  "scss",
  "tsx",
  "typescript",
  "regex",
  "vim",
  "yaml",
  "latex",
  "help",
  "thrift",
}

local plugin = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  opts = {
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false },
    ensure_installed = installed_grammar_list,
    ignore_install = { 'help' }
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}

return { plugin }
