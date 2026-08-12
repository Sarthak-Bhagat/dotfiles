function reload --description "Restart fish, picking up config changes"
    echo "reloading $__fish_config_dir"
    exec fish
end
