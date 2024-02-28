currently testing xfce4 on oryx.

yay -S xfce4
(accept default which is all)

change .xinitrc to:
exec startxfce4

logout and startx again

## settings manager:

keyboard: remove all shortcuts
Session and startup:

- current session: set panel, xfwm and desktop to start never and hit save session
- application autostart: add bspwm on login

## But why

application defaults
dbus startup
keyring is hard!
gives more consistent settings
