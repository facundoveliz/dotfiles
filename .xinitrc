dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

udiskie &

setxkbmap -layout us
xset s off
xset -dpms
xset r rate 351 60
xgamma -gamma 1.2
xmodmap -e 'keycode 135 = Super_R' && xset -r 135
setxkbmap -option caps:escape

# scripts
node ~/Dev/automation-scripts/todoist-notifier/index.js &
# node ~/Dev/automation-scripts/todoist-creator/index.js &

# some default apps
xdg-mime default thunar.desktop inode/directory application/x-gnome-saved-search

# export DESKTOP_SESSION=plasma
# exec startplasma-x11
exec i3
# exec herbstluftwm --locked
