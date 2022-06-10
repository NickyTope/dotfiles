## Arch linux config

requirements:

```
sudo pacman -S alacritty bspwm dunst picom polybar rofi sxhkd git base-devel cmake zsh
```

setup.sh (run from this dir) creates symlinks in ~/.config

### xorg

```
sudo pacman -S xorg-server xorg-xsetroot xorg-xinit xorg-xbacklight xorg-setxkbmap xorg-xrdb xorg-xinput xorg-xprop xorg-xrandr xorg-utils xorg-server-utils xdotool xclip
```

### yay (pacman aur helper)

```
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

### gpu / cpu

- nvidia settings, smi
- amdgpu
- amd / intel ucode

### neovim - install from source

```
git clone https://github.com/neovim/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

### apps

- clipster
- firefox-developer-edition
- nautilus
- feh
- ponymix
- pulseaudio
- alsa-utils
- arandr
- lxappearance
- gnome-tweaks
- openssh
- zip / unzip
- nvm
- docker
- python / pip
- font manager
- inkscape
- gimp
- archlinux-keyring
- gnome-keyring
- colorpicker
- maim
- i3lock-fancy-multimonitor
- meld
- lazygit
- mpv
- remmina

### fonts

- adobe-source-code-pro-fonts
- cantarell-fonts
- nerd-fonts-hermit
- nerd-fonts-inconsolata
- nerd-fonts-jetbrains-mono
- nerd-fonts-mononoki
- nerd-fonts-roboto-mono
- noto-fonts-lite
- otf-nerd-fonts-fira-code
- ttf-borg-sans-mono
- ttf-carlito
- ttf-cutive-mono
- ttf-dejavu
- ttf-droid
- ttf-font-awesome
- ttf-hack
- ttf-haeck
- ttf-ibm-plex
- ttf-impallari-dancing-script
- ttf-liberation
- ttf-lilex
- ttf-roboto
- ttf-roboto-mono
- ttf-twemoji
