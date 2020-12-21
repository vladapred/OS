#!/bin/bash

s1pid=$(cat s1process)
s2pid=$(cat s2process)
s3pid=$(cat s3process)

limit=$1
pidArray=($s1pid $s2pid $s3pid)
sizebef=0

while  true; do
top -b -n 1 > topRes
for pid in "${pidArray[@]}"
do
usedMem=$(grep " $pid " topRes | awk '{print $6}')
if [[ $usedMem != "" && $usedMem -ge $((2 * sizebef)) ]]
then
echo "Process $pid is using double the mem it was using before"
fi
sizebef=$usedMem

if [[ $usedMem != "" && $usedMem -ge $limit ]]
then
echo "Process $pid terminated, it exceeded the $limit set by the user"
kill 15 $pid
fi
sleep 1s
done
done
