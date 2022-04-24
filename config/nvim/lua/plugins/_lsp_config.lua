local M = {}

M.on_attach = function ()
  vim.keymap.set('n', 'K',      ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', 'ga',     ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', 'gd',     ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
  vim.keymap.set('i', '<C-s>',  ':lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', 'gD',     ':lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', 'gR',     ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', 'gf',     ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
end

return M
