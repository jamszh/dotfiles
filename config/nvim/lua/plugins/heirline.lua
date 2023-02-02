local heirline = require("lib.heirline")

local plugin = {
  "rebelot/heirline.nvim",
  event = "UiEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local colors = require("catppuccin.palettes").get_palette "mocha"
    require("heirline").load_colors(colors)
    local setup_config = {
      statusline = {
        heirline.build_statuslines()
      },
      winbar = {
        heirline.build_file_block(),
      },
      tabline = {},
      status_column = {},
    }
    require("heirline").setup(setup_config)
  end
}

return { plugin }
