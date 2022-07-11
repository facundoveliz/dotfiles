setxkbmap -option caps:escape
xset s off &
xset -dpms &
xset r rate 350 60 &
export PATH="$HOME/.local/bin:$PATH"
exec i3
