#!/bin/bash

while true
do
read line
echo "$line" >> pipe5
 if [[ "$line" == "quit" ]]
    then
        exit 0
    fi

    if [[ ! "$line" =~ [0-9]+ && "$line" != "+" && "$line" != "*" ]]
    then
        echo "Incorrect"
        exit 1
        fi
done
