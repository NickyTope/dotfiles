---@diagnostic disable: duplicate-set-field
local started = false

local function get_message(...)
	local print_safe_args = {}

	for _, arg in ipairs({ ... }) do
		table.insert(print_safe_args, tostring(arg))
	end

	return table.concat(print_safe_args, " ")
end

return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#371082",
		})
		vim.notify = require("notify")
	end,
	version = "*",
	event = "VeryLazy",
}
