#!/usr/bin/env bash

bssid=$(nmcli device wifi list | sed -n '1!p' | cut -b 9- | dmenu -p "Select Wifi  :" -l 20 | cut -d' ' -f1)
pass=$(echo "" | dmenu -p "Enter Password  :")
nmcli device wifi connect "$bssid" password "$pass"
sleep 10
if ping -q -c 2 -W 2 google.com >/dev/null; then
  notify-send "Your internet is working :)"
else
  notify-send "Your internet is not working :("
fi
