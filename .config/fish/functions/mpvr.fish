function mpvr --wraps='env WAYLAND_DISPLAY=wayland-0 XDG_RUNTIME_DIR=/run/user/1002 setsid mpv' --description 'alias mpvr env WAYLAND_DISPLAY=wayland-0 XDG_RUNTIME_DIR=/run/user/1002 setsid mpv'
    env WAYLAND_DISPLAY=wayland-0 XDG_RUNTIME_DIR=/run/user/1002 setsid mpv $argv
end
