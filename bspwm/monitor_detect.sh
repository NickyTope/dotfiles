#!/bin/bash

if [ "$HOSTNAME" == "nt-arch-sfc" ]; then

  xrandr --setprovideroutputsource modesetting NVIDIA-0
  xrandr --newmode "2400x1600_60"  326.00  2400 2584 2840 3280  1600 1603 1613 1658 -hsync +vsync
  xrandr --addmode eDP-1-1 2400x1600_60
  xrandr --output eDP-1-1 --mode 2400x1600_60 --pos 0x0

  home=$(xrandr | grep "DP-1-1-2 connected" | wc -l)
  work=$(xrandr | grep "DP-1-1-8 connected" | wc -l)
  dock=$(xrandr | grep "DP-1-1-2-8 connected" | wc -l)
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
    xrandr --output DP-1-1-1 --mode 2560x1440 --pos 0x0 --rotate normal
    xrandr --output DP-1-1-2 --mode 2560x1440 --right-of DP-1-1-1 --rotate normal
    xrandr --output eDP-1-1 --mode 2400x1600_60 --pos 1540x1440
  elif [ "$work" == "1" ]
  then
    echo "ugh, work"
    xrandr --output DP-1-1-8 --mode 2560x1440 --pos 0x0 --rotate normal
    xrandr --output DP-1-1-1 --mode 2560x1440 --right-of DP-1-1-8 --rotate normal
    xrandr --output eDP-1-1 --mode 2400x1600_60 --pos 1540x1440
  elif [ "$dock" == "1" ]
  then
    echo "docked"
    xrandr --output DP-1-1-1 --mode 2560x1440 --right-of eDP-1-1 --rotate normal
    xrandr --output DP-1-1-2-8 --mode 2560x1440 --right-of DP-1-1-1 --rotate normal
    xrandr --output eDP-1-1 --mode 2400x1600_60 --pos 1540x1440
  elif [ "$second" == "1" ]
  then
    echo "activating second monitor"
    xrandr --output DP-1-1-1 --mode 2560x1440 --right-of eDP-1-1 --rotate normal
  fi

fi

if [ "$HOSTNAME" == "miniarch" ]; then

  readarray -t monitors <<<$(xrandr --listmonitors | grep "+" | awk '{ print $4 }')
  count=${#monitors[@]}

  [ "$count" -eq "1" ] && return

  dp0=$(xrandr --listmonitors | grep "DisplayPort-0" | wc -l)
  dp1=$(xrandr --listmonitors | grep "DisplayPort-1" | wc -l)
  dp2=$(xrandr --listmonitors | grep "DisplayPort-2" | wc -l)
  dp3=$(xrandr --listmonitors | grep "DisplayPort-3" | wc -l)
  dp4=$(xrandr --listmonitors | grep "DisplayPort-4" | wc -l)

  if [ "$dp0" -eq "1" ] && [ "$dp1" -eq "1" ]; then
    xrandr --output DisplayPort-0 --pos 0x0
    xrandr --output DisplayPort-1 --right-of DisplayPort-0
  elif [ "$dp3" -eq "1" ] && [ "$dp4" -eq "1" ]; then
    xrandr --output DisplayPort-4 --pos 0x0
    xrandr --output DisplayPort-3 --right-of DisplayPort-4
  fi

fi
