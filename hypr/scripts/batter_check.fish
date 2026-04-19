#!/usr/bin/fish

while true
    # Get battery level and status (Charging/Discharging)
    set battery_level (cat /sys/class/power_supply/BAT0/capacity)
    set battery_status (cat /sys/class/power_supply/BAT0/status)

    # Check if battery is low and not charging
    if test $battery_level -le 20; and test "$battery_status" = Discharging
        notify-send -u critical "Battery Low" "Level is at $battery_level%. Plug in your charger!" -i battery-low
        # Wait 5 minutes before annoying you again
        sleep 300
    else
        # Check every 60 seconds otherwise
        sleep 60
    end
end
