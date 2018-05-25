#!/usr/bin/env bash

# This matches files that have '-qGGUNmI4v2k' (any Youtube ID) at the end.
# For example, 'Movie Title-qGGUNmI4v2k.mp3'. It adds the date to the filename,
# such that it's 'Movie Title-qGGUNmI4v2k (2018-11-22).mp3'.

for file in *.*; do
  ytcode=`echo $file | grep -oe "\(.\{11\}\)\.[^ ]*$" | cut -d. -f1`
  yturl="https://www.youtube.com/watch?v=$ytcode"
  ts=`wget -qO- "$yturl" | grep -oe "datePublished\" content\=\"\([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}\)" | grep -oe "[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}"`
  if [ ! -z "$ts" ]; then
    fn="${file%.*}"
    ext="${file##*.}"
    newfn="$fn ($ts).$ext"
    echo "$fn.$ext -> $newfn"
    mv "$file" "$newfn"
  fi
done

