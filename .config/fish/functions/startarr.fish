function startarr --wraps='sudo systemctl start sonarr radarr bazarr jackett spoofdpi.service' --wraps='sudo systemctl restart sonarr radarr bazarr jackett spoofdpi.service' --wraps='sudo systemctl restart sonarr radarr bazarr jackett spoofdpi.service; qbittorrent &' --description 'alias startarr sudo systemctl restart sonarr radarr bazarr jackett spoofdpi.service; qbittorrent &'
    sudo systemctl restart sonarr radarr bazarr jackett spoofdpi.service; qbittorrent &
end
