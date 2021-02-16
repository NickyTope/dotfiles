#!/bin/sh

wid=$1
# echo "init" > "/tmp/wid$wid.txt"
props=`xprop -id "$1"`
above=`echo "$props" | grep _NET_WM_STATE_ABOVE | wc -l`
remmina=`echo "$props" | grep "Remmina Remote Desktop Client" | wc -l` 
# echo "$props" > "/tmp/wid$wid.txt"
[ "$above" -gt 0 ] && echo "state=floating"
[ "$remmina" -gt 0 ] && echo "state=floating rectangle=600x600+0+0 center=on"
