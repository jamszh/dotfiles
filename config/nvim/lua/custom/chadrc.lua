local bufferline = require("custom.plugins.bufferline")
local lsp = require("custom.plugins.lsp")
local user_plugins = require("custom.plugins")
local M = {}

M.ui = {
  theme = "gruvchad",
}

M.plugins = {
  install = user_plugins,
  -- LSP
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lsp-installer",
    }
  },

  -- plugin override
  default_plugin_config_replace = {
    bufferline = bufferline,
  }
}

M.mappings = {
  plugins = {
    lspconfig = lsp.mappings,
  }
}

return M
