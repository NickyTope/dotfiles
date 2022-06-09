local api = vim.api
local buf, win

local M = {}

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
	local width = api.nvim_win_get_width(0)
	-- local height = api.nvim_win_get_height(0)

	local path = vim.fn.expand("%:~:.")
	if path == "" then
		path = vim.fn.expand("%:p:h:t")
	end
	local pathlen = string.len(path) + 2
	local pad = (width - pathlen)

	local opts = {
		style = "minimal",
		relative = "win",
		width = pathlen,
		focusable = false,
		height = 3,
		row = 0,
		col = pad,
	}

	win = api.nvim_open_win(buf, false, opts)

	api.nvim_buf_set_lines(buf, 1, -1, false, { " " .. path })

	M.timer = vim.defer_fn(M.hide, 2000)
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