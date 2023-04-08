local plugin = {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>fe",
      function()
          require("neo-tree.command").execute({ toggle = true, reveal=true })
      end,
      desc = "Explorer NeoTree (reveal || root dir)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (reveal || root dir)", remap = true },
  },
  opts = {
    buffers = {
      follow_current_file = false,
    }
  }
}

return { plugin }
