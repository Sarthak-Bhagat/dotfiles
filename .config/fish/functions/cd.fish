function cd --wraps=z --description "cd via zoxide, builtin when z is unavailable"
    # zoxide is initialised only in interactive shells (conf.d guards on
    # `status is-interactive`), so `z` does not exist in scripts, `fish -c`, or
    # fish-invoked systemd units. Without this guard cd silently fails there --
    # the directory never changes, and depending on how zoxide was initialised
    # there may not even be an error.
    if type -q z
        z $argv
    else
        builtin cd $argv
    end
end
