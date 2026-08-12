# XDG Base Directory Variables
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_STATE_HOME "$HOME/.local/state"
set -x XDG_CACHE_HOME "$HOME/.cache"

# Bash history
set -x HISTFILE "$XDG_STATE_HOME/bash/history"

# Cargo
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"

# CUDA
set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME/nv"

# Dotnet
set -x DOTNET_CLI_HOME "$XDG_DATA_HOME/dotnet"

# GnuPG
set -x GNUPGHOME "$XDG_DATA_HOME/gnupg"

# GNU Screen
set -x SCREENRC "$XDG_CONFIG_HOME/screen/screenrc"

# Go
set -x GOPATH "$XDG_DATA_HOME/go"

# GTK2
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"

# XCursor (icons)
set -x XCURSOR_PATH "/usr/share/icons:$XDG_DATA_HOME/icons"

# Omnisharp
set -x OMNISHARPHOME "$XDG_CONFIG_HOME/omnisharp"

# Java preferences
set -x _JAVA_OPTIONS "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"

# Ren'Py
set -x RENPY_PATH_TO_SAVES "$XDG_DATA_HOME/renpy"

# Rustup
set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"

# SQLite history
set -x SQLITE_HISTORY "$XDG_CACHE_HOME/sqlite_history"

# Wget HSTS file
alias wget "wget --hsts-file=$XDG_DATA_HOME/wget-hsts"

# Wine prefix
set -x WINEPREFIX "$XDG_DATA_HOME/wine"

# Xinit
set -x XINITRC "$XDG_CONFIG_HOME/X11/xinitrc"

# Xsession
set -x USERXSESSION "$XDG_CACHE_HOME/X11/xsession"
set -x USERXSESSIONRC "$XDG_CACHE_HOME/X11/xsessionrc"

# xrdb (X resources)
alias xrdb "xrdb -load $XDG_CONFIG_HOME/X11/xresources"

# Yarn
alias yarn "yarn --use-yarnrc $XDG_CONFIG_HOME/yarn/config"
