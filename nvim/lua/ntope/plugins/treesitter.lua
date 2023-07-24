return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				modules = {},
				auto_install = true,
				sync_install = false,
				ignore_install = {},
				ensure_installed = {
					"bash",
					"c",
					"comment",
					"css",
					"dockerfile",
					"go",
					"html",
					"javascript",
					"jsdoc",
					"json",
					"lua",
					"luap",
					"markdown",
					"markdown_inline",
					"python",
					"query",
					"regex",
					"scss",
					"tsx",
					"typescript",
					"vim",
					"yaml",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
}
