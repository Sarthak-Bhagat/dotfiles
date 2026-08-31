# Core aliases: listing, grep, general shell.

status is-interactive; or exit 0

# ---------------------------------------------------------------- listing
#
# exa was unmaintained from 2023 and is superseded by eza, the community fork.
# Same flags, plus git status columns and a working grid.

# `ls`, `lss` and `clss` are functions in functions/ — do not alias them here,
# autoloaded functions would shadow these anyway.
if type -q eza
    alias la   "eza -a --icons --group-directories-first"
    alias ll   "eza -lah --icons --group-directories-first --octal-permissions --git"
    alias lt   "eza --tree --level=2 --icons"
    alias llt  "eza --tree --level=3 --long --icons"
else
    alias la   "ls -a --color=auto"
    alias ll   "ls -alFh --color=auto"
end

alias l.   "eza -a --icons --group-directories-first --list-dirs .*"

# Tree depth shortcuts. The old config guarded these with `test tree`, which
# tests whether the *string* "tree" is non-empty — always true. `type -q` is
# the actual check.
if type -q eza
    alias l1 "eza --tree --level=1"
    alias l2 "eza --tree --level=2"
    alias l3 "eza --tree --level=3"
else if type -q tree
    alias l1 "tree --dirsfirst -ChFL 1"
    alias l2 "tree --dirsfirst -ChFL 2"
    alias l3 "tree --dirsfirst -ChFL 3"
end

# ---------------------------------------------------------------- colour & format
# grep, egrep and fgrep are aliased to ripgrep in 34-aliases-modern.fish.
alias ip    "ip -color"
# df is aliased to duf in 34-aliases-modern.fish; this is the plain one.
alias dfh   "command df -h"
alias free  "free -mh"
alias wget  "wget -c"

# bat already detects when stdout is not a terminal and drops to plain output,
# so piping behaves like cat without any extra flags.
if type -q bat
    # alias cat "bat --paging=never"
    alias cat "bat"
end

# ---------------------------------------------------------------- typos I actually make
alias cd..  "cd .."
alias pdw   pwd
alias udpate "sudo pacman -Syu"

# ---------------------------------------------------------------- misc
alias psa    "ps auxf"
alias jctl   "journalctl -p 3 -xb"
alias hw     "hwinfo --short"
alias ff     fastfetch
alias ssn    "sudo shutdown now"
alias sr     "systemctl reboot"
alias userlist "cut -d: -f1 /etc/passwd | sort"
alias sysfailed "systemctl list-units --failed"
alias audio  "pactl info | command grep 'Server Name'"
alias microcode "command grep . /sys/devices/system/cpu/vulnerabilities/*"
alias cpu    "cpuid -i | command grep uarch | head -n 1"
alias kernels "ls /usr/lib/modules"
