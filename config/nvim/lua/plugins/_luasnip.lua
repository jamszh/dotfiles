local ls = require('luasnip')

ls.config.set_config({
  history = false,
  updateevents = "TextChanged,TextChangedI",
  region_check_events = "CursorMoved",
})

ls.snippets = { all = {}, html = {} }
ls.snippets.javascriptreact = ls.snippets.html
ls.snippets.typescriptreact = ls.snippets.html

require('luasnip/loaders/from_vscode').load({include = {'html'}})
require("luasnip.loaders.from_vscode").lazy_load()

local filetype = vim.bo.filetype
if filetype == "javascriptreact" then
  require("luasnip/loaders/from_vscode").load({include = {"javascriptreact"}})
  return
end

if filetype == "typescriptreact" then
  require("luasnip/loaders/from_vscode").load({include = {"typescriptreact"}})
  return
end
