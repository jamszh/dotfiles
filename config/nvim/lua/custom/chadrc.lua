local user_plugins = require("custom.plugins")
local M = {}

M.ui = {
  theme = "gruvchad",
}

M.plugins = {
  install = user_plugins,
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lsp-installer",
    }
  },
}

return M
