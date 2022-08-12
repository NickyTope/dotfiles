#!/bin/bash


big=$(xrandr --listmonitors | grep 5120/ | wc -l)

if [ "$big" == "1" ]
then
  feh --randomize --bg-scale ~/Pictures/walls/uwide
else
  feh --randomize --bg-fill ~/Pictures/walls/current
  ~/.config/bspwm/getnew.sh &
fi


