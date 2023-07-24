return {
	{
		"towolf/vim-helm",
	},
	{
		"mrjosh/helm-ls",
		event = "VeryLazy",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.helm_ls.setup({
				filetypes = { "helm" },
				cmd = { "helm_ls", "serve" },
			})
		end,
	},
}
