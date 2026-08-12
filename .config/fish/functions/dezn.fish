function dezn --description "Mosh to this laptop from elsewhere"
    mosh --ssh="ssh -i $HOME/.ssh/phone" dez@10.147.18.49 $argv
end
