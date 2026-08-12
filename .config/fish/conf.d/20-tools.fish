# Tool initialisation. Every block is guarded, so a missing tool is silent
# rather than an error on every new shell.

status is-interactive; or exit 0

if type -q zoxide
    zoxide init fish | source
end

if type -q direnv
    direnv hook fish | source
end

# fzf.fish bindings.
#
# By default this plugin takes ctrl-v for variable search, which collides with
# paste. Variables move to ctrl-alt-v; ctrl-v is rebound to paste in
# 25-bindings.fish, which is sourced after this file.
if type -q fzf; and type -q fzf_configure_bindings
    fzf_configure_bindings \
        --directory=ctrl-t \
        --variables=ctrl-alt-v \
        --history=ctrl-r \
        --processes=ctrl-alt-p \
        --git_log=ctrl-alt-l \
        --git_status=ctrl-alt-s
end

# Prompt is tide. Configure with `tide configure`; settings live in
# fish_variables, not here.
