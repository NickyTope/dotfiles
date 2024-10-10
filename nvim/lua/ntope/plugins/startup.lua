return {
	"startup-nvim/startup.nvim",
	config = function()
		require("startup").setup({
			hydra = {
				type = "text",
				align = "center",
				fold_section = false,
				title = "Welcome",
				margin = 1,
				content = require("startup.headers").hydra_header,
				highlight = "Statement",
				default_color = "",
				oldfiles_amount = 0,
			},
			quote = {
				type = "text",
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "Quote",
				margin = 5,
				content = require("startup.functions").quote(),
				highlight = "Constant",
				default_color = "",
				oldfiles_amount = 0,
			},
			clock = {
				type = "text",
				content = function()
					local clock = " " .. os.date("%H:%M")
					local date = " " .. os.date("%d-%m-%y")
					return { clock, date }
				end,
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "",
				margin = 5,
				highlight = "TSString",
				default_color = "#FFFFFF",
				oldfiles_amount = 10,
			},
			files = {
				type = "mapping",
				content = {
					{
						" Recent Files",
						"lua require('telescope').extensions.recent_files.pick(require('telescope.themes').get_dropdown({sort_lastused=1,previewer=false}))",
						"<leader>b",
					},
					{ " Find File", "Telescope find_files", "<c-p>" },
				},
				oldfiles_directory = false,
				align = "center",
				title = "Mapping",
				margin = 5,
				highlight = "TSString",
				default_color = "#FFFFFF",
				oldfiles_amount = 10,
			},
			parts = {
				"hydra",
				"quote",
				"files",
				"clock",
			},
		})
	end,
}
