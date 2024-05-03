return {
	{
		"petertriho/nvim-scrollbar",
		config = function()
			local palette = require("nightfox.palette").load("nightfox")
			require("scrollbar").setup({
				show_in_active_only = true,
				handle = {
					color = palette.bg4,
				},
			})
		end,
	},
}
