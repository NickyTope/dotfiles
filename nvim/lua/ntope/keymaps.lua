local telescope = require("telescope.builtin")

local cmd = function(txt)
	return "<cmd>" .. txt .. "<CR>"
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

nmap("Q", cmd("q"), {})
nmap("Y", "yy", {})
nmap("<a-o>", "o<esc>", {})
nmap("<a-O>", "O<esc>", {})
nmap("gp", "'[v']", {})
nmap("<c-p>", find_files, {})
nmap("{", cmd("keepjumps normal! {"), {})
nmap("}", cmd("keepjumps normal! }"), {})
nmap("<c-s>", cmd("w"), { silent = true })
-- nmap("-", cmd("Neotree source=filesystem reveal=true position=left action=focus"), {})
nmap("<c-Space>", cmd("lua require'ntope.complete'.toggle()"), {})

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

vim.cmd([[
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-N><C-w>h
  tnoremap <A-j> <C-\><C-N><C-w>j
  tnoremap <A-k> <C-\><C-N><C-w>k
  tnoremap <A-l> <C-\><C-N><C-w>l
]])
