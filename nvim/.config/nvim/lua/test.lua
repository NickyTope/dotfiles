local M = {}

M.events = {}
M.cmd = {}
M.out = ""
-- { mode = "n", cmd = { "c", "i", "*" }, index = 1 }

M.on_key = function(key)
	if string.len(key) > 1 then
		return
	end
	local mode = vim.api.nvim_get_mode().mode
	local map = M.keys[mode]
	if map == nil then
		return
	end

	if M.cmd.mode == mode then
		local next = M.cmd.cmd[M.cmd.index + 1]
		if next == "*" then
			next = key
		end
		print(next .. "=" .. key)
		if next and key == next then
			M.cmd.index = M.cmd.index + 1
			if M.cmd.index == table.maxn(M.cmd) then
				table.insert(M.events, { mode = mode, key = M.cmd.cmd })
				M.cmd = {}
			end
		end
	end

	for _, value in ipairs(map) do
		if type(value) == "table" then
			if value[1] == key then
				M.cmd = {
					mode = mode,
					cmd = value,
					index = 1,
				}
				return
			end
		end
		if key == value then
			table.insert(M.events, { mode = mode, key = key })
			M.cmd = {}
		end
	end
end

M.setup = function(opts)
	M.keys = opts.keys or {}
	M.ns = vim.on_key(M.on_key)
end

M.show = function()
	print(vim.inspect(M.events))
end

M.stop = function()
	vim.on_key(nil, M.ns)
end

M.setup({
	keys = {
		n = { "j", "k", "", "", "{", "}", { "c", "i", "*" } },
	},
})

return M
