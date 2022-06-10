#!/bin/bash

INSTALL_DIR=`pwd`
CFG=("alacritty" "bspwm" "dunst" "kitty" "nvim" "picom" "polybar" "rofi" "sxhkd" "fontconfig")

cd ~/.config

for dir in "${CFG[@]}"
do
	ln -s "$INSTALL_DIR/$dir" "$dir"
done

cd ~
ln -s "$INSTALL_DIR/.zshrc" .zshrc

cd "$INSTALL_DIR"

