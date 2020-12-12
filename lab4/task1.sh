#!/bin/bash

if [[ ! -e "$PWD/.number_tmp.log" ]]
then
echo 1 > "$PWD/.number_tmp.log"
fi

case $1 in
*\ *)
echo "Wrong format of file"
exit 1
;;
esac

if [[ $# -ne 1 ]]
then
echo "Wrong number of input arguments"
exit
fi

#a)
if [[ ! -f $1 ]]
then
echo "$1: That file doesn't exist"
exit
fi

#b)
dir="/home/user/lab4/.trash"
dir_log="/home/user/lab4/.trash.log"
if [[ ! -d $dir ]]
then
mkdir $dir
fi

#c)
number_tmp=$(cat $PWD/.number_tmp.log)
ln "$PWD/$1" "$dir/$number_tmp"
tmp="$PWD/$1"
tmp_ln="$dir/$number_tmp"
touch "$tmp_ln"
let number_tmp=number_tmp+1
echo "$number_tmp" > "$PWD/.number_tmp.log"
rm $tmp

#d)
echo "$tmp $tmp_ln" >> $dir_log
