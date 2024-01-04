#!/bin/sh

wid=$1
# echo "init" > "/tmp/wid$wid.txt"
props=`xprop -id "$1"`
above=$(echo "$props" | grep _NET_WM_STATE_ABOVE | wc -l)
remmina=$(echo "$props" | grep "Remmina Remote Desktop Client" | wc -l) 
android=$(echo "$props" | grep "Emulator" | wc -l) 
zoom=$(echo "$props" | grep "zoom_linux_float_video_window" | wc -l)
echo "$props" > "/tmp/wid$wid.txt"
[ "$above" -gt 0 ] && echo "state=floating"
[ "$android" -gt 0 ] && echo "state=floating"
[ "$remmina" -gt 0 ] && echo "state=floating rectangle=600x600+0+0 center=on"
[ "$zoom" -gt 0 ] && echo "state=floating sticky=on center=on rectangle=500x300+0+0"
