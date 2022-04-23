local present, nvimtree = pcall(require, "nvim-tree")
if not present then
  vim.notify("Cannot find nvim-tree")
  return
end

local g = vim.g

g.nvim_tree_add_trailing = 0 -- append trailing slash to folder names
g.nvim_tree_git_hl = 0
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??"  }

g.nvim_tree_show_icons = {
  folders = 1,
  files = 1,
  git = 0,
}

g.nvim_tree_icons = {
  default = "",
  symlink = "",
  folder = {
    default = "",
    empty = "",
    empty_open = "",
    open = "",
    symlink = "",
    symlink_open = "",
  }
}

local config = {
  disable_netrw = true,
  hijack_netrw = true,
  ignore_ft_on_setup = { "dashboard" },
  auto_close = false,
  open_on_tab = false,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    allow_resize = true,
    side = "left",
    width = 25,
    hide_root_folder = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    }
  },
  renderer = {
    indent_markers = {
      enable = true
    }
  },
  filters = {
    dotfiles = true,
    custom = {
      '.git', 'node_modules', '__sapper__', '.routify', 'dist', '.cache', '__pycache__'
    }
  }
}

nvimtree.setup(config)
