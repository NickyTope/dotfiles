#!/bin/bash

# if xfce4-session-logout exists, run it
if [ -x "$(command -v xfce4-session-logout)" ]; then
  xfce4-session-logout
# otherwise use bspc to logout
else
  bspc quit
fi
