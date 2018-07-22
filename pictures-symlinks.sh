#!/usr/bin/env fish

set src \
"/Users/msikma/Files/Pictures/Collections/Animals" \
"/Users/msikma/Files/Pictures/Collections/Avatars" \
"/Users/msikma/Files/Pictures/Collections/Computers" \
"/Users/msikma/Files/Pictures/Collections/Design inspiration" \
"/Users/msikma/Files/Pictures/Collections/Games" \
"/Users/msikma/Files/Pictures/Collections/Icons" \
"/Users/msikma/Files/Pictures/Collections/Informational" \
"/Users/msikma/Files/Pictures/Collections/Mooie dingen" \
"/Users/msikma/Files/Pictures/Collections/Software" \
"/Users/msikma/Files/Pictures/Collections/Pokémon" \
"/Users/msikma/Files/Pictures/Collections/Pokémon/Pokémon screenshot project/gen1" \
"/Users/msikma/Files/Pictures/Collections/Star Trek" \
"/Users/msikma/Files/Pictures/Collections/Stuff" \
"/Users/msikma/Files/Pictures/Collections/Tech" \
"/Users/msikma/Files/Pictures/Collections/Winter" \
"/Users/msikma/Files/Pictures/Collections/漫画" \
"/Users/msikma/Files/Pictures/Collections/電車" \
"/Users/msikma/Files/Pictures/Collections/食べ物" \
"/Users/msikma/Files/Pictures/Collections/Temp" \
"/Volumes/Files/Backups/msikma/Scans" \
"/Volumes/Files/Backups/msikma/Wallpapers"

set dst \
"/Users/msikma/Pictures/Animals" \
"/Users/msikma/Pictures/Avatars" \
"/Users/msikma/Pictures/Computers" \
"/Users/msikma/Pictures/Design inspiration" \
"/Users/msikma/Pictures/Games" \
"/Users/msikma/Pictures/Icons" \
"/Users/msikma/Pictures/Informational" \
"/Users/msikma/Pictures/Mooie dingen" \
"/Users/msikma/Pictures/Software" \
"/Users/msikma/Pictures/Pokémon" \
"/Users/msikma/Pictures/Pokémon Gen1" \
"/Users/msikma/Pictures/Star Trek" \
"/Users/msikma/Pictures/Stuff" \
"/Users/msikma/Pictures/Tech" \
"/Users/msikma/Pictures/Winter" \
"/Users/msikma/Pictures/漫画" \
"/Users/msikma/Pictures/電車" \
"/Users/msikma/Pictures/食べ物" \
"/Users/msikma/Pictures/_" \
"/Users/msikma/Pictures/Scans" \
"/Users/msikma/Pictures/Wallpapers"

for n in (seq (count $src))
  set s $src[$n]
  set d $dst[$n]
  if test -d $d
    echo "Directory is already symlinked: "$s
    exit
  end
  if not test -d $s
    echo "Can't access target directory: "$d
    exit
  end
end

for n in (seq (count $src))
  set s $src[$n]
  set d $dst[$n]
  echo "Symlinking: "$s" -> "$d
  ln -s $s $d
end