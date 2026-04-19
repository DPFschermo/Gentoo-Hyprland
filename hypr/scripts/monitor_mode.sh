#!/bin/bash

EXTERNAL="HDMI-A-1"
INTERNAL="eDP-1"

# Check if we are currently mirroring
if hyprctl monitors | grep -q "mirroring"; then
  # Switch to Extended Mode
  hyprctl keyword monitor "$EXTERNAL, preferred, auto, 1"
  notify-send "Monitor Mode" "Switched to Extended Display"
else
  # Switch to Mirror Mode
  hyprctl keyword monitor "$EXTERNAL, preferred, auto, 1, mirror, $INTERNAL"
  notify-send "Monitor Mode" "Switched to Mirror Display"
fi
