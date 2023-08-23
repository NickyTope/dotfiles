return {

	-- Pretties
	"ryanoasis/vim-devicons",

	-- Editor convenience
	{ "folke/which-key.nvim", config = true },

	-- Text manilpulation
	-- "kana/vim-textobj-user",
	-- "etdev/vim-textobject-pack",

	-- Input trickery

	-- git
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{ "f-person/git-blame.nvim", dependencies = { "f-person/lua-timeago" } },

	-- Syntax
	{ "mitsuhiko/vim-jinja", ft = "jinja" },
	-- "yuezk/vim-js",
	{ "stephpy/vim-yaml", ft = "yaml" },
	{ "vim-scripts/groovy.vim", ft = "groovy" },
	{ "chrisbra/csv.vim", ft = "csv" },
	"vim-scripts/nginx.vim",
	-- "neoclide/vim-jsx-improve",

	-- tools
	"nvim-lua/popup.nvim",
	"tami5/sqlite.lua",
	{ "m-demare/hlargs.nvim", config = true },
	"mbbill/undotree",

	-- new plugins go here until confirmed ful...
}
