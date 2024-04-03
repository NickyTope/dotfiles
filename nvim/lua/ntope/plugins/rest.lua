return {
	{
		"vhyrro/luarocks.nvim",
		opts = {
			rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
		},
	},
	{
		"rest-nvim/rest.nvim",
		ft = "http",
		dependencies = { "luarocks.nvim" },
		keys = {
			{ "<leader>h", "<cmd>Rest run<CR>", desc = "rest request", ft = "http" },
		},
		config = function()
			require("rest-nvim").setup()
		end,
	},
}

-- If this fails on update, try rebuilding both packages
-- :Lazy build luarocks.nvim
-- :Lazy build rest.nvim
