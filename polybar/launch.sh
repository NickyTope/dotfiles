#!/usr/bin/env bash

killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar -c ~/.config/polybar/config.ini --reload top &
done

polybar main -c $(dirname $0)/config.ini --reload &
