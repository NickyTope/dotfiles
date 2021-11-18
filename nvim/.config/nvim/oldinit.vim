au BufNewFile,BufRead *Jenkinsfile* set syntax=groovy
au BufNewFile,BufRead *html.mustache set ft=html
au BufNewFile,BufRead *.conf set ft=nginx

function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction

" vim-dirvish
if !exists("dirvish_setup")
  au FileType dirvish call CustomDirvishSetup()
  let dirvish_setup = 1
  hi link DirvishTitle Search
endif

function! CustomDirvishSetup()
  " let parts = split(expand("%:.:h"), "/")
  " let preparts = []
  " if len(parts) > 3
  "   call add(preparts, "(")
  "   for part in parts[0:-4]
  "     call add(preparts, part[0])
  "   endfor
  "   call add(preparts, ") ")
  "   let parts = parts[-3:]
  " endif
  " let path = join(preparts, "").join(parts, " > ")
  " if path == "."
  "   let path = "(".expand("%:h:t").")"
  " endif
  " call append(0, "]   ".path."   [")
  " syn match DirvishTitle =^].*$=
  setlocal conceallevel=2
  map <buffer> ma :e %
  map <buffer> mf :Mkdir %
  map <buffer> mc yy:!cp " "
  map <buffer> mm yy:!mv " "
  map <buffer> md yy:!rm "
  map <buffer> <c-v> :call dirvish#open("vsplit", 0)<cr>
  map <buffer> <c-p> <cmd>lua require'telescope.builtin'.find_files{search_dirs={vim.fn.expand('%')}}<cr>
endfunction

let g:dirvish_git_indicators = {
\ 'Modified'  : '✹',
\ 'Staged'    : '✚',
\ 'Untracked' : '✭',
\ 'Renamed'   : '➜',
\ 'Unmerged'  : '═',
\ 'Ignored'   : '☒',
\ 'Unknown'   : '?'
\ }

" vimwiki uses - to decrease header level
au BufEnter *.md nmap <buffer> - <Plug>(dirvish_up)

" vimwiki
let g:vimwiki_folding = 'list'
let g:vimwiki_ext2syntax = {'.wiki': 'media'}
let g:vimwiki_key_mappings = { 'table_mappings': 0, }

" prosession
let g:prosession_dir = '~/.config/nvim/session/'

" closetag (auto close xml tags)
let g:closetag_filenames = "*.html,*.jsx,*.tsx,*.vue,*.xhml,*.xml"
let g:closetag_regions = {
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ 'javascript.jsx': 'jsxRegion',
  \ }

" indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd guibg=none
hi IndentGuidesEven guibg=#3C3836

" ulti snips
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"

" vim-move
let g:move_key_modifier = 'S'

" vim-rest-console
let g:vrc_curl_opts = {
  \ '--connect-timeout' : 5,
  \ '-s': '',
  \ '-i': '',
  \ '--max-time': 20,
  \ '--ipv4': '',
  \ '-k': '',
\}
