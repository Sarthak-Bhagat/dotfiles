function lss --wraps=eza --description "Long listing, newest last"
    eza -lahF --icons --color always --group-directories-first -s modified $argv
end
