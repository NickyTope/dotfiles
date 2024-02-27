return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#AAAAAA",
			timeout = 3000,
		})
		vim.notify = require("notify")
	end,
}
