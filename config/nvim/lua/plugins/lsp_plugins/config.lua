local on_attach = require("plugins.config.lsp").on_attach
local capabilities = require("plugins.config.lsp").capabilities

local servers = {
  html = {},
  cssls = {},
  bashls = {},
  emmet_ls = {},
  tsserver = {},
  clangd = {},
  pyright = {},
  gopls = {},
  svelte = {},
  rust_analyzer = {},
 -- "html",
 -- "cssls",
 -- "bashls",
 -- "emmet_ls",
 -- "tsserver",
 -- "clangd",
 -- "pyright",
 -- "gopls",
 -- "svelte",
 -- "rust_analyzer",
}

local config = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  opts = {
    servers = servers,
    setup = {},
  },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function(_, opts)
    servers = opts.servers
    require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
    require("mason-lspconfig").setup_handlers({
      function(server)
        local server_opts = servers[server] or {}
        server_opts.capabilities = capabilities
        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end,
    })

  end,
}

return config
