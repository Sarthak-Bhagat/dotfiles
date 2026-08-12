function stoparr --description "Stop the *arr stack and qbittorrent"
    sudo systemctl stop sonarr radarr bazarr jackett spoofdpi.service
    pkill -9 qbittorrent
end
