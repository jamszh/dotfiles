local mappings = require("custom.mappings")
local override = require("custom.override")
local M = {}

M.ui = {
  theme = "gruvchad",
}

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
  },
}

M.mappings = mappings

return M
