local M = {}

local P = function (v)
  print(vim.inspect(v))
  return v
end

M.on_key = function (key)
  local mode = vim.api.nvim_get_mode();
  print(mode.mode .. "-" .. key)
end

vim.on_key(M.on_key,0)

local function name ()
  print('hello')
end

return M
