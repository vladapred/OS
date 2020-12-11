#!/bin/bash
trash=/home/user/lab4/.trash
trashlog=/home/user/lab4/.trash.log
filename=$1

restore(){
path=$1
file=$2
ln $file $path
}

if [[ $# -ne 1 ]]
then
echo "Invalid argument"
exit 1
fi
if [[ ! -d $trash ]]
then
echo "Catalog doesn't exist"
exit 1
fi

if [[ ! -f $trashlog ]]
then
echo "File doesn't exist"
exit 1
fi

if [ -z $(grep $1 $trash) ]
then
exit 1
fi

grep $filename $trashlog |
while read filepath
do
file=$(echo $filepath | cut -d " " -f 1)
trashed=$(echo $filepath | cut -d " " -f 2)
echo "Restore $trashed ? (y/n)"
read answer < /dev/tty

if [ $answer == "y" ]
then
dir=$(dirname $file) &&

if [ -d $dir ]
then
$(restore $file $trashed)
else
$(restore /home/user/lab4/$filename $trashed) &&
echo "Restored"
fi &&

rm $trashed && {
sed -i "#$filepath#d" $trashlog
echo "Restore $file"
}
fi
done
