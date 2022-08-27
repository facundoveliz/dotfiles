#!/bin/sh

export PATH="$HOME/.local/bin:$PATH" &
setxkbmap -layout us &
setxkbmap -option caps:escape &
xgame -gamma 1.15 &
flameshot &
udiskie &
xset s off &
xset -dpms &
xset r rate 350 60 &
exec i3
