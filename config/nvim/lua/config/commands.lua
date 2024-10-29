local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.api.nvim_create_user_command("CopyRelPath", "call setreg('+', expand('%'))", {})

map("n", "<leader>cp", "<cmd>lua require('lib/path').copy_path()<CR>", { silent=false, desc="Copy relative path" })

map("n", "<C-u>", "<C-u>zz", { silent=false, desc = "Up page and re-centre" })
map("n", "<C-d>", "<C-d>zz", { silent=false, desc = "Down page and re-centre" })
map("n", "<C-i>", "<C-i>zz", { silent=false, desc = "Forward cursor and re-centre" })
map("n", "<C-o>", "<C-o>zz", { silent=false, desc = "Backward cursor and re-centre" })
map("n", "<leader>tl", "<cmd>set relativenumber<CR>", { silent=false, desc = "Toggle relative line number" })
