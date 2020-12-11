#!/bin/bash
while true
do
if [[ $(cat 11.log | wc -l) -gt 10 ]]
then kill -USR1 $(cat pid)
exit 1
fi
done
