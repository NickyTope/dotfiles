-- show current file in float
-- vim.defer_fn(function()
-- 	vim.cmd([[
--     autocmd BufEnter * lua require'ntope.showfilename'.show()
--     ]])
-- end, 50)

vim.cmd([[
au BufNewFile,BufRead *Jenkinsfile* set syntax=groovy
au BufNewFile,BufRead *html.mustache set ft=html
au BufNewFile,BufRead *.conf set ft=nginx
au BufNewFile,BufRead *.yuck set ft=lisp
au BufWritePost *.md silent !pandoc -o /tmp/preview.pdf %
" vimwiki uses - to decrease header level
]])
-- au BufEnter *.md nmap <buffer> - <Plug>(dirvish_up)

vim.cmd([[
autocmd FileType scss setlocal commentstring=/*\ %s\ */
]])
