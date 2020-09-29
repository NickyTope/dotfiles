#! /bin/sh
#all_monitors=$(xrandr -q | awk '/connected/ {print $1}')
#default_screen=$(xrandr | awk '/ connected/ {print $1;exit;}')
#extra_monitors=$(xrandr -q | awk '/connected/ {print $1}' | grep -v $default_screen)

##First, configure stuff with xrandr
#[[ $(who) != "" ]] && USER=$(who | grep :0\) | cut -f 1 -d ' ') || \
#USER=$(echo /home/* | cut -f 3 -d '/')

#export DISPLAY=:0.0
#export XAUTHORITY=/home/$USER/.Xauthority

#for monitor in $extra_monitors; do
#	prev_mon=$(xrandr | awk '/connected/ {print $1}' | grep -B1 "^$monitor" | grep -vE "^$monitor|^--$")
#	xrandr --output $monitor \
#		--auto \
#		--right-of $prev_mon
#done

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

