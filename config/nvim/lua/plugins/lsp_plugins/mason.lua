local installed_lsp_list = {
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
}

local config = {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = installed_lsp_list
  },
  cmd = "Mason",
}

return config
