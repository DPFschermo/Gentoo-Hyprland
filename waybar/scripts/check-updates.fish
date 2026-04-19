#!/usr/bin/fish
# Check for updates using xbps-install (memory/sync only)
# -n: dry run
# -u: update
# -M: use remote repositories
set updates (xbps-install -nuM 2>/dev/null | wc -l | string collect; or echo)
if [ "$updates" -gt 0 ]
    # Output for Waybar: Icon + Number
    echo '󰚰 '"$updates"
else
    # Output when system is clean
    echo '󰸞'
end
