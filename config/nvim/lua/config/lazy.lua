-- boostrap lazy.nvim --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("config.commands")

require("lazy").setup("plugins", {
  defaults = { lazy = true },
  checker = {
    enabled = false,
    notify = true
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "tutor",
        "netrwPlugin"
      }
    }
  }
})
