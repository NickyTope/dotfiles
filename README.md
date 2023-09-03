## Arch linux config

requirements:

arch basic install using python archinstall script
after install got to chroot and install iwd, dhcpcd and vi
systemctl enable iwd
systemctl enable dhcpcd

### Pipewire
sudo pacman -S pipewire pipewire-alsa pipewire-media-session pipewire-pulse

### volume

```
sudo pacman -S alacritty bspwm dunst picom polybar rofi sxhkd git base-devel cmake zsh
```

// This doesnt work
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
- nemo
- feh
- alsa-utils
- arandr
- lxappearance
- gnome-tweaks
- openssh
- pass
- zip / unzip
- jq
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
- fileroller
- i3lock-fancy-multimonitor
- meld
- lazygit
- mpv
- remmina
- eww
- wezterm

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
