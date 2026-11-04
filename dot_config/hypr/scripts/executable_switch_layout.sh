#!/usr/bin/env bash

current_layout=$(hyprctl -j getoption general:layout | jq -r '.str')

if [ "$current_layout" = "dwindle" ]; then
  hyprctl eval 'hl.config({ general = { layout = "scrolling" } })'
  sleep 0.3
  hyprctl dispatch 'hl.dsp.layout("fit visible")'
  notify-send "Hyprland" "Layout switched to: Scrolling" -e -u low
else
  hyprctl eval 'hl.config({ general = { layout = "dwindle" } })'
  notify-send "Hyprland" "Layout switched to: Dwindle" -e -u low
fi
