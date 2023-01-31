local M = {}

function M.opts(name)
  local plugin = require("lazy.core.config").plugins[name]
  if not plugin then
    return {}
  end
  local Plugin = require("lazy.core.plugin")
  return Plugin.values(plugin, "opts", false)
end

function M.has(plugin_name)
  return require("lazy.core.config").plugins[plugin_name] ~= nil
end

return M
