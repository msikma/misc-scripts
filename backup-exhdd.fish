#!/usr/bin/env fish
echo Backing up Prototype Stalker-C...
rsync -avrSH8 --progress --delete --stats --exclude=".*/" "/Volumes/Prototype Stalker-C/." "/Volumes/Gencore Phoenix/Prototype Stalker-C Backup"