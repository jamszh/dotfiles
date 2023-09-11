local plugin = {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      map("n", "<leader>gr", gs.reset_buffer, "Reset Buffer")
      map("n", "<leader>gd", gs.diffthis, "Diff This")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
    end,
  }
}

return { plugin }
