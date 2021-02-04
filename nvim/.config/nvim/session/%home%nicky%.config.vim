let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +105 ~/code/dotfiles/nvim/.config/nvim/init.vim
badd +65 ~/code/dotfiles/nvim/.config/nvim/lua/setup.lua
badd +186 /usr/local/share/nvim/runtime/doc/provider.txt
badd +113 ~/.zshrc
badd +572 ~/code/dotfiles/kitty/.config/kitty/kitty.conf
badd +6 ~/code/dotfiles/polybar/.config/polybar/fonts.ini
badd +37 ~/code/dotfiles/bspwm/.config/bspwm/bspwmrc
badd +167 ~/code/dotfiles/sxhkd/.config/sxhkd/sxhkdrc
badd +4 ~/code/dotfiles/nvim/.config/nvim/coc-settings.json
badd +3 ~/code/dotfiles/polybar/.config/polybar/scripts/screenlayout.sh
badd +4 ~/.screenlayout/home.sh
badd +8 ~/.screenlayout/laptop-only.sh
badd +10 ~/.oh-my-zsh/custom/example.zsh
badd +1 ~/.oh-my-zsh/custom/plugins/example/example.plugin.zsh
badd +26 ~/code/dotfiles/dunst/.config/dunst/dunstrc
badd +64 ~/.zoom/logs/zoom_stdout_stderr.log
badd +1 ~/code/dotfiles/bspwm/.config/bspwm/monitors.sh
badd +1 ~/code/dotfiles/bspwm/.config/bspwm/multi-monitor.sh
badd +8 ~/code/dotfiles/bspwm/.config/bspwm/monitor_detect.sh
badd +56 ~/.xinitrc
badd +1 ~/.oh-my-zsh/oh-my-zsh.sh
badd +2 ~/code/dotfiles/rofi/.config/rofi/config.rasi
badd +31 ~/code/dotfiles/rofi/.config/rofi/nord.rasi
badd +4843 /usr/local/share/nvim/runtime/doc/syntax.txt
badd +1 ~/code/dotfiles/nvim/.config/nvim/session/\%home\%nicky\%code\%kudos-boards-core.vim
badd +43 ~/code/dotfiles/nvim/.config/nvim/session/\%home\%nicky\%code\%kudos-boards-core\%kudos-boards-webfront.vim
badd +2 ~/.mozilla/firefox/profiles.ini
badd +3 ~/.mozilla/firefox/qq1v0437.dev-edition-default/chrome/userChrome.css
badd +14 fontconfig/fonts.conf
badd +10 ~/code/dotfiles/polybar/.config/polybar/launch.sh
badd +13 ~/code/dotfiles/polybar/.config/polybar/config.ini
badd +3 ~/code/dotfiles/bspwm/.config/bspwm/pause-dunst.sh
badd +0 ~/code/dotfiles/bspwm/.config/bspwm/get_phrase.sh
argglobal
%argdel
edit ~/code/dotfiles/bspwm/.config/bspwm/pause-dunst.sh
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 105 + 158) / 316)
exe 'vert 2resize ' . ((&columns * 105 + 158) / 316)
exe 'vert 3resize ' . ((&columns * 104 + 158) / 316)
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
let s:l = 7 - ((6 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
7
normal! 0
wincmd w
argglobal
if bufexists("~/code/dotfiles/bspwm/.config/bspwm/get_phrase.sh") | buffer ~/code/dotfiles/bspwm/.config/bspwm/get_phrase.sh | else | edit ~/code/dotfiles/bspwm/.config/bspwm/get_phrase.sh | endif
if &buftype ==# 'terminal'
  silent file ~/code/dotfiles/bspwm/.config/bspwm/get_phrase.sh
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
let s:l = 1 - ((0 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
if bufexists("~/code/dotfiles/sxhkd/.config/sxhkd/sxhkdrc") | buffer ~/code/dotfiles/sxhkd/.config/sxhkd/sxhkdrc | else | edit ~/code/dotfiles/sxhkd/.config/sxhkd/sxhkdrc | endif
if &buftype ==# 'terminal'
  silent file ~/code/dotfiles/sxhkd/.config/sxhkd/sxhkdrc
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
let s:l = 169 - ((39 * winheight(0) + 40) / 80)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
169
normal! 06|
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 105 + 158) / 316)
exe 'vert 2resize ' . ((&columns * 105 + 158) / 316)
exe 'vert 3resize ' . ((&columns * 104 + 158) / 316)
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
