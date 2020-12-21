#!/bin/bash
index=0
array=()

while true
do
for (( count=1; count<11; count++ ))
do
array[$index]=$count
index=$((index+1))
done

if [[ "$1" -lt "${#array[*]}" ]]
then
echo "stop"
break
fi
done
