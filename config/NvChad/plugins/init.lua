return {
  ["famiu/bufdelete.nvim"] = {},
  ["vimwiki/vimwiki"] = {},
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["nvim-telescope/telescope.nvim"] = {
    module = "telescope",
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  }
}
