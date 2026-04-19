#!/usr/bin/fish

# 1. Path to the generated template in Pywal's cache
set CACHE_FILE "$HOME/.cache/wal/cava-config"
set TARGET_FILE "$HOME/.config/cava/config"

pkill -USR2 cava

# 2. Check if the generated config exists before copying
if test -f $CACHE_FILE
    cp -f $CACHE_FILE $TARGET_FILE
    echo "CAVA config updated from Pywal colors."
else
    echo "Error: Pywal hasn't generated the cava-config yet."
end

# 3. Reload CAVA if it's currently running
# pkill -USR2 tells CAVA to reload its config file on the fly
if pgrep -x cava > /dev/null
    pkill -USR2 cava
    echo "CAVA reloaded."
end

# 4. Optional: Reload Waybar colors (if you use it)
if pgrep -x waybar > /dev/null
    pkill -USR2 waybar
end
