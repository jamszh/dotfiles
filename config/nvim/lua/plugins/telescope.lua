local path = require("lib.path")

local function grep_wrap(builtin, opts)
  local params = { builtin = builtin, opts = opts }
  return function()
    builtin = params.builtin
    opts = params.opts
    opts = vim.tbl_deep_extend("force", { cwd = path.get_root() }, opts or {})
    if builtin == "files" then
      if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. "/.git") then
        opts.show_untracked = true
        builtin = "git_files"
      else
        builtin = "find_files"
      end
    end
    require("telescope.builtin")[builtin](opts)
  end
end

local keys = {
  { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
  { "<leader>/", grep_wrap("live_grep"), desc = "Find in Files (Grep)" },
  { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
  { "<leader><space>", grep_wrap("files"), desc = "Find Files (root dir)" },
  -- find
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
  { "<leader>fF", grep_wrap("files"), desc = "Find Files (cwd)" },
  { "<leader>ff", grep_wrap("files", { cwd = false }), desc = "Find Files (root dir)" },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
  -- git
  { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
  { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
  -- search
  { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
  { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
  { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
  { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
  { "<leader>sg", grep_wrap("live_grep"), desc = "Grep (root dir)" },
  { "<leader>sG", grep_wrap("live_grep", { cwd = false }), desc = "Grep (cwd)" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
  { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
  { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
  { "<leader>sw", grep_wrap("grep_string"), desc = "Word (root dir)" },
  { "<leader>sW", grep_wrap("grep_string", { cwd = false }), desc = "Word (cwd)" },
  {
    "<leader>ss",
    grep_wrap("lsp_document_symbols", {
      symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Struct", "Trait", "Field", "Property" },
    }),
    desc = "Goto Symbol",
  },
}

local options = {
  vimgrep_arguments = {
    "rg",
    "-L",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
  },
  prompt_prefix = "   ",
  selection_caret = "  ",
  entry_prefix = "  ",
  initial_mode = "insert",
  selection_strategy = "reset",
  sorting_strategy = "ascending",
  layout_strategy = "horizontal",
  layout_config = {
    horizontal = {
      prompt_position = "top",
      preview_width = 0.55,
      results_width = 0.8,
      preview_cutoff = 120,
      width = 0.75,
      height = 0.65,
    },
    vertical = {
      prompt_position = "bottom",
      preview_height = 0.7,
      mirror = false,
      preview_cutoff = 0,
      width = 0.5,
      height = 0.7,
    },
  },
  file_ignore_patterns = { "node_modules" },
  path_display = { "truncate" },
  winblend = 0,
  border = true,
  color_devicons = true,
  set_env = { ["COLORTERM"] = "truecolor" },
  mappings = {
    n = {
      ["q"] = function()
        return require("telescope.actions").close
      end
    }
  }
}

local config = {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  keys = keys,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "catppuccin/nvim",
  },
  opts = {
    defaults = options,
  },
}

return { config }
