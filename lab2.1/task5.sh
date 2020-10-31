#!/bin/basn
>res5.log
ppid=0
count=0
art=0
while read line
do
ppid_tmp=$(echo "$line" | grep -Eo "Parent_ProcessID=[0-9]+" | grep -Eo "[0-9]+")
art_tmp=$(echo "$line" | grep -Eo "[0-9]*\.{0,1}[0-9]+$")
if (( $ppid != $ppid_tmp && $count != '0' )); then
relation=$(awk "BEGIN {print $art/$count}" | bc)
echo "Average_Sleeping_Children_of_ParentID=$ppid is $relation" >> res5.log
count=0
art=0
fi
ppid=$ppid_tmp
art=$(awk "BEGIN {print $art+$art_tmp}" | bc)
count=$(awk "BEGIN {print $count+1}" 2>/dev/null | bc)
echo $line >> res5.log
done < res4.log
relation=$(echo "scale=7;$art/$count" | bc)
echo "Averange_Sleeping_Children_of_ParentID=$ppid is $relation" >> res5.log



