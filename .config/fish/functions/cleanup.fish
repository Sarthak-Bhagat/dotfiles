function cleanup --description "Remove orphaned packages"
    set -l orphans (pacman -Qtdq)
    if test -z "$orphans"
        echo "no orphans"
        return 0
    end
    sudo pacman -Rns $orphans
end
