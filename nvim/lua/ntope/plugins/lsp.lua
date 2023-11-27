return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"nvim-lua/lsp-status.nvim",
	},

	config = function()
		local icons = require("ntope.icons")

		local lsp_status = require("lsp-status")
		lsp_status.config({
			indicator_errors = icons.error,
			indicator_warnings = icons.warning,
			indicator_info = icons.info,
			indicator_hint = icons.hint,
			indicator_ok = icons.ok,
		})
		lsp_status.register_progress()

		local my_attach = function(client)
			lsp_status.on_attach(client)
			vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
			-- vim.keymap.set("n", "td", require("telescope.builtin").lsp_type_definitions)
			-- vim.keymap.set("n", "td", vim.lsp.buf.type_definition)
		end

		local lsp = require("lspconfig")

		lsp.eslint.setup({
			on_attach = function(client, bufnr)
				my_attach(client)
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "EslintFixAll",
				})
			end,
		})

		lsp.groovyls.setup({
			cmd = { "docker", "run", "--rm", "-ia", "stdin", "-ia", "stderr", "-ia", "stdout", "glsp" },
		})

		lsp.tsserver.setup({
			on_attach = my_attach,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		lsp.emmet_ls.setup({
			on_attach = my_attach,
			filetypes = {
				"css",
				"eruby",
				"html",
				"javascript",
				"javascriptreact",
				"less",
				"sass",
				"scss",
				"svelte",
				"pug",
				"typescriptreact",
				"vue",
			},
			init_options = {
				html = {
					options = {
						-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
						["bem.enabled"] = true,
					},
				},
			},
		})

		lsp.cssmodules_ls.setup({
			-- provide your on_attach to bind keymappings
			on_attach = my_attach,
			-- optionally
			init_options = {
				camelCase = "dashes",
			},
		})

		-- local sumneko_install = "/home/nicky/apps/lua-language-server/"
		lsp.lua_ls.setup({
			on_attach = my_attach,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})

		lsp.dockerls.setup({ on_attach = my_attach })
		lsp.vimls.setup({ on_attach = my_attach })
		lsp.stylelint_lsp.setup({
			filetypes = { "css", "scss" },
			settings = {
				stylelintplus = {
					autoFixOnFormat = true,
				},
			},
		})

		lsp.tailwindcss.setup({
			filetypes = {
				-- "aspnetcorerazor",
				-- "astro",
				-- "astro-markdown",
				-- "blade",
				-- "clojure",
				-- "django-html",
				-- "htmldjango",
				-- "edge",
				-- "eelixir",
				-- "elixir",
				-- "ejs",
				-- "erb",
				-- "eruby",
				-- "gohtml",
				-- "haml",
				-- "handlebars",
				-- "hbs",
				-- "html",
				-- "html-eex",
				-- "heex",
				-- "jade",
				-- "leaf",
				-- "liquid",
				-- "markdown",
				-- "mdx",
				-- "mustache",
				-- "njk",
				-- "nunjucks",
				-- "php",
				-- "razor",
				-- "slim",
				-- "twig",
				-- "css",
				-- "less",
				-- "postcss",
				-- "sass",
				-- "scss",
				-- "stylus",
				-- "sugarss",
				-- "javascript",
				-- "javascriptreact",
				-- "reason",
				-- "rescript",
				-- "typescript",
				"typescriptreact",
				-- "vue",
				-- "svelte",
			},
		})

		lsp.jsonls.setup({
			on_attach = my_attach,
			cmd = { "vscode-json-languageserver", "--stdio" },
		})

		lsp.yamlls.setup({
			on_attach = my_attach,
			filetypes = { "yaml" },
			autostart = false,
			settings = {
				redhat = { telemetry = { enabled = false } },
				yaml = {
					keyOrdering = false,
				},
			},
		})

		lsp.gopls.setup({
			on_attach = function(client)
				my_attach(client)
			end,
		})

		-- pip install 'python-lsp-server[all]'
		lsp.pylsp.setup({
			on_attach = function(client)
				my_attach(client)
			end,
		})

		-- local config = vim.diagnostic.config()
		-- config.underline = true
		-- -- config.virtual_text = false
		-- config.virtual_text = {
		-- 	-- spacing = 2,
		-- 	-- prefix = "<",
		-- 	severity = {
		-- 		min = vim.diagnostic.severity.INFO,
		-- 	},
		-- }
		-- rim.diagnostic.config(config)
	end,
}
