#!/bin/sh

selected=$(cat ~/.local/share/zathura/history | grep -m1 -Po '\[\K[^\]]*')

[[ -z $selected ]] && exit

zathura "$selected"

exit 0
