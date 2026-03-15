local plugin = {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  opts = {
    settings = {
      separate_diagnostic_server = true,
      tsserver_file_preferences = {
        includeCompletionsForModuleExports = true,
      },
    },
  },
}

return { plugin }
