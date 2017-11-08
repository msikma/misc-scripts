#!/usr/bin/env fish
if not test -d "/Volumes/Glitch/"
  echo "Can't access source directory: /Volumes/Glitch/"
  exit
end
if not test -d "/Volumes/happy zoo/dada/Music"
  echo "Can't access target directory: /Volumes/happy zoo/dada/Music"
  exit
end

rsync -ahvrESH8 --delete --progress --stats --exclude=".*/" --exclude=".*" "/Volumes/Glitch/Music/Tracker/" "/Volumes/happy zoo/dada/Music/Tracker/"
rsync -ahvrESH8 --delete --progress --stats --exclude=".*/" --exclude=".*" "/Volumes/Glitch/Music/Game music covers/" "/Volumes/happy zoo/dada/Music/Game music covers/"
rsync -ahvrESH8 --delete --progress --stats --exclude=".*/" --exclude=".*" "/Volumes/Glitch/Music/Game music/" "/Volumes/happy zoo/dada/Music/Game music/"
rsync -ahvrESH8 --delete --progress --stats --exclude=".*/" --exclude=".*" "/Volumes/Glitch/Music/Classical/" "/Volumes/happy zoo/dada/Music/Classical/"
