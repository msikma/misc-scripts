#!/usr/bin/env fish

set ts (date "+%Y-%m-%d")
set dest "/Volumes/Files/Backups/msikma/Databases"
set user "root"
set pass "root"
set sqlcmd "/Applications/MAMP/Library/bin/mysql"
set dumpcmd "/Applications/MAMP/Library/bin/mysqldump"

if not test -d "$dest"
    echo "backup-dbs.fish: Error: could not access destination: $dest"
    exit 1
end

set databases (eval $sqlcmd -u$user -p$pass -e "'show databases;'" | grep -Ev "(mysql|Database|information_schema|performance_schema)")
set dbcount (count $databases)
echo "Backing up $dbcount databases."

for i in $databases
  eval $dumpcmd --force -u$user -p$pass --databases $i | gzip > "$dest/$i.sql.gz"
  du -h "$dest/$i.sql.gz"
end
du -h "$dest"