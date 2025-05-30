function startarr --wraps='sudo systemctl start sonarr radarr bazarr jackett spoofdpi.service' --wraps='sudo systemctl restart sonarr radarr bazarr jackett spoofdpi.service' --description 'alias startarr sudo systemctl restart sonarr radarr bazarr jackett spoofdpi.service'
  sudo systemctl restart sonarr radarr bazarr jackett spoofdpi.service $argv
        
end
