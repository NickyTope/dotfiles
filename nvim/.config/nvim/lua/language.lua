local mapper = function(mode, key, result)
	vim.api.nvim_buf_set_keymap(0, mode, key, result, { noremap = true, silent = true })
end

require("renamer").setup({})

local icons = require("icons")

local lsp_status = require("lsp-status")
lsp_status.config({
	indicator_errors = icons.error,
	indicator_warnings = icons.warning,
	indicator_info = icons.info,
	indicator_hint = icons.hint,
	indicator_ok = icons.ok,
	status_symbol = "",
})
lsp_status.register_progress()
local function stat()
	return lsp_status.status()
end

require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = false,
	},
})

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

require("lualine").setup({
	sections = {
		lualine_a = {
			{
				"mode",
				format = function(mode_name)
					return mode_name:sub(1, 1)
				end,
			},
		},
		lualine_b = { "diff", "branch" },
		lualine_x = { "filetype" },
		lualine_y = { stat },
		lualine_z = { "progress" },
	},
	inactive_sections = {
		lualine_x = { "progress" },
	},
	options = {
		theme = "gruvbox",
	},
})

local my_attach = function(client)
	-- require "completion".on_attach(client)
	lsp_status.on_attach(client)
	mapper("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end
end

local null = require("null-ls")
null.config({
	sources = {
		-- cargo install stylua
		null.builtins.formatting.stylua,
		null.builtins.diagnostics.eslint_d.with({
			prefer_local = "node_modules/.bin",
		}),
		null.builtins.code_actions.eslint_d.with({
			prefer_local = "node_modules/.bin",
		}),
		null.builtins.formatting.eslint_d.with({
			prefer_local = "node_modules/.bin",
		}),
		null.builtins.formatting.autopep8,
		null.builtins.formatting.prettier.with({
			filetypes = {
				"markdown",
				"json",
				"yaml",
			},
		}),
		null.builtins.formatting.stylelint,
	},
})

require("lspconfig")["null-ls"].setup({
	on_attach = my_attach,
})

require("lspconfig").tsserver.setup({
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		local ts_utils = require("nvim-lsp-ts-utils")

		ts_utils.setup_client(client)
		my_attach(client)

		-- no default maps, so you may want to define some here
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rf", ":TSLspRenameFile<CR>", { silent = true })
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gi", ":TSLspImportAll<CR>", { silent = true })
	end,
})

local sumneko_install = "/home/nicky/apps/lua-language-server/"

require("lspconfig").sumneko_lua.setup({
	on_attach = my_attach,
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	cmd = { sumneko_install .. "bin/Linux/lua-language-server", "-E", sumneko_install .. "main.lua" },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

require("lspconfig").dockerls.setup({ on_attach = my_attach })
require("lspconfig").vimls.setup({ on_attach = my_attach })
require("lspconfig").stylelint_lsp.setup({
	on_attach = my_attach,
	filetypes = { "css", "scss" },
})
require("lspconfig").cssls.setup({
	on_attach = my_attach,
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	debug = true,
	cmd = { "css-languageserver", "--stdio" },
})

require("lspconfig").jsonls.setup({
	on_attach = my_attach,
	cmd = { "vscode-json-languageserver", "--stdio" },
})

require("lspconfig").yamlls.setup({ on_attach = my_attach })

-- pip install 'python-lsp-server[all]'
require("lspconfig").pylsp.setup({ on_attach = my_attach })

local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path", max_item_count = 3 },
		{ name = "vsnip" },
		{
			name = "buffer",
			keyword_length = 4,
			get_bufnrs = function()
				local bufs = {}
				for _, win in ipairs(vim.api.nvim_list_wins()) do
					bufs[vim.api.nvim_win_get_buf(win)] = true
				end
				return vim.tbl_keys(bufs)
			end,
		},
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
	mapping = {
		["<C-Space"] = cmp.mapping.complete(),
		-- tab ?
		["<Enter>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
})
