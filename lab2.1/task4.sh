#!/bin/bash
(>tmp.log
for pid in $(ps -eo pid | awk '$1!="PID"')
do
ppid=$(cat /proc/"$pid"/status 2>/dev/null | grep PPid | awk '{ print $2 }')
sertime=$(cat /proc/"$pid"/sched 2>/dev/null | grep sum_exec_runtime | awk '{ print $3 }')
nr=$(cat /proc/"$pid"/sched 2>/dev/null | grep nr_switches | awk '{ print $3 }')
art=$(awk "BEGIN {print $sertime/$nr}" | bc -l 2>/dev/null)
if [[ -n "$ppid" ]] && [[ -n "$art" ]]
then
echo "ProcessID=$pid : Parent_ProcessID=$ppid : Averange_Running_Time=$art" >> tmp.log
fi
done
) 2>/dev/null
file_tmp=$(cat tmp.log | sort -t ':' -nk2.19)
echo "$file_tmp" > res4.log


