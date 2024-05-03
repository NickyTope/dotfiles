return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind-nvim",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		cmp.setup({
			sources = cmp.config.sources({
				{ name = "nvim_lua" },
				{ name = "nvim_lsp" },
				{ name = "path", max_item_count = 3 },
				{ name = "luasnip" },
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
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space"] = cmp.mapping.complete(),
				-- tab ?
				["<Enter>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"

					return kind
				end,
			},
			window = {
				completion = {
					col_offset = -3,
					side_padding = 0,
				},
			},
			view = {
				entries = {
					follow_cursor = true,
				},
			},
		})

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline", keyword_length = 3 },
			}),
		})
	end,
}
