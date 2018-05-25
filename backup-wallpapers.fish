#!/usr/bin/env fish
if not test -d "/Users/msikma/Pictures/Wallpapers"
  echo "Can't access source directory: /Users/msikma/Pictures/Wallpapers"
  exit
end
if not test -d "/Volumes/files/Pictures/Wallpapers"
  echo "Can't access target directory: /Volumes/files/Pictures/Wallpapers"
  exit
end

rsync -ahvrESH8 --delete --progress --stats --exclude=".*/" --exclude=".*" "/Users/msikma/Pictures/Wallpapers" "/Volumes/files/Pictures/Wallpapers"
