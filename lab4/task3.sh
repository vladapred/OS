#!/bin/bash

home_path="/home/user"

#a)
backup_prev=$(ls "$home_path" | grep -E "^Backup-" | sort -n | tail -1)
date_time_now=$(date +"%Y-%m-%d")
date_time_now_sec=$(date -d "$date_time_now" +"%s")
date_time_backup_prev=$(echo "$backup_prev" | sed "s/Backup-//" )
date_time_backup_prev_sec=$(date -d "$date_time_backup_prev" +"%s")
time_difference=$(echo "(${date_time_now_sec} - ${date_time_backup_prev_sec}) / (3600 * 24) " | bc)

if [[ ! -d "$home_path/source" ]]
then
echo "Source dir doesn't exist"
exit
fi

if [[ ! -e "$home_path/backup-report" ]]
then
touch "$home_path/backup-report"
fi

if [[ "$(tree $home_path/source/ | tail -1 | awk '{print $1}')" -ne 0 ]]
then
echo "Error is directory"
exit 1
fi

if [[ "$time_difference" -ge 7 ]] || [[ "$backup_prev" == "" ]]
#b)
then
mkdir "$home_path/Backup-${date_time_now}"
for line in $(ls -1 "$home_path/source")
do
cp "$home_path/source/$line" "$home_path/Backup-${date_time_now}"
done
echo -e "New backup\n\tDate ${date_time_now}\n\tFiles: " >> "$home_path/backup-report"
for line in $(ls -1 "$home_path/Backup-${date_time_now}")
do
echo "$line" >> "$home_path/backup-report"
done
#c)
else
touch changed_files_info.log
touch new_files_info.log
for line in $(ls -1 "$home_path/source")
do
if [[ ! -f "$home_path/$backup_prev/$line" ]]
then
cp "$home_path/source/$line" "$home_path/$backup_prev"
echo "Copied: $line" >> new_files_info.log
else
new_size=$(wc -c "$home_path/source/$line" | awk '{print $1}')
old_size=$(wc -c "$home_path/$backup_prev/$line" | awk '{print $1}')
if [[ "$new_size" -ne "$old_size" ]]
then
mv "$home_path/$backup_prev/$line" "$home_path/$backup_prev/$line-${date_time_now}"
cp -a "$home_path/source/$line" "$home_path/$backup_prev/$line"
echo "Changed: $line last version is $line-${date_time_now}" >> changed_files_info.log
fi
fi
done
echo -e "Change backup\n\tDate ${date_time_backup_prev}\n\tNew files:\n$(cat new_files_info.log)\n\tChanged file:\n$(cat changed_files_info.log)" >> "$home_path/backup-report"
rm changed_files_info.log 2>/dev/null
rm new_files_info.log 2>/dev/null
fi
