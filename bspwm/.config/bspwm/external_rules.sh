#!/bin/sh

wid=$1
# echo "init" > "/tmp/wid$wid.txt"
props=`xprop -id "$1" | grep _NET_WM_STATE_ABOVE | wc -l`
# echo "$props" > "/tmp/wid$wid.txt"
[ "$props" -gt 0 ] && echo "state=floating"
