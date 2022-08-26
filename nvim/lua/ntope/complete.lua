local M = {}

M.incomplete_task = "%[%s?%]"
M.complete_task = "%[x%]"

M.toggle = function()
  local line = vim.api.nvim_get_current_line()
  local inc = string.match(line, M.incomplete_task)
  -- [] incomplete_task
  -- [x] complete_task
  if inc then
    local n = string.gsub(line, M.incomplete_task, "[x]")
    vim.api.nvim_set_current_line(n)
    return
  end
  local comp = string.match(line, M.complete_task)
  if comp then
    local n = string.gsub(line, M.complete_task, "[]")
    vim.api.nvim_set_current_line(n)
    return
  end
end

return M
