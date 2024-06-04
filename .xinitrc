dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# misc
xset s off # turn off screensaver
xset -dpms # disable turn off screen
xset r rate 351 60 # keyboard repeat rate

# keys
setxkbmap -layout us
setxkbmap -option caps:escape
setxkbmap -option compose:menu

# scripts
node ~/Dev/automation-scripts/todoist-notifier/index.js &

# execute Xmodmap
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

udiskie &
clipmenud &
exec i3
