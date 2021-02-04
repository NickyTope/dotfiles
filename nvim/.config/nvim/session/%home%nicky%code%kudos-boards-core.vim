let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/code/kudos-boards-core
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +4 kudos-boards-webfront/src/colors.scss
badd +333 kudos-user-service/src/models/User.js
badd +1 README.md
badd +16 .env
badd +67 package.json
badd +1 node_modules/kudos-common/package.json
badd +18 src/live/socket.js
badd +1 src/routes/Nodes.routes.js
badd +1 kudos-boards-webfront/src/components/DialogCloseButton.jsx
badd +1 kudos-boards-webfront/src/components/Divider.jsx
badd +1 kudos-boards-webfront/src/components/FlexMax.js
badd +1 kudos-boards-webfront/src/components/FlexMax.module.scss
badd +42 kudos-boards-webfront/src/components/Moveable.jsx
badd +1 .vim/.ropeproject/config.py
badd +1 kudos-boards-webfront/src/components/DialogProvider.js
badd +1 kudos-user-service/.dockerignore
badd +50 kudos-user-service/src/config/credentials.js
badd +88 src/config/index.js
badd +1 kudos-boards-webfront/src/icons/GlobalIcon.jsx
badd +2 kudos-boards-webfront/src/icons/ListIcon.jsx
badd +1 kudos-boards-webfront/node_modules/mdi-material-ui/Logout.d.ts
badd +1 kudos-boards-webfront/node_modules/mdi-material-ui/Logout.js
badd +1 kudos-boards-webfront/src/icons/BoardIcon.jsx
badd +1 kudos-boards-webfront/src/icons/DueIcon.jsx
badd +85 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Node/Node.jsx
badd +32 ~/code/kudos-boards-core/kudos-boards-webfront/src/boards/Node/NodeDialog.js
badd +83 ~/code/kudos-boards-core/src/index.js
badd +55 src/routes/Members.routes.js
badd +26 ~/code/kudos-boards-core/src/routes/../controllers/Members.controller.js
badd +4 ~/code/kudos-boards-core/api/powerautomate/microsoft-isvstudio-intro.md
badd +1 ~/code/kudos-boards-core/api/zapier/README.md
badd +1 ~/code/kudos-boards-core/api/zapier/index.js
badd +38 ~/code/kudos-boards-core/src/routes/user/Groups.routes.js
argglobal
%argdel
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
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
