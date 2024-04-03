return {
	"stevearc/oil.nvim",
	opts = {
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-s>"] = false,
			["<C-h>"] = false,
			["<C-t>"] = false,
			["<C-p>"] = false,
			["<C-c>"] = false,
			["<C-l>"] = false,
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
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"-",
			"<cmd>Oil<cr>",
			mode = "n",
			desc = "Browse",
		},
		{
			"<Leader>-",
			"<cmd>vsplit | Oil<cr>",
			mode = "n",
			desc = "Browse Split",
		},
		{
			"<Leader>o",
			function()
				require("oil").open_float()
			end,
			desc = "Browse Float",
			mode = { "n", "v" },
		},
	},
}
