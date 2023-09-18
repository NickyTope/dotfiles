## Arch linux config

requirements:

arch basic install using python archinstall script
after install got to chroot and install iwd, dhcpcd and vi
systemctl enable iwd
systemctl enable dhcpcd

### Pipewire

sudo pacman -S pipewire pipewire-alsa pipewire-media-session pipewire-pulse pavucontrol

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

### keyring setup

```
sudo pacman -S gnome-keyring seahorse
```

/etc/pam.d/login:

```
#%PAM-1.0

auth       required     pam_securetty.so
auth       requisite    pam_nologin.so
auth       include      system-local-login
auth	   optional     pam_gnome_keyring.so
account    include      system-local-login
session    include      system-local-login
password   include      system-local-login
session    optional     pam_gnome_keyring.so auto_start
```

### system specific config

The following files have system specific config that may need customising
bspwm/bspwmrc
bspwm/desktops.sh
bspwm/monitor_detect.sh
bspwm/configbyhost.sh

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
- pass-otp
- passff-host
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
- ripgrep
- roficlip
- rofi-emoji

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
