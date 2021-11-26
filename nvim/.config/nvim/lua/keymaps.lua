vim.g.mapleader = " "
local wk = require("which-key")

local cmd = function(txt)
	return "<cmd>" .. txt .. "<CR>"
end

local telescope = require("telescope.builtin")

wk.register({
	["<leader>"] = {
		o = { cmd("e ."), "Project root" },
		e = { cmd("e"), "Reload file" },
		["<leader>"] = { cmd("b#"), "Previous file" },
		n = { vim.lsp.diagnostic.goto_next, "Next error" },
		N = { vim.lsp.diagnostic.goto_prev, "Prev error" },
		["rn"] = {
			vim.lsp.buf.rename,
			"Rename var",
		},
		p = { vim.lsp.buf.formatting, "Format file" },
		-- ["ca"] = {vim.lsp.buf.code_action, "Code Action"},
		-- ["cg"] = {vim.lsp.buf.code_lens, "Code Lens"},
		l = {
			name = "LSP",
			r = { telescope.lsp_references, "References" },
			n = {
				vim.lsp.buf.rename,
				"Rename var",
			},
			d = { vim.lsp.buf.definition, "Definition" },
			a = { vim.lsp.buf.code_action, "Code Action" },
			l = { vim.lsp.buf.code_lens, "Code Lens" },
			s = { vim.lsp.buf.signature_help, "Signature Help" },
		},
		f = { telescope.live_grep, "Find in files" },
		F = { telescope.grep_string, "Find word" },
		b = { telescope.buffers, "Buffer list" },
		i = { telescope.oldfiles, "Old files" },
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
		["<Esc>"] = { cmd("noh"), "Remove hl" },
		g = {
			name = "Git",
			s = { cmd("G"), "Git status" },
			l = { cmd("Glog"), "Git log" },
			f = { cmd("Git fetch"), "Git fetch" },
			r = { cmd("Git rebase"), "Git rebase" },
			p = { cmd("Git push"), "Git push" },
			b = { cmd("Git blame"), "Git blame" },
			h = { cmd("GBrowse"), "Git browse" },
		},
		["uh"] = { cmd("UndotreeShow") .. cmd("UndotreeFocus"), "Undo tree" },
	},
})

local map = function(mode, key, result, opts)
	vim.api.nvim_set_keymap(mode, key, result, opts)
end

local nmap = function(key, result, opts)
	map("n", key, result, opts)
end

local imap = function(key, result, opts)
	map("i", key, result, opts)
end

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
nmap("<c-y>", "<Plug>(Yanks)", {})

map("", "<c-_>", cmd("Commentary"), {})

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
vim.cmd([[ nnoremap _ :vsp <c-r>=expand("%:.:h")<cr><cr> ]])
vim.cmd([[ nmap gx :silent execute "!xdg-open " . shellescape("<cWORD>")<CR> ]])