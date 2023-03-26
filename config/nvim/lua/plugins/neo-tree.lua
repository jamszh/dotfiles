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
          require("neo-tree.command").execute({ toggle = true, dir = require("lib.path").get_root() })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
    {
      "<leader>fr",
      function()
          require("neo-tree.command").execute({ toggle = true, dir = require("lib.path").get_root(), reveal=true })
      end,
      desc = "Explorer NeoTree (reveal)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    { "<leader>r", "<leader>fr", desc = "Explorer NeoTree (reveal)", remap = true },
  }
}

return { plugin }
