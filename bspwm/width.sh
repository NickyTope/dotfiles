#!/bin/bash

totalwidth=($(bspc query -T -n @/ | jq -r .rectangle.width))
wincount=3
multiples=1


if [ $# -eq 1 ]; then
  wincount=$1
fi

if [ $# -eq 2 ]; then
  wincount=$1
  multiples=$2
fi

targetwidth=$((totalwidth/wincount*multiples))

currentwidth=($(bspc query -T -n | jq -r .rectangle.width))

if [ $targetwidth -ne $currentwidth ]; then
  bspc node -z right $((targetwidth-currentwidth)) 0
fi
