#!/usr/bin/env fish
if not test -d "/Users/msikma/Pictures/Collections/"
  echo "Can't access source directory: /Users/msikma/Pictures/Collections/"
  exit
end
if not test -d "/Volumes/Files/Pictures/Collections/"
  echo "Can't access target directory: /Volumes/Files/Pictures/Collections/"
  exit
end

rsync -ahvrESH8 --delete --progress --stats --exclude=".*/" --exclude=".*" "/Users/msikma/Pictures/Collections/" "/Volumes/Files/Pictures/Collections/"
rm -f "/Volumes/Files/Pictures/Collections/.backup"
date -u > "/Volumes/Files/Pictures/Collections/.backup"
