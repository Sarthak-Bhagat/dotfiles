function mpvr --description "Play on the local Wayland session, detached"
    env WAYLAND_DISPLAY=wayland-0 XDG_RUNTIME_DIR=/run/user/(id -u) setsid mpv $argv
end
