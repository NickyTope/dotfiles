local M = {}

M.events = {}

local function hasKey(map, key)
  if map == nil then
    return false
  end

  for _, value in ipairs(map) do
    if key == value then
      return true
    end
  end
  return false
end

M.on_key = function (key)
  local mode = vim.api.nvim_get_mode().mode;
  if hasKey(M.keys[mode], key) then
    table.insert(M.events, { mode = mode, key = key })
  end
end

M.setup = function (opts)
  M.keys = opts.keys or {}
  M.ns = vim.on_key(M.on_key)
end

M.stop = function ()
  vim.on_key(nil, M.ns)
end

M.setup({
  keys = {
    n = { "j", "k", "", "", "{", "}" }
  }
})

-- vim.on_key(M.on_key,0)

return M
