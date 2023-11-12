return {

	{
		"f-person/git-blame.nvim",
		dependencies = { "f-person/lua-timeago" },
		config = function()
			require("gitblame").setup({
				enabled = false,
			})
		end,
	},
}
