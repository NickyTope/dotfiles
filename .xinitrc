#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

export HOSTNAME=$(cat /etc/hostname)
export QT_QPA_PLATFORMTHEME=qt5ct

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

~/.config/bspwm/monitor_detect.sh

xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
xset r rate 399 40
# eval $(dbus-update-activation-environment --all)
# eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

export XDG_CURRENT_DESKTOP=Gnome
export XDG_SESSION_DESKTOP=Gnome
export XDG_CONFIG_HOME=/home/nicky/.config
systemctl --user import-environment XDG_CURRENT_DESKTOP
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh


exec bspwm
