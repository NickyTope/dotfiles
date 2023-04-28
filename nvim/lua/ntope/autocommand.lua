vim.cmd([[
au BufNewFile,BufRead *Jenkinsfile* set syntax=groovy
au BufNewFile,BufRead *html.mustache set ft=html
au BufNewFile,BufRead *.conf set ft=nginx
au BufNewFile,BufRead *.yuck set ft=lisp
au BufNewFile,BufRead dunstrc set ft=dosini
au BufWritePost *.md silent !pandoc -o /tmp/preview.pdf %
]])

vim.cmd([[
autocmd FileType scss setlocal commentstring=/*\ %s\ */
]])

local grp = vim.api.nvim_create_augroup("highlight_yank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
  group = grp,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400 })
  end,
})
