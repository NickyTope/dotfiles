-- show current file in float
vim.defer_fn(
  function()
    vim.cmd [[
    autocmd BufEnter * lua require'showfilename'.show()
    ]]
  end,
  50
)

vim.cmd [[
au BufNewFile,BufRead *Jenkinsfile* set syntax=groovy
au BufNewFile,BufRead *html.mustache set ft=html
au BufNewFile,BufRead *.conf set ft=nginx
" vimwiki uses - to decrease header level
au BufEnter *.md nmap <buffer> - <Plug>(dirvish_up)
]]

vim.cmd [[
if !exists("dirvish_setup")
  au FileType dirvish call CustomDirvishSetup()
  let dirvish_setup = 1
  hi link DirvishTitle Search
endif

function! CustomDirvishSetup()
  setlocal conceallevel=2
  map <buffer> ma :e %
  map <buffer> mf :Mkdir %
  map <buffer> mc yy:!cp " "
  map <buffer> mm yy:!mv " "
  map <buffer> md yy:!rm "
  map <buffer> <c-v> :call dirvish#open("vsplit", 0)<cr>
  map <buffer> <c-p> <cmd>lua require'telescope.builtin'.find_files{search_dirs={vim.fn.expand('%')}}<cr>
endfunction
]]
