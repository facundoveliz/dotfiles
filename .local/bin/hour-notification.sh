#!/bin/sh

time=$(date +"%H:%M")

sudo -u facu DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send 'Reminder' "Current time is <b>${time}</b>"
