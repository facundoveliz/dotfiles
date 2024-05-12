dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY

# misc
xset s off
xset -dpms
xset r rate 351 60
xgamma -gamma 1.2

# keys
setxkbmap -layout us
setxkbmap -option caps:escape
setxkbmap -option compose:menu
xmodmap -e 'keycode 135 = Super_R' && xset -r 135
xmodmap -e 'keycode 115 = less'
xmodmap -e 'keycode 94 = z'
xmodmap -e 'keycode 110 = 6'
xmodmap -e 'keycode 78 = F6'

# overclock monitor
xrandr --newmode "1600x900_75.05"  151.50  1600 1704 1872 2144  900 903 908 942 -hsync +vsync
xrandr --addmode HDMI-1 1600x900_75.05
xrandr --output HDMI-1 --mode "1600x900_75.05"

# scripts
node ~/Dev/automation-scripts/todoist-notifier/index.js &

udiskie &
exec i3
