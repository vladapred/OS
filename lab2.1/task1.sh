#!/bin/bash
ps -a -u $USER -o pid,command | awk '{printf $1 ": " $2 "\n"}' > outTask1.out
wc -l outTask1.out | awk '{print $1}'
