#!/bin/sh

cp ~/.config/sxhkd/sxhkdrc /tmp/keys.ini
sed -i -E ":a ; $!N ; s/\n\s+/  =>  / ; /^$/d ; ta ; P ; D" /tmp/keys.ini
sed -i -e '/^\s*$/d' /tmp/keys.ini
bat /tmp/keys.ini
