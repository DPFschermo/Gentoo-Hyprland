#!/usr/bin/fish

# 1. Setup Directories
set WALL_DIR "$HOME/Pictures/Wallpapers"
set CACHE_DIR "$HOME/.cache/wal"

# 2. Set Animations
set TRANSITIONS wipe grow center outer wave
set SELECTED_TRANSITION (random choice $TRANSITIONS)
# 3. Select Wallpaper via Wofi
set CHOICE (ls $WALL_DIR | sed 's/^/  /' | wofi -d --prompt "Select Wallpaper" --conf "$HOME/.config/wofi/config" --style "$HOME/.config/wofi/style.css" | string collect)

# Exit if nothing selected
if test -z "$CHOICE"
    exit 0
end

# 4. Clean up the filename
set FILENAME (echo "$CHOICE" | sed 's/^  //' | string collect)
set FULL_PATH "$WALL_DIR/$FILENAME"

# 5. Trigger the visual changes
# Change wallpaper with the transition you liked
swww img "$FULL_PATH" \
    --transition-type $SELECTED_TRANSITION \
    --transition-pos center \
    --transition-duration 2 \
    --transition-fps 60 \
    --transition-step 90

# Generate colors with Pywal (quiet mode)
wal -i "$FULL_PATH" -n -q

#Cava color change
~/.config/wal/postrun.sh

# 6. Refresh Apps
# Reload Waybar CSS
pkill -USR2 waybar

# Update Hyprland Borders (Using your logic)
# Note: Pywal variables are available in Fish if you source the sequences
source "$CACHE_DIR/colors.fish"

set HEX_COLOR4 (string replace "#" "" $color4)
set HEX_COLOR1 (string replace "#" "" $color1)

hyprctl setoption general:col.active_border "rgb($HEX_COLOR4) rgb($HEX_COLOR1) 45deg"
hyprctl setoption general:col.inactive_border "rgba(000000aa)"

if test -f "$HOME/.cache/wal/colors-foot.conf"
    # This tells all running foot instances to reload their colors
    pkill -USR1 foot
end

for tty in /dev/pts/[0-9]*
    cat "$HOME/.cache/wal/sequences" > $tty 2>/dev/null
end

# 7. SDDM Sync (Optional)
# Copy to the location SDDM expects for your theme
cp "$FULL_PATH" "$HOME/.cache/current_wallpaper.jpg"
