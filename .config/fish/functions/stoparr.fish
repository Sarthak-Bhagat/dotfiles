function stoparr --wraps='sudo systemctl stop sonarr radarr bazarr jackett spoofdpi.service;pkill -9 qbittorrent' --description 'Stop *arr services and qbittorrent'
  sudo systemctl stop sonarr radarr bazarr jackett $argv;
  pkill -9 qbittorrent
end
