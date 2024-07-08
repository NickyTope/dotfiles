return {
	{
		"towolf/vim-helm",
		ft = "helm",
	},
	{
		"mrjosh/helm-ls",
		ft = "helm",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.helm_ls.setup({
				filetypes = { "helm" },
				cmd = { "helm_ls", "serve" },
			})
		end,
	},
}
