#!/usr/bin/env fish
if not test -d "/Volumes/Glitch/Music"
  echo "Can't access source directory: /Volumes/Glitch/"
  exit
end
if not test -d "/Volumes/Files/Music/Archive"
  echo "Can't access target directory: /Volumes/Files/Music/Archive/"
  exit
end

rsync -ahvrESH8 --delete --progress --stats --exclude=".*/" --exclude=".*" "/Volumes/Glitch/" "/Volumes/Files/Music/Archive/"