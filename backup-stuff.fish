#!/usr/bin/env fish

set src \
"/Users/msikma/Pictures/Collections/" \
"/Users/msikma/Sheet music/" \
"/Users/msikma/VMs/" \
"/Users/msikma/Toolkit/" \
"/Users/msikma/Sites/" \
"/Users/msikma/Resources/" \
"/Users/msikma/Books/"


set dst \
"/Volumes/Files/Pictures/Collections/" \
"/Volumes/Files/Documents/Sheet music/" \
"/Volumes/Files/Documents/VMs/" \
"/Volumes/Files/Documents/Toolkit/" \
"/Volumes/Work/Sites/" \
"/Volumes/Files/Documents/Resources/" \
"/Volumes/Files/Documents/Books/"

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