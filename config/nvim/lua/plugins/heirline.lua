local heirline = require("lib.heirline")

local plugin = {
  "rebelot/heirline.nvim",
  event = "UiEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local colors = require("tokyonight.colors").setup()
    require("heirline").load_colors(colors)
    local setup_config = {
      statusline = { heirline.mode_indicator, heirline.build_file_block() },
      winbar = {},
      tabline = {},
      status_column = {},
    }
    require("heirline").setup(setup_config)
  end
}

return { plugin }
