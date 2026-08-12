function clss --description "Clear, then long listing newest last"
    clear
    eza -lahF --icons --color always --group-directories-first -s modified $argv
end
