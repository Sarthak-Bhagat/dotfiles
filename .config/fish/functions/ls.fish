function ls --wraps=eza --description "eza with icons, directories first"
    eza --icons --group-directories-first $argv
end
