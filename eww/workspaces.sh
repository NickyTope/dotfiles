#!/bin/bash

workspaces() {
  all=$(bspc query -D --names)
  box="(box :class \"ws\" :orientation \"v\""

  for name in $all
  do
    focus=$(bspc query -D -d focused --names | grep "\\b$name\\b")
    if [ $focus ]; then
      box="$box (label :text \"$name\" :class \"focused\")"
    else
      box="$box (label :text \"$name\")"
    fi
    unset focus
  done

  box="$box)"

  echo $box
}

bspc subscribe all | while read -r _ ; do
workspaces
done
