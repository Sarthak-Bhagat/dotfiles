function backup --description "Copy a file to FILE.bak with a timestamp"
    for file in $argv
        if test -f $file
            cp -- $file $file.(date +%Y%m%d-%H%M%S).bak
            echo "backed up: $file"
        else
            echo "backup: '$file' is not a file"
        end
    end
end
