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
