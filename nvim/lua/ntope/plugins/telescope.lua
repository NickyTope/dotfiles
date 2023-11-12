return {
	"nvim-lua/plenary.nvim",
	-- "nvim-telescope/telescope-ui-select.nvim",
	"nvim-telescope/telescope-symbols.nvim",
	{
		"nvim-telescope/telescope.nvim",
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
			})
			-- require("telescope").load_extension("ui-select")
		end,
	},
}
