function rip --description "List recently installed packages (default 50)"
    set -l n 50
    test (count $argv) -gt 0; and set n $argv[1]
    expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -n $n | nl
end
