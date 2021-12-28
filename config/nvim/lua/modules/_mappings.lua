local k = require"astronauta.keymap"

local noremap =  k.noremap
local nnoremap = k.nnoremap
local inoremap = k.inoremap
local vnoremap = k.vnoremap


nnoremap{"<C-p>", require"plugins._telescope".files, { silent = true }}
nnoremap{"<C-f>", require"plugins._telescope".grep_prompt, { silent = true }}
nnoremap{"<C-n>", "<CMD>NvimTreeToggle<CR>"}
