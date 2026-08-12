# PATH.
#
# The old config did this three different ways: it erased and rewrote the
# universal fish_user_paths on every startup, then appended the same two
# directories again inside two separate `status --is-login` blocks.
#
# fish_user_paths is a universal variable, so it persists across sessions and
# across shells by design. Rewriting it every startup is pointless work, and
# doing it with `set -e` first means a race if two shells start at once.
#
# fish_add_path is the supported way. It is idempotent, so running it every
# startup costs nothing and adds nothing twice.

fish_add_path -g $HOME/.bin
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/Applications
fish_add_path -g $HOME/.rye/shims
fish_add_path -g $HOME/.cargo/bin
