local bufferline = require("custom.plugins.bufferline")
local lsp = require("custom.plugins.lsp")
-- local comment = require("custom.plugins.comment")
local M = {}

M.ui = {
  theme = "gruvchad",
}

M.plugins = {
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
    -- comment = comment.mappings,
  }
}

return M
