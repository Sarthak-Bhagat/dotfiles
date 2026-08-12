function dezl --description "Mosh to the media server"
    mosh --ssh="ssh -i $HOME/.ssh/old_laptop" dez@10.147.18.53 $argv
end
