function gl --description "Browse git log with fzf"
    git log --graph --color=always \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" $argv |
    fzf --ansi --no-sort --reverse --tiebreak=index \
        --bind "enter:execute:echo {} | command grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always % | less -R'"
end
