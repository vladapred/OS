#!/bin/bash

#a)
dir=//home/user/lab4/.trash
log=//home/user/lab4/.trash.log
file=//home/user/user/lab4/$1
id=0

if [[ $# -ne 1 ]]
then
echo "Wrong number of arguments "
exit 1
fi
for i in $(grep -h "$file" "$log" | awk '{print $1" "$2}')
do
path=$(echo $i | awk -F " " '{print $1}')
backup=$(echo $i | awk -F " " '{print $2}')
if [[$file == $path ]]
then
restore=$dir/$backup
if [[ -e $restore ]]
then
echo "Restore file $path ?"
read cmd
if [[ $cmd == "yes" ]]
then
if [[ -d $(dirname $path) ]]
then
if [[ -e $path ]]
then
echo "File with name $file already exists"
echo "Enter now one: "
read newFileName
ln $restore "$(dirname $path)/$newFileName"
else
ln $restore $path
fi
else
echo "Directory $(dirname $path) doesn't exist"
ln $restore //home/user/lab4/$1
echo "Backup was created at //home/user/lab4/$1"
fi
rm -R $restore
grep -v $backup //home/user/lab4/.trash.log > //home/user/lab4/.temp.log
mv //home/user/lab4/.temp.log //home/user/lab4/.trash.log
else
echo "Error"
fi
fi
fi
done
