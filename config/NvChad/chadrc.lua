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
    statusline = {
       separator_style = "block", -- default/round/block/arrow
       config = "%!v:lua.require'custom.plugins.statusline'.run()",
    },
  },
  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["feline-nvim/feline.nvim"] = override.feline,
    ["NvChad/nvterm"] = override.nvterm,
  },
  user = require("custom.plugins")
}

M.mappings = mappings

return M
