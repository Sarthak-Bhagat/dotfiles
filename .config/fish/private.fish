#set -gx fish_user_paths "$HOME/.rye/shims"
source (/usr/bin/starship init fish --print-full-init | psub)
set -Ua fish_user_paths "$HOME/.rye/shims"
umask 002
ufetch

# XDG Base Directory Spec
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_CACHE_HOME $HOME/.cache

# Automatically start or attach to tmux in interactive shells
# if status is-interactive
#     and not set -q TMUX
#     # Check if there are existing tmux sessions
#     if tmux has-session 2>/dev/null
#         exec tmux -u attach-session
#     else
#         exec tmux -uf /home/dez/.config/tmux/tmux.conf
#     end
# end
