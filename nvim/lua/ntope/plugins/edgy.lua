return {
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		opts = {
			animate = {
				enabled = false,
				fps = 220, -- frames per second
				cps = 220, -- cells per second
				on_begin = function()
					vim.g.minianimate_disable = true
				end,
				on_end = function()
					vim.g.minianimate_disable = false
				end,
				-- Spinner for pinned views that are loading.
				-- if you have noice.nvim installed, you can use any spinner from it, like:
				-- spinner = require("noice.util.spinners").spinners.circleFull,
				spinner = {
					frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
					interval = 80,
				},
			},
			keys = {
				["q"] = function(win)
					win:close()
				end,
				["Q"] = function() end,
			},
			left = {
				{
					title = "Neo-Tree",
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == "filesystem"
					end,
					size = { height = 0.5 },
					pinned = true,
					open = "Neotree",
				},
				{
					title = "Neo-Tree Buffers",
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == "buffers"
					end,
					pinned = true,
					open = "Neotree position=top buffers",
				},
				{
					ft = "Outline",
					pinned = true,
					open = "SymbolsOutlineOpen",
				},
				-- any other neo-tree windows
				"neo-tree",
				"undotree",
			},
			bottom = {
				{
					ft = "toggleterm",
					size = { height = 0.4 },
					filter = function(buf, win)
						return vim.api.nvim_win_get_config(win).relative == ""
					end,
				},
				{ ft = "qf", title = "QuickFix" },
				{ ft = "fugitive", title = "Git Fugitive", size = { height = 0.3 } },
				{
					ft = "help",
					filter = function(buf)
						return vim.bo[buf].buftype == "help"
					end,
				},
			},
		},
	},
}
