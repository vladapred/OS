#!/bin/bash

ps auxkstart_time | tail -n 1 | awk '{print $2}'
