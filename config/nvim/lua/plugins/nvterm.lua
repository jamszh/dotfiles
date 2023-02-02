local opts = { noremap = true, silent = true }

local plugin = {
  "NvChad/nvterm",
  lazy = false,
  config = function()
    require("nvterm").setup()

    local nvterm = require("nvterm.terminal")
    local mappings = {
      { 'n', '<leader>th', function() nvterm.new "horizontal" end },
      { 'n', '<leader>tv', function() nvterm.new "vertical" end },
      { 't', '<C-x>', '<C-\\><C-N>' },
    }

    for _, mapping in ipairs(mappings) do
      vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
    end
  end,
}

return { plugin }
