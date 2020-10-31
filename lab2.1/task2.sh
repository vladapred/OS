#!/bin/bash

ps ax -o pid,command | grep "\/sbin\/.*" | awk '{print $1}' > outTask2.out
