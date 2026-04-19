#!/usr/bin/fish
set choice (printf '⏻ Shutdown\\n🔁 Reboot\\n⏾ Suspend\\n🚪 Logout' | wofi --dmenu --width 250 --lines 4 | string collect; or echo)
function poweroff_cmd
    if command -v loginctl >/dev/null 2>&1
        loginctl poweroff
    else
        poweroff
    end
end
function reboot_cmd
    if command -v loginctl >/dev/null 2>&1
        loginctl reboot
    else
        reboot
    end
end
function suspend_cmd
    if command -v loginctl >/dev/null 2>&1
        loginctl suspend
    else
        echo '⚠️ Suspend not available'
    end
end
switch "$choice"
    case '*Shutdown'
        poweroff_cmd
    case '*Reboot'
        reboot_cmd
    case '*Suspend'
        suspend_cmd
    case '*Logout'
        swaymsg exit
end
