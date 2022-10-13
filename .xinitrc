setxkbmap -layout us &
udiskie &
xset s off &
xset -dpms &
xset r rate 350 60 &
xgamma -gamma 1.2 &

# scripts
node ~/Documents/Dev/puppeteer/todoist-notifier/index.js &

# some default apps
xdg-mime default thunar.desktop inode/directory application/x-gnome-saved-search &

# exec herbstluftwm --locked
exec i3
