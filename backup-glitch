#!/usr/bin/env fish
if not test -d "/Volumes/Glitch/"
  echo "Can't access source directory: /Volumes/Glitch/"
  exit
end
if not test -d "/Volumes/Files/Backups/msikma/Glitch backup/"
  echo "Can't access target directory: /Volumes/Files/Backups/msikma/Glitch backup/"
  exit
end

rsync -ahvrESH8 --delete --progress --stats --exclude=".*/" --exclude=".*" "/Volumes/Glitch/" "/Volumes/Files/Backups/msikma/Glitch backup/"
rm -f "/Volumes/Files/Backups/msikma/Glitch backup/.backup"
date -u > "/Volumes/Files/Backups/msikma/Glitch backup/.backup"
