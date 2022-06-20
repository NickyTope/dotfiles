#! /bin/sh

count=0
for monitor in $(bspc query -M); do
  echo $monitor
  let count++
done

if [ "$HOSTNAME" == "nt-arch-sfc" ]; then
  if [ $count == 1 ]
  then
    bspc monitor ^1 -d term code web chat code2 win scratch
  elif [ $count == 2 ]
  then
    bspc monitor ^1 -d term code code2 scratch
    bspc monitor ^2 -d web chat win 
  elif [ $count == 3 ]
  then
    bspc monitor ^1 -d code code2 scratch
    bspc monitor ^2 -d web chat win
    bspc monitor ^3 -d term
  fi
fi

if [ "$HOSTNAME" == "miniarch" ]; then
  if [ $count == 1 ]
  then
    bspc monitor ^1 -d term code code2 four web chat win eight
  elif [ $count == 2 ]
  then
    bspc monitor ^1 -d term code code2 four
    bspc monitor ^2 -d web chat win eight
  fi
fi

# echo ${#monitors[@]}

