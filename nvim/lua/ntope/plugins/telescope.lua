return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-symbols.nvim",
		"smartpde/telescope-recent-files",
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				file_sorter = require("telescope.sorters").get_fzy_sorter,
				prompt_prefix = " >",
				color_devicons = true,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				mappings = {
					i = {
						["<C-x>"] = false,
						["<esc>"] = actions.close,
						["<C-q>"] = actions.send_to_qflist,
					},
				},
			},
			extensions = {
				recent_files = {
					only_cwd = true,
				},
			},
		})
		require("telescope").load_extension("recent_files")
	end,
}
