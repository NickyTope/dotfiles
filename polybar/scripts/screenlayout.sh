#!/bin/bash

cd /home/nicky/.screenlayout
SCRIPT=`ls | rofi -dmenu`
bash $SCRIPT
