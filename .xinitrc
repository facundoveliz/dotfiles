#!/bin/sh

export PATH="$HOME/.local/bin:$PATH" &
setxkbmap -layout us &
setxkbmap -option caps:escape &
flameshot &
udiskie &
xset s off &
xset -dpms &
xset r rate 350 60 &
xgamma -gamma 1.2 &

# gnome-keyring setup
# source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
# eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
# export SSH_AUTH_SOCK

exec i3
