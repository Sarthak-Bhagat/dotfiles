# Environment. Sourced for every shell, interactive or not, so exported
# variables belong here rather than in config.fish.

# XDG base directories. Set these before anything that reads them.
set -gx XDG_DATA_HOME   $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME  $HOME/.local/state
set -gx XDG_CACHE_HOME  $HOME/.cache

set -gx EDITOR nvim
set -gx VISUAL nvim

# Group-writable by default. Matters for the shared media/arr directories.
umask 002

# Deliberately not setting TERM. Kitty sets it correctly (xterm-kitty), and
# overriding it to xterm-256color breaks truecolour detection and some keys.

status is-interactive; or exit 0

# ---------------------------------------------------------------- interactive

set -g fish_greeting                    # suppress the intro banner
set -g fish_prompt_pwd_dir_length 0     # never abbreviate directories in $PWD

# bat as the pager for man
if type -q bat
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
    set -gx MANROFFOPT -c
end

set -gx FZF_DEFAULT_OPTS "--height=40% --layout=reverse --border --inline-info --tiebreak=end,length"
