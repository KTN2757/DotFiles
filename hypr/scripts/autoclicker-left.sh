#!/bin/bash
if pgrep -x "clicker" > /dev/null; then
    killall -9 clicker
else
    clicker -b Left &
fi
