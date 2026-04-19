#!/bin/bash

# Check for updates using xbps-install (memory/sync only)
# -n: dry run
# -u: update
# -M: use remote repositories
updates=$(xbps-install -nuM 2>/dev/null | wc -l)

if [ "$updates" -gt 0 ]; then
  # Output for Waybar: Icon + Number
  echo "󰚰 $updates"
else
  # Output when system is clean
  echo "󰸞"
fi
