function dezlt --wraps='ssh -t -i ~/.ssh/old_laptop dez@10.147.18.53' --description 'alias dezlt ssh -t -i ~/.ssh/old_laptop dez@10.147.18.53'
    ssh -t -i ~/.ssh/old_laptop dez@10.147.18.53 $argv
end
