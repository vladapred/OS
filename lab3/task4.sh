#!/bin/bash

./generation4.sh & pid0=$!
./generation4.sh & pid1=$!
./generation4.sh & pid2=$!

renice 10 -p $pid0
kill $pid2
