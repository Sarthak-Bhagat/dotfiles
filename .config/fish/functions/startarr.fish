function startarr --description "Start the *arr stack and qbittorrent"
    sudo systemctl restart sonarr radarr bazarr jackett spoofdpi.service
    and qbittorrent &
end
