function glx --description "Show OpenGL renderer, integrated then discrete"
    glxinfo | rg "OpenGL renderer string"
    prime-run glxinfo | rg "OpenGL renderer string"
end
