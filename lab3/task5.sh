#!/bin/bash

prevres=1
res=1
operation='+'
(tail -f pipe5) | while true
do
read line
case $line in
"+")
operation='+'
echo "Additing"
;;

"*")
operation='*'
echo "Multiplying num"
;;

[0-9]*)
prevres=$res
if [[ $operation == '+' ]]
then
let res=$res+$line
else
let res=$res*$line
fi
echo "$prevres$operation$line = $res"
;;

"quit")
killall tail
echo "Exit"
exit 0
;;

*)
killall tail
echo "Stopped "
exit 0
;;
esac
done

