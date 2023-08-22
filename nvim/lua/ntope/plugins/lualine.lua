return {
	{
		"hoob3rt/lualine.nvim",
		config = function()
			local function recording()
				local reg = vim.fn.reg_recording()
				if reg == "" then
					return ""
				else
					return "rec @" .. reg
				end
			end

			local function search()
				if vim.v.hlsearch == 1 then
					local ok, count = pcall(vim.fn.searchcount)
					if ok and count["total"] > 0 then
						return "🔎 " .. count["current"] .. "/" .. count["total"]
					end
				end
				return ""
			end
			local function stat()
				return require("lsp-status").status()
			end
			local palette = require("nightfox.palette").load("nightfox")

			require("lualine").setup({
				sections = {
					lualine_b = { "diff", "branch" },
					lualine_c = { "filename" },
					lualine_x = {
						recording,
						search,
						"filetype",
					},
					lualine_y = { stat },
					lualine_z = { "progress" },
				},
				winbar = {
					lualine_c = {
						{
							"filetype",
							icon_only = true,
							colored = true,
							separator = { left = "", right = "" },
						},
						{
							"filename",
							color = { fg = palette.blue.bright, gui = "italic" },
						},
					},
					lualine_z = { "fileformat" },
				},
				inactive_winbar = {
					lualine_c = {
						{
							"filetype",
							icon_only = true,
							colored = true,
							separator = { left = "", right = "" },
							color = { fg = palette.blue.dim, gui = "italic" },
						},
						{
							"filename",
							color = { gui = "italic" },
						},
					},
				},
				inactive_sections = {
					lualine_x = { "progress" },
				},
				options = {
					theme = "nightfox",
					globalstatus = true,
				},
			})
		end,
	},
}
