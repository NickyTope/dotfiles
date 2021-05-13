local api = vim.api
local buf, win

local M = {}

M.show = function(timeout)
  if win then
    M.hide()
  end
  if M.timer then
    M.timer:stop()
  end

  buf = api.nvim_create_buf(false, true)
  local width = api.nvim_win_get_width(0)
  local height = api.nvim_win_get_height(0)

  local path = vim.fn.expand("%:~:.")
  if path == "" then
    path = vim.fn.expand("%:p:h:t")
  end
  local pathlen = string.len(path) + 2
  local pad = (width - pathlen) / 2

  local opts = {
    style = "minimal",
    relative = "win",
    width = pathlen,
    focusable = false,
    height = 3,
    row = math.ceil(height * 0.66),
    col = pad
  }

  win = api.nvim_open_win(buf, false, opts)

  api.nvim_buf_set_lines(buf, 1, -1, false, {" " .. path})

  if timeout then
    M.timer = vim.defer_fn(M.hide, timeout)
  end
end

M.hide = function()
  if win then
    api.nvim_win_close(win, true)
    win = nil
    buf = nil
  end
end

return M
