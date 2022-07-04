#!/bin/bash

workspaces() {
  all=$(bspc query -D --names)
  focused=$(bspc query -D -d focused --names)
  occupied=$(bspc query -D -d .occupied --names)
  box="(box :class \"ws module\" :orientation \"v\""

  for name in $all
  do
    focus=$(echo "$focused" | grep "\\b$name\\b")
    occ=$(echo "$occupied" | grep "\\b$name\\b")
    if [ $focus ]; then
      box="$box (label :text \"$name\" :class \"ws-name focused\")"
    elif [ $occ ]; then
      box="$box (label :text \"$name\" :class \"ws-name occupied\")"
    else
      box="$box (label :text \"$name\" :class \"ws-name\")"
    fi
    unset focus
  done

  box="$box)"

  echo $box
}

bspc subscribe all | while read -r _ ; do
workspaces
done
