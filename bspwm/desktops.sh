#! /bin/sh

count=0
for monitor in $(bspc query -M); do
  echo $monitor
  let count++
done

if [ $count == 1 ]
then
  bspc monitor ^1 -d term code web chat code2 win scratch
elif [ $count == 2 ]
then
  bspc monitor ^1 -d term code code2 scratch
  bspc monitor ^2 -d web chat win 
elif [ $count == 3 ]
then
  bspc monitor ^1 -d term
  bspc monitor ^2 -d code code2 scratch
  bspc monitor ^3 -d web chat win
fi

# echo ${#monitors[@]}

