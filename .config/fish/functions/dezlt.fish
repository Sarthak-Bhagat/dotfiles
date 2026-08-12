function dezlt --description "ssh to the media server with a tty (for sudo)"
    ssh -t -i $HOME/.ssh/old_laptop dez@10.147.18.53 $argv
end
