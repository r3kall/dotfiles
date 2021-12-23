#!/bin/sh

function run {
  if ! pgrep $1 > /dev/null; then
    $@&
  fi
}

run setxkbmap -layout it
run xrandr --output Virtual1 --mode 1440x900

# systray battery icon
run cbatticon -u 5 &

# systray volume
run volumeicon &

# systray network manager
run nm-applet
