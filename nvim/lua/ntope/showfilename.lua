local api = vim.api
local buf, win

local M = {
  minwidth = 60,
  timeout = 10000,
}

M.toggle = function()
  if win then
    M.hide()
  else
    M.show()
  end
end

M.show = function()
  if win then
    M.hide()
  end
  if M.timer then
    M.timer:stop()
  end

  if vim.bo.filetype == "NvimTree" then
    return
  end

  if vim.fn.pumvisible() == 1 then
    return
  end

  buf = api.nvim_create_buf(false, true)
  local winwidth = api.nvim_win_get_width(0)

  local path = vim.fn.expand("%:~:.")
  if path == "" then
    path = vim.fn.expand("%:p:h:t")
  end
  local pathlen = string.len(path) + 2
  local pad = (winwidth / 2 - pathlen / 2)
  local width = pathlen
  if width < M.minwidth then
    width = M.minwidth
  end

  local opts = {
    style = "minimal",
    relative = "win",
    width = width,
    focusable = false,
    height = 10,
    row = 10,
    col = pad,
  }

  win = api.nvim_open_win(buf, false, opts)

  api.nvim_buf_set_lines(buf, 1, -1, false, { " " .. path })
  local filestat
  local gitstat
  vim.fn.jobstart(
    "ls -la " .. path .. [[ | awk '{ print "\towner: " $3 "\n\tperms: " $1 "\n\tudate: " $6 " " $7 " " $8 }']],
    {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if data then
          filestat = data
        end
        if filestat and gitstat then
          api.nvim_buf_set_lines(buf, 2, 2, false, { "" })
          api.nvim_buf_set_lines(buf, 3, 5, false, filestat)
          api.nvim_buf_set_lines(buf, 6, 6, false, { "" })
          api.nvim_buf_set_lines(buf, 7, 8, false, gitstat)
        end
      end,
    }
  )
  vim.fn.jobstart("git --no-pager diff --stat -B -M -C " .. path, {
    stdout_buffered = true,
    cwd = vim.fn.expand("%:h"),
    on_stdout = function(_, data)
      if data then
        if data[1] == "" then
          gitstat = { " no changes" }
        else
          gitstat = data
        end
      end
      if filestat and gitstat then
        api.nvim_buf_set_lines(buf, 2, 2, false, { "" })
        api.nvim_buf_set_lines(buf, 3, 5, false, filestat)
        api.nvim_buf_set_lines(buf, 6, 6, false, { "" })
        api.nvim_buf_set_lines(buf, 7, 8, false, gitstat)
      end
    end,
  })

  M.timer = vim.defer_fn(M.hide, M.timeout)
end

M.win_valid = function()
  if win then
    for _, w in pairs(vim.api.nvim_list_wins()) do
      if w == win then
        return true
      end
    end
  end
  return false
end

M.hide = function()
  if M.win_valid() then
    api.nvim_win_close(win, true)
    vim.cmd("bd! " .. buf)
  end
  win = nil
  buf = nil
end

return M
