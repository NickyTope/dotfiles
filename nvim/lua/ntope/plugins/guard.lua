return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
	},
	config = function()
		local ft = require("guard.filetype")

		ft("lua"):fmt("stylua")
		ft("markdown"):fmt("prettier")
		ft("json"):fmt("prettier")
		ft("yaml"):fmt("prettier")
		ft("scss"):fmt("lsp")
		ft("css"):fmt("lsp")

		require("guard").setup({
			fmt_on_save = true,
			lsp_as_default_fomatter = false,
		})
	end,
}
