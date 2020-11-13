#!/bin/bash
tmp=$(date +%m-%d-%y_%H:%M:%S)
mkdir ~/test 2>/dev/null && {
echo "catalog test was created succesfully" >> ~/report
touch ~/test/"$tmp"
}
ping 'www.net_nikogo.ru' 2>/dev/null ||{
tmp1=$(date +%m-%d-%y_%H:%M:%S)
echo "$tmp1 Error" >> ~/report
}

