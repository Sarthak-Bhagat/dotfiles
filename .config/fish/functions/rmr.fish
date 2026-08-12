function rmr --wraps='rm -r' --wraps='rm -rf' --description 'trash instead of rm -r'
    rm -r $argv; and clss (dirname $argv[1])
end
