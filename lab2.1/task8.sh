#!/bin/bash
ps -e -o pid,vsz | grep "VmRSS" /proc/*/status 
