#!/bin/bash
tmp=$(date +%m-%d-%y_%H:%M:%S)
mkdir /home/user/lab3/test 2>/dev/null && {
echo "catalog test was created succesfully" >> /home/user/lab3/report
touch /home/user/lab3/test/"$tmp"
}
ping 'www.net_nikogo.ru' 2>/dev/null ||{
tmp1=$(date +%m-%d-%y_%H:%M:%S)
echo "$tmp1 Error" >> /home/user/lab3/report
}

