#!/bin/bash

cd /home/nt/.screenlayout
SCRIPT=`ls | rofi -dmenu`
bash $SCRIPT
