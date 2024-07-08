return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.move").setup({
				mappings = {
					-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
					left = "<S-h>",
					right = "<S-l>",
					down = "<S-j>",
					up = "<S-k>",
					-- Move current line in Normal mode
					line_left = "<S-h>",
					line_right = "<S-l>",
					line_down = "<S-j>",
					line_up = "<S-k>",
				},
				-- Options which control moving behavior
				options = {
					-- Automatically reindent selection during linewise vertical move
					reindent_linewise = true,
				},
			})
			require("mini.ai").setup()
			require("mini.pairs").setup()
			require("mini.comment").setup()
			require("mini.surround").setup({
				mappings = {
					update_n_lines = "sN",
				},
			})
			require("mini.indentscope").setup({
				draw = {
					delay = 500,
					animation = function(_n, total)
						if total > 40 then
							return 0
						elseif total > 30 then
							return 2
						elseif total > 20 then
							return 5
						end
						return 15
					end,
				},
			})
			require("mini.cursorword").setup({ delay = 500 })
			require("mini.bufremove").setup()
			require("mini.icons").setup()
			require("mini.icons").mock_nvim_web_devicons()
		end,
	},
}
