local keys = {
  { "<localleader>c", "<cmd>VimtexCompileSS<cr>", desc = "Vimtex compile" },
  { "<localleader>r", "<cmd>VimtexCompile<cr>", desc = "Vimtex continue compile" },
}

local config = {
  "lervag/vimtex",
  lazy = false,
  keys = keys,
}

return { config }
