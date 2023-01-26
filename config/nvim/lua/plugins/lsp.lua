local mason = require("plugins.lsp_plugins.mason")
local config = require("plugins.lsp_plugins.config")
local null_ls = require("plugins.lsp_plugins.null-ls")

return {
  config,
  mason,
  null_ls,
}
