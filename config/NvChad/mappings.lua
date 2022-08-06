local M = {}

M.disabled = {
  n = {
    ["gd"] = "",
    ["gr"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-s>"] = "",
    ["<A-i>"] = "",
    ["<A-v>"] = "",
    ["<A-h>"] = "",
    ["<TAB>"] = "",
    ["<S-Tab>"] = "",
  },
  t = {
    ["<A-i>"] = "",
    ["<A-v>"] = "",
    ["<A-h>"] = "",
  }
}

M.tabufline = {
  n = {
    ["<C-k>"] = { "<cmd> Tbufnext <CR>", "  goto next buffer" },
    ["<C-j>"] = { "<cmd> Tbufprev <CR> ", "  goto prev buffer" },
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
