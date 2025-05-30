function lss --wraps='eza -lahF --icons --color always --group-directories-first -s modified -r' --description 'alias lsm eza -lahF --icons --color always --group-directories-first -s modified -r'
  # eza -lahF --icons --color always --group-directories-first -s modified -r $argv
  eza -lahF --icons --color always --group-directories-first -s modified $argv

end
