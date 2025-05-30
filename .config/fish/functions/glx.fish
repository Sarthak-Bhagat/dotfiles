function glx --wraps='glxinfo | rg "OpenGL renderer string";prime-run glxinfo | rg "OpenGL renderer string"' --description 'alias glx glxinfo | rg "OpenGL renderer string";prime-run glxinfo | rg "OpenGL renderer string"'
  glxinfo | rg "OpenGL renderer string";prime-run glxinfo | rg "OpenGL renderer string" $argv
        
end
