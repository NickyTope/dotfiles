vim.cmd([[
au BufNewFile,BufRead *Jenkinsfile* set syntax=groovy
au BufNewFile,BufRead *html.mustache set ft=html
au BufNewFile,BufRead *.conf set ft=nginx
au BufNewFile,BufRead *.yuck set ft=lisp
au BufNewFile,BufRead dunstrc set ft=dosini
au BufWritePost *.md silent !pandoc -o /tmp/preview.pdf %
autocmd BufRead,BufNewFile */templates/*.yml,*/templates/*.tpl,*.gotmpl,helmfile*.yml set ft=helm
]])

-- zmk
vim.cmd([[
au BufNewFile,BufRead *.keymap set syntax=dts
au BufNewFile,BufRead *.overlay set syntax=dts
]])

vim.cmd([[
autocmd FileType scss setlocal commentstring=/*\ %s\ */
]])

local yank_group = vim.api.nvim_create_augroup("highlight_yank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400 })
	end,
})
