#!/bin/bash

at -f task1.sh now + 1 minute
tail -n 0 -f /home/user/lab3/report
