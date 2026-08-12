# Media, downloads and the homelab.

status is-interactive; or exit 0

# ---------------------------------------------------------------- yt-dlp
alias yta-aac  'yt-dlp --extract-audio --audio-format aac'
alias yta-best 'yt-dlp --extract-audio --audio-format best'
alias yta-flac 'yt-dlp --extract-audio --audio-format flac'
alias yta-mp3  'yt-dlp --extract-audio --audio-format mp3'
alias ytv-best "yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4"

# ---------------------------------------------------------------- git
alias grh        'git reset --hard'
alias rmgitcache 'rm -rf ~/.cache/git'
# The old config had `alias undopush "git push ..."` — missing the `=`, so it
# was parsed as two arguments and never worked.
alias undopush   'git push -f origin HEAD^:main'

# Remote hosts are functions in functions/: dezl, dezls, dezlt, dezn.

# ---------------------------------------------------------------- docker
alias dc     'docker compose'
alias dcup   'docker compose up -d'
alias dcdown 'docker compose down'
alias dclog  'docker compose logs -f'
alias dps    "docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"

# ---------------------------------------------------------------- wayland capture
alias wsimplescreen 'wf-recorder -a'
