local api = vim.api
local buf, win

function ShowFileName()
  if not win then
    buf = api.nvim_create_buf(false, true)
    -- api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    local width = api.nvim_get_option("columns")

    local opts = {
      style = "minimal",
      relative = "editor",
      width = width,
      focusable = false,
      height = 1,
      row = 0,
      col = 0
    }

    win = api.nvim_open_win(buf, false, opts)
  end
  local path = vim.fn.expand("%:~:.")
  local parts = {}
  for part in string.gmatch(path, "[^/]+") do
    table.insert(parts, part)
  end
  local out = ""
  if #parts > 2 then
    for i, part in pairs(parts) do
      if i < #parts - 2 then
        out = out..string.sub(part, 1, 1)
      else
        out = out..part
      end
      if i < #parts then
        out = out.."/"
      end
    end
  else
    out = path
  end
  if out == "" then
    out = vim.fn.expand("%:p:h:t")
  end
  api.nvim_buf_set_lines(buf, 0, -1, false, { out })
end

function HideFileName()
  if win then
    api.nvim_win_close(win, true)
    win = nil
    buf = nil
  end
end

-- function! ShowPath()
  -- let width = float2nr(&columns)
  -- let opts = {
    -- \ 'relative': 'editor',
    -- \ 'row': 0,
    -- \ 'col': width / 2,
    -- \ 'width': width / 2,
    -- \ 'height': 1
  -- \ }
  -- let buf = nvim_create_buf(v:false, v:true)
  -- let win = nvim_open_win(buf, v:true, opts)
  -- setlocal
    -- \ buftype=nofile
    -- \ nobuflisted
    -- \ bufhidden=wipe
    -- \ nonumber
    -- \ norelativenumber
    -- \ signcolumn=no
-- endfunction
--
