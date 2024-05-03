return {
	"nvim-pack/nvim-spectre",
	event = "VeryLazy",
	keys = {
		{
			"<leader>rr",
			function()
				require("spectre").open_visual()
			end,
			desc = "Spectre replace",
		},
		{
			"<leader>rR",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			desc = "Spectre replace word",
		},
	},
}
