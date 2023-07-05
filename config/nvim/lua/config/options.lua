vim.g.mapleader = " "
vim.opt.laststatus = 3

local opt = vim.opt

-- indentation
opt.expandtab = true
opt.tabstop = 2
opt.shiftround = true
opt.shiftwidth = 2

opt.number = true
opt.relativenumber = true

opt.termguicolors = true
opt.clipboard = "unnamedplus"

vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'

if vim.fn.has("wsl") == 1 then
  vim.api.nvim_exec([[
    let g:clipboard = {
      \   'name': 'WslClipboard',
      \   'copy': {
      \      '+': 'clip.exe',
      \      '*': 'clip.exe',
      \    },
      \   'paste': {
      \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      \   },
      \   'cache_enabled': 0,
      \ }]]
    , true
  )
end

