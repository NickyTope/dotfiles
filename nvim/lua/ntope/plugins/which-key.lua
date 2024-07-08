return {

	{
		"folke/which-key.nvim",
		config = function()
			vim.g.mapleader = " "
			local wk = require("which-key")

			local cmd = function(txt)
				return "<cmd>" .. txt .. "<CR>"
			end

			local builtin = require("telescope.builtin")
			local extensions = require("telescope").extensions

			local symbols = function()
				builtin.symbols({ sources = { "kaomoji", "gitmoji" } })
			end

			local diag = function()
				builtin.diagnostics(require("telescope.themes").get_ivy({
					previewer = false,
				}))
			end

			local format_slowly = function()
				vim.lsp.buf.format({
					filter = function(c)
						return c.name ~= "tsserver"
					end,
					timeout_ms = 4000,
					async = true,
				})
			end

			local toggle_name = function()
				require("ntope.showfilename").toggle()
			end

			local buffers = function()
				extensions.recent_files.pick(require("telescope.themes").get_dropdown({
					sort_lastused = 1,
					ignore_current_buffer = 1,
					previewer = false,
				}))
			end

			local clear_hidden_buffers = function()
				require("close_buffers").delete({ type = "hidden", force = true })
			end

			local jump = function(count)
				return function()
					vim.diagnostic.jump({ count = count })
				end
			end

			wk.register({
				g = {
					d = { builtin.lsp_definitions, "Goto Definition" },
					t = { builtin.lsp_type_definitions, "Goto Type Definition" },
					["<Enter>"] = { cmd("vsp | lua vim.lsp.buf.definition()"), "Goto def in split" },
				},
				["<leader>"] = {
					["<leader>"] = { cmd("b#"), "Previous file" },
					["<Enter>"] = { cmd("vsp #"), "Split previous file" },
					["<Esc>"] = { cmd("noh"), "Remove hl" },
					["<"] = { cmd("set foldmethod=syntax"), "fold by syntax" },
					[">"] = { "za", "toggle fold" },
					b = { buffers, "Buffer list" },
					["BD"] = { clear_hidden_buffers, "Clear hidden buffer" },
					c = { cmd("!zenity --color-selection --color='\\#<cword>'"), "preview color" },
					e = { cmd("e"), "Reload file" },
					f = { builtin.live_grep, "Find in files" },
					F = { builtin.grep_string, "Find word" },
					g = {
						name = "Git",
						s = { cmd("G|18wincmd_"), "Git status" },
						l = { cmd("Glog"), "Git log" },
						f = { cmd("Git fetch"), "Git fetch" },
						r = { cmd("Git rebase"), "Git rebase" },
						p = { cmd("Git push"), "Git push" },
						b = { cmd("GitBlameToggle"), "Toggle inline blame" },
						B = { cmd("Git blame"), "Git blame" },
						h = { cmd("GBrowse"), "Git browse" },
						g = { builtin.git_commits, "git commits" },
					},
					i = { toggle_name, "Info (showfilename)" },
					j = { "J", "join lines" },
					l = {
						name = "LSP",
						r = { builtin.lsp_references, "References" },
						n = {
							cmd("Lspsaga rename ++project"),
							"Rename (in project)",
						},
						d = { diag, "Diagnostix" },
						h = { vim.lsp.buf.hover, "Hover (doc)" },
						l = { vim.diagnostic.open_float, "Diagnostic float" },
						s = { vim.lsp.buf.signature_help, "Signature Help" },
						-- t = { telescope.lsp_type_definitions, "Type def" },
						t = { cmd("TSC"), "TypeScript Check" },
					},
					n = { jump(1), "Next error" },
					N = { jump(-1), "Prev error" },
					["mp"] = { cmd("silent !zathura /tmp/preview.pdf &"), "Open preview in Zathura" },
					["rn"] = {
						vim.lsp.buf.rename,
						"Rename var",
					},
					p = { format_slowly, "Format file" },
					q = {
						name = "Quickfix",
						q = { builtin.quickfix, "Telescope QF" },
						n = { cmd("cn"), "Next QF item" },
						b = { cmd("cb"), "Prev QF item" },
						c = { cmd("cclo"), "Close QF" },
						o = { cmd("copen"), "Open QF" },
					},
					r = {
						name = "Replace",
						n = { vim.lsp.buf.rename, "Rename var" },
					},
					t = { builtin.builtin, "Telescope builtin" },
					T = { builtin.resume, "Telescope resume" },
					w = {
						name = "word operations",
						y = { symbols, "Symbols" },
						s = { '"syiw:%s!\\(<c-r>s\\)!\\1', "substitute word" },
						S = { '"syiW:%s!\\(<c-r>s\\)!\\1', "substitute WORD" },
						g = { '"gyiw:g/<c-r>g/norm ', "operate on lines containing word" },
						G = { '"gyiW:g/<c-r>g/norm ', "operate on lines containing WORD" },
					},
					W = { "<c-w>=", "even window ratio" },
					u = {
						h = { cmd("UndotreeShow") .. cmd("UndotreeFocus"), "Undo tree" },
					},
					v = { '"+p', "Paste system clip" },
					y = { extensions.neoclip.default, "Yank list" },
				},
			})
		end,
	},
}
