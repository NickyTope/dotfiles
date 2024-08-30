return {
	"startup-nvim/startup.nvim",
	config = function()
		local evil = require("startup.themes.evil")
		evil.body_2.fold_section = false
		evil.parts = {
			"header",
			"header_2",
			"body_2",
			"clock",
		}
		require("startup").setup(evil)
	end,
}
