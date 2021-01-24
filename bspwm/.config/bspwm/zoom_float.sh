#!/bin/sh

count=xprop _NET_WM_STATE | grep _NET_WM_STATE_ABOVE | wc -l
[ $count = "1" ] && echo state=floating
