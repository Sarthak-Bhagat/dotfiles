# fish configuration
#
# Almost nothing lives here. fish sources conf.d/*.fish alphabetically before
# reading this file, and autoloads functions/ on demand, so both are better
# homes for anything you would otherwise put below.
#
#   conf.d/00-env.fish            environment, XDG, editor, umask
#   conf.d/10-path.fish           PATH
#   conf.d/20-tools.fish          zoxide, direnv, fzf
#   conf.d/25-bindings.fish       key bindings
#   conf.d/30-aliases-core.fish   listing, grep, general
#   conf.d/31-aliases-arch.fish   pacman, paru, mirrors, snapper
#   conf.d/32-aliases-edit.fish   config editing shortcuts
#   conf.d/33-aliases-media.fish  yt-dlp, git, docker, remote hosts
#   conf.d/90-local.fish          machine-specific, not tracked in git
#   functions/                    one file per function, autoloaded
#
# Fisher-installed plugins also drop files into conf.d. Numeric prefixes keep
# ours ordered ahead of them without colliding.
#
# Prompt: tide (fisher install IlanCosman/tide@v6, then `tide configure`).
# Colours: hellwal writes a fish theme; do not hardcode fish_color_* here or
# it will fight the generated one.

status is-interactive; or exit 0

# Run fastfetch on new interactive shells, but not inside editors, pagers or
# nested tooling where it is just noise.
if type -q fastfetch; and not set -q INSIDE_EMACS; and not set -q VIMRUNTIME
    fastfetch
end
