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

			wk.add({
				{ "gd", builtin.lsp_definitions, desc = "Goto Definition" },
				{ "gt", builtin.lsp_type_definitions, desc = "Goto Type Definition" },
				{ "g<Enter>", cmd("vsp | lua vim.lsp.buf.definition()"), desc = "Goto def in split" },
				{ "<leader><leader>", cmd("b#"), desc = "Previous file" },
				{ "<leader><Enter>", cmd("vsp #"), desc = "Split previous file" },
				{ "<leader><Esc>", cmd("noh"), desc = "Remove hl" },
				{ "<leader><", cmd("set foldmethod=syntax"), desc = "fold by syntax" },
				{ "<leader>>", "za", desc = "toggle fold" },
				{ "<leader>b", buffers, desc = "Buffer list" },
				{ "<leader>BD", clear_hidden_buffers, desc = "Clear hidden buffer" },
				{ "<leader>c", cmd("!zenity --color-selection --color='\\#<cword>'"), desc = "preview color" },
				{ "<leader>e", cmd("e"), desc = "Reload file" },
				{ "<leader>f", builtin.live_grep, desc = "Find in files" },
				{ "<leader>F", builtin.grep_string, desc = "Find word" },
				{ "<leader>g", group = "Git" },
				{ "<leader>gl", cmd("Glog"), desc = "Git log" },
				{ "<leader>gf", cmd("Git fetch"), desc = "Git fetch" },
				{ "<leader>gr", cmd("Git rebase"), desc = "Git rebase" },
				{ "<leader>gp", cmd("Git push"), desc = "Git push" },
				{ "<leader>gb", cmd("GitBlameToggle"), desc = "Toggle inline blame" },
				{ "<leader>gB", cmd("Git blame"), desc = "Git blame" },
				{ "<leader>gg", builtin.git_commits, desc = "git commits" },
				{ "<leader>i", toggle_name, desc = "Info (showfilename)" },
				{ "<leader>j", "J", desc = "join lines" },
				{ "<leader>l", group = "LSP" },
				{ "<leader>lr", builtin.lsp_references, desc = "References" },
				{
					"<leader>ln",
					cmd("Lspsaga rename ++project"),
					desc = "Rename (in project)",
				},
				{ "<leader>ld", diag, desc = "Diagnostix" },
				{ "<leader>lh", vim.lsp.buf.hover, desc = "Hover (doc)" },
				{ "<leader>ll", vim.diagnostic.open_float, desc = "Diagnostic float" },
				{ "<leader>ls", vim.lsp.buf.signature_help, desc = "Signature Help" },
				{ "<leader>lt", cmd("TSC"), desc = "TypeScript Check" },
				{ "<leader>n", jump(1), desc = "Next error" },
				{ "<leader>N", jump(-1), desc = "Prev error" },
				{ "<leader>mp", cmd("silent !zathura /tmp/preview.pdf &"), desc = "Open preview in Zathura" },
				{ "<leader>rn", vim.lsp.buf.rename, desc = "Rename var" },
				{ "<leader>p", format_slowly, desc = "Format file" },
				{ "<leader>q", group = "Quickfix" },
				{ "<leader>qq", builtin.quickfix, desc = "Telescope QF" },
				{ "<leader>qn", cmd("cn"), desc = "Next QF item" },
				{ "<leader>qb", cmd("cb"), desc = "Prev QF item" },
				{ "<leader>qc", cmd("cclo"), desc = "Close QF" },
				{ "<leader>qo", cmd("copen"), desc = "Open QF" },
				{ "<leader>rn", vim.lsp.buf.rename, desc = "Rename var" },
				{ "<leader>t", builtin.builtin, desc = "Telescope builtin" },
				{ "<leader>T", builtin.resume, desc = "Telescope resume" },
				{ "<leader>w", group = "word operations" },
				{ "<leader>wy", symbols, desc = "Symbols" },
				{ "<leader>ws", '"syiw:%s!\\(<c-r>s\\)!\\1', desc = "substitute word" },
				{ "<leader>wS", '"syiW:%s!\\(<c-r>s\\)!\\1', desc = "substitute WORD" },
				{ "<leader>wg", '"gyiw:g/<c-r>g/norm ', desc = "operate on lines containing word" },
				{ "<leader>wG", '"gyiW:g/<c-r>g/norm ', desc = "operate on lines containing WORD" },
				{ "<leader>W", "<c-w>=", desc = "even window ratio" },
				{ "<leader>v", '"+p', desc = "Paste system clip" },
				{ "<leader>y", extensions.neoclip.default, desc = "Yank list" },
			})
		end,
	},
}
