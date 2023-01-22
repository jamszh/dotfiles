local config = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    vim.o.timeout = true
    vim.o.timeoutlen = 400
    local wk = require("which-key")
    wk.setup(opts)
    wk.register({
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>s"] = { name = "+search" },
    })
  end,
}

return { config }
