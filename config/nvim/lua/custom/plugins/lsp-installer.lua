local M = {}

M.setup_lsp = function(attach, capabilities)
  local lsp_installer = require("nvim-lsp-installer")

  lsp_installer.settings({
    ui = {
      icons = {
      server_installed = "﫟",
      server_pending = "",
      server_uninstalled = "✗"
      }
    }
  })

  lsp_installer.on_server_ready(function (server)
    local opts = {}

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
    end

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
  end)
end

return M
