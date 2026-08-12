# Config editing shortcuts.
#
# $EDITOR is expanded at alias-definition time in fish, which is fine since it
# is set in 00-env.fish and sourced first.

status is-interactive; or exit 0

# system
alias npacman     'sudo $EDITOR /etc/pacman.conf'
alias ngrub       'sudo $EDITOR /etc/default/grub'
alias nmakepkg    'sudo $EDITOR /etc/makepkg.conf'
alias nmkinitcpio 'sudo $EDITOR /etc/mkinitcpio.conf'
alias nmirrorlist 'sudo $EDITOR /etc/pacman.d/mirrorlist'
alias nfstab      'sudo $EDITOR /etc/fstab'
alias nhosts      'sudo $EDITOR /etc/hosts'
alias nhostname   'sudo $EDITOR /etc/hostname'
alias nresolv     'sudo $EDITOR /etc/resolv.conf'
alias nenvironment 'sudo $EDITOR /etc/environment'
alias nsddm       'sudo $EDITOR /etc/sddm.conf'
alias nsddmk      'sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf'

# user
alias nf         '$EDITOR ~/.config/fish/config.fish'
alias nfc        '$EDITOR ~/.config/fish/conf.d/'
alias nkitty     '$EDITOR ~/.config/kitty/kitty.conf'
alias nfastfetch '$EDITOR ~/.config/fastfetch/config.jsonc'
alias nmpv       '$EDITOR ~/.config/mpv/mpv.conf'
alias nb         '$EDITOR ~/.bashrc'

# docker / homelab
alias ncompose '$EDITOR ~/Projects/arr-compose.yml'
alias ncaddy   '$EDITOR ~/Projects/arr-caddy'
