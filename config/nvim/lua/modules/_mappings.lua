local telescope = require("plugins._telescope")
vim.keymap.set('n', '<C-p>', telescope.files, { silent = true })
vim.keymap.set('n', '<C-f>', telescope.grep_prompt, { silent = true})
vim.keymap.set('n', '<C-n>', "<cmd>NvimTreeToggle<cr>")
