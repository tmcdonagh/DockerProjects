#!/bin/bash

while :
do
  memFree=$(cat /proc/meminfo | grep "MemFree" | awk -F: '{ print $2 }')
  memTotal=$(cat /proc/meminfo | grep "MemTotal" | awk -F: '{ print $2 }')
  time=$(TZ='America/Chicago' date +"%a %b %d %I:%M:%S %p")
  echo "INSERT INTO mem (free, total, time) VALUES ('$memFree','$memTotal','$time')" | mysql -uroot -ptest clouddb
  echo "DELETE FROM mem WHERE ID NOT IN ( SELECT ID FROM ( SELECT ID FROM mem ORDER BY ID DESC LIMIT 50 ) del );" | mysql -ptest clouddb
  sleep 2

done
