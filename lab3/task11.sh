#!/bin/bash

echo $$ > pid
rm 11.log
mood="I'm okey"
Dead(){
mood="dead"
}
trap 'Dead' USR1
while true
do
case $mood in
"I'm okey")
echo "I'm okey" >> 11.log
;;
"dead")
echo "I'm dead" >> 11.log
echo "I'm dead"
exit 1
;;
esac
sleep 1
done
