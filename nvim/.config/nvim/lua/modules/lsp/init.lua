vim.cmd[[packadd nvim-lspconfig]]

local nvim_lsp = require('lspconfig')
local mappings = require('modules.lsp._mappings')

local custom_on_attach = function(client)
  mappings.lsp_mappings()

  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end
end

local custom_on_init = function()
  print('LSP started!')
end

nvim_lsp.pyright.setup{ on_attach = custom_on_attach, on_init = custom_on_init }
nvim_lsp.gopls.setup{ on_attach = custom_on_attach, on_init = custom_on_init, root_dir = function() return vim.loop.cwd() end }
nvim_lsp.clangd.setup{ on_attach = custom_on_attach, on_init = custom_on_init }

local sumneko_root = os.getenv("HOME") .. "/Workspace/lua-language-server"
nvim_lsp.sumneko_lua.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  cmd = {
    sumneko_root
    .. "/bin/MacOS/lua-language-server", "-E",
    sumneko_root .. "/main.lua"
  }
}
