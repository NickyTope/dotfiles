let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/code/kudos-boards-core/kudos-boards-webfront
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +3 Dockerfile
badd +34 ~/code/kudos-boards-core/kudos-user-service/.env
badd +1 ~/Downloads/boards-cp.yaml
badd +134 src/boards/Provider/ConnectionsSSOHeader.js
badd +69 src/boards/Board/Kanban/KanbanBoard.jsx
badd +57 src/boards/Node/components/Description.js
badd +38 src/boards/Boards/BoardsLive.js
badd +124 src/boards/Node/NodeActions.js
badd +37 src/boards/Node/NodeLive.js
badd +213 src/boards/Node/NodeReducer.js
badd +4 src/boards/Board/Timeline/util/State.js
badd +44 src/boards/Board/Timeline/util/DayHover.js
badd +4 src/boards/Board/components/ActiveNode.js
badd +20 src/boards/Board/Timeline/DayHeader.js
badd +27 src/stores/Store.js
badd +96 src/boards/Node/components/RichTextEditor.js
badd +128 src/boards/Node/components/Toolbar.js
badd +32 src/util/CordovaController.js
badd +52 src/util/popup.js
badd +62 src/micro/Login/Login.js
badd +45 src/boards/Window/WindowReducer.js
badd +45 src/boards/Node/CommentActions.js
badd +100 src/components/Toasts.js
badd +23 src/boards/User/TNCDialog.jsx
badd +8 src/App.scss
badd +26 src/boards/User/UserMenu.js
argglobal
%argdel
edit src/boards/User/UserMenu.js
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 311 - ((40 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
311
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0&& getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOF
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
