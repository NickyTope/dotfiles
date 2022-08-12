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
au BufNewFile,BufRead dunstrc set ft=dosini
au BufWritePost *.md silent !pandoc -o /tmp/preview.pdf %
" vimwiki uses - to decrease header level
]])
-- au BufEnter *.md nmap <buffer> - <Plug>(dirvish_up)

vim.cmd([[
autocmd FileType scss setlocal commentstring=/*\ %s\ */
]])

local function format()
  local clients = vim.lsp.buf_get_clients();
  if #clients > 0 then
    vim.lsp.buf.format({
      async = false,
      filter = function(c) return c.name ~= 'tsserver' end,
      timeout_ms = 4000
    })
  end
end

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = format
})
