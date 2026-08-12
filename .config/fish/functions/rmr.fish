function rmr --description "Remove a directory, then list the parent"
    rm -r $argv
    and clss (dirname $argv[1])
end
