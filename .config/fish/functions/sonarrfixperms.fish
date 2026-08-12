function sonarrfixperms --wraps='sudo chmod 775 -R /mnt/Secondary/Documents/Media/TV_Shows/;sudo chown sonarr:media -R /mnt/Secondary/Documents/Media/TV_Shows/' --description 'alias sonarrfixperms sudo chmod 775 -R /mnt/Secondary/Documents/Media/TV_Shows/;sudo chown sonarr:media -R /mnt/Secondary/Documents/Media/TV_Shows/'
  sudo chmod 775 -R /mnt/Secondary/Documents/Media/TV_Shows/;sudo chown sonarr:media -R /mnt/Secondary/Documents/Media/TV_Shows/ $argv
        
end
