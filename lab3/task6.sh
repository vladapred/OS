#!/bin/bash

echo $$ > pid6
num=1
usr1()
{
let "num =num+2"
}
usr2(){
let "num=num*2"
}
trap 'usr1' USR1
trap 'usr2' USR2

while true
do
sleep 1
echo $num
done
