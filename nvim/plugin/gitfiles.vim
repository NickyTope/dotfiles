if exists('g:loaded_gitfiles')
  finish
endif

function! gitfiles#list()

  let s:buf = nvim_create_buf(v:false, v:true)
  let width = nvim_win_get_width(nvim_get_current_win()) - 10
  let height = &lines - 12
  let opts = {
    \ 'style': 'minimal',
    \ 'relative': 'win',
    \ 'width': width,
    \ 'height': height,
    \ 'row': 3,
    \ 'col': 5,
  \}
  let s:rel = expand('%:p:h')
  let s:win = nvim_open_win(s:buf, v:true, opts)

  syn match GitTitle =^].*$=

  call execute("lcd ". s:rel)
  call execute("read !git ls-files")
  call execute("norm gg")
  call gitfiles#title()
  nmap <buffer> <silent> <Esc> :call gitfiles#close()<cr>
  nmap <buffer> <silent> - :call gitfiles#up()<cr>
  nmap <buffer> <silent>  :call gitfiles#go("")<cr>
  nmap <buffer> <silent> <c-v> :call gitfiles#go("vsplit")<cr>
endfunction

function! gitfiles#up()
  " check ft first ??
  call execute("lcd ..")
  let s:rel = fnamemodify(s:rel, ":h")
  call execute("norm ggdG")
  call execute("read !git ls-files")
  call execute("norm gg")
  call gitfiles#title()
endfunction

function gitfiles#title()
  let parts = split(s:rel, "/")
  if len(parts) > 3
    let parts = parts[-3:]
  endif
  let path = join(parts, " > ")
  if path == "."
    let path = "(".expand("%:h:t").")"
  endif
  call append(0, "]   ".path."   [")
endfunction

function! gitfiles#go(where)
  let file = s:rel . '/' . nvim_get_current_line()
  call gitfiles#close()
  if a:where != ""
    execute(a:where . " " . file)
  else
    echo file
    execute("edit ".file)
  endif
endfunction

function! gitfiles#close()
  if exists('s:win')
    call execute("close " . s:win)
  endif
endfunction

noremap <silent> <Plug>(gitfiles) :call gitfiles#list()<cr>
hi link GitTitle Search

let g:loaded_gitfiles = 1
