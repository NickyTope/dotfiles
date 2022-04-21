local api = vim.api

function ListBuffers()
	local buf = api.nvim_create_buf(false, true)
	local list = {}
	local bufs = api.nvim_list_bufs()
	for _, b in pairs(bufs) do
		table.insert(list, api.nvim_buf_get_name(b))
	end
	api.nvim_buf_set_lines(buf, 0, 0, false, list)
	api.nvim_command("b" .. buf)
	api.nvim_command("set ft=dirvish")
end
