#!/bin/bash

at -f task1.sh now + 2 minute
tail -n 0 -f ~/report
