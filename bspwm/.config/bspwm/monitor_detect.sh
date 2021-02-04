#!/bin/bash


home=`xrandr | grep "DP-1-1-2 connected" | wc -l`
work=`xrandr | grep "DP-1-1-8 connected" | wc -l`
second=`xrandr | grep "DP-1-1-1 connected" | wc -l`

xrandr --output DP-1-1-1 --off --output DP-1-1-2 --off --output DP-1-1-8 --off

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

