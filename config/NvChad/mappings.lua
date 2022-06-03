local M = {}

M.disabled = {
  ["gd"] = "",
  ["gr"] = "",
}

M.telescope = {
  n = {
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "  find files" },
    ["<C-f>"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["gd"]    = { "<cmd> Telescope lsp_definitions <CR>", " " },
    ["gr"]    = { "<cmd> Telescope lsp_references<CR>", " " },
  }
}

return M
