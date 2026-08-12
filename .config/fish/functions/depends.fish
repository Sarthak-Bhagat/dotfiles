function depends --description "Show what requires a package"
    if test (count $argv) -eq 0
        echo "usage: depends PACKAGE"
        return 1
    end
    pacman -Sii $argv[1] | command grep "Required By" | sed -e 's/Required By     : //' -e 's/  /\n/g'
end
