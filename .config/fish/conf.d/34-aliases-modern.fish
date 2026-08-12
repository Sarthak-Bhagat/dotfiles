# Modern CLI tools.
#
# These are aliased over the originals deliberately. They are not drop-in
# replacements, but the incompatibilities almost all fail loudly — an error,
# not a wrong answer — which is a cost worth paying for the daily improvement.
#
# The one exception is ripgrep, which fails *quietly*: it respects .gitignore,
# skips hidden files and skips binaries, so a path search can return nothing
# where grep would have found matches. --no-ignore --hidden restores grep's
# file visibility and removes that failure mode. What remains is the regex
# dialect (Rust's regex crate has no backreferences or lookaround), which
# errors out visibly.
#
# `command grep`, `command find` and so on bypass these when you need the real
# thing. Note also that every alias here is interactive-only, so scripts run
# with `#!/usr/bin/env fish` are unaffected.

status is-interactive; or exit 0

# ---------------------------------------------------------------- search
if type -q rg
    # --no-ignore --hidden makes rg look at the same files grep would.
    alias grep  "rg --no-ignore --hidden"
    alias egrep "rg --no-ignore --hidden"
    alias fgrep "rg --no-ignore --hidden --fixed-strings"

    # rg under its own name keeps rg's defaults: gitignore-aware, hidden
    # files skipped. That is what you want inside a repository.
    alias rgh   "rg --no-ignore --hidden"
    alias rgf   "rg --files-with-matches"
end

if type -q fd
    alias find "fd"
    alias fdh  "fd --hidden --no-ignore"
end

# ---------------------------------------------------------------- disk
if type -q dust
    alias du dust
end
if type -q duf
    alias df duf
end

# ---------------------------------------------------------------- process
if type -q procs
    alias psx procs
end
if type -q btop
    alias top btop
end

# ---------------------------------------------------------------- text
if type -q sd
    alias sdr sd        # sed replacement, under its own name
end

# ---------------------------------------------------------------- misc
if type -q jq
    alias jqc "jq -C ."
end
if type -q hyperfine
    alias bench hyperfine
end
if type -q delta
    alias gd "git diff"
end
