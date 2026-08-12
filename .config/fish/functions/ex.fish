function ex --description "Extract any bundled or compressed archive"
    if test (count $argv) -eq 0
        echo "usage: ex FILE..."
        return 1
    end
    for file in $argv
        if not test -f $file
            echo "ex: '$file' is not a file"
            continue
        end
        switch $file
            case '*.tar.bz2' '*.tbz2'; tar xjf $file
            case '*.tar.gz' '*.tgz';   tar xzf $file
            case '*.tar.xz' '*.txz';   tar xJf $file
            case '*.tar.zst';          tar --zstd -xf $file
            case '*.tar';              tar xf  $file
            case '*.bz2';              bunzip2 $file
            case '*.gz';               gunzip  $file
            case '*.xz';               unxz    $file
            case '*.zst';              unzstd  $file
            case '*.rar';              unrar x $file
            case '*.zip';              unzip   $file
            case '*.7z';               7z x    $file
            case '*.Z';                uncompress $file
            case '*.deb';              ar x    $file
            case '*';                  echo "ex: don't know how to extract '$file'"
        end
    end
end
