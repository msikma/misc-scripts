#!/usr/bin/env bash

for f in "$@"; do
  ext="${f##*.}"
  nf="${f%.*} - trimmed.$ext"
  echo "Trimming: $f"
  sox "$f" "$nf" reverse silence 1 0.1 0.05% reverse
done

# Trimming start and end:
# sox inputfile.mp3 outputfile.mp3 silence 1 0.1 1% reverse silence 1 0.1 1% reverse
# https://thejoe.it/en/2017/11/03/eliminare-il-silenzio-allinizio-e-alla-fine-di-un-file-audio-con-sox/
