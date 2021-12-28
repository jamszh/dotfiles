vim.cmd[[packadd nvim-tree.lua]]

-- Set some variables
vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 30
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1
}

require'nvim-tree'.setup {
  open_on_setup = false,
  auto_close = false,
  open_on_tab = false,
  update_focused_file = {
    enable = true
  },
  filters = {
    dotfiles = true,
    custom = {
      '.git', 'node_modules', '__sapper__', '.routify', 'dist', '.cache', '__pycache__'
    }

  }
}

local get_lua_cb = function (cb_name)
  return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
end


-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',

  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★"
  },

  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = ""
  }
}
