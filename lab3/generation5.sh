#!/bin/bash

while true
do
read line
echo "$line" >> pipe5
<<<<<<< HEAD
if [[ "$line" == "quit" ]]
then
exit 0
fi

if [[ ! "$line" =~ [0-9]+ && "$line" != "+" && "$line" != "*" ]]
then
echo "Incorrect"
exit 1
fi
=======
 if [[ "$line" == "quit" ]]
    then
        exit 0
    fi

    if [[ ! "$line" =~ [0-9]+ && "$line" != "+" && "$line" != "*" ]]
    then
        echo "Incorrect"
        exit 1
        fi
>>>>>>> 4999f34a0a5bb39df64f72c5633e6cb7773f8382
done
