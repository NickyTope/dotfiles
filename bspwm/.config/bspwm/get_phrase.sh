#!/bin/sh
xclip /tmp/quote -selection clipboard
sleep 0.2
xdotool key --clearmodifiers "ctrl+v"
~/.config/bspwm/get_phrase.py &
