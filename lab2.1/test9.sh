#!/bin/bash
ps -Al | awk '{if ($2 == "R" && $13 <= "00:01:00")print $4 " " $13 }' > tmp

#ps -Al pid,s,etimes | awk '{if ($2 == "R" && $3 <= 60)print $1 " "$2 " " $3 }'> tmp
