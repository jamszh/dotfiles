local M = {}

M.general = {
  n = {
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
  }
}

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
  },
  t = {
    ["<A-i>"] = "",
    ["<A-v>"] = "",
    ["<A-h>"] = "",
  }
}

M.gitsigns = {
  n = {
    ["<leader>bl"] = { "<cmd> Gitsigns blame_line <CR>", "git blame line" }
  }
}

M.tabufline = {
  n = {
    ["<C-k>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "  goto next buffer"
    },
    ["<C-j>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "  goto prev buffer"
    },
  }
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "  find files" },
    ["<C-f>"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["gd"]    = { "<cmd> Telescope lsp_definitions <CR>", " " },
    ["gr"]    = { "<cmd> Telescope lsp_references<CR>", " " },
    ["gs"]    = { "<cmd> Telescope grep_string<CR>", "cursor grep string" },
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
