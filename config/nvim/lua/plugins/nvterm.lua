local opts = { noremap = true, silent = true }

local plugin = {
  "NvChad/nvterm",
  lazy = false,
  config = function()
    require("nvterm").setup({
      behavior = {
        auto_insert = false,
      }
    })

    local nvterm = require("nvterm.terminal")
    local toggle_modes = { 'n', 't' }
    local mappings = {
      { toggle_modes, '<leader>th', function() nvterm.toggle('horizontal') end },
      { toggle_modes, '<leader>tv', function() nvterm.toggle('vertical') end },
      { 't', '<C-x>', '<C-\\><C-N>' },
    }

    for _, mapping in ipairs(mappings) do
      vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
    end
  end,
}

return { plugin }
