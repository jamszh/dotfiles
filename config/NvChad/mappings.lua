local M = {}

M.disabled = {
  n = {
    ["gd"] = "",
    ["gr"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<A-i>"] = "",
    ["<A-v>"] = "",
    ["<A-h>"] = "",
  },
  t = {
    ["<A-i>"] = "",
    ["<A-v>"] = "",
    ["<A-h>"] = "",
  }
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "  find files" },
    ["<C-f>"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["gd"]    = { "<cmd> Telescope lsp_definitions <CR>", " " },
    ["gr"]    = { "<cmd> Telescope lsp_references<CR>", " " },
  }
}

M.nvterm = {
  n = {
    ["\\t"] = {
       function()
          require("nvterm.terminal").toggle "float"
       end,
       "   toggle floating term",
    }
  },
  t = {
    ["\\t"] = {
       function()
          require("nvterm.terminal").toggle "float"
       end,
       "   toggle floating term",
    }
  }
}

return M
