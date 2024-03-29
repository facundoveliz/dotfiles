#!/bin/bash

# terminate already running bar instances
killall -q polybar

# wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# set $MONITOR env variable and launch for each monitor
for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar -q main -c '~/.config/polybar/config.ini' &
  # MONITOR=$m polybar -q main -c '~/.config/polybar/config.ini' &
done
