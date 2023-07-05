local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.api.nvim_create_user_command("CopyRelPath", "call setreg('+', expand('%'))", {})
map("n", "<leader>cp", "<cmd>lua require('lib/path').copy_path()<CR>", { silent=false, desc="Copy relative path" })
