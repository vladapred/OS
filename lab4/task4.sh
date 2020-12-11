#!/bin/bash

if [[ -d "/home/user/restore" ]]
then
rmdir "/home/user/restore"
fi
mkdir "/home/user/restore"

#a)
backup_prev=$(ls /home/user | grep -E "^Backup-" | sort -n | tail -1)
date_time_backup_prev=$( echo "$backup_prev" | sed "s/Backup-//" )

if [[ -z "$backup_prev" ]]
then
echo "There is no any backup"
exit
fi

for line in $( ls "/home/user/$backup_prev/$line" | grep -Ev "\-[0-9]{4}-[0-9]{2}-[0-9]{2}$" )
do
cp "/home/user/$backup_prev/$line" "/home/user/restore/$line"
done
