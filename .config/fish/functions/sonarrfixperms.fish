function sonarrfixperms --description "Reset ownership and mode on the TV library"
    set -l dir /mnt/Secondary/Documents/Media/TV_Shows
    sudo chmod 775 -R $dir
    sudo chown sonarr:media -R $dir
end
