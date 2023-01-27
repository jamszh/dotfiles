local neoconf = {
  "folke/neoconf.nvim",
  cmd = "Neoconf",
  config = true,
}

local neodev = {
  "folke/neodev.nvim",
  opts = {
    experimental = {
      pathStrict = true
    }
  },
}

return { neoconf, neodev }
