local heirline = require("lib.heirline")

local build_winbar_blocks = function()
  return {
    fallthrough = false,
    heirline.build_terminal_block(),
    heirline.build_file_block(),
  }
end

local plugin = {
  "rebelot/heirline.nvim",
  event = "UiEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local colors = require("catppuccin.palettes").get_palette "mocha"
    require("heirline").load_colors(colors)
    local conditions = require("heirline.conditions")
    local setup_config = {
      statusline = {
        heirline.build_statuslines()
      },
      winbar = build_winbar_blocks(),
      tabline = {},
      status_column = {},
      opts = {
        disable_winbar_cb = function (args)
          return conditions.buffer_matches({
            buftype = { "nofile", "prompt", "help", "quickfix" },
            filetype = { "^git.*", "dashboard" },
          }, args.buf)
        end
      }
    }
    require("heirline").setup(setup_config)
  end
}

return { plugin }
