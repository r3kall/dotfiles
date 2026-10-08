#!/usr/bin/env bash

playerctl -a metadata --format \
  '{"text": "{{markup_escape(artist)}} - {{markup_escape(title)}}", "tooltip": "{{playerName}} : {{markup_escape(title)}}", "alt": "{{status}}", "class": "{{status}}"}' -F
