if exists('g:loaded_yanklist')
  finish
endif

let s:yanks = []
let s:before = 0

function! yanks#list()
  if len(s:yanks) < 1
    echo "no yanks to show"
    return
  endif
  let s:buf = nvim_create_buf(v:false, v:true)
  " let width = nvim_win_get_width(nvim_get_current_win()) - 20
  let opts = {
    \ 'style': 'minimal',
    \ 'relative': 'cursor',
    \ 'width': 100,
    \ 'height': len(s:yanks),
    \ 'row': 0,
    \ 'col': 1,
  \}
  let out = nvim_buf_set_lines(s:buf, 0, 0, v:false, s:yanks)
  let s:win = nvim_open_win(s:buf, v:true, opts)
  set ft=yanks
  syn match YankLine /.*[[:cntrl:]]$/
  syn match YankWord /.*[[:print:]]$/
  nmap <buffer> <silent> <Esc> :call yanks#close()<cr>
  nmap <buffer> <silent>  :call yanks#put()<cr>
  nmap <buffer> <silent> P :call yanks#putafter()<cr>
endfunction

function! yanks#put()
  call setreg('"', s:yanks[line(".") - 1])
  call yanks#close()
  normal! ""p
endfunction

function! yanks#putafter()
  call setreg('"', s:yanks[line(".") - 1])
  call yanks#close()
  normal! ""P
endfunction

function! yanks#close()
  if exists('s:win')
    call execute("close " . s:win)
  endif
endfunction

function! yanks#add()
  let yank = getreg('"')
  if len(yank) < 3
    return
  endif
  call filter(s:yanks, 'v:val != yank')
  call insert(s:yanks, yank)
  if len(s:yanks) > 25
    call remove(s:yanks, -1)
  endif
endfunction

augroup Yanks
  autocmd!
  autocmd TextYankPost * call yanks#add()
  hi link YankLine Search
  hi link YankWord DiffAdd
augroup END

noremap <silent> <Plug>(Yanks) :call yanks#list()<cr>

let g:loaded_yanklist = 1
