#!/bin/bash

while true
do
read line
case $line in
"+")
kill -USR1 $(cat pid6)
;;
"*")
kill -USR2 $(cat pid6)
;;
"term")
kill -SIGTERM $(cat pid6)
exit
;;
esac
done

