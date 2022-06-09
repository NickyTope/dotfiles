#! /bin/sh

Xdialog --wmclass "dialog" --default-button "OK" --inputbox "Rename Desktop" 10 50 2> /tmp/deskname
bspc desktop -n `cat /tmp/deskname`

