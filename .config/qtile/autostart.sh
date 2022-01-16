#!/bin/sh

function run {
  if ! pgrep $(basename $1); then
    $@&
  fi
}

# Keyboard Layout
setxkbmap -layout it

# Display Resolution
# Find out your native resolution with xrandr or arandr
# IF it does not exist in xandr, set a new one
xrandr --newmode "1920x1080_60.00" 172.80 1920 2040 2248 2576 1080 1081 1084 1118 -HSync +Vsync
xrandr --addmode Virtual1 "1920x1080_60.00"
xrandr --output Virtual1 --primary --mode "1920x1080_60.00" --pos 0x0 --rotate normal

# Starting utility applications at boot time
run nm-applet
# run cbatticon -u 5
run /usr/bin/dunst
run /usr/bin/lxpolkit

# Starting user applications at boot time
run volumeicon

