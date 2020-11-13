#!/bin/bash

at -f task1.sh now + 1 minute
tail -n 0 -f ~/report
