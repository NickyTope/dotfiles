let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/code/dotfiles/nvim/.config/nvim/lua/ntope/tree.lua
badd +2 ~/code/dotfiles/nvim/.config/nvim/lua/ntope/cmp-config.lua
badd +41 ~/code/dotfiles/nvim/.config/nvim/plugin/gitfiles.vim
badd +107 ~/code/dotfiles/nvim/.config/nvim/lua/ntope/keymaps.lua
badd +4 ~/code/dotfiles/nvim/.config/nvim/lua/ntope/neoclip_setup.lua
badd +97 ~/code/dotfiles/nvim/.config/nvim/lua/ntope/plugins.lua
badd +1 ~/code/dotfiles/nvim/.config/nvim/lua/ntope/mkdn.lua
badd +1 ~/code/dotfiles/nvim/.config/nvim/init.lua
badd +97 ~/code/dotfiles/nvim/.config/nvim/lua/ntope/snippets.lua
badd +9 ~/code/dotfiles/bspwm/.config/bspwm/monitor_detect.sh
badd +1 ~/code/dotfiles/bspwm/.config/bspwm/desktops.sh
badd +49 ~/code/dotfiles/nvim/.config/nvim/lua/ntope/settings.lua
badd +19 ~/code/dotfiles/nvim/.config/nvim/lua/ntope/nvim-gomove.lua
badd +9 ~/code/dotfiles/polybar/.config/polybar/launch.sh
badd +1 ~/.config/polybar/config.ini
badd +7 ~/code/dotfiles/polybar/.config/polybar/include-modules.ini
badd +24 ~/code/dotfiles/polybar/.config/polybar/colors.ini
badd +5 ~/code/dotfiles/polybar/.config/polybar/modules/round-left.ini
badd +6 ~/code/dotfiles/polybar/.config/polybar/fonts.ini
badd +5 ~/code/dotfiles/polybar/.config/polybar/modules/angle-left.ini
badd +4 ~/code/dotfiles/polybar/.config/polybar/modules/angle-right.ini
badd +1 ~/code/dotfiles/polybar/.config/polybar/modules/round-right.ini
badd +7 ~/code/dotfiles/polybar/.config/polybar/modules/bspwm.ini
badd +20 ~/code/dotfiles/polybar/.config/polybar/modules/bspwm-mode.ini
badd +60 ~/code/dotfiles/polybar/.config/polybar/modules/battery.ini
badd +33 ~/code/dotfiles/polybar/.config/polybar/modules/cpu.ini
badd +9 ~/code/dotfiles/polybar/.config/polybar/modules/date.ini
badd +1 ~/code/dotfiles/polybar/.config/polybar/modules/margin.ini
badd +31 ~/code/dotfiles/polybar/.config/polybar/modules/memory.ini
badd +14 ~/code/dotfiles/polybar/.config/polybar/modules/pulseaudio.ini
badd +46 ~/code/dotfiles/alacritty/.config/alacritty/alacritty.yml
badd +3 ~/code/dotfiles/dunst/.config/dunst/dunstrc
badd +1 ~/code/dotfiles/dunst/.config/dunst/gruvbox.ini
badd +39 ~/code/dotfiles/bspwm/.config/bspwm/bspwmrc
badd +159 ~/code/dotfiles/rofi/.config/rofi/config.rasi
badd +1 ~/code/dotfiles/rofi/.config/rofi/gruvbox-dark.rasi
badd +8 ~/code/dotfiles/rofi/.config/rofi/nightfox.rasi
badd +202 ~/.config/river/init
badd +24 ~/.config/waybar/config
badd +66 ~/.config/waybar/style.css
badd +12 ~/.config/bspwm/external_rules.sh
badd +57 ~/code/dotfiles/sxhkd/.config/sxhkd/sxhkdrc
badd +4 ~/.config/river/bg.sh
badd +1 ~/code/dotfiles/bspwm/.config/bspwm/getnew.sh
badd +4 ~/code/dotfiles/bspwm/.config/bspwm/setwall.sh
badd +1 ~/.azotebg
badd +1 ~/.config/kanshi/config
badd +21 ~/.config/eww/eww.yuck
badd +82 ~/.config/sway/config
badd +124 ~/.zshrc
badd +2 ~/.config/azote/azoterc
badd +150 ~/code/dotfiles/picom/.config/picom/picom.conf
badd +62 ~/.xinitrc
badd +313 ~/.config/awesome/rc.lua
badd +138 ~/code/dotfiles/nvim/.config/nvim/lua/ntope/language.lua
badd +11 ~/code/dotfiles/.git/index
argglobal
%argdel
edit ~/.zshrc
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt ~/code/dotfiles/nvim/.config/nvim/lua/ntope/language.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 134 - ((10 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 134
normal! 030|
wincmd w
argglobal
if bufexists(fnamemodify("~/code/dotfiles/nvim/.config/nvim/init.lua", ":p")) | buffer ~/code/dotfiles/nvim/.config/nvim/init.lua | else | edit ~/code/dotfiles/nvim/.config/nvim/init.lua | endif
if &buftype ==# 'terminal'
  silent file ~/code/dotfiles/nvim/.config/nvim/init.lua
endif
balt ~/code/dotfiles/nvim/.config/nvim/lua/ntope/mkdn.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/code/dotfiles/.git/index", ":p")) | buffer ~/code/dotfiles/.git/index | else | edit ~/code/dotfiles/.git/index | endif
if &buftype ==# 'terminal'
  silent file ~/code/dotfiles/.git/index
endif
balt ~/code/dotfiles/nvim/.config/nvim/lua/ntope/language.lua
setlocal fdm=manual
setlocal fde=0
setlocal fmr=<<<<<<<<,>>>>>>>>
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 3 - ((2 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 0
wincmd w
3wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
