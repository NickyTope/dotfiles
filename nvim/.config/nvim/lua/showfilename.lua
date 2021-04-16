local api = vim.api
local buf, win

local M = {}

M.show = function()
  if win then
    M.hide()
  end

  buf = api.nvim_create_buf(false, true)
  local width = api.nvim_get_option("columns")

  local path = vim.fn.expand("%:~:.")
  if path == "" then
    path = vim.fn.expand("%:p:h:t")
  end
  local pathlen = string.len(path) + 2
  local pad = (width - pathlen) / 2

  local opts = {
    style = "minimal",
    relative = "buffer",
    width = pathlen,
    focusable = false,
    height = 3,
    row = 50,
    col = pad
  }

  win = api.nvim_open_win(buf, false, opts)

  api.nvim_buf_set_lines(buf, 1, -1, false, {" " .. path})
end

M.hide = function()
  if win then
    api.nvim_win_close(win, true)
    win = nil
    buf = nil
  end
end

return M
