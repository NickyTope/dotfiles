vim.g.mapleader = " "
local wk = require("which-key")

local cmd = function(txt)
	return "<cmd>" .. txt .. "<CR>"
end

local telescope = require("telescope.builtin")
local telescope_extensions = require("telescope").extensions

local symbols = function()
	telescope.symbols({ sources = { "kaomoji", "gitmoji" } })
end

local diag = function()
	telescope.diagnostics(require("telescope.themes").get_ivy({
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

local find_files = function()
	local git_ls_files = function()
		telescope.git_files(require("telescope.themes").get_dropdown({
			previewer = false,
			width = 0.5,
			results_height = 15,
		}))
	end
	local rg_files = function()
		telescope.find_files(require("telescope.themes").get_dropdown({
			previewer = false,
			winblend = 10,
			width = 0.5,
			results_height = 15,
		}))
	end
	if not pcall(git_ls_files) then
		rg_files()
	end
end

local toggle_name = function()
	require("ntope.showfilename").toggle()
end

local spectre_replace = function(select_word)
	return function()
		require("spectre").open_visual({ select_word = select_word })
	end
end

-- local diagnostic = function(forward)
-- 	return function()
-- 		if forward then
-- 			vim.diagnostic.goto_next()
-- 		else
-- 			vim.diagnostic.goto_prev()
-- 		end
-- 		vim.lsp.buf.code_action()
-- 	end
-- end

local clear_hidden_buffers = function()
	require("close_buffers").delete({ type = "hidden", force = true })
end

wk.register({
	g = {
		d = { vim.lsp.buf.definition, "Goto Definition" },
		["<Enter>"] = { cmd("vsp | lua vim.lsp.buf.definition()"), "Goto def in split" },
	},
	["<leader>"] = {
		["<leader>"] = { cmd("b#"), "Previous file" },
		["<Enter>"] = { cmd("vsp #"), "Split previous file" },
		["<Esc>"] = { cmd("noh"), "Remove hl" },
		b = { cmd("Neotree source=buffers reveal=true position=left action=focus"), "Buffer list" },
		["BD"] = { clear_hidden_buffers, "Clear hidden buffer" },
		c = { cmd("!zenity --color-selection --color='\\#<cword>'"), "preview color" },
		e = { cmd("e"), "Reload file" },
		f = { telescope.live_grep, "Find in files" },
		F = { telescope.grep_string, "Find word" },
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
			g = { telescope.git_commits, "git commits" },
			-- d = goto definition (defined in language.lua when lsp client connects)
			-- t = goto type definition (defined in language.lua when lsp client connects)
		},
		i = { toggle_name, "Info (showfilename)" },
		j = { "J", "join lines" },
		l = {
			name = "LSP",
			r = { telescope.lsp_references, "References" },
			n = {
				cmd("Lspsaga rename ++project"),
				"Rename (in project)",
			},
			d = { diag, "Diagnostix" },
			h = { vim.lsp.buf.hover, "Hover (doc)" },
			l = { vim.diagnostic.open_float, "Diagnostic float" },
			-- a = { cmd("Lspsaga code_action"), "Code Action" },
			-- a = { vim.lsp.buf.code_action, "Code Action" },
			a = { cmd("CodeActionMenu"), "Code Action" },
			s = { vim.lsp.buf.signature_help, "Signature Help" },
			t = { telescope.lsp_type_definitions, "Type def" },
		},
		-- n = { cmd("Lspsaga diagnostic_jump_next"), "Next error" },
		-- N = { cmd("Lspsaga diagnostic_jump_prev"), "Prev error" },
		n = { vim.diagnostic.goto_next, "Next error" },
		N = { vim.diagnostic.goto_prev, "Prev error" },
		["mp"] = { cmd("silent !zathura /tmp/preview.pdf &"), "Open preview in Zathura" },
		["rn"] = {
			vim.lsp.buf.rename,
			"Rename var",
		},
		o = { cmd("Neotree toggle"), "Toggle tree" },
		p = { format_slowly, "Format file" },
		q = {
			name = "Quickfix",
			q = { telescope.quickfix, "Telescope QF" },
			n = { cmd("cn"), "Next QF item" },
			b = { cmd("cb"), "Prev QF item" },
			c = { cmd("cclo"), "Close QF" },
			o = { cmd("copen"), "Open QF" },
		},
		r = {
			name = "Replace",
			n = { vim.lsp.buf.rename, "Rename var" },
			r = { spectre_replace(false), "Find and Replace" },
			R = { spectre_replace(true), "Current word replace" },
		},
		t = { telescope.builtin, "Telescope builtin" },
		T = { telescope.resume, "Telescope resume" },
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
		y = { telescope_extensions.neoclip.default, "Yank list" },
	},
})

local map = vim.keymap.set

local nmap = function(key, result, opts)
	map("n", key, result, opts)
end

local imap = function(key, result, opts)
	map("i", key, result, opts)
end

vim.keymap.set("i", "<c-l>", function()
	vim.lsp.buf.signature_help()
end)

-- local focus_file = function()
-- 	require("nvim-tree.api").tree.find_file({
-- 		open = true,
-- 		focus = true,
-- 	})
-- end

nmap("Q", cmd("q"), {})
nmap("Y", "yy", {})
-- nmap("x", '"_x', {})
-- nmap("<del>", '"_x', {})
nmap("<a-o>", "o<esc>", {})
nmap("<a-O>", "O<esc>", {})
nmap("gp", "'[v']", {})
nmap("<c-p>", find_files, {})
nmap("{", cmd("keepjumps normal! {"), {})
nmap("}", cmd("keepjumps normal! }"), {})
nmap("<c-s>", cmd("w"), { silent = true })
nmap("-", cmd("Neotree source=filesystem reveal=true position=left action=focus"), {})
nmap("<c-Space>", cmd("lua require'ntope.complete'.toggle()"), {})

-- use gc maps instead !!
-- map("n", "<c-_>", cmd("lua require'Comment.api'.toggle.linewise.current()"))
-- map("x", "<c-_>", "<Esc>" .. cmd("lua require'Comment.api'.locked.toggle.linewise.current(vim.fn.visualmode())"))

-- window movement
map("", "<a-h>", cmd("wincmd h"), {})
map("", "<a-j>", cmd("wincmd j"), {})
map("", "<a-k>", cmd("wincmd k"), {})
map("", "<a-l>", cmd("wincmd l"), {})

imap("<F6>", "h", {})
imap("<c-s>", "<esc>" .. cmd("w"), { silent = true })
imap("jk", "<esc>", {})
imap("kj", "<esc>", {})

map("v", "Y", '"+y', {})
map("v", "<c-c>", '"+y', {})
map("v", "<leader>g", '"gy:g/<c-r>g/norm ', {})
map("v", "<leader>s", '"sy:%s!\\(<c-r>s\\)!<c-r>s', {})

-- no idea how to port these, let's just cmd them
vim.cmd([[ nmap gx :silent execute "!xdg-open " . shellescape("<cWORD>")<CR> ]])

vim.cmd([[
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-N><C-w>h
  tnoremap <A-j> <C-\><C-N><C-w>j
  tnoremap <A-k> <C-\><C-N><C-w>k
  tnoremap <A-l> <C-\><C-N><C-w>l
]])
