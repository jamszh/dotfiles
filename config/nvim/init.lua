vim.cmd('cd %:p:h')

-- Plugins
require('plugins._packer')
require('plugins._lualine')
require('plugins._nvimtree')

-- Looks
require('modules._looks')

-- Mappings/Settings
require('modules._settings')
require('modules._mappings')

-- LSP
require('modules.lsp')
