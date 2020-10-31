#!/bin/bash
ps -e -o pid,vsz | grep "VmRSS" /proc/*/status | tr -d [:alpha:][:punct:] | sort -nk2 | tail -n1
top -o RES | head -n8 | tail -n1 | awk '{ print $2 "        " $7 }'

