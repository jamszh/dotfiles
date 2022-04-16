vim.cmd('cd %:p:h')

-- Plugins
require('plugins._packer')
require('plugins._lualine')
require('plugins._nvimtree')
require('plugins._telescope')
require('plugins._treesitter')
require('plugins._bufferline')
require('plugins._toggleterm')

-- Looks
require('modules._looks')

-- Mappings/Settings
require('modules._settings')
require('modules._mappings')

-- LSP
require('modules.lsp')
