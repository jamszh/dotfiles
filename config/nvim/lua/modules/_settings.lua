local cmd = vim.api.nvim_command

local apply_options = function(opts)
  for k, v in pairs(opts) do
    if v == true then
      cmd('set ' .. k)
    elseif v == false then
      cmd(string.format('set no%s', k))
    else
      cmd(string.format('set %s=%s', k, v))
    end
  end
end

local options = {
  -- Boolean value
  autoindent = true, -- enable autoindent
  backup = false, -- disable backup
  expandtab = true, -- use spaces instead of tabs
  autowrite = true, -- autowrite buffer when it's not focused
  hidden = true, -- keep hidden buffers
  hlsearch = false, -- don't highlight matching search
  ignorecase = true, -- case insensitive on search
  lazyredraw = true, -- lazyredraw to make macro faster
  list = true, -- display listchars
  number = true, -- enable number
  showmode = false, -- don't show mode
  smartcase = true, -- improve searching using '/'
  smartindent = true, -- smarter indentation
  smarttab = true, -- make tab behaviour smarter
  splitbelow = true, -- split below instead of above
  splitright = true, -- split right instead of left
  startofline = false, -- don't go to the start of the line when moving to another file
  swapfile = false, -- disable swapfile
  wrap = false, -- dont wrap lines
  writebackup = false, -- disable backup

  -- String value
  completeopt = 'menu,menuone,noinsert,noselect', -- better completion
  encoding = "UTF-8", -- set encoding
  foldmethod = "marker", -- foldmethod using marker
  inccommand = "split", -- incrementally show result of command
  shortmess = "csa", -- disable some stuff on shortmess

  -- Number value
  tabstop = 2, -- tab size as 2 spaces
  shiftwidth = 2,
  laststatus = 2, -- always enable statusline
  pumheight = 10, -- limit completion items
  re = 0, -- set regexp engine to auto
  synmaxcol = 300, -- set limit for syntax highlighting in a single line
  timeoutlen = 500, -- faster timeout wait time
  updatetime = 100, -- set faster update time
}

apply_options(options)
