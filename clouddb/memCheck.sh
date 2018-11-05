#!/bin/bash

while :
do
  memFree=$(cat /proc/meminfo | grep "MemFree" | awk -F: '{ print $2 }')
  memAvailable=$(cat /proc/meminfo | grep "MemAvailable" | awk -F: '{ print $2 }')
  time=$(TZ='America/Chicago' date +"%a %b %d %I:%M:%S %p")
  echo "INSERT INTO mem (free, available, time) VALUES ('$memFree','$memAvailable','$time')" | mysql -uroot -ptest clouddb
  sleep 2

done
