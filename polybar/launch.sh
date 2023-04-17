#!/usr/bin/env bash

killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
big=$(xrandr --listmonitors | grep 5120/ | wc -l)

for m in $(polybar --list-monitors | cut -d":" -f1); do
  if [ "$big" == "0" ]; then
    MONITOR=$m polybar -c ~/.config/polybar/config.ini --reload top &
    MONITOR=$m polybar -c ~/.config/polybar/config.ini --reload topright &
  else
    MONITOR=$m polybar -c ~/.config/polybar/config.ini --reload middle &
  fi
done

polybar main -c $(dirname $0)/config.ini --reload &
