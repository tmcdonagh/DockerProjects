#!/bin/bash 
cp /sender/config.sh /var/www/html
tmux new -d -s tmux_monitor '/sender/./cpu.sh'
