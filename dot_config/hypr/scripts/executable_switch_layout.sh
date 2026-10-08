#!/usr/bin/env bash

current_layout=$(hyprctl getoption general:layout | grep 'str:' | awk '{print $2}')

if [ "$current_layout" = "dwindle" ]; then
  hyprctl keyword general:layout scrolling
  sleep 0.3
  hyprctl dispatch layoutmsg "fit visible"
  notify-send "Hyprland" "Layout switched to: Scrolling" -e -u low
else
  hyprctl keyword general:layout dwindle
  notify-send "Hyprland" "Layout switched to: Dwindle" -e -u low
fi
