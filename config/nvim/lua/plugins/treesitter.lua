local installed_grammar_list = {
  "bash",
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
}

local plugin = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPost",
  opts = {
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false },
    ensure_installed = installed_grammar_list,
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}

return { plugin }
