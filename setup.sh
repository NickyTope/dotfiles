#!/bin/bash

CFG=("alacritty" "bspwm" "dunst" "kitty" "nvim" "picom" "polybar" "rofi" "sxhkd" "fontconfig")

for dir in "${CFG[@]}"
do
	ln -s "$dir" "~/.config/$dir"
done

ln -s "$INSTALL_DIR/.zshrc" .zshrc

