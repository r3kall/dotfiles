#!/usr/bin/env bash

playerctl -a metadata --format \
  '{"text": "{{artist}} - {{title}}", "alt": "{{status}}", "class": "{{status}}"}' -F
