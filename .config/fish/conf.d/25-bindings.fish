# Key bindings.
#
# fish 4.x uses its own key names rather than terminfo ones. `ctrl-v` and
# `alt-backspace` are the current spellings.
#
# This file is sourced after 20-tools.fish, so bindings here win over any a
# plugin set earlier.

status is-interactive; or exit 0

function fish_user_key_bindings
    bind alt-backspace backward-kill-word

    # Ctrl-V pastes. fish's own binding is insert-control-char, and fzf.fish
    # wants it for variable search; both are given up here.
    bind ctrl-v fish_clipboard_paste
    bind ctrl-y fish_clipboard_copy
end
