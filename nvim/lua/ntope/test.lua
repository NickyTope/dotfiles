local M = {}

M.events = {}
M.cmd = {}
M.out = ""
M.stat = ""
-- { mode = "n", cmd = { "c", "i", "*" }, index = 1 }

M._on_key = function(key)
	if string.len(key) > 1 then
		return
	end
	local mode = vim.api.nvim_get_mode().mode
	M.out = M.out .. key .. mode .. ","
	local map = M.keys[mode]
	if map == nil then
		return
	end

	if M.cmd.cmd ~= nil then
		local next = M.cmd.cmd[M.cmd.index + 1]
		if next == "*" then
			next = key
		end
		if next and key == next then
			print("match")
			M.cmd.index = M.cmd.index + 1
			if M.cmd.index == table.maxn(M.cmd.cmd) then
				table.insert(M.events, { mode = mode, key = M.cmd.cmd })
				M.cmd = {}
			end
		else
			M.cmd = {}
		end
	end

	for _, value in ipairs(map) do
		if type(value) == "table" then
			if value[1] == key then
				M.stat = "cmd"
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
	M.on_key = M._on_key
	M.ns = vim.on_key(M.on_key)
end

M.show = function()
	print(vim.inspect(M.events))
	-- print(M.out)
end

M.log = function()
	-- print(vim.inspect(M.events))
	print(M.out)
end

M.stop = function()
	M.on_key = nil
end

M.setup({
	keys = {
		n = { "j", "k", "", "", "{", "}", { "c", "i", "*" } },
	},
})

return M
