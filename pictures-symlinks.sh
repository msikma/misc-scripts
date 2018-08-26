#!/usr/bin/env fish

set err "pictures-symlinks: Error:"
set root "/Users/msikma/Pictures/"

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
"/Volumes/Files/Backups/Vesuvius/Scans" \
"/Volumes/Files/Backups/Vesuvius/Wallpapers"

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

if not test -d $root
	echo $err" can't access target directory: "$d
	exit
end

for n in (seq (count $src))
  set s $src[$n]
  set d $dst[$n]
  if test -d $d
    echo $err" directory is already symlinked: "$d
    exit
  end
  if not test -d $s
    echo $err" cannot find source directory: "$s
    exit
  end
end

for n in (seq (count $src))
  set s $src[$n]
  set d $dst[$n]
  echo "Symlinking: "$s" -> "$d
  ln -s $s $d
end