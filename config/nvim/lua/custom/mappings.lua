local map = require("core.utils").map

map('n', '<C-p>', ':Telescope find_files <cr>')
map('n', '<C-f>', ':Telescope live_grep <cr>')
map('n', 'gr',    ':Telescope lsp_references<cr>')
