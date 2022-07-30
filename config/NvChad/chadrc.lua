local mappings = require("custom.mappings")
local override = require("custom.override")

local M = {}

M.ui = {
  theme = "gruvchad",
}

M.plugins = {
  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["NvChad/nvterm"] = override.nvterm,
    ["williamboman/mason.nvim"] = override.mason,
    ["neovim/nvim-lspconfig"] = override.lspconfig,
    ["NvChad/ui"] = override.ui,
    ["goolord/alpha-nvim"] = override.alpha,
  },
  user = require("custom.plugins")
}

M.mappings = mappings

return M
