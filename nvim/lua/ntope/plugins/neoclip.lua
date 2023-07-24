return {
	{
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup({
				enable_persistent_history = true,
				content_spec_column = true,
			})
		end,
	},
}
