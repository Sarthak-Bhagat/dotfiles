# Colours.
#
# The old config hardcoded ~30 fish_color_* values. Most were defaults in
# disguise; only a few actually mattered. These are the ones that do:
# fish colours the command word live as you type, so a valid command and an
# unknown one are visually distinct before you press enter.

status is-interactive; or exit 0

# If hellwal has generated a fish palette, prefer it and stop here.
for f in $XDG_CACHE_HOME/hellwal/colors-fish.fish $XDG_CACHE_HOME/wal/colors-fish.fish
    if test -r $f
        source $f
        return
    end
end

# ---------------------------------------------------------------- fallback
# Green when the command resolves, red when it does not.
set -g fish_color_command       green
set -g fish_color_error         brred

set -g fish_color_param         normal
set -g fish_color_quote         yellow
set -g fish_color_comment       brblack
set -g fish_color_operator      magenta
set -g fish_color_redirection   magenta
set -g fish_color_escape        brmagenta
set -g fish_color_end           brmagenta
set -g fish_color_autosuggestion brblack
set -g fish_color_cwd           cyan
set -g fish_color_cwd_root      red
set -g fish_color_user          brgreen
set -g fish_color_host          normal
set -g fish_color_host_remote   yellow
set -g fish_color_valid_path    --underline

set -g fish_pager_color_prefix     cyan --bold --underline
set -g fish_pager_color_completion normal
set -g fish_pager_color_description yellow
set -g fish_pager_color_selected_background --background=brblack
