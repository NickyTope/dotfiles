vim.g.mapleader = " "
local nest = require("nest")
local wk = require("which-key")

local cmd = function(txt)
	return "<cmd>" .. txt .. "<CR>"
end

local telescope = require("telescope.builtin")

vim.cmd([[ nnoremap _ :vsp <c-r>=expand("%:.:h")<cr><cr> ]])
vim.cmd([[ nnoremap <c-p> <cmd>lua require'telescope.builtin'.git_files{cwd=vim.fn.expand('%:h')}<cr> ]])
vim.cmd([[ nmap gx :silent execute "!xdg-open " . shellescape("<cWORD>")<CR> ]])

wk.register({
	["<leader>"] = {
		o = { cmd("e ."), "Project root" },
		e = { cmd("e"), "Reload file" },
		["<leader>"] = { cmd("b#"), "Previous file" },
		n = { vim.lsp.diagnostic.goto_next, "Next error" },
		N = { vim.lsp.diagnostic.goto_prev, "Prev error" },
		["rn"] = {
			function()
				require("renamer").rename()
			end,
			"Rename var",
		},
		p = { cmd("Format"), "Format file" },
		-- ["ca"] = {vim.lsp.buf.code_action, "Code Action"},
		-- ["cg"] = {vim.lsp.buf.code_lens, "Code Lens"},
		l = {
			name = "LSP",
			r = { telescope.lsp_references, "References" },
			n = {
				function()
					require("renamer").rename()
				end,
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

nest.applyKeymaps({
	-- random things
	{ "Q", cmd("q") },
	{ "<A-o", "o<Esc>" },
	{ "<A-O", "O<Esc>" },
	{ "<Del>", '"_x' },
	{ "x", '"_x' },
	{ "gp", "'[v']" },
	{ "Y", "yy" },
	{ "<c-p>", telescope.git_files },
	{ "}", cmd("keepjumps normal! }") },
	{ "{", cmd("keepjumps normal! {") },
	{ "<c-s>", "<Esc>:w<CR>", mode = "ni", options = { silent = true } },
	{ "<c-y>", "<Plug>(Yanks)" },
	-- c-/ == c-_
	{ "<c-_>", cmd("Commentary") },
	-- window movement
	{
		mode = "tn",
		{ "<a-h>", cmd("wincmd h") },
		{ "<a-j>", cmd("wincmd j") },
		{ "<a-k>", cmd("wincmd k") },
		{ "<a-l>", cmd("wincmd l") },
	},
	{
		mode = "i",
		{
			{ "jk", "<Esc>" },
			{ "kj", "<Esc>" },
			{ "<F6>", "h" },
		},
	},
	{
		mode = "v",
		{
			{ "<c-c>", '"+y' },
			{ "cp", '"+y' },
		},
	},
})
