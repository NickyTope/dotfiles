return {
	"stevearc/oil.nvim",
	opts = {
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["v"] = "actions.select_vsplit",
			["p"] = "actions.preview",
			["R"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["<Esc>"] = "actions.close",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},
		use_default_keymaps = false,
		skip_confirm_for_simple_edits = true,
		float = {
			max_width = 150,
			max_height = 40,
			win_options = {
				winblend = 20,
			},
		},
	},
	keys = {
		{
			"-",
			function()
				require("oil").open_float()
			end,
			mode = "n",
			desc = "Browse",
		},
		{
			"<Leader>o",
			"<cmd>vsplit | Oil<cr>",
			mode = "n",
			desc = "Browse Split",
		},
	},
}
