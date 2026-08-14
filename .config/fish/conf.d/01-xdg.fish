# XDG relocation for tools that honour it. Recovered from the pre-rewrite config
# (fish.old/conf.d/xdg.fish), which set around twenty-five of these; only the
# ones whose data actually lives at the XDG path are set here. The base XDG_*
# directories are in 00-env.fish and must be set before this file runs.

# These two are not cosmetic. ~/.cargo and ~/go do not exist, while
# ~/.local/share/{cargo,go} hold 479M and 47M -- so with the variables unset,
# both toolchains ignore everything already downloaded and start from scratch.
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx GOPATH     $XDG_DATA_HOME/go

# 141M of Ren'Py saves live here. ~/.renpy holds 4K.
set -gx RENPY_PATH_TO_SAVES $XDG_DATA_HOME/renpy

# Regenerable caches and history files. Safe to point anywhere at any time.
set -gx CUDA_CACHE_PATH $XDG_CACHE_HOME/nv
set -gx SQLITE_HISTORY  $XDG_CACHE_HOME/sqlite_history

# Keeps ~/.wget-hsts out of $HOME. An alias rather than a variable because wget
# has no environment override for the HSTS path.
alias wget "wget --hsts-file=$XDG_DATA_HOME/wget-hsts"

# Deliberately NOT restored from the old config, and why:
#
#   RUSTUP_HOME    ~/.rustup is the live one -- rustup itself reports it and it
#                  was modified today. The XDG copy is from February and carries
#                  a different toolchain set, so setting this silently swaps the
#                  compiler out from under every project.
#   WINEPREFIX     ~/.wine is newer than the XDG copy and both contain a
#                  drive_c. Pointing wine at the other one hides every installed
#                  application's configuration.
#   GNUPGHOME      yadm wrote its archive against ~/.gnupg. Neither directory
#                  holds a secret key (yadm encrypt is symmetric, passphrase
#                  only), so relocating GPG buys nothing and risks the one path
#                  that unlocks the encrypted files.
#   GTK2_RC_FILES  Plasma already exports this; overriding it breaks GTK2
#                  theming.
#   _JAVA_OPTIONS  The JVM prints "Picked up _JAVA_OPTIONS" to stderr on every
#                  invocation, which breaks anything parsing java output.
#   HISTFILE       fish does not read it, and ~/.bash_history already exists.
#   DOTNET_CLI_HOME, SCREENRC, OMNISHARPHOME, XINITRC, USERXSESSION,
#   USERXSESSIONRC, XCURSOR_PATH
#                  no data at the XDG path, or the tool is not installed.
