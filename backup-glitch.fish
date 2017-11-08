#!/usr/bin/env fish
if not test -d "/Volumes/Glitch/"
  echo "Can't access source directory: /Volumes/Glitch/"
  exit
end
if not test -d "/Volumes/Files/Music/Glitch backup"
  echo "Can't access target directory: /Volumes/Files/Music/Glitch backup/"
  exit
end

rsync -ahvrESH8 --delete --progress --stats --exclude=".*/" --exclude=".*" "/Volumes/Glitch/" "/Volumes/Files/Music/Glitch backup/"
rm -f "/Volumes/Files/Music/Glitch backup/.backup"
date -u > "/Volumes/Files/Music/Glitch backup/.backup"
