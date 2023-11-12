return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	config = function()
		require("dressing").setup({
			select = {
				enabled = false,
				backend = { "telescope", "builtin" },
				telescope = require("telescope.themes").get_cursor({}),
			},
		})
	end,
}
