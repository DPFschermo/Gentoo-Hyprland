### --- SETTINGS --- ###
set -g fish_greeting ""

### --- PATH --- ###
fish_add_path "$HOME/.local/bin"

### --- PYWAL COLORS --- ###

# This sets the variables ($color1, $color2, etc.)
if test -f "$HOME/.cache/wal/colors.fish"
    source "$HOME/.cache/wal/colors.fish"
end

# This physically changes the terminal's colors
if test -f "$HOME/.cache/wal/sequences"
    cat "$HOME/.cache/wal/sequences"
end

### --- ABBREVIATIONS & ALIASES --- ###

alias ls='ls --color=auto'
alias spotify='dbus-run-session spotify'

### --- PROGRAMS --- ###

# Initialize Starship Prompt (ONLY ONCE)
if type -q starship
    starship init fish | source
end
