#!/bin/bash

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --output eDP-1-1 --mode 3000x2000 --pos 0x0

home=$(xrandr | grep "DP-1-1-2 connected" | wc -l)
work=$(xrandr | grep "DP-1-1-8 connected" | wc -l)
second=$(xrandr | grep "DP-1-1-1 connected" | wc -l)
intel=$(xrandr | grep "eDP-1 connected" | wc -l)

xrandr --output DP-1-1-1 --off --output DP-1-1-2 --off --output DP-1-1-8 --off

if [ "$intel" == "1" ]
then
  notify-send "warning, using intel gpu" -i /usr/share/icons/breeze-dark/status/32/dialog-warning.svg -u critical
fi

if [ "$home" == "1" ]
then
  echo "welcome home"
  xrandr --output DP-1-1-1 --mode 2560x1440 --right-of eDP-1-1 --rotate normal
  xrandr --output DP-1-1-2 --mode 2560x1440 --right-of DP-1-1-1 --rotate normal
elif [ "$work" == "1" ]
then
  echo "ugh, work"
  xrandr --output DP-1-1-8 --mode 2560x1440 --right-of eDP-1-1 --rotate normal
  xrandr --output DP-1-1-1 --mode 2560x1440 --right-of DP-1-1-8 --rotate normal
elif [ "$second" == "1" ]
then
  echo "activating second monitor"
  xrandr --output DP-1-1-1 --mode 2560x1440 --right-of eDP-1-1 --rotate normal
fi

