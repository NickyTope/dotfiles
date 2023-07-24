return {
	"nvimdev/guard.nvim",
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
		})
	end,
}
