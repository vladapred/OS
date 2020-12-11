#!/bin/bash
homepath="/home/user/lab4"
trashdir="$homepath/.trash"
trashlog="$homepath/.trash.log"
function untrash{
path=$(dirname "$2")
if [[ ! -d "$path" ]]
then
echo "dir $path doesn't exist, file will"
fi

name=$(basename "$2")
while [[ -f "$path/$name" ]]
do
read -p "error2"
done
ln "$1" "$path/$name"
rm "$1"
grep -Ev "$1" "$trashlog" > tmp.log
cat tmp.log > "$trashlog"
rm tmp.log
}

if [[ "$#" -ne 1 ]]
then
echo "Only one argument requires got $#"
exit
fi

if [[ ! -d "$trashdir" ]]
then
echo "hidden directory doesn't exist"
exit
fi

if [[ ! -f "$trashlog" ]]
then
echo "hidden file trash.log doesn't exist"
exit
fi

if [[ ! -s "$trashlog" ]]
then
echo "hidden file trash.log is empty"
exit
fi

IFS=$'\n'
for line in $(grep -E "$1" "trashlog")
do
echo "$line"
filepath=$(echo "$line" | awk '{print $1}')
linkname=$(echo "$line" | awk '{print $2}')
read -p "Do you want to untrash file $filepath& Y/N : " ans <&1

case "$ans" in
[Yy]*)
echo "we will try to untrash file to $filepath"
untrash "$linkname" "$filepath"
echo "success"
;;

*)
echo "file won't be untrashed"
continue
;;

esac
done
