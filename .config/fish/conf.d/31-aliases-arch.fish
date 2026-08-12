# Arch / CachyOS package management.
#
# Everything ArcoLinux-specific was removed: the ~40 arcolinux-* wrappers, the
# display-manager switchers, /etc/skel copying, /etc/dev-rel ISO detection and
# the arcolinux mirrorlist. None of those binaries or files exist on CachyOS.

status is-interactive; or exit 0

# ---------------------------------------------------------------- pacman
alias sps   "sudo pacman -S"
alias spr   "sudo pacman -R"
alias sprs  "sudo pacman -Rs"
alias sprdd "sudo pacman -Rdd"
alias spqo  "pacman -Qo"
alias spsii "pacman -Sii"

alias update "sudo pacman -Syu"
alias upd    "sudo pacman -Syu"

# ---------------------------------------------------------------- paru
alias upa    "paru -Syu"
alias upall  "paru -Syu --noconfirm"
alias paruskip "paru -S --mflags --skipinteg"

# ---------------------------------------------------------------- listing packages
alias list    "pacman -Qqe"
alias listt   "pacman -Qqet"
alias listaur "pacman -Qqem"
alias big     "expac -H M '%m\t%n' | sort -h | nl"

# ---------------------------------------------------------------- maintenance
alias unlock  "sudo rm /var/lib/pacman/db.lck"
alias update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias update-fc   "sudo fc-cache -fv"
alias pamac-unlock "sudo rm /var/tmp/pamac/dbs/db.lock"

# ---------------------------------------------------------------- mirrors
alias mirrorx  "sudo reflector --age 6 --latest 20 --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx "sudo reflector --age 6 --latest 20 --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram      "rate-mirrors --allow-root --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist"
alias rams     "rate-mirrors --allow-root --disable-comments --protocol https arch | sudo tee /etc/pacman.d/mirrorlist"

# ---------------------------------------------------------------- gpg
alias gpg-check    "gpg2 --keyserver-options auto-key-retrieve --verify"
alias gpg-retrieve "gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# ---------------------------------------------------------------- btrfs / snapper
alias btrfsfs "sudo btrfs filesystem df /"
alias btrfsli "sudo btrfs su li / -t"
alias snapli  "sudo snapper list"
alias snapcr  "sudo snapper -c root create"
alias snapch  "sudo snapper -c home create"

# ---------------------------------------------------------------- logs
alias lpacman "bat /var/log/pacman.log"
