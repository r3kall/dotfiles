#!/bin/bash

# Check if there is any active player (playing/paused/stopped but alive)
if ! playerctl -l 2>/dev/null | grep -q .; then
  exit 0 # → prints nothing → Waybar hides the module
fi

# Optional: check for real playback status
status="$(playerctl status 2>/dev/null)"

# Hide when nothing is playing or paused
if [[ "$status" != "Playing" && "$status" != "Paused" ]]; then
  exit 0
fi

# Visible output
echo "󰙣 "
