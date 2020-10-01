if exists('g:loaded_bufferlist')
  finish
endif

let g:__buffers_last_accessed = {}

function! buffers#sort(b1, b2)
  if a:b1['flagged'] != a:b2['flagged']
    return a:b2['flagged'] - a:b1['flagged']
  endif
  if a:b1['pfile'] != a:b2['pfile']
    return a:b2['pfile'] - a:b1['pfile']
  endif
  if a:b1['mod'] != a:b2['mod']
    return a:b2['mod'] - a:b1['mod']
  endif
  let b1 = get(g:__buffers_last_accessed, a:b1['buf'], a:b1['buf'])
  let b2 = get(g:__buffers_last_accessed, a:b2['buf'], a:b2['buf'])
  return b1 < b2 ? 1 : -1
endfunction

function! buffers#format(b)
  return printf('%s %s%s %s', a:b['buf'], a:b['flag'], a:b['mod'], a:b['name'])
endfunction

function! buffers#pad(b, len)
  let w = strdisplaywidth(a:b)
  if w < a:len
    return a:b.repeat(' ', a:len - w) 
  else
    return a:b
  endif
endfunction

function! buffers#flag(b)
  if a:b == bufnr('')
    return '%'
  elseif a:b == bufnr('#')
    return '#'
  elseif nvim_buf_is_loaded(a:b)
    return 'h'
  endif
  return ' '
endfunction

function! buffers#list()
  let s:buffers = []
  for buf in range(1,bufnr('$'))
    if buflisted(buf)
      let path = bufname(buf)
      let name = fnamemodify(path, ":p:.")
      let flag = buffers#flag(buf)
      let info = {
        \ 'buf': buffers#pad(buf, strdisplaywidth(bufnr('$'))),
        \ 'name': name,
        \ 'pfile': name[0] != "/",
        \ 'mod': getbufvar(buf, '&modified') ? '+' : ' ',
        \ 'flag': flag,
        \ 'flagged': flag != ' '
      \}
      call insert(s:buffers, info)
    endif
  endfor

  call sort(s:buffers, 'buffers#sort')
  call map(s:buffers, {_, b -> buffers#format(b)})

  let s:buf = nvim_create_buf(v:false, v:true)
  let width = nvim_win_get_width(nvim_get_current_win()) - 10
  let height = &lines - 12
  if height > len(s:buffers)
    let height = len(s:buffers)
  endif
  let opts = {
    \ 'style': 'minimal',
    \ 'relative': 'win',
    \ 'width': width,
    \ 'height': height,
    \ 'row': 3,
    \ 'col': 5,
  \}
  let out = nvim_buf_set_lines(s:buf, 0, 0, v:false, s:buffers)
  let s:win = nvim_open_win(s:buf, v:true, opts)
  nmap <buffer> <silent> <Esc> :call buffers#close()<cr>
  nmap <buffer> <silent>  :call buffers#go("")<cr>
  nmap <buffer> <silent> <c-v> :call buffers#go("vsplit")<cr>
endfunction

function! buffers#go(where)
  let line = nvim_get_current_line()
  let buf = matchstr(line, '^\d*')
  call buffers#close()
  if a:where != ""
    execute(a:where . " " . bufname(str2nr(buf)))
  else
    execute("b".buf)
  endif
endfunction

function! buffers#close()
  if exists('s:win')
    call execute("close " . s:win)
  endif
endfunction

" function! buffers#save()
"   call writefile([ json_encode(g:__buffers_last_accessed) ], expand( s:cachefile ), "b")
" endfunction

noremap <silent> <Plug>(buffers) :call buffers#list()<cr>

" let s:cachefile = '~/.cache/vimbuffers.json'
" if filereadable(expand(s:cachefile))
"   let cache = readfile(expand(s:cachefile))
"   if !empty(cache)
"     echo cache[0]
"     let g:__buffers_last_accessed = json_decode(cache[0])
"   endif
" endif

augroup Buffers
  autocmd!
  autocmd BufEnter * let g:__buffers_last_accessed[bufnr('')] = reltimefloat(reltime())
  " autocmd VimLeave call buffers#save()
augroup END

let g:loaded_bufferlist = 1
