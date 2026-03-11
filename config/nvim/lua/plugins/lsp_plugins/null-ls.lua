local plugin = {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("none-ls")
    return {
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.diagnostics.flake8
      },
    }
  end,
}

return { plugin }
