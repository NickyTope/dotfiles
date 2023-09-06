#!/bin/bash


big=$(xrandr --listmonitors | grep 5120/ | wc -l)
widths=$(xrandr --listmonitors | grep "+" | awk '{ sub(/\/.*$/, "", $3); print $3 }')

feh_cmd="feh --bg-scale "
for w in $widths; do
  if [ "$w" -gt "5000" ]; then
    pic=$(shuf -n1 -e ~/Pictures/walls/uwide/*)
  else
    pic=$(shuf -n1 -e ~/Pictures/walls/current/*)
  fi
  feh_cmd="$feh_cmd $pic"
done
eval "$feh_cmd"

# if [ "$big" == "1" ]
# then
#   feh --randomize --bg-scale ~/Pictures/walls/uwide
# else
#   feh --randomize --bg-fill ~/Pictures/walls/current
#   ~/.config/bspwm/getnew.sh &
# fi


