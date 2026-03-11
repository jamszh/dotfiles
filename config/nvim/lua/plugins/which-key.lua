local config = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    vim.o.timeout = true
    vim.o.timeoutlen = 400
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      { "<leader>f", group = "file/find" },
      { "<leader>g", group = "git" },
      { "<leader>s", group = "search" },
    })
  end,
}

return { config }
