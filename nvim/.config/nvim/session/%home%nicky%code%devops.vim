let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/code/devops
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +51 ~/code/devops/boards/production.yaml
badd +25 ~/code/devops/boards/production-kudos.yaml
badd +55 ~/code/devops/boards-aio/docker-compose-local.yml
badd +154 ~/code/devops/boards/dev.yaml
badd +14 ~/code/devops/local-utils/proxy/local_proxy.conf
badd +1 ~/code/devops/boards/dev6.yaml
badd +1 ~/code/devops/em-share/roles/docker-deploy/tasks/main.yml
badd +1 ~/code/devops/em-share/roles/docker-deploy/files/config.json
badd +2 ~/code/devops/em-share/roles/emshare/templates/nginx.conf.j2
badd +1 ~/code/devops/em-share/roles/emshare/templates/docker-compose.yml.j2
badd +30 ~/code/devops/boards-aio/nginx.conf.local
badd +1 ~/code/devops/boards-aio/.env
badd +42 ~/code/devops/boards-aio/docker-compose.yml
badd +63 ~/code/devops/boards-aio/nginx.conf
argglobal
%argdel
edit ~/code/devops/boards/production.yaml
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 157 + 158) / 316)
exe 'vert 2resize ' . ((&columns * 158 + 158) / 316)
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
let s:l = 119 - ((10 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
119
normal! 0
wincmd w
argglobal
if bufexists("~/code/devops/local-utils/proxy/local_proxy.conf") | buffer ~/code/devops/local-utils/proxy/local_proxy.conf | else | edit ~/code/devops/local-utils/proxy/local_proxy.conf | endif
if &buftype ==# 'terminal'
  silent file ~/code/devops/local-utils/proxy/local_proxy.conf
endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 18 - ((10 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 03|
wincmd w
exe 'vert 1resize ' . ((&columns * 157 + 158) / 316)
exe 'vert 2resize ' . ((&columns * 158 + 158) / 316)
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
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
