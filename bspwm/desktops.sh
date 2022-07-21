#! /bin/sh

count=0
for monitor in $(bspc query -M); do
  echo $monitor
  let count++
done

if [ "$HOSTNAME" == "nt-arch-sfc" ]; then
  if [ $count == 1 ]
  then
    bspc monitor ^1 -d term code code2 four five web chat win nine ten
  elif [ $count == 2 ]
  then
    bspc monitor ^1 -d term code code2 four five
    bspc monitor ^2 -d web chat win nine ten 
  elif [ $count == 3 ]
  then
    bspc monitor ^1 -d code code2 four five
    bspc monitor ^2 -d web chat win nine ten
    bspc monitor ^3 -d term
  fi
fi

if [ "$HOSTNAME" == "miniarch" ]; then
  if [ $count == 1 ]
  then
    bspc monitor ^1 -d term code code2 four five web chat win nine ten
  elif [ $count == 2 ]
  then
    bspc monitor ^1 -d term code code2 four five
    bspc monitor ^2 -d web chat win nine ten
  fi
fi

# echo ${#monitors[@]}

