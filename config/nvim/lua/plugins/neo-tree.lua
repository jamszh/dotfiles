local plugin = {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      's1n7ax/nvim-window-picker',
      config = function()
        require'window-picker'.setup({
          autoselect_one = true,
          include_current = false,
          filter_rules = {
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { 'neo-tree', "neo-tree-popup", "notify" },

              -- if the buffer type is one of following, the window will be ignored
              buftype = { 'terminal', "quickfix" },
            },
          },
        })
      end,
    }
  },
  keys = {
    {
      "<leader>fe",
      function()
          require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Explorer NeoTree (reveal || root dir)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (reveal || root dir)", remap = true },
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      follow_current_file = true
    },
    source_selector = {
      winbar = true
    }
  },
  config = function (_, opts)
    require("neo-tree").setup(opts)
  end
}

return { plugin }
