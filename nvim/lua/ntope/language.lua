local mapper = function(mode, key, result)
	vim.api.nvim_buf_set_keymap(0, mode, key, result, { noremap = true, silent = true })
end

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
local function stat()
	return lsp_status.status()
end

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
	inactive_sections = {
		lualine_x = { "progress" },
	},
	options = {
		theme = "nightfox",
		-- globalstatus = true,
	},
})

local my_attach = function(client)
	lsp_status.on_attach(client)
	mapper("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
	mapper("n", "td", "<cmd>Lspsaga peek_type_definition<CR>")
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
-- local null_ls = require("null-ls")
-- null_ls.setup({
--   on_attach = function(client, bufnr)
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = bufnr,
--       callback = function()
--         vim.lsp.buf.format({
--           async = false,
--           filter = function(c)
--             return c.name ~= "tsserver"
--           end,
--         })
--       end,
--     })
--   end,
--   sources = {
--     -- cargo install stylua
--     null_ls.builtins.formatting.stylua,
--     null_ls.builtins.formatting.gofmt,
--     null_ls.builtins.formatting.autopep8,
--     null_ls.builtins.formatting.prettier.with({
--       filetypes = {
--         "markdown",
--         "json",
--         "yaml",
--       },
--     }),
--     null_ls.builtins.formatting.stylelint,
--   },
-- })

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
	settings = {
		stylelintplus = {
			autoFixOnFormat = true,
		},
	},
})

require("lspconfig").tailwindcss.setup({})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").cssls.setup({
	capabilities = capabilities,
	cmd = { "css-languageserver", "--stdio" },
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
