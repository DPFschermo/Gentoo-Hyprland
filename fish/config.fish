### --- SETTINGS --- ###
set -g fish_greeting ""

### --- PATH --- ###

fish_add_path "$HOME/.local/bin"

### --- PYWAL --- ###

if test "$XDG_CURRENT_DESKTOP" = "Hyprland"
    if test -f "$HOME/.cache/wal/colors.fish"
        source "$HOME/.cache/wal/colors.fish"
    end
    if test -f "$HOME/.cache/wal/sequences"
        cat "$HOME/.cache/wal/sequences"
    end
end

### --- HYPRLAND VS VXWM LOGIC --- ###

if test "$XDG_CURRENT_DESKTOP" = "Hyprland"
    set -gx STARSHIP_CONFIG "$HOME/.config/starship.toml"
    if test -f "$HOME/.cache/wal/colors.fish"
        source "$HOME/.cache/wal/colors.fish"
    end
    if test -f "$HOME/.cache/wal/sequences"
        cat "$HOME/.cache/wal/sequences"
    end
else
    set -gx STARSHIP_CONFIG "$HOME/.config/starship-vxwm.toml"
end

### --- ABBREVIATIONS & ALIASES --- ###

alias ls='ls --color=auto'
alias spotify='dbus-run-session spotify'

### --- PROGRAMS --- ###

if type -q starship
    starship init fish | source
end
