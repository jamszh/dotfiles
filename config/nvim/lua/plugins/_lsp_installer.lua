local lsp_installer = require("nvim-lsp-installer")
local lsp_config = require('plugins._lsp_config')

lsp_installer.settings({
  ui = {
    icons = {
    server_installed = "✓",
    server_pending = "➜",
    server_uninstalled = "✗"
    }
  }
})

lsp_installer.on_server_ready(function (server)
  local opts = {}
  opts.on_attach = lsp_config.on_attach

  if server.name == "sumneko_lua" then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = { enable = false },
      }
    }
    server:setup(opts)
  end
end)
