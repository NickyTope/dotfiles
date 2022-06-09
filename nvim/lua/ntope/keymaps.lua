vim.g.mapleader = " "
local wk = require("which-key")

local cmd = function(txt)
	return "<cmd>" .. txt .. "<CR>"
end

local telescope = require("telescope.builtin")
local telescope_extensions = require("telescope").extensions
local trouble = require("trouble")

local diag = function()
	trouble.open("workspace_diagnostics")
end

local symbols = function()
	telescope.symbols({ sources = { "kaomoji", "gitmoji" } })
end

wk.register({
	["<leader>"] = {
		e = { cmd("e"), "Reload file" },
		["<leader>"] = { cmd("b#"), "Previous file" },
		n = { vim.diagnostic.goto_next, "Next error" },
		N = { vim.diagnostic.goto_prev, "Prev error" },
		h = { telescope.help_tags, "Vim help" },
		["mp"] = { cmd("silent !zathura /tmp/preview.pdf &"), "Open preview in Zathura" },
		["rn"] = {
			vim.lsp.buf.rename,
			"Rename var",
		},
		p = { vim.lsp.buf.format, "Format file" },
		l = {
			name = "LSP",
			r = { telescope.lsp_references, "References" },
			n = {
				vim.lsp.buf.rename,
				"Rename var",
			},
			d = { vim.lsp.buf.definition, "Definition" },
			h = { vim.lsp.buf.hover, "Hover (doc)" },
			a = { vim.lsp.buf.code_action, "Code Action" },
			s = { vim.lsp.buf.signature_help, "Signature Help" },
			w = { telescope.lsp_workspace_diagnostics, "Workspace Diagnostix" },
			t = { trouble.toggle, "Trouble Toggle" },
			T = { diag, "Trouble Diagnostix" },
		},
		f = { telescope.live_grep, "Find in files" },
		F = { telescope.grep_string, "Find word" },
		b = { telescope.buffers, "Buffer list" },
		i = { telescope.oldfiles, "Old files" },
		d = { telescope.diagnostics, "Diagnostix" },
		s = { symbols, "Symbols" },
		q = {
			name = "+quickfix",
			q = { telescope.quickfix, "Telescope QF" },
			n = { cmd("cn"), "Next QF item" },
			b = { cmd("cb"), "Prev QF item" },
			c = { cmd("cclo"), "Close QF" },
			o = { cmd("copen"), "Open QF" },
		},
		j = { "J", "join lines" },
		v = { '"+p', "Paste system clip" },
		y = { telescope_extensions.neoclip.default, "Yank list" },
		["<Esc>"] = { cmd("noh"), "Remove hl" },
		g = {
			name = "Git",
			s = { cmd("G"), "Git status" },
			l = { cmd("Glog"), "Git log" },
			f = { cmd("Git fetch"), "Git fetch" },
			r = { cmd("Git rebase"), "Git rebase" },
			p = { cmd("Git push"), "Git push" },
			b = { cmd("Git blame"), "Git blame" },
			B = { telescope.git_branches, "git branches" },
			h = { cmd("GBrowse"), "Git browse" },
			g = { telescope.git_commits, "git commits" },
		},
		["uh"] = { cmd("UndotreeShow") .. cmd("UndotreeFocus"), "Undo tree" },
	},
})

local map = vim.keymap.set

local nmap = function(key, result, opts)
	map("n", key, result, opts)
end

local imap = function(key, result, opts)
	map("i", key, result, opts)
end

map("n", "<c-h>", "<Plug>(CybuPrev)")
map("n", "<c-l>", "<Plug>(CybuNext)")

nmap("Q", cmd("q"), {})
nmap("Y", "yy", {})
-- nmap("x", '"_x', {})
-- nmap("<del>", '"_x', {})
nmap("<a-o>", "o<esc>", {})
nmap("<a-O>", "O<esc>", {})
nmap("gp", "'[v']", {})
nmap("<c-p>", cmd("Telescope git_files"), {})
nmap("{", cmd("keepjumps normal! {"), {})
nmap("}", cmd("keepjumps normal! }"), {})
nmap("<c-s>", cmd("w"), { silent = true })
nmap("-", cmd("NvimTreeFindFile"), {})

map("n", "<c-_>", cmd("lua require'Comment.api'.toggle_current_linewise_op()"))
map("x", "<c-_>", "<Esc>" .. cmd("lua require'Comment.api'.locked.toggle_linewise_op(vim.fn.visualmode())"))

-- window movement
map("", "<a-h>", cmd("wincmd h"), {})
map("", "<a-j>", cmd("wincmd j"), {})
map("", "<a-k>", cmd("wincmd k"), {})
map("", "<a-l>", cmd("wincmd l"), {})

imap("<F6>", "h", {})
imap("<c-s>", "<esc>" .. cmd("w"), { silent = true })
imap("jk", "<esc>", {})
imap("kj", "<esc>", {})

map("v", "cp", '"+y', {})
map("v", "<c-c>", '"+y', {})

-- no idea how to port these, let's just cmd them
-- vim.cmd([[ nnoremap _ :vsp <c-r>=expand("%:.:h")<cr><cr> ]])
vim.cmd([[ nmap gx :silent execute "!xdg-open " . shellescape("<cWORD>")<CR> ]])
