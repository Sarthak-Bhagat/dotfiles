# Colours.
#
# Decorative colours come from hellwal so the shell tracks the wallpaper.
# Semantic ones do not: fish resolves the command word live, and green-valid /
# red-invalid should not depend on what colours an image happened to contain.
#
# The template deliberately avoids color0 (the background slot) for anything
# that renders as text. An earlier version used it for comment and
# autosuggestion, producing black text on a black background.

status is-interactive; or exit 0

set -l generated $XDG_CACHE_HOME/hellwal/colors-fish.fish
if test -r $generated
    source $generated
end

# Semantic, always.
set -g fish_color_command green
set -g fish_color_error   brred

# Guard: if the generated palette left anything unreadable, fall back.
for pair in fish_color_autosuggestion:brblack fish_color_comment:brblack fish_color_param:cyan
    set -l var (string split ':' $pair)[1]
    set -l fallback (string split ':' $pair)[2]
    if not set -q $var; or string match -qr '^0{6}$' -- "$$var"
        set -g $var $fallback
    end
end

set -g fish_color_selection --background=brblack
set -g fish_color_search_match --background=brblack
set -g fish_color_valid_path --underline
