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

local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		mappings = {
			i = {
				["<C-x>"] = false,
				["<esc>"] = actions.close,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
})
require("telescope").load_extension("ui-select")

local my_attach = function(client)
	lsp_status.on_attach(client)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition)
	vim.keymap.set("n", "td", vim.lsp.buf.type_definition)
end

require("lspconfig").eslint.setup({
	settings = {
		packageManager = "yarn",
	},
	on_attach = function(client, bufnr)
		my_attach(client)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
})

require("lspconfig").groovyls.setup({
	cmd = { "docker", "run", "--rm", "-ia", "stdin", "-ia", "stderr", "-ia", "stdout", "glsp" },
})

require("lspconfig").tsserver.setup({
	on_attach = my_attach,
})

require("lspconfig").cssmodules_ls.setup({
	-- provide your on_attach to bind keymappings
	on_attach = my_attach,
	-- optionally
	init_options = {
		camelCase = "dashes",
	},
})

-- local sumneko_install = "/home/nicky/apps/lua-language-server/"
require("lspconfig").lua_ls.setup({
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

require("lspconfig").dockerls.setup({ on_attach = my_attach })
require("lspconfig").vimls.setup({ on_attach = my_attach })
require("lspconfig").stylelint_lsp.setup({
	filetypes = { "css", "scss" },
	settings = {
		stylelintplus = {
			autoFixOnFormat = true,
		},
	},
})

require("lspconfig").tailwindcss.setup({
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

require("lspconfig").jsonls.setup({
	on_attach = my_attach,
	cmd = { "vscode-json-languageserver", "--stdio" },
})

require("lspconfig").yamlls.setup({
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

require("lspconfig").gopls.setup({
	on_attach = function(client)
		my_attach(client)
	end,
})

-- pip install 'python-lsp-server[all]'
require("lspconfig").pylsp.setup({
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
