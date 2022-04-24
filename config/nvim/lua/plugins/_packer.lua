local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

local ok, packer = pcall(require, "packer")

if ok then
  local use = packer.use

  packer.init({
    git = {
      clone_timeout = 300
    },
    display = {
      open_cmd = '80vnew [packer]',
    }
  })

  local plugins = function()
    -- Do your own thing Packer
    use 'wbthomason/packer.nvim'

    -- das Aussehen
    use 'ellisonleao/gruvbox.nvim'
    use { 'kyazdani42/nvim-web-devicons' }
    use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function() -- use default
        require('alpha').setup(require('alpha.themes.dashboard').config)
      end
    }
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function() -- use default
        require('indent_blankline').setup()
      end
    }

    ----- LSP -----
    use 'neovim/nvim-lspconfig' -- builtin LSP config
    use { -- LSP installer
      'williamboman/nvim-lsp-installer',
      config = [[ require('plugins/_lsp_installer') ]],
    }

    -- Syntax Highlighting
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'nvim-treesitter/playground',
        opt = true
      },
      run = ':TSUpdate',
      config = [[ require('plugins/_treesitter') ]]
    }

    ----- IDE Features -----
    use { -- file explorer
      'kyazdani42/nvim-tree.lua',
      config = [[ require('plugins/_nvimtree') ]]
    }

    use { -- comments made easier
      'numToStr/Comment.nvim',
      config = [[ require('plugins/_comment') ]]
    }

    use { -- Auto completion
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        { 'hrsh7th/cmp-nvim-lua', ft = 'lua' },
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
      },
      config = [[ require('plugins/_cmp') ]]
    }

    use { -- Snippet Engine
      'L3MON4D3/LuaSnip',
      requires = {
        'rafamadriz/friendly-snippets',
      },
      config = [[ require('plugins/_luasnip') ]]
    }

    use { -- Find, Filter, Preview, Pick
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        { 'nvim-telescope/telescope-file-browser.nvim' },
        { 'nvim-telescope/telescope-media-files.nvim' },
      },
      config = [[ require('plugins/_telescope') ]]
    }

    use { -- Pictograms for completion topics
      'onsails/lspkind-nvim',
      config = [[ require('plugins/_lspkind') ]]
    }

    use { -- status line
      'feline-nvim/feline.nvim',
      config = [[ require('plugins/_feline') ]]
    }

    use { -- bufferline
      'akinsho/nvim-bufferline.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = [[ require('plugins/_bufferline') ]]
    }

    ----- Misc -----
    use { 'andweeb/presence.nvim', opt = true } -- discord integration
    use { 'wakatime/vim-wakatime', opt = true } -- track usage time using wakatime

    use {
      'rhysd/git-messenger.vim',
      cmd = 'GitMessenger',
      opt = true
    } -- sort of like git blame but in floating window
    use {"akinsho/toggleterm.nvim", opt = true }
  end

  return packer.startup(plugins)
end
