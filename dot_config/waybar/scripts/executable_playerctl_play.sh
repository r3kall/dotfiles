#!/usr/bin/env bash

status=$(playerctl status 2>/dev/null)
case "$status" in
  Playing|Paused|Stopped)
    printf '{"text":"%s","alt":"%s","class":"%s"}\n' "$status" "$status" "$status"
    ;;
  *)
    printf '{"text":""}\n'
    ;;
esac
