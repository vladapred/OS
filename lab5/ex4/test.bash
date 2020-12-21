#!/bin/bash

mkdir -p history
if [ "$1" == "process" ]
then
for i in history/name*.log
do
cat "$i"
cat $(echo $i | sed ' s/name//')
done
exit 0
fi

if [ "$1" != "" ]
then
cat history/name$1.log
cat history/$1.log
exit 0
fi

i=0
date=$(date "+%Y-%m-%dT%H:%M:%S")
for item in $(ps -aux | sed '1d' | awk '{print $2" "$11" "$5}')
do
if [ $i -eq 0 ]
then
pid=$item
else
if [ $i -eq 1 ]
then
name=$item
else
mem=$item
echo "$name" > history/name$pid.log
echo "$date $mem" >> history/$pid.log
fi
fi
let i=($i+1)%3
done
