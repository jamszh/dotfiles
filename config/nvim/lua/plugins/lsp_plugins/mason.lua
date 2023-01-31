local installed_lsp_list = {
  "lua-language-server",
  "html-lsp",
  "css-lsp",
  "bash-language-server",
  "emmet-ls",
  "clangd",
  "pyright",
  "gopls",
  "svelte-language-server",
  "rust-analyzer",
  "stylua",
  "typescript-language-server",
  "flake8",
  "json-lsp",
}

local plugin = {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = installed_lsp_list
  },
  cmd = "Mason",
  config = function(_, opts)
    require("mason").setup(opts)
    local registry = require("mason-registry")
    for _, tool in ipairs(opts.ensure_installed) do
      local p = registry.get_package(tool)
      if not p:is_installed() then
        p:install()
      end
    end
  end,
}

return plugin
