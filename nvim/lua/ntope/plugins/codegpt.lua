return {
	{
		"dpayne/CodeGPT.nvim",
		lazy = true,
		cmd = { "Chat" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			vim.g["codegpt_global_commands_defaults"] = {
				model = "gpt-4o",
				max_tokens = 128000,
			}
			require("codegpt.config")
		end,
	},
}
