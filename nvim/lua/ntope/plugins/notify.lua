return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#AAAAAA",
			timeout = 3000,
		})
		local banned_messages = { "No information available" }

		vim.notify = function(msg, ...)
			for _, banned in ipairs(banned_messages) do
				if msg == banned then
					return
				end
			end
			require("notify")(msg, ...)
		end
	end,
}
