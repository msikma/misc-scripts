#!/usr/bin/env fish

set src \
"/Users/msikma/Files/" \
"/Users/msikma/Documents/"


set dst \
"/Volumes/Files/Backups/msikma/Files" \
"/Volumes/Files/Backups/msikma/Documents"

for n in (seq (count $src))
  set s $src[$n]
  set d $dst[$n]
  if not test -d $s
    echo "Can't access source directory: "$s
    exit
  end
  if not test -d $d
    echo "Can't access target directory: "$d
    exit
  end
end

for n in (seq (count $src))
  set s $src[$n]
  set d $dst[$n]
  echo "Syncing: "$s" -> "$d
  rsync -ahvrESH8 --delete --progress --stats --exclude=".*/" --exclude=".*" $s $d
end